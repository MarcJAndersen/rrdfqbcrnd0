GetDescrStatProcedure<- function( ) {

list(
    "code:procedure-mean"=list(fun=function(x){mean(x, na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-stddev"=list(fun=function(x){sd(x, na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-stdev"=list(fun=function(x){sd(x, na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-std"=list(fun=function(x){sd(x, na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-median"=list(fun=function(x){median(x, na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-min"=list(fun=function(x){min(x, na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-max"=list(fun=function(x){max(x, na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-n"=list(fun=function(x){length(x[!is.na(x)])}, univfunc="univfunc1" ),
    "code:procedure-q1"=list(fun=function(x){quantile(x, probs=c(0.25),na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-q3"=list(fun=function(x){quantile(x, probs=c(0.75),na.rm=TRUE)}, univfunc="univfunc1" ),
    "code:procedure-count"=list(fun=function(x){length(x)}, univfunc="univfunc2" ),
    "code:procedure-countdistinct"=list(fun=function(x){length(unique(x))}, univfunc="univfunc2" ),
    "code:procedure-percent"=list(fun=function(x){-1}, univfunc="univfunc3" )
  )
}
