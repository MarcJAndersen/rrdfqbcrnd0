##' Get domain name for the RDF data cube
##' TODO: change the way domainname is used - should only use the dsdName
##' 
##' @inheritParams GetDsdNameFromCube
##' @return the domainName for the cube
GetDomainNameFromCube<- function( store, forsparqlprefixcommon=GetForSparqlPrefix()  ) {

dsdName<- GetDsdNameFromCube( store, forsparqlprefixcommon ) 
domainName<- strsplit(dsdName,"-")[[1]][[2]]

domainName
}

