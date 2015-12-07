---
title: "Create DEMO table as csv file"
author: "mja@statgroup.dk"
date: "2015-12-08"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create DEMO table from csv file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create turtle version of example files

This script creates the result and codelist for a simple DEMO table.


```r
knitr::read_chunk("setup.R")
```

```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqbcrnd0
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
All files are store to the directory

```r
targetDir<- system.file("extdata/sample-rdf", package="rrdfqbcrnd0")
```

## RDF data cubes specified in workbook


```r
RDFCubeWorkbook<- system.file("extdata/sample-cfg", "RDFCubeWorkbook.xlsx", package="rrdfqbcrnd0")

dm.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "DM" )
```

```
## Start loading rdf.cdisc.org contents from /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/CDISC-standards-rdf/cdisc-rdf.zip
## Done loading rdf.cdisc.org contents, number of triples: 165672
```

```r
cat("DM cube stored as ", dm.cube.fn, "\n")
```

```
## DM cube stored as  /tmp/RtmpaCA7tK/DC-DM-R-V-0-5-2.ttl
```

```r
targetFile<- file.path(targetDir,"DC-DM-sample.ttl")

if (file.copy( dm.cube.fn, targetFile, overwrite=TRUE)) {
  cat("DM cube copied to ", normalizePath(targetFile), "\n")
}
```

```
## DM cube copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/DC-DM-sample.ttl
```

```r
ae.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "AE" )
cat("AE cube stored as ", ae.cube.fn, "\n")
```

```
## AE cube stored as  /tmp/RtmpaCA7tK/DC-AE-R-V-0-5-2.ttl
```

```r
targetFile<- file.path(targetDir,"DC-AE-sample.ttl")
if (file.copy( ae.cube.fn, targetFile, overwrite=TRUE)) {
  cat("AE cube copied to ", normalizePath(targetFile), "\n")
}
```

```
## AE cube copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/DC-AE-sample.ttl
```

## RDF data cube in csv files


```r
demoObsDataCsvFn<- system.file("extdata/sample-cfg", "demo.AR.csv", package="rrdfqbcrnd0")
demoObsData <- read.csv(demoObsDataCsvFn,stringsAsFactors=FALSE)

##TODO add measurefmt; quick hack - affects vignettes/cube-from-workbook.Rmd and
##TODO inst/data-raw/create-qb-examples-as-ttl.Rmd
if (!( "measurefmt" %in% names(demoObsData))) {
demoObsData$measurefmt<- "%6.1f"
demoObsData$measurefmt[ demoObsData$procedure %in% c("n", "nmiss", "count") ]<- "%6.0f"
## sprintf( demoObsData$measurefmt, demoObsData$measure)
}

demoMetaDataCsvFn<- system.file("extdata/sample-cfg", "DEMO-Components.csv", package="rrdfqbcrnd0")
demoMetaData <- read.csv(demoMetaDataCsvFn,stringsAsFactors=FALSE)

demo.cube.fn<- BuildCubeFromDataFrames(demoMetaData, demoObsData )
cat("DEMO cube stored as ", normalizePath(demo.cube.fn), "\n")
```

```
## DEMO cube stored as  /tmp/RtmpaCA7tK/DC-DEMO-R-V-0-5-2.ttl
```

```r
targetFile<- file.path(targetDir,"DC-DEMO-sample.ttl")

if (file.copy( demo.cube.fn, targetFile, overwrite=TRUE)) {
   cat("DEMO cube copied to ", normalizePath(targetFile), "\n")
 }
```

```
## DEMO cube copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/DC-DEMO-sample.ttl
```

