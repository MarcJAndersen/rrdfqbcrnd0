##' Add prefixes to a rrdf store
##'
##' The function defines the domain specific prefixes used for the rdf
##' data cube for the Clinical Research and Development Analysis
##' Results Data
##' 
##' @param domainName The domainName to create prefixes for
##' @param namespaceStem The stem for the namespace
##' @param domain.prefixes Prefix specific for the domain
##' @param general.prefixes General prefixes not specific for the domain
##' @return Data frame with column prefix and namespace
Get.qb.crnd.prefixes<- function(
  domainName,
  namespaceStem="http://www.example.org/dc/",
  domain.prefixes= c("prop", "dccs", "ds"),
  general.prefixes=c("code")
  ) {

custom.prefixes <-data.frame(
  prefix=c(general.prefixes, domain.prefixes),
  namespace=c(
    paste0(namespaceStem,general.prefixes,"/") ,
    paste0(namespaceStem,domainName,"/",domain.prefixes,"/")
    )
  )

custom.prefixes
}
  
