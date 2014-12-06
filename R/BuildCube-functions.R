

## removing function qb.addprefix, as the functions uses assign, which is not recommended MJA 2014-11-16
## qb.addprefix<- function(prefixes) {
## for (i in 1:nrow(prefixes))
## {
##   tempName <-paste0("prefix",toupper(prefixes[i,"prefix"]))
##   assign(tempName,as.character(prefixes[i,"namespace"]), envir=globalenv()) # MJA 2014-10-13
##   # Use as.character to get the enquoting needed by the function
##   add.prefix(store,as.character(prefixes[i,"prefix"]),
##              as.character(prefixes[i,"namespace"]))
## }
## invisible(TRUE)
## }




