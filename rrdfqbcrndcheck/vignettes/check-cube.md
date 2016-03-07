---
title: "Derive results in RDF data cube and compare with results in data cube"
author: "mja@statgroup.dk"
date: "2016-03-07"
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
```

```
## Loading required package: methods
```

```
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
library(rrdfqb)
```

```
## Loading required package: RCurl
```

```
## Loading required package: bitops
```

```
## 
## Attaching package: 'RCurl'
```

```
## The following object is masked from 'package:rJava':
## 
##     clone
```

```
## Loading required package: rrdfancillary
```

```r
library(rrdfqbcrnd0)
```

```
## Loading required package: rrdfcdisc
```

```
## Loading required package: devtools
```

```
## 
## Attaching package: 'rrdfqbcrnd0'
```

```
## The following object is masked from 'package:rrdfcdisc':
## 
##     summarize.rdf.noprint
```

```r
library(rrdfqbcrndex)
library(rrdfqbcrndcheck)


obsFile<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfqbcrndex")
## TODO do not want factors in the data.frame
## http://stackoverflow.com/questions/2851015/convert-data-frame-columns-from-factors-to-characters
## better to use library(SASxport) - see inst/data-raw/create-dm-table-as-csv.Rmd
dataSet<-read.xport(obsFile)
ii <- sapply(dataSet, is.factor)
dataSet[ii] <- lapply(dataSet[ii], as.character)
```
The conversion to character can be avoided by using
`library(SASxport)`, see
(../../rrdfqbcrndex/inst/data-raw/create-dm-table-as-csv.Rmd).


```r
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfqbcrndex")
store <- new.rdf()  # Initialize
cat("Reading turtle definition from ", dataCubeFile, "\n")
```

```
## Reading turtle definition from  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrndex/extdata/sample-rdf/DC-DM-sample.ttl
```

```r
temp<- load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)
```

```
## [1] "Number of triples: 1450"
```

```r
dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
forsparqlprefix<- GetForSparqlPrefix( domainName )
custom.prefixes <-Get.qb.crnd.prefixes(domainName)

common.prefixes <-data.frame(
  prefix=names( Get.default.crnd.prefixes() ),
  namespace=as.character( Get.default.crnd.prefixes() )
  )

 ## Prefix for storing the results of check each measure in the data cube

  validation.mesure.prefix<- data.frame(
    prefix=c("validmeas"),
    namespace=c(paste0("http://www.example.org/dc/",tolower(domainName),"/validmeas/"))
    )

  prefixes<- rbind(common.prefixes, custom.prefixes, validation.mesure.prefix)

  forsparqlprefix<- paste("prefix", paste(prefixes$prefix,":",sep=""), paste("<",prefixes$namespace,">",sep=""),sep=" ",collapse="\n")

  ## The qbfile also contains prefixes, which are part of the model
  ## So not adding the prefixes to the model, but using them for adding further
  ## information to the model when deriving statistics

  myprefixes<- qb.def.prefixlist(store, prefixes )

res<- DeriveStatsForCube(store, forsparqlprefix, domainName, dsdName, dataSet, deriveMeasureList=NULL, checkOnly=FALSE, myprefixes=myprefixes, filterexpr=" " ) 
```

```
## Error in DeriveStatsForCube(store, forsparqlprefix, domainName, dsdName, : unused argument (filterexpr = " ")
```

```r
print(res)
```

```
## Error in print(res): object 'res' not found
```

TODO(mja): naming of parameters to function _DeriveStatsForCube_ to be updated.


End of file.
