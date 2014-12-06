##' 
##'
##' Start-up code
##' @param libname 
##' @param pkgname 
##' @return invisible

env <- new.env(parent=emptyenv()) 

.onLoad <- function(libname, pkgname) {
  env[["cdiscstandards"]]<- NULL
  invisible()
}

