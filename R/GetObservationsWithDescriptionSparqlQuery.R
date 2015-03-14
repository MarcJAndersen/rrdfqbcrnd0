##' SPARQL query for observations from RDF data cube in workbook format
##' @param forsparqlprefix PREFIX part of SPARQL query
##' @param domainName domainName for the RRDF cube
##' @param dimensions dimensions
##' @param attributes attributes 
##' @return SPARQL query
##' 
GetObservationsWithDescriptionSparqlQuery<- function( forsparqlprefix, domainName, dimensions, attributes ) {
  cube.observations.rq<-  paste(
    forsparqlprefix,
    "select * where {",
    "\n",
    "?s a qb:Observation  ;", "\n",
## TODO: better way of using label    
##    "rdfs:label        ?olabel;", "\n",
    paste("qb:dataSet",  paste0( "ds:", "dataset", "-", domainName), " ;", sep=" ", collapse="\n"), "\n",
    paste0( dimensions, " ", sub("crnd-dimensions:", "?", dimensions), ";", collapse="\n"),
    "\n",
    paste0( attributes, " ", sub("crnd-dimensions:", "?", attributes), ";", collapse="\n"),
    "\n",                          
    "crnd-measure:measure      ?measure .      \n",
    paste0( "optional{ ", sub("crnd-dimensions:", "?", dimensions), " ",
           "skos:prefLabel",
           " ",
           sub("crnd-dimensions:", "?", dimensions), "value" ,
           " . ", "}",
           collapse="\n"),
    "\n",                              
    paste0( "optional{ ", dimensions, " ",
           "rdfs:label",
           " ",
           sub("crnd-dimensions:", "?", dimensions), "label" ,
           " . ", "}",
           collapse="\n"),
    "\n",                              
    paste0( "BIND( IRI(", dimensions, ")",
           " as",
           " ",
           sub("crnd-dimensions:", "?", dimensions), "IRI" ,
           ")",
           collapse="\n"),
    "\n",                          
    "BIND( IRI( ?s ) AS ?measureIRI)",                              
    "\n",
    "} ",
## TODO(mja) Make more clever way os sorting    
##    "ORDER BY ?olabel",
    "\n"
    )
  cube.observations.rq
}
