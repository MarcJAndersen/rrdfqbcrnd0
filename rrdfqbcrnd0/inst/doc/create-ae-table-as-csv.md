---
title: "Create AE table as csv file"
author: "mja@statgroup.dk"
date: "2015-04-06"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create AE table as csv file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create AE sample table as CSV file and other files

This script creates the result and codelist for a simple AE table.
The script is currently written to be executed manually.


```r
knitr::read_chunk("setup.R")
```

```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqbcrnd0
## Loading required package: rrdf
## Loading required package: rrdflibs
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

```
## Warning: character(0)
```


```r
require(foreign)
```

```
## Loading required package: foreign
```

```r
require(sqldf)
```

```
## Loading required package: sqldf
## Loading required package: gsubfn
## Loading required package: proto
## Loading required package: RSQLite
## Loading required package: DBI
```

```r
fnadae<- system.file("extdata/sample-xpt", "adae.xpt", package="rrdfqbcrnd0")
adae<- read.xport(fnadae)

aesummay.e<- sqldf("select TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD, 'count' as procedure, 'quantity' as factor, count(*) as measure from adae group by TRTA", stringsAsFactors=FALSE )
```

```
## Loading required package: tcltk
```

```r
aesoc.e<- sqldf("select TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD, 'count' as procedure, 'quantity' as factor, count(*) as measure from adae group by TRTA, SAFFL, AESOC", stringsAsFactors=FALSE )
aesocpt.e<- sqldf("select TRTA, SAFFL, AESOC, AEDECOD, 'count' as procedure, 'quantity' as factor, count(*) as measure from adae group by TRTA, SAFFL, AESOC, AEDECOD", stringsAsFactors=FALSE )

aesummay.n<- sqldf("select TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD, 'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure from adae group by TRTA", stringsAsFactors=FALSE )
aesoc.n<- sqldf("select TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD, 'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure from adae group by TRTA, SAFFL, AESOC", stringsAsFactors=FALSE )
aesocpt.n<- sqldf("select TRTA, SAFFL, AESOC, AEDECOD, 'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure from adae group by TRTA, SAFFL, AESOC, AEDECOD", stringsAsFactors=FALSE )

aetable<- rbind(aesummay.e, aesummay.n, aesoc.e, aesoc.n, aesocpt.e, aesocpt.n )
aetable$unit<- "_NULL_"
aetable$denominator<- "_NULL_"
names(aetable)<- tolower(names(aetable))

targetDir<- system.file("extdata/sample-cfg", package="rrdfqbcrnd0")
aetableFile<- file.path(targetDir, "ae.AR.csv")
write.csv(aetable, file=aetableFile,row.names=FALSE)
cat("Written to ", aetableFile, "\n")
```

```
## Written to  /home/ma/projects/R-packages/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-cfg/ae.AR.csv
```

```r
recode.aesoc.list<- sqldf("select distinct AESOC from adae", stringsAsFactors=FALSE)
names(recode.aesoc.list)<- tolower(names(recode.aesoc.list))
recode.aesoc.list<- rbind(recode.aesoc.list, data.frame(aesoc="_ALL_"))
for (i in 1:nrow(recode.aesoc.list)) { recode.aesoc.list[i,"recodeto"]<- encodetouri(as.character(recode.aesoc.list[i,1])) }
aesocFile<- file.path(targetDir, "ae.aesoc.AR.csv" )
write.csv(recode.aesoc.list, file=aesocFile, row.names=FALSE)
cat("Written to ", aesocFile, "\n")
```

```
## Written to  /home/ma/projects/R-packages/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-cfg/ae.aesoc.AR.csv
```

```r
recode.aedecod.list<- sqldf("select distinct AEDECOD from adae", stringsAsFactors=FALSE )
names(recode.aedecod.list)<- tolower(names(recode.aedecod.list))
recode.aedecod.list<- rbind(recode.aedecod.list, data.frame(aedecod="_ALL_"))
for (i in 1:nrow(recode.aedecod.list)) { recode.aedecod.list[i,"recodeto"]<- encodetouri(as.character(recode.aedecod.list[i,1])) }

aedecodFile<- file.path(targetDir, "ae.aedecod.AR.csv")
write.csv(recode.aedecod.list, file=aedecodFile, row.names=FALSE)
cat("Written to ", aedecodFile, "\n")
```

```
## Written to  /home/ma/projects/R-packages/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-cfg/ae.aedecod.AR.csv
```