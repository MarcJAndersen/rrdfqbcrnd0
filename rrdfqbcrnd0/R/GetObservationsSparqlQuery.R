##' SPARQL query for observations from RDF data cube in workbook format
##' @param forsparqlprefix PREFIX part of SPARQL query
##' @param domainName domainName for the RRDF cube
##' @param dimensions dimensions
##' @param attributes attributes 
##' @return SPARQL query
GetObservationsSparqlQuery<- function( forsparqlprefix, domainName, dimensions, attributes ) {
cube.observations.rq<-  paste( forsparqlprefix,
    "select * where {",
    "?s a qb:Observation  ;", "\n",
    paste("       qb:dataSet",  paste0( "ds:", "dataset", "-", domainName), " ;", sep=" ", collapse="\n"), "\n",
    paste0( dimensions, " ", sub("crnd-dimension:", "?", dimensions), ";", collapse="\n"),
    paste0( attributes, " ", sub("crnd-attribute:", "?", attributes), ";", collapse="\n"),
    "crnd-measure:measure      ?measure ;      \n",
    paste0( "optional{ ", sub("crnd-dimension:", "?", dimensions), " ",
           "skos:prefLabel",
           " ",
           sub("crnd-dimension:", "?", dimensions), "value" ,
           " . ", "}",
           collapse="\n"),
    "\n",
    "} ",
    "\n"
   )
cube.observations.rq
}
