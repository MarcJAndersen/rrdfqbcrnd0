##' Add prefixes to a rrdf store
##'
##' Sideeffect: the prefixes are added to the store
##' @param store A rrdf store
##' @param prefixSource A data.frame with column prexi and namespace
##' @return The list with member names prefixUPPERCASEPREFIX and namespace as value
##' @examples 
qb.def.prefixlist<- function(store, prefixSource) {
pl<- list();

for (i in 1:nrow(prefixSource))
{

  pl[[ paste0("prefix",toupper(prefixSource[i,"prefix"])) ]] <-
      as.character(prefixSource[i,"namespace"])

  # Use as.character to get the enquoting needed by the function
  add.prefix(store, as.character(prefixSource[i,"prefix"]),
                    as.character(prefixSource[i,"namespace"]))
}
return(pl)
}

