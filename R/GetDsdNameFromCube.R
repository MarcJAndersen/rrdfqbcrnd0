##' Get dsdname for the RDF data cube
##' TODO: change the way domainname is used - should only use the dsdName
##' @param store RRDF store with one RDF data cube
##' @return the dsdName for the cube

GetDsdNameFromCube<- function( store ) {

tempstr<- as.character(sparql.rdf(store,
'
select ?s
where {
?s a <http://purl.org/linked-data/cube#DataStructureDefinition>
} limit 1
'
))
tempstrvec<- unlist(strsplit( tempstr, "/"))
dsdName<- tempstrvec[length(tempstrvec)]
domainName<- strsplit(dsdName,"-")[[1]][[2]]

dsdName
}


