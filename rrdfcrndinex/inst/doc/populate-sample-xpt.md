---
title: "Populate sample-xpt directory with example file in SAS transport xpt format"
author: "mja@statgroup.dk"
date: "2015-12-20"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Populate sample-xpt directory with example file in SAS transport xpt format}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Populate sample-xpt with example file in SAS transport xpt format

This script creates the result and codelist for a simple AE table.
The script is currently written to be executed manually.

TODO(mja): automate execution of script

This script downloads example files from phuse script repository
(https://github.com/phuse-org/phuse-scripts) and stores the files in
the corresponding example directory.


```r
library(rrdf)
```

```
## Loading required package: rJava
## Loading required package: methods
## Loading required package: rrdflibs
```

```r
library(tools)
```



```r
repositoryURL<- "https://raw.githubusercontent.com/phuse-org/phuse-scripts/master/scriptathon2014/data"

fnadae<- file.path( system.file("extdata/sample-xpt", package="rrdfcrndinex"), "adae.xpt" )
message("Downloading to ", fnadae )
```

```
## Downloading to /adae.xpt
```

```r
downloadURL<-paste0(repositoryURL, "/", "adae.xpt")
message("Downloading from ", downloadURL )
```

```
## Downloading from https://raw.githubusercontent.com/phuse-org/phuse-scripts/master/scriptathon2014/data/adae.xpt
```

```r
download.file( downloadURL, fnadae, method="curl")
```

```
## Warning in download.file(downloadURL, fnadae, method = "curl"): download
## had nonzero exit status
```

```r
fnadae<- file.path( system.file("extdata/sample-xpt", package="rrdfcrndinex"), "adsl.xpt" )
message("Downloading to ", fnadsl )
```

```
## Error in message("Downloading to ", fnadsl): object 'fnadsl' not found
```

```r
downloadURL<-paste0(repositoryURL, "/", "adsl.xpt")
message("Downloading from ", downloadURL )
```

```
## Downloading from https://raw.githubusercontent.com/phuse-org/phuse-scripts/master/scriptathon2014/data/adsl.xpt
```

```r
download.file( downloadURL, fnadsl, method="curl")
```

```
## Error in download.file(downloadURL, fnadsl, method = "curl"): object 'fnadsl' not found
```


```r
if (require(foreign)) {
fnadae<- system.file("extdata/sample-xpt", "adae.xpt", package="rrdfcrndinex")
message("Reading SAS transport file ", fnadae )
adae<-read.xport(fnadae)
str(adae)
fnadsl<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfcrndinex")
message("Reading SAS transport file ", fnadsl )
adsl<-read.xport(fnadsl)
str(adsl)

## sasxport.get should create dataset with dates
## lookup.xport(fnadsl)
## adslX<- Hmisc::sasxport.get(fnadsl,format=lookup.xport(fnadsl))
## adslX<- Hmisc::sasxport.get(fnadsl,format=lookup.xport(testFile)$FORMAT)
## adslX<- Hmisc::sasxport.get(fnadsl,method="sas")
## names(adslX)
## str(adslX$trtsdt)

## this works as expected
## testFile <- system.file('extdata', 'test2.xpt', package="SASxport")
## w<-Hmisc::sasxport.get(testFile)
## str(w$test)

## looks like it is easier to do own data conversion
## str(head(Hmisc:::importConvertDateTime(adsl$TRTSDT, "date", "sas")))
}
```

```
## Loading required package: foreign
## Reading SAS transport file
```

```
## Error in lookup.xport(file): unable to open file: 'No such file or directory'
```


```r
if (require(SASxport)) {

fnadsl<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfcrndinex")
message("Reading SAS transport file ", fnadsl, include.formats=TRUE )
print(SASxport::lookup.xport(fnadsl))
adsl<-SASxport::read.xport(fnadsl, include.formats=TRUE,verbose=TRUE)
str(adsl)
## do not understand why this is not a date
## running the example for SASxport::read.xport
## testFile <- system.file('extdata', 'test2.xpt', package="SASxport")
## w <- read.xport(testFile)
## class(w)
## sapply(w, head)
## shows SAS date times are imported as DATETIME
## w$TEST$DT1
## but SAS date are not imported
## w$TEST$D1
str(adsl$ADSL$TRTSDT)

fnadae<- system.file("extdata/sample-xpt", "adae.xpt", package="rrdfcrndinex")
message("Reading SAS transport file ", fnadae )
print(SASxport::lookup.xport(fnadae))
adae<-SASxport::read.xport(fnadae, include.formats=TRUE)
str(adae)

}
```

TODO(mja): move the example data into a separate package.
