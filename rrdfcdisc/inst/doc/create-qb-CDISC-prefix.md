---
title: "Create prefixes for use with CDISC standards in RDF"
author: "mja@statgroup.dk"
date: "2016-01-05"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create prefixes for use with CDISC standards in RDF}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create prefixes for use with CDISC standards in RDF

## Setup 

```r
library(devtools)
devtools::load_all(pkg="../..")
```

```
## Loading rrdfcdisc
## Loading required package: RCurl
## Loading required package: methods
## Loading required package: bitops
## Loading required package: rrdf
## Loading required package: rJava
## 
## Attaching package: 'rJava'
## 
## The following object is masked from 'package:RCurl':
## 
##     clone
## 
## Loading required package: rrdflibs
```

# Prefixes for the package

This script creates a list with the prefix used for the package.
The prefix corresponds to the usual values.


```r
qbCDISCprefixes<-  list(
 "rdf"= "http://www.w3.org/1999/02/22-rdf-syntax-ns#" ,
 "skos"="http://www.w3.org/2004/02/skos/core#" ,
 "prov"="http://www.w3.org/ns/prov#" ,
 "rdfs"="http://www.w3.org/2000/01/rdf-schema#" ,
 "dcat"="http://www.w3.org/ns/dcat#" ,
 "owl"= "http://www.w3.org/2002/07/owl#" ,
 "xsd"= "http://www.w3.org/2001/XMLSchema#" ,
 "qb"=  "http://purl.org/linked-data/cube#" ,
 "pav"= "http://purl.org/pav" ,
 "dct"= "http://purl.org/dc/terms/" ,
 "mms"= "http://rdf.cdisc.org/mms#" ,
 "cts"= "http://rdf.cdisc.org/ct/schema#",
 "rrdfqbcrnd0"="http://www.example.org/rrdfqbcrnd0/"
) 
```



```r
devtools::use_data(qbCDISCprefixes,overwrite=TRUE)
```

```
## Saving qbCDISCprefixes to data/qbCDISCprefixes.rda
```
