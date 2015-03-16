##' SPARQL query giving observations for a subset of observatition from RDF data cube
##' @param forsparqlprefix PREFIX part of SPARQL query
##' @param domainName domainName for the RRDF cube
##' @param dimensionsorattrs vector of dimensions or attributes
##' @return SPARQL query
GetDimsubsetWithObsSparqlQuery<- function( forsparqlprefix, domainName, dimensionsorattrs ) {
cube.observations.rq<-  paste( forsparqlprefix,
    "select * where {",
    "?s a qb:Observation  ;", "\n",
    paste("       qb:dataSet",  paste0( "ds:", "dataset", "-", domainName), " ;", sep=" ", collapse="\n"), "\n",
    paste0( dimensionsorattrs, " ", gsub("crnd-dimension:|crnd-attribute:", "?", dimensionsorattrs), ";", collapse="\n"),
    "\n",
    "} ",
    "order by ",  paste0( gsub("crnd-dimension:|crnd-attribute:", "?", dimensionsorattrs), collapse=" "),
    "\n"
   )
cube.observations.rq
}
