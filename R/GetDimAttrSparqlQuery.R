##' SPARQL query for dimensions and attributes in RDF data cube
##'
##' 
##' @inheritParams GetObservationsSparqlQuery
##' @return SPARQL query
GetDimAttrSparqlQuery<- function( forsparqlprefix ) {
dimAttr.rq<-   paste(forsparqlprefix,
'
select * where
{ {[] qb:dimension ?p . } union {  ?p a qb:AttributeProperty . } }"
',
"\n"
)
dimAttr.rq
}
