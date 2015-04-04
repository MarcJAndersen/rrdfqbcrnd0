##' SPARQL query for DataStructureDefinition in RDF data cube
##'
##' @inheritParams GetObservationsSparqlQuery
##' @return SPARQL query
##' @family SPARQL queries
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
