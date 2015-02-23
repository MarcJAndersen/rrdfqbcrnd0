##' Run the RDF data cube Integrity Constraints
##' The present version does not run IC-20 and IC-21.
##' The function could be extend to print the result or return the result as data frame.
##' 
##' @param model a RRDF model containing one or more date cubes
##' @inheritParams GetObservationsSparqlQuery
##' @return data.frame with columns ICtitle, ICfailobs
##' 
RunQbIC<- function(model, forsparqlprefix, doForIC=NULL ) {

  victitle<- character(length(qbIClist))
  vicfail<- numeric( length(qbIClist))
  nic<-0

  icallnames<- names(qbIClist)
  if (! is.null(doForIC)) {
    icallnames<- intersect(icallnames, doForIC)
  }
  for (icallname in icallnames) {
    icall<- qbIClist[[icallname]]
##    print(names(icall))
##  cat(paste(names(icall), unlist(icall),collapse=": ",sep="\n"),"\n")
  if (! icall$HasInstantiation ) {
    message("Executing ", icall$ictitel)
    nic<- nic+1
    victitle[nic]<- icall$ictitel
    icSelectRq<- gsub("ASK \\{", "SELECT \\* WHERE \\{", icall$rq)
##    cat(icSelectRq,"\n")
    cube.ic<- sparql.rdf(model, paste( forsparqlprefix, icSelectRq  )  )
    vicfail[nic] <- nrow(cube.ic)   
    message(" -- ", nrow(cube.ic), " rows returned" )
   }
}

  ICres<- data.frame( ictitle=victitle[1:nic], icfail=vicfail[1:nic] )
}

      
  
  
