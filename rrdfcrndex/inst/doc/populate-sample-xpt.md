---
title: "Populate sample-xpt directory with example file in SAS transport xpt format"
author: "mja@statgroup.dk"
date: "2015-12-22"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Populate sample-xpt directory with example file in SAS transport xpt format}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Populate sample-xpt with example file in SAS transport xpt format

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
devtools::load_all(pkg="../..")
```

```
## Loading rrdfcrndex
## Loading required package: xlsx
## Loading required package: xlsxjars
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
repositoryURL<- "https://raw.githubusercontent.com/phuse-org/phuse-scripts/master/scriptathon2014/data"

fnadae<- file.path( system.file("extdata/sample-xpt", package="rrdfcrndex"), "adae.xpt" )
message("Downloading to ", fnadae )
```

```
## Downloading to /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfcrndex/inst/extdata/sample-xpt/adae.xpt
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

fnadsl<- file.path( system.file("extdata/sample-xpt", package="rrdfcrndex"), "adsl.xpt" )
message("Downloading to ", fnadsl )
```

```
## Downloading to /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfcrndex/inst/extdata/sample-xpt/adsl.xpt
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


```r
if (require(foreign)) {
fnadae<- system.file("extdata/sample-xpt", "adae.xpt", package="rrdfcrndex")
message("Reading SAS transport file ", fnadae )
adae<-read.xport(fnadae)
fnadsl<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfcrndex")
message("Reading SAS transport file ", fnadsl )
adsl<-read.xport(fnadsl)

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
## Reading SAS transport file /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfcrndex/inst/extdata/sample-xpt/adae.xpt
## Reading SAS transport file /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfcrndex/inst/extdata/sample-xpt/adsl.xpt
```

The following codes is not evaluated.


```r
if (require(SASxport)) {

fnadsl<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfcrndex")
message("Reading SAS transport file ", fnadsl, include.formats=TRUE )
print(SASxport::lookup.xport(fnadsl))
adsl<-SASxport::read.xport(fnadsl, include.formats=TRUE,verbose=TRUE)
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

fnadae<- system.file("extdata/sample-xpt", "adae.xpt", package="rrdfcrndex")
message("Reading SAS transport file ", fnadae )
print(SASxport::lookup.xport(fnadae))
adae<-SASxport::read.xport(fnadae, include.formats=TRUE)
str(adae)

}
```

