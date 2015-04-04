##' SPARQL query for codelists in RDF data cube
##'
##' @inheritParams GetObservationsSparqlQuery
##' @param dsdName Dataset Descriptor Name
##' @return SPARQL query
##' @family SPARQL queries
GetCodeListSparqlQuery<- function( forsparqlprefix, dsdName ) {
codelists.rq<-   paste(forsparqlprefix,
'
select distinct ?p ?cl ?prefLabel
where {
?DataStructureDefinition a qb:DataStructureDefinition ;
   qb:component ?component .
?component a qb:ComponentSpecification .
?component qb:dimension ?p .
?p qb:codeList ?c .
?c skos:hasTopConcept ?cl .
?cl skos:prefLabel ?prefLabel .
values ( ?DataStructureDefinition ) {
',
paste0( "(", "ds:", dsdName, ")"),
'
}
}
order by ?p ?cl ?prefLabel
'
)
codelists.rq
}
