---
title: "Derive results in RDF data cube and compare with results in data cube"
author: "mja@statgroup.dk"
date: "2015-09-22"
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
library(rrdfqbcrnd0)
```

```
## Loading required package: rrdf
## Loading required package: rrdflibs
## Loading required package: RCurl
## Loading required package: bitops
## 
## Attaching package: 'RCurl'
## 
## The following object is masked from 'package:rJava':
## 
##     clone
```

```
## Warning: replacing previous import by 'rJava::clone' when loading 'rrdfqbcrnd0'
```

```r
obsFile<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfqbcrnd0")
## TODO do not want factors in the data.frame
## http://stackoverflow.com/questions/2851015/convert-data-frame-columns-from-factors-to-characters
## better to use library(SASxport) - see inst/data-raw/create-dm-table-as-csv.Rmd
dataSet<-read.xport(obsFile)
ii <- sapply(dataSet, is.factor)
dataSet[ii] <- lapply(dataSet[ii], as.character)


dataCubeFile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfqbcrnd0")
store <- new.rdf()  # Initialize
cat("Reading turtle definition from ", dataCubeFile, "\n")
```

```
## Reading turtle definition from  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/sample-rdf/DC-DM-sample.ttl
```

```r
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)
```

```
## [1] "Number of triples: 1365"
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

res<- DeriveStatsForCube(store, forsparqlprefix, domainName, dsdName, dataSet, deriveMeasureList=NULL, checkOnly=FALSE, myprefixes=myprefixes ) 
```

```
## Number of differences  1 
## [1] "If the result is <0 x 0> matrix then all value matches"
```

```r
print(res)
```

```
## <0 x 0 matrix>
```

TODO(mja): naming of parameters to function _DeriveStatsForCube_ to be updated.


End of file.
