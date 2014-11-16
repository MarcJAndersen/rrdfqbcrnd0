##' @title Return code for value using codelist
##' @param s A value iterpreted as characted
##' @param l A named list using the value as name as part of a URI
##' @return s capitalized
ph.recode<- function( s, l ) {
  if (s %in% names(l)) {
    return(l[[as.character(s)]])  # as.character !!!
 } else {
    warning( paste0( s, " -- ", 'CODING ERROR- no decode value'))
    'CODING ERROR- no decode value'
  }
}

