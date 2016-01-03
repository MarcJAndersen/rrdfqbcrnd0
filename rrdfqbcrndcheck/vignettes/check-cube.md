---
title: "Derive results in RDF data cube and compare with results in data cube"
author: "mja@statgroup.dk"
date: "2016-01-03"
vignette: >
  %\VignetteIndexEntry{Derive results in RDF data cube and compare with results in data cube}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---

# Derive results in RDF data cube and compare with results in data cube



```r
options(width=200) # long lines

library(xlsx)
```

```
## Loading required package: rJava
## Loading required package: methods
## Loading required package: xlsxjars
```

```r
library(foreign)
library(rrdf)
```

```
## Loading required package: rrdflibs
```

```r
tmp.install.packages <- function(pack, dependencies=TRUE, ...) {
  path <- tempdir()
  ## Add 'path' to .libPaths, and be sure that it is not
  ## at the first position, otherwise any other package during
  ## this session would be installed into 'path'
  firstpath <- .libPaths()[1]
  .libPaths(c(firstpath, path))
  install.packages(pack, dependencies=dependencies, lib=path, ...)
}
tmp.install.packages("../../rrdfqbcrnd0_0.1.19.tar.gz")
```

```
## inferring 'repos = NULL' from 'pkgs'
```

```r
tmp.install.packages("../../rrdfcrndex_0.1.19.tar.gz")
```

```
## inferring 'repos = NULL' from 'pkgs'
```

```
## Warning in install.packages(pack, dependencies = dependencies, lib = path, : installation of package '../../rrdfcrndex_0.1.19.tar.gz' had non-zero exit status
```

```r
obsFile<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfcrndex")
## TODO do not want factors in the data.frame
## http://stackoverflow.com/questions/2851015/convert-data-frame-columns-from-factors-to-characters
## better to use library(SASxport) - see inst/data-raw/create-dm-table-as-csv.Rmd
dataSet<-read.xport(obsFile)
```

```
## Error in lookup.xport(file): unable to open file: 'No such file or directory'
```

```r
ii <- sapply(dataSet, is.factor)
```

```
## Error in lapply(X = X, FUN = FUN, ...): object 'dataSet' not found
```

```r
dataSet[ii] <- lapply(dataSet[ii], as.character)
```

```
## Error in lapply(dataSet[ii], as.character): object 'dataSet' not found
```

```r
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfcrndex")
store <- new.rdf()  # Initialize
cat("Reading turtle definition from ", dataCubeFile, "\n")
```

```
## Reading turtle definition from
```

```r
temp<- load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : java.io.FileNotFoundException:  (No such file or directory)
```

```r
summarize.rdf(store)
```

```
## [1] "Number of triples: 40"
```

```r
dsdName<- GetDsdNameFromCube( store )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDsdNameFromCube"
```

```r
domainName<- GetDomainNameFromCube( store )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDomainNameFromCube"
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetForSparqlPrefix"
```

```r
custom.prefixes <-Get.qb.crnd.prefixes(domainName)
```

```
## Error in eval(expr, envir, enclos): could not find function "Get.qb.crnd.prefixes"
```

```r
common.prefixes <-data.frame(
  prefix=names( Get.default.crnd.prefixes() ),
  namespace=as.character( Get.default.crnd.prefixes() )
  )
```

```
## Error in data.frame(prefix = names(Get.default.crnd.prefixes()), namespace = as.character(Get.default.crnd.prefixes())): could not find function "Get.default.crnd.prefixes"
```

```r
 ## Prefix for storing the results of check each measure in the data cube

  validation.mesure.prefix<- data.frame(
    prefix=c("validmeas"),
    namespace=c(paste0("http://www.example.org/dc/",tolower(domainName),"/validmeas/"))
    )
```

```
## Error in tolower(domainName): object 'domainName' not found
```

```r
  prefixes<- rbind(common.prefixes, custom.prefixes, validation.mesure.prefix)
```

```
## Error in rbind(common.prefixes, custom.prefixes, validation.mesure.prefix): object 'common.prefixes' not found
```

```r
  forsparqlprefix<- paste("prefix", paste(prefixes$prefix,":",sep=""), paste("<",prefixes$namespace,">",sep=""),sep=" ",collapse="\n")
```

```
## Error in paste(prefixes$prefix, ":", sep = ""): object 'prefixes' not found
```

```r
  ## The qbfile also contains prefixes, which are part of the model
  ## So not adding the prefixes to the model, but using them for adding further
  ## information to the model when deriving statistics

  myprefixes<- qb.def.prefixlist(store, prefixes )
```

```
## Error in eval(expr, envir, enclos): could not find function "qb.def.prefixlist"
```

```r
res<- DeriveStatsForCube(store, forsparqlprefix, domainName, dsdName, dataSet, deriveMeasureList=NULL, checkOnly=FALSE, myprefixes=myprefixes ) 
```

```
## Error in eval(expr, envir, enclos): could not find function "DeriveStatsForCube"
```

```r
print(res)
```

```
## Error in print(res): object 'res' not found
```

TODO(mja): naming of parameters to function _DeriveStatsForCube_ to be updated.


End of file.
