##' Get the PREFIX part for a SPARQL for the given domainname
##'
##' 
##' @param domainName Domain Name for the RDF data cube, none if NULL
##' @param common.prefixes Common prefixes, using default if NULL
##' @param custom.prefixes Custom prefixes, using default if NULL
##' @return Character string with PREFIX statements delimited by CR
GetForSparqlPrefix<- function( domainName=NULL, common.prefixes=NULL, custom.prefixes=NULL  ) {

if (is.null(common.prefixes)) {

  common.prefixes <- data.frame(
    prefix=gsub("^prefix","",names(Get.default.crnd.prefixes())),
    namespace=as.character(Get.default.crnd.prefixes() ),
    stringsAsFactors=FALSE
    )
}

if (is.null(custom.prefixes)) {
  if (is.null(domainName)) {
    custom.prefixes<- NULL
  } else {
    custom.prefixes <-Get.qb.crnd.prefixes(tolower(domainName))
  }
}

Get.rq.prefix.df(rbind(common.prefixes, custom.prefixes))
}
