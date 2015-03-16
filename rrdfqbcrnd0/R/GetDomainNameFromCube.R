##' Get domain name for the RDF data cube
##' TODO: change the way domainname is used - should only use the dsdName
##'
##' 
##' @param store RRDF store with one RDF data cube
##' @return the domainName for the cube
GetDomainNameFromCube<- function( store ) {

dsdName<- GetDsdNameFromCube( store )
domainName<- strsplit(dsdName,"-")[[1]][[2]]

domainName
}

