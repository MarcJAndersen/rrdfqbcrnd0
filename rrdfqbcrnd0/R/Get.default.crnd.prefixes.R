##' Get list of default prefixes
##'
##' @return List with default prefixes
##' @export Get.default.crnd.prefixes
Get.default.crnd.prefixes<- function( ) {
    
    ## TODO(mja)  env[["qbCDISCprefixes"]]
    ## TODO(mja) move to more appropriate location
    c(
        rrdfcdisc:::env[["qbCDISCprefixes"]],
        rrdfqb:::env[["rrdfqb"]],
        rrdfqbcrnd0:::env[["rrdfqbcrnd0"]]
        )
}
  
