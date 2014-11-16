

## removing function qb.addprefix, as the functions uses assign, which is not recommended MJA 2014-11-16
## qb.addprefix<- function(prefixSource) {
## for (i in 1:nrow(prefixSource))
## {
##   tempName <-paste0("prefix",toupper(prefixSource[i,"prefix"]))
##   assign(tempName,as.character(prefixSource[i,"namespace"]), envir=globalenv()) # MJA 2014-10-13
##   # Use as.character to get the enquoting needed by the function
##   add.prefix(store,as.character(prefixSource[i,"prefix"]),
##              as.character(prefixSource[i,"namespace"]))
## }
## invisible(TRUE)
## }




