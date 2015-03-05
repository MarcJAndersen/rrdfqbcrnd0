##' SPARQL query for CDISC codelists
##'
##' @param forsparqlprefix SPARQL prefix
##' @param nciDomainValue NCI domain value
##' @return SPARQL query
GetCDISCCodeListSparqlQuery<- function( forsparqlprefix, nciDomainValue ) {
codelists.rq<-   paste(forsparqlprefix,
'select ?nciDomain ?cdiscDefinition ?code ?cdiscSynonyms ?nciCode ?nciPreferredTerm
where {
  ?nciDomain mms:inValueDomain ', paste0(':', nciDomainValue), ' .',
'  ?nciDomain cts:cdiscDefinition      ?cdiscDefinition .
  ?nciDomain cts:cdiscSubmissionValue ?code .
  OPTIONAL { ?nciDomain cts:cdiscSynonyms        ?cdiscSynonyms . }
  ?nciDomain cts:nciCode              ?nciCode .
  ?nciDomain cts:nciPreferredTerm     ?nciPreferredTerm
  }
'
)
codelists.rq
}
