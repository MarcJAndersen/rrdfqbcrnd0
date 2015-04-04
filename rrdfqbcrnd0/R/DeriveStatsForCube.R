##' Derive the descriptive statistics defined in a cube
##' 
##' @inheritParams GetObservationsSparqlQuery
##' @param store a RRDF store containing one or more date cubes
##' @param domainName domainName for the RRDF cube
##' @param dsdName Dataset Descriptor Name
##' @param dataSet data.frame containing dataset to validate against/derive measures
##' @param validation.measure list with property, prefix and
##' URIprefix. The derived results is stored in the cube in the store
##' using the property. This is only used is checkOnly==TRUE
##' @param checkOnly: TRUE if only the check is performed (default), FALSE then measure is overwritten with the results
##' @return list with status TRUE if the operation was sucessfull
##' 
DeriveStatsForCube<- function(store, forsparqlprefix, domainName, dsdname, dataSet, deriveMeasureList=NULL, checkOnly=TRUE, validation.measure=NULL ) {

  ## obsFile=paste(tempdir(),"/", "adsl", ".xpt",sep="")
  ## domainName="demog"
  
  if (is.null(validation.measure) & checkOnly==TRUE ) {
    validation.measure<- NULL
    validation.measure$property<- "qbderiv:result"
    validation.measure$prefix<- unlist(strsplit(validation.measure$property,":"))[1]
    validation.measure$namespace<- paste0("http://www.example.org/dc/",domainName,"/validmeas/")
  }

  codelists.rq<- GetCodeListSparqlQuery( forsparqlprefix, dsdName )
  cube.codelists<- as.data.frame(sparql.rdf(store, codelists.rq), stringsAsFactors=FALSE)

  codelist.all<- cube.codelists[ cube.codelists$prefLabel=="_ALL_",]
  ## print(codelist.all)
  subsetting.dimensions<- list();

  ## TODO(mja): the variable name/column name in the data frame should be part of the datacube.
  ## This would remove the need for the workaround below using gsub
  for (i in 1:nrow(codelist.all))
    {
      subsetting.dimensions[[ gsub("[^:]*:","", codelist.all[i,"p"]) ]] <-
        as.character(codelist.all[i,"cl"])
    }

  dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
  dimensions<- sparql.rdf(store, dimensionsRq)

  attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
  attributes<- sparql.rdf(store, attributesRq)

  observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
  observations<- as.data.frame(sparql.rdf(store, observationsRq ), stringsAsFactors=FALSE)

  ## print(head(observations))
  ## str(observations)


  ## TODO cts:cdiscSubmissionValue could also be used instead of skos:prefLabel
  ## TODO by code:saffl-Y does not have cts:cdiscSubmissionValue

  ## TODO: this should be defined in a RDF model
  ## using list for key-value lookup to function for descriptive statistic
  univfunc1= list(
    "code:procedure-MEAN"=mean,
    "code:procedure-STDDEV"=sd,
    "code:procedure-MEDIAN"=median,
    "code:procedure-MIN"=min,
    "code:procedure-MAX"=max
    )

  univfunc2= list(
    "code:procedure-COUNT"=length,
    "code:procedure-COUNTDISTINCT"=function(x){length(unique(x))}
    )

if (nrow(observations )<1) {
  stop("no rows in observations")
}
## print(nrow(observations ))

  for (r in  1:nrow(observations )  ) {
    thisrow<-  observations[r,]
## print(thisrow)

    ## TODO(mja): handle _NONMISS_, see GetSQLFromCube.R for approach
    data.subset.logical<- rep(TRUE, nrow(dataSet))
    for (v in names(subsetting.dimensions)) {
##       print( c(v, thisrow[v ],  subsetting.dimensions[[ v ]] ) )
      if ( thisrow[v ] != subsetting.dimensions[[ v ]] ) {
##        print( paste0(v, ": ", thisrow[v ], " = ", thisrow[ paste0(v,"value") ]))
        ## print( dataSet[,toupper(v)]  )
        ## print(  thisrow[ paste0(v,"value") ] )
        ## print( dataSet[,toupper(v)] == as.character(thisrow[ paste0(v,"value") ]) )
        data.subset.logical<- data.subset.logical & ( dataSet[,toupper(v)] == as.character(thisrow[ paste0(v,"value") ]) )
      }
    }
    
    has.result<- FALSE
    
    if (thisrow["procedure"] %in% names(univfunc1) ) {
    ## print("univfunc1")
      AOD<- dataSet[data.subset.logical,thisrow["factorvalue"]]
      result<- univfunc1[[ thisrow["procedure"] ]](AOD)
      has.result<- TRUE
      ##   print(paste("AOD number of observations", nrow(AOD)))
    } else if (thisrow["procedure"] %in% names(univfunc2) ) {
      ## print(paste0("univfunc2"," ",thisrow["procedure" ],collapse=" "))
      AOD<- dataSet[data.subset.logical,"USUBJID"]  # take the first variable, would be better if there was a default, like USUBJID
      result<- univfunc2[[ thisrow["procedure" ] ]](AOD)
      has.result<- TRUE
      ##   print(paste0("AOD number of observations", nrow(AOD), sep=" "))
    } else if (thisrow["procedure"]== "code:procedure-PERCENT" & thisrow["factor"]== "code:factor-PROPORTION") {
      
      ##  print(c("proportion",thisrow["denominator"]))
      denom.def<- thisrow[ names(subsetting.dimensions) ]
      denom.def[ tolower(thisrow["denominator"]) ] =paste0("code:",tolower(thisrow["denominator"]),"-_ALL_",sep="")
      AOD<- dataSet[data.subset.logical,] # should use a variable name - USUBJID like for count

      denom.data.subset.logical<- rep(TRUE, nrow(dataSet))
      ## print( denom.def )
      for (v in names(denom.def)) {
        if ( denom.def[v ] != subsetting.dimensions[[ v ]] ) {
          denom.data.subset.logical<- denom.data.subset.logical & ( dataSet[,toupper(v)] == thisrow[ paste0(v,"value") ] )
        }
      }
      denom.data.frame<-  dataSet[denom.data.subset.logical , ]
      
      result<- nrow(AOD) / nrow( denom.data.frame ) * 100;
      has.result<- TRUE
      ## print(paste("AOD number of observations", nrow(AOD)))
      ## print(paste("denom.data.frame number of observations", nrow(denom.data.frame)))
    }



    if (has.result) {
      ## print(paste("result", result, sep=" "))
      add.data.triple( store,
                      subject=gsub("ds:", myprefixes$prefixDS, thisrow["s"]), # add triple does not resolve prefix
                      predicate=gsub(validation.measure$prefix,validation.measure$namespace,validation.measure$property),
                      data=paste(result), type="float")
    } else {
      ##  print( paste( thisrow["s"], ifelse(has.result, result, "No result determined") ) )
    }
    
    
  } # for
  
prval<- paste0("prefix ", validation.measure$prefix,": ","<", validation.measure$namespace, ">\n")
print(prval)
cube.measure.result.rq<- paste(forsparqlprefix, prval,
      "select * where {",
      "    ?s a qb:Observation  ;",
      paste("       qb:dataSet",  paste0("ds:",dsdName), " ;", sep=" ", collapse=" "),
      "       crnd:measure      ?measure ;      ",
      "      optional{ ?s ", validation.measure$property, " ?result }      ",
      "} order by ?s"
)

cat(cube.measure.result.rq)
cube.measure.result<-  sparql.rdf(store, cube.measure.result.rq);
  
  ## print(cube.measure.result)
  
  
  cube.check<- sparql.rdf(store,
                          paste(forsparqlprefix, prval,
                                "select * where {",
                              "    ?s a qb:Observation  ;",
                                paste("       qb:dataSet",  paste0("ds:",dsdName), " ;", sep=" ", collapse=" "),
                                "       crnd:measure      ?measure ;      ",
                                "      optional{ ?s ", validation.measure$property, " ?result }      ",
                                " filter ( ?measure != ?result ) ",
                                "} order by ?s"
                                )
                          );
  
  print("If the result is <0 x 0> matrix then all value matches")
  cube.check
  
  
}
