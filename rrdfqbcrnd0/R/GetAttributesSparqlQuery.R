##' SPARQL query for attributes in RDF data cube
##'
##' 
##' @inheritParams GetObservationsSparqlQuery
##' @return SPARQL query
GetAttributesSparqlQuery<- function( forsparqlprefix ) {
attributes.rq<-   paste(forsparqlprefix,
'
select * where
{ ?p a qb:AttributeProperty .  }
',
"\n"
)
attributes.rq
}
