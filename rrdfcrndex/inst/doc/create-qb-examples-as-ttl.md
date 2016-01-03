---
title: "Create DEMO table as csv file"
author: "mja@statgroup.dk"
date: "2016-01-03"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create DEMO table from csv file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create turtle version of example files

This script creates the result and codelist for a simple DEMO table.


```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfcrndex
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
## http://stackoverflow.com/questions/14896941/install-an-r-package-temporarily-only-for-the-current-session
tmp.install.packages <- function(pack, dependencies=TRUE, ...) {
  path <- tempdir()
  ## Add 'path' to .libPaths, and be sure that it is not
  ## at the first position, otherwise any other package during
  ## this session would be installed into 'path'
  firstpath <- .libPaths()[1]
  .libPaths(c(firstpath, path))
  install.packages(pack, dependencies=dependencies, lib=path, ...)
}
tmp.install.packages("../../../rrdfqbcrnd0_0.1.19.tar.gz")
```

```
## inferring 'repos = NULL' from 'pkgs'
```

All files are store to the directory

```r
targetDir<- system.file("extdata/sample-rdf", package="rrdfcrndex")
```

## RDF data cubes specified in workbook


```r
RDFCubeWorkbook<- system.file("extdata/sample-cfg", "RDFCubeWorkbook.xlsx", package="rrdfcrndex")

dm.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "DM" )
```

```
## Error in eval(expr, envir, enclos): could not find function "BuildCubeFromWorkbook"
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
```

```
## Error in eval(expr, envir, enclos): could not find function "BuildCubeFromWorkbook"
```

```r
cat("AE cube stored as ", ae.cube.fn, "\n")
```

```
## Error in cat("AE cube stored as ", ae.cube.fn, "\n"): object 'ae.cube.fn' not found
```

```r
targetFile<- file.path(targetDir,"DC-AE-sample.ttl")
if (file.copy( ae.cube.fn, targetFile, overwrite=TRUE)) {
  cat("AE cube copied to ", normalizePath(targetFile), "\n")
}
```

```
## Error in file.copy(ae.cube.fn, targetFile, overwrite = TRUE): object 'ae.cube.fn' not found
```

## RDF data cube in csv files


```r
demoObsDataCsvFn<- system.file("extdata/sample-cfg", "demo.AR.csv", package="rrdfcrndex")
demoObsData <- read.csv(demoObsDataCsvFn,stringsAsFactors=FALSE)

##TODO add measurefmt; quick hack - affects vignettes/cube-from-workbook.Rmd and
##TODO inst/data-raw/create-qb-examples-as-ttl.Rmd
if (!( "measurefmt" %in% names(demoObsData))) {
demoObsData$measurefmt<- "%6.1f"
demoObsData$measurefmt[ demoObsData$procedure %in% c("n", "nmiss", "count") ]<- "%6.0f"
## sprintf( demoObsData$measurefmt, demoObsData$measure)
}

demoMetaDataCsvFn<- system.file("extdata/sample-cfg", "DEMO-Components.csv", package="rrdfcrndex")
demoMetaData <- read.csv(demoMetaDataCsvFn,stringsAsFactors=FALSE)

demo.cube.fn<- BuildCubeFromDataFrames(demoMetaData, demoObsData )
```

```
## Error in eval(expr, envir, enclos): could not find function "BuildCubeFromDataFrames"
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

