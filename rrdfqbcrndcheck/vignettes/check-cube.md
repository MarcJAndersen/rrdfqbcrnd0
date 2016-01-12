---
title: "Derive results in RDF data cube and compare with results in data cube"
author: "mja@statgroup.dk"
date: "2016-01-12"
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
library(rrdfqbcrnd0)
```

```
## Loading required package: RCurl
## Loading required package: bitops
## 
## Attaching package: 'RCurl'
## 
## The following object is masked from 'package:rJava':
## 
##     clone
```

```r
library(rrdfqbcrndex)


obsFile<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfqbcrndex")
## TODO do not want factors in the data.frame
## http://stackoverflow.com/questions/2851015/convert-data-frame-columns-from-factors-to-characters
## better to use library(SASxport) - see inst/data-raw/create-dm-table-as-csv.Rmd
dataSet<-read.xport(obsFile)
ii <- sapply(dataSet, is.factor)
dataSet[ii] <- lapply(dataSet[ii], as.character)


dataCubeFile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfqbcrndex")
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
## Error in GetDomainNameFromCube(store): could not find function "GetDsdNameFromCube"
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

```
## Error in GetForSparqlPrefix(domainName): could not find function "Get.rq.prefix.df"
```

```r
custom.prefixes <-Get.qb.crnd.prefixes(domainName)
```

```
## Error in tolower(domainName): object 'domainName' not found
```

```r
common.prefixes <-data.frame(
  prefix=names( Get.default.crnd.prefixes() ),
  namespace=as.character( Get.default.crnd.prefixes() )
  )

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
## Error in rbind(common.prefixes, custom.prefixes, validation.mesure.prefix): object 'custom.prefixes' not found
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
## Error in qb.def.prefixlist(store, prefixes): could not find function "qb.add.prefixlist.to.store"
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
