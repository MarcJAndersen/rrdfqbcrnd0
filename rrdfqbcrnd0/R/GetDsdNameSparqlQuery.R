##' SPARQL query for DataStructureDefinition in RDF data cube
##'
##' @inheritParams GetDomainNameFromCube
##' @return SPARQL query
##' @family SPARQL queries
##' @export
GetDsdNameSparqlQuery<- function( forsparqlprefixcommon=GetForSparqlPrefix() ) {
dsd.rq<-   paste(forsparqlprefixcommon,
'
select ?dsd
where {
?dsd a qb:DataStructureDefinition 
} 
'
)
dsd.rq
}
