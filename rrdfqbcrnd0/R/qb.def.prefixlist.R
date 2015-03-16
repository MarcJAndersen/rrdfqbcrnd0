##' Add prefixes to a rrdf store
##'
##' Sideeffect: the prefixes are added to the store
##' @param store A rrdf store, if NULL then not added to a store
##' @param prefixes A data.frame with column prefix and namespace
##' @return The list with member names prefixUPPERCASEPREFIX and namespace as value
qb.def.prefixlist<- function(store=NULL, prefixes) {
pl<- list();

for (i in 1:nrow(prefixes))
{

  pl[[ paste0("prefix",toupper(prefixes[i,"prefix"])) ]] <-
      as.character(prefixes[i,"namespace"])

  # Use as.character to get the enquoting needed by the function
  if (!is.null(store)) {
  add.prefix(store, as.character(prefixes[i,"prefix"]),
                    as.character(prefixes[i,"namespace"]))
}
}
return(pl)
}

