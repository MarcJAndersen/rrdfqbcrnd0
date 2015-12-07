---
title: "Create AE table as csv file"
author: "mja@statgroup.dk"
date: "2015-12-08"
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


## by treatment
aesummay.trta.e<- sqldf("
select distinct TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by TRTA
", stringsAsFactors=FALSE )
```

```
## Loading required package: tcltk
```

```r
aesoc.trta.e<- sqldf("
select distinct TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by TRTA, SAFFL, AESOC
", stringsAsFactors=FALSE )

aesocpt.trta.e<- sqldf("
select distinct TRTA, SAFFL, AESOC, AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by TRTA, SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )

aesummay.trta.n<- sqldf("
select distinct TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by TRTA
", stringsAsFactors=FALSE )

aesoc.trta.n<- sqldf("
select distinct TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by TRTA, SAFFL, AESOC
", stringsAsFactors=FALSE )

aesocpt.trta.n<- sqldf("
select distinct TRTA, SAFFL, AESOC, AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by TRTA, SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )

## over treatment
aesummay.e<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae 
", stringsAsFactors=FALSE )

aesoc.e<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by SAFFL, AESOC
", stringsAsFactors=FALSE )

aesocpt.e<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )

aesummay.n<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae 
", stringsAsFactors=FALSE )

aesoc.n<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by SAFFL, AESOC
", stringsAsFactors=FALSE )

aesocpt.n<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )

aetable.trta<- rbind(
  aesummay.trta.e, aesummay.trta.n, aesoc.trta.e, aesoc.trta.n, aesocpt.trta.e, aesocpt.trta.n
  )

aetable.all<- rbind(
  aesummay.e, aesummay.n, aesoc.e, aesoc.n, aesocpt.e, aesocpt.n
  )

aetable.rows<- rbind(
  aesummay.e, aesoc.e, aesocpt.e
  )

rowstosort<- aetable.rows[,c("AESOC", "AEDECOD" )]
rows<- do.call(order, rowstosort)
rowno.df<- rowstosort[rows,] 
rowno.df$rowno<- seq(nrow(rowstosort))

colstosort<- unique(aetable.trta[,c("TRTA" )])
cols<- order( colstosort)
colno.df<- data.frame(TRTA=colstosort[cols] )
colno.df$colno<- seq(length(colstosort))
colno.df<- rbind(colno.df, data.frame( TRTA="_ALL_", colno=4))

aetable.1<- rbind( aetable.trta, aetable.all )
aetable.2<- merge( aetable.1, rowno.df, by=c("AESOC", "AEDECOD" ) )
aetable.3 <- merge( aetable.2, colno.df, by=c("TRTA" ) )

aetable.4<-aetable.3[,c("TRTA", "AESOC", "AEDECOD", "procedure")]
aetable<- aetable.3[do.call(order, aetable.4),]
aetable$cellpartno<- ifelse(aetable$procedure=="count", 1, 2)
kable(aetable)
```

```
## Error in eval(expr, envir, enclos): could not find function "kable"
```

```r
check<- aetable[,c("rowno", "colno", "cellpartno" )]
dupObs<-duplicated(check)
if (any(dupObs)) {
## idea from http://stackoverflow.com/questions/12495345/find-indices-of-duplicated-rows
  dupObsRev<-  duplicated(check, fromLast=TRUE)
  kable( aetable[which(dupObs | dupObsRev ), ] )
    stop("Unexpected an observation is not uniquely identified by row, column and cellpart number")
  }

aetable$unit<- "_NULL_"
aetable$denominator<- "_NULL_"
names(aetable)<- tolower(names(aetable))

targetDir<- system.file("extdata/sample-cfg", package="rrdfqbcrnd0")
aetableFile<- file.path(targetDir, "ae.AR.csv")
write.csv(aetable, file=aetableFile,row.names=FALSE)
cat("Written to ", aetableFile, "\n")
```

```
## Written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-cfg/ae.AR.csv
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
## Written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-cfg/ae.aesoc.AR.csv
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
## Written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-cfg/ae.aedecod.AR.csv
```
