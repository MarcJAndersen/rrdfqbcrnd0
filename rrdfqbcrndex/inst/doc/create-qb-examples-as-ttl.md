---
title: "Create DEMO table as csv file"
author: "mja@statgroup.dk"
date: "2016-01-06"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create DEMO table from csv file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create turtle version of example files

This script creates the result and codelist for a simple DEMO table.


```r
library(rrdfqb)
```

```
## Loading required package: xlsx
## Loading required package: rJava
## Loading required package: methods
## Loading required package: xlsxjars
## Loading required package: RCurl
## Loading required package: bitops
## 
## Attaching package: 'RCurl'
## 
## The following object is masked from 'package:rJava':
## 
##     clone
## 
## Loading required package: rrdf
## Loading required package: rrdflibs
```

```r
library(rrdfqbcrnd0)
library(rrdfcdisc)
```

```
## Loading required package: devtools
## 
## Attaching package: 'rrdfcdisc'
## 
## The following object is masked from 'package:rrdfqbcrnd0':
## 
##     summarize.rdf.noprint
```

```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqbcrndex
```

All files are stored in the directory

```r
targetDir<- system.file("extdata/sample-rdf", package="rrdfqbcrndex")
(targetDir)
```

```
## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf"
```

## RDF data cubes specified in workbook


```r
RDFCubeWorkbook<- system.file("extdata/sample-cfg", "RDFCubeWorkbook.xlsx", package="rrdfqbcrndex")
(RDFCubeWorkbook)
```

```
## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-cfg/RDFCubeWorkbook.xlsx"
```

```r
dm.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "DM" )
```

```
## Start loading rdf.cdisc.org contents from /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/CDISC-standards-rdf/cdisc-rdf.zip
## Done loading rdf.cdisc.org contents, number of triples: 165672
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : method sparql with signature (Ljava/lang/String;)Lcom/github/egonw/rrdf/StringMatrix; not found
```

```r
cat("DM cube stored as ", dm.cube.fn, "\n")
```

```
## Error in cat("DM cube stored as ", dm.cube.fn, "\n"): object 'dm.cube.fn' not found
```

```r
targetFile<- file.path(targetDir,"DC-DM-sample.ttl")

if (file.copy( dm.cube.fn, targetFile, overwrite=TRUE)) {
  cat("DM cube copied to ", normalizePath(targetFile), "\n")
}
```

```
## Error in file.copy(dm.cube.fn, targetFile, overwrite = TRUE): object 'dm.cube.fn' not found
```

```r
ae.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "AE" )
cat("AE cube stored as ", ae.cube.fn, "\n")
```

```
## AE cube stored as  /tmp/RtmpPTCWOg/DC-AE-R-V-0-5-2.ttl
```

```r
targetFile<- file.path(targetDir,"DC-AE-sample.ttl")
if (file.copy( ae.cube.fn, targetFile, overwrite=TRUE)) {
  cat("AE cube copied to ", normalizePath(targetFile), "\n")
}
```

```
## AE cube copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DC-AE-sample.ttl
```

## RDF data cube in csv files


```r
demoObsDataCsvFn<- system.file("extdata/sample-cfg", "demo.AR.csv", package="rrdfqbcrndex")
demoObsData <- read.csv(demoObsDataCsvFn,stringsAsFactors=FALSE)

##TODO add measurefmt; quick hack - affects vignettes/cube-from-workbook.Rmd and
##TODO inst/data-raw/create-qb-examples-as-ttl.Rmd
if (!( "measurefmt" %in% names(demoObsData))) {
demoObsData$measurefmt<- "%6.1f"
demoObsData$measurefmt[ demoObsData$procedure %in% c("n", "nmiss", "count") ]<- "%6.0f"
## sprintf( demoObsData$measurefmt, demoObsData$measure)
}

demoMetaDataCsvFn<- system.file("extdata/sample-cfg", "DEMO-Components.csv", package="rrdfqbcrndex")
demoMetaData <- read.csv(demoMetaDataCsvFn,stringsAsFactors=FALSE)

demo.cube.fn<- BuildCubeFromDataFrames(demoMetaData, demoObsData )
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : method sparql with signature (Ljava/lang/String;)Lcom/github/egonw/rrdf/StringMatrix; not found
```

```r
cat("DEMO cube stored as ", normalizePath(demo.cube.fn), "\n")
```

```
## Error in path.expand(path): object 'demo.cube.fn' not found
```

```r
targetFile<- file.path(targetDir,"DC-DEMO-sample.ttl")

if (file.copy( demo.cube.fn, targetFile, overwrite=TRUE)) {
   cat("DEMO cube copied to ", normalizePath(targetFile), "\n")
 }
```

```
## Error in file.copy(demo.cube.fn, targetFile, overwrite = TRUE): object 'demo.cube.fn' not found
```

