##' SPARQL query giving observations for a subset of observatition from RDF data cube
##' @param forsparqlprefix PREFIX part of SPARQL query
##' @param domainName domainName for the RRDF cube
##' @param dimensions dimensions
##' @return SPARQL query
GetDimsubsetWithObsSparqlQuery<- function( forsparqlprefix, domainName, dimensions ) {
cube.observations.rq<-  paste( forsparqlprefix,
    "select * where {",
    "?s a qb:Observation  ;", "\n",
    paste("       qb:dataSet",  paste0( "ds:", "dataset", "-", domainName), " ;", sep=" ", collapse="\n"), "\n",
    paste0( dimensions, " ", sub("crnd-dimensions:", "?", dimensions), ";", collapse="\n"),
    "\n",
    "} ",
    "order by ",  paste0( sub("crnd-dimensions:", "?", dimensions), collapse=" "),
    "\n"
   )
cube.observations.rq
}
