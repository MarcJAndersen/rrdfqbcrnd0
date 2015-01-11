##' Get formular for the summary statistics in RDF data cube
##'
##' 
##' @param store 
##' @return expression with the formulars representing the RDF data cube
GetFormularFromCube<- function( store ) {

dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
forsparqlprefix<- GetForSparqlPrefix( domainName )

dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
dimensions<- sparql.rdf(store, dimensionsRq)

attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
attributes<- sparql.rdf(store, attributesRq)

observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
observations<- as.data.frame(sparql.rdf(store, observationsRq ), stringsAsFactors=FALSE)

xx<- apply( observations, 1, function(x) {
expr<- c()
for (vn in names(x)) {
if (vn %in% gsub("prop:", "", c(dimensions)) & ! (vn %in% c("factor", "procedure")) )  {
  if (x[paste0(vn,"value")] != "_ALL_") { expr<- c(expr, vn) }
  }
}

if (!(x["factorvalue"] %in% c("quantity","proportion"))) {
   expr<- c(expr, tolower(x["factorvalue"]))
   }
if ( x["procedurevalue"] %in% c("percent")) {
  expr<- c(expr, paste0(x["procedurevalue"],"(", tolower(x["denominator"]), ")"))
  } else {
  expr<- c(expr, paste0(x["procedurevalue"],"()"))
  }
}
)

a<-parse(text=paste0("~", paste0(unique(xx),collapse="+")))
}
