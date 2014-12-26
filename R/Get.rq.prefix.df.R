##' Create prefix definition for SPARQL query from 
##'
##' The function defines the domain specifif prefixes used for the rdf
##' data cube for the Clinical Research and Development Analysis
##' Results Data
##' 
##' @param domainName The domainName to create prefixes for
##' @param namespaceStem The stem for the namespace
##' @return Data frame with column prefix and namespace
Get.rq.prefix.df<- function( prefix.df ) {

forsparqlprefix<- paste(
  "prefix",
  paste(prefix.df$prefix,":",sep=""),
  paste("<",prefix.df$namespace,">",sep=""),
  sep=" ",collapse="\n")

forsparqlprefix
}
  
