##' @noRd
##

env <- new.env(parent=emptyenv()) 

#  Following http://stackoverflow.com/questions/12598242/global-variables-in-packages-in-r

.onLoad <- function(libname, pkgname) {
  env[["cdiscstandards"]]<- NULL

  env[["qbCDISCprefixes"]]<-  list(
 "rdf"= "http://www.w3.org/1999/02/22-rdf-syntax-ns#" ,
 "skos"="http://www.w3.org/2004/02/skos/core#" ,
 "prov"="http://www.w3.org/ns/prov#" ,
 "rdfs"="http://www.w3.org/2000/01/rdf-schema#" ,
 "dcat"="http://www.w3.org/ns/dcat#" ,
 "owl"= "http://www.w3.org/2002/07/owl#" ,
 "xsd"= "http://www.w3.org/2001/XMLSchema#" ,
 "qb"=  "http://purl.org/linked-data/cube#" ,
 "pav"= "http://purl.org/pav" ,
 "dct"= "http://purl.org/dc/terms/" ,
 "mms"= "http://rdf.cdisc.org/mms#" ,
 "cts"= "http://rdf.cdisc.org/ct/schema#"
)  
    
  invisible()
}

