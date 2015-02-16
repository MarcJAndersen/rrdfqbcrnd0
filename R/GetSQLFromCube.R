##' Get SQL expression for the summary statistics in RDF data cube
##'
##' 
##' @param store The name for the rrdf store
##' @return SQL expression with the formulars representing the RDF data cube

GetSQLFromCube<- function( store ) {

  dsdName<- GetDsdNameFromCube( store )
  xdsdName<- "adsl"
  domainName<- GetDomainNameFromCube( store )
  forsparqlprefix<- GetForSparqlPrefix( domainName )

  dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
  dimensions<- sparql.rdf(store, dimensionsRq)

  attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
  attributes<- sparql.rdf(store, attributesRq)

  observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
  observations<- as.data.frame(sparql.rdf(store, observationsRq ), stringsAsFactors=FALSE)

  xx<- apply( observations, 1, function(x) {
    SQLexpr<- c()
    selectExpr<- c()
    groupbyExpr<- c()
    for (vn in names(x)) {
      if ( x["procedurevalue"] %in% c("percent") & vn==tolower(x["denominator"])) {
        vnx<- paste0( "b.", toupper(vn))
      } else {        
        vnx<- paste0( "a.", toupper(vn))
      }
      if (vn %in% gsub("prop:", "", c(dimensions)) & ! (vn %in% c("factor", "procedure")) )  {
        if (x[paste0(vn,"value")] != "_ALL_") {
          selectExpr<- c(selectExpr, vnx)
          groupbyExpr<- c(groupbyExpr,vnx)
        } else {
          selectExpr<- c(selectExpr, paste("'_ALL_' as", toupper(vn), collapse=" "))
        }
      }
    }

    ## if (!(x["factorvalue"] %in% c("quantity","proportion"))) {
    ##   SQLexpr<- c(SQLexpr, tolower(x["factorvalue"]))
    ##   }
    if ( x["procedurevalue"] %in% c("percent")) {
      derivExpr<- paste0("100*avg","(",
                         "a.", toupper(tolower(x["denominator"])), "=",
                         "b.", toupper(tolower(x["denominator"])),
                         ")")
    } else if ( x["procedurevalue"] %in% c("count")) {
      derivExpr<- paste0(x["procedurevalue"],"(", "*", ")")
    } else if ( x["procedurevalue"] %in% c("mean")) {
      derivExpr<- paste0("avg","(", toupper(tolower(x["factorvalue"])),")" )
    } else  {
      derivExpr<- paste0(x["procedurevalue"],"(", toupper(tolower(x["factorvalue"])),")" )
    }
    paste("SELECT",
          paste(
            paste0(selectExpr, collapse=", "),
            paste0("'",x["procedurevalue"],"'"," as procedure"),
            paste0("'",x["factorvalue"],"'"," as factor"), 
            paste0("'",x["denominator"],"'"," as denominator"), 
            paste0("'",x["unit"],"'"," as unit"), 
            paste0( derivExpr, " as measure"), sep=", "
             ),
          "from ", xdsdName, " as a",
          ifelse( x["procedurevalue"] %in% c("percent"),
                 paste0( ", ",
                        "(select distinct ", toupper(tolower(x["denominator"])), " from ", xdsdName, ") as b")
                 , " "
                 ),
          "group by ", paste(groupbyExpr, collapse=", "),
##          "order by ", paste(groupbyExpr, collapse=", "),
          collapse="\n"
          )
  }
             )

  a<-paste0(paste0(unique(xx),collapse="\nUNION\n"),"\n")

#  print(str(observations))
#  print(c(dimensions,attributes))


  qbframe<- observations[,c(paste0(gsub("prop:","",dimensions),"value"),gsub("prop:","",attributes))]
  names(qbframe)[1:length(dimensions)]<- gsub("prop:","",dimensions)


  list(summStatSQL=a,qbframe=qbframe)
}
