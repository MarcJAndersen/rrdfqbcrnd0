---
title: "Create AE table as csv file"
author: "mja@statgroup.dk"
date: "2016-01-06"
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
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqbcrndex
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
fnadae<- system.file("extdata/sample-xpt", "adae.xpt", package="rrdfqbcrndex")
adae<- read.xport(fnadae)
```

```
## Error in lookup.xport(file): file not in SAS transfer format
```

```r
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

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesoc.trta.e<- sqldf("
select distinct TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by TRTA, SAFFL, AESOC
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesocpt.trta.e<- sqldf("
select distinct TRTA, SAFFL, AESOC, AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by TRTA, SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesummay.trta.n<- sqldf("
select distinct TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by TRTA
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesoc.trta.n<- sqldf("
select distinct TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by TRTA, SAFFL, AESOC
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesocpt.trta.n<- sqldf("
select distinct TRTA, SAFFL, AESOC, AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by TRTA, SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
## over treatment
aesummay.e<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae 
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesoc.e<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by SAFFL, AESOC
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesocpt.e<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, AEDECOD,
       'count' as procedure, 'quantity' as factor, count(*) as measure
from adae group by SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesummay.n<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, '_ALL_' as AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae 
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesoc.n<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, '_ALL_' as AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by SAFFL, AESOC
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aesocpt.n<- sqldf("
select distinct '_ALL_' as TRTA, SAFFL, AESOC, AEDECOD,
       'countdistinct' as procedure, 'USUBJID' as factor, count(distinct USUBJID) as measure
from adae group by SAFFL, AESOC, AEDECOD
", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
aetable.trta<- rbind(
  aesummay.trta.e, aesummay.trta.n, aesoc.trta.e, aesoc.trta.n, aesocpt.trta.e, aesocpt.trta.n
  )
```

```
## Error in rbind(aesummay.trta.e, aesummay.trta.n, aesoc.trta.e, aesoc.trta.n, : object 'aesummay.trta.e' not found
```

```r
aetable.all<- rbind(
  aesummay.e, aesummay.n, aesoc.e, aesoc.n, aesocpt.e, aesocpt.n
  )
```

```
## Error in rbind(aesummay.e, aesummay.n, aesoc.e, aesoc.n, aesocpt.e, aesocpt.n): object 'aesummay.e' not found
```

```r
aetable.rows<- rbind(
  aesummay.e, aesoc.e, aesocpt.e
  )
```

```
## Error in rbind(aesummay.e, aesoc.e, aesocpt.e): object 'aesummay.e' not found
```

```r
rowstosort<- aetable.rows[,c("AESOC", "AEDECOD" )]
```

```
## Error in eval(expr, envir, enclos): object 'aetable.rows' not found
```

```r
rows<- do.call(order, rowstosort)
```

```
## Error in do.call(order, rowstosort): object 'rowstosort' not found
```

```r
rowno.df<- rowstosort[rows,] 
```

```
## Error in eval(expr, envir, enclos): object 'rowstosort' not found
```

```r
rowno.df$rowno<- seq(nrow(rowstosort))
```

```
## Error in nrow(rowstosort): object 'rowstosort' not found
```

```r
colstosort<- unique(aetable.trta[,c("TRTA" )])
```

```
## Error in unique(aetable.trta[, c("TRTA")]): error in evaluating the argument 'x' in selecting a method for function 'unique': Error: object 'aetable.trta' not found
```

```r
cols<- order( colstosort)
```

```
## Error in order(colstosort): object 'colstosort' not found
```

```r
colno.df<- data.frame(TRTA=colstosort[cols] )
```

```
## Error in data.frame(TRTA = colstosort[cols]): object 'colstosort' not found
```

```r
colno.df$colno<- seq(length(colstosort))
```

```
## Error in seq(length(colstosort)): object 'colstosort' not found
```

```r
colno.df<- rbind(colno.df, data.frame( TRTA="_ALL_", colno=4))
```

```
## Error in rbind(colno.df, data.frame(TRTA = "_ALL_", colno = 4)): object 'colno.df' not found
```

```r
aetable.1<- rbind( aetable.trta, aetable.all )
```

```
## Error in rbind(aetable.trta, aetable.all): object 'aetable.trta' not found
```

```r
aetable.2<- merge( aetable.1, rowno.df, by=c("AESOC", "AEDECOD" ) )
```

```
## Error in merge(aetable.1, rowno.df, by = c("AESOC", "AEDECOD")): object 'aetable.1' not found
```

```r
aetable.3 <- merge( aetable.2, colno.df, by=c("TRTA" ) )
```

```
## Error in merge(aetable.2, colno.df, by = c("TRTA")): object 'aetable.2' not found
```

```r
aetable.4<-aetable.3[,c("TRTA", "AESOC", "AEDECOD", "procedure")]
```

```
## Error in eval(expr, envir, enclos): object 'aetable.3' not found
```

```r
aetable<- aetable.3[do.call(order, aetable.4),]
```

```
## Error in eval(expr, envir, enclos): object 'aetable.3' not found
```

```r
aetable$cellpartno<- ifelse(aetable$procedure=="count", 1, 2)
```

```
## Error in ifelse(aetable$procedure == "count", 1, 2): object 'aetable' not found
```

```r
kable(aetable)
```

```
## Error in eval(expr, envir, enclos): could not find function "kable"
```

```r
check<- aetable[,c("rowno", "colno", "cellpartno" )]
```

```
## Error in eval(expr, envir, enclos): object 'aetable' not found
```

```r
dupObs<-duplicated(check)
```

```
## Error in duplicated(check): error in evaluating the argument 'x' in selecting a method for function 'duplicated': Error: object 'check' not found
```

```r
if (any(dupObs)) {
## idea from http://stackoverflow.com/questions/12495345/find-indices-of-duplicated-rows
  dupObsRev<-  duplicated(check, fromLast=TRUE)
  kable( aetable[which(dupObs | dupObsRev ), ] )
    stop("Unexpected an observation is not uniquely identified by row, column and cellpart number")
  }
```

```
## Error in eval(expr, envir, enclos): object 'dupObs' not found
```

```r
aetable$unit<- "_NULL_"
```

```
## Error in aetable$unit <- "_NULL_": object 'aetable' not found
```

```r
aetable$denominator<- "_NULL_"
```

```
## Error in aetable$denominator <- "_NULL_": object 'aetable' not found
```

```r
names(aetable)<- tolower(names(aetable))
```

```
## Error in tolower(names(aetable)): object 'aetable' not found
```

```r
targetDir<- system.file("extdata/sample-cfg", package="rrdfqbcrndex")
aetableFile<- file.path(targetDir, "ae.AR.csv")
write.csv(aetable, file=aetableFile,row.names=FALSE)
```

```
## Error in is.data.frame(x): object 'aetable' not found
```

```r
cat("Written to ", aetableFile, "\n")
```

```
## Written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-cfg/ae.AR.csv
```

```r
recode.aesoc.list<- sqldf("select distinct AESOC from adae", stringsAsFactors=FALSE)
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
names(recode.aesoc.list)<- tolower(names(recode.aesoc.list))
```

```
## Error in tolower(names(recode.aesoc.list)): object 'recode.aesoc.list' not found
```

```r
recode.aesoc.list<- rbind(recode.aesoc.list, data.frame(aesoc="_ALL_"))
```

```
## Error in rbind(recode.aesoc.list, data.frame(aesoc = "_ALL_")): object 'recode.aesoc.list' not found
```

```r
for (i in 1:nrow(recode.aesoc.list)) { recode.aesoc.list[i,"recodeto"]<- encodetouri(as.character(recode.aesoc.list[i,1])) }
```

```
## Error in nrow(recode.aesoc.list): object 'recode.aesoc.list' not found
```

```r
aesocFile<- file.path(targetDir, "ae.aesoc.AR.csv" )
write.csv(recode.aesoc.list, file=aesocFile, row.names=FALSE)
```

```
## Error in is.data.frame(x): object 'recode.aesoc.list' not found
```

```r
cat("Written to ", aesocFile, "\n")
```

```
## Written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-cfg/ae.aesoc.AR.csv
```

```r
recode.aedecod.list<- sqldf("select distinct AEDECOD from adae", stringsAsFactors=FALSE )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adae
```

```r
names(recode.aedecod.list)<- tolower(names(recode.aedecod.list))
```

```
## Error in tolower(names(recode.aedecod.list)): object 'recode.aedecod.list' not found
```

```r
recode.aedecod.list<- rbind(recode.aedecod.list, data.frame(aedecod="_ALL_"))
```

```
## Error in rbind(recode.aedecod.list, data.frame(aedecod = "_ALL_")): object 'recode.aedecod.list' not found
```

```r
for (i in 1:nrow(recode.aedecod.list)) { recode.aedecod.list[i,"recodeto"]<- encodetouri(as.character(recode.aedecod.list[i,1])) }
```

```
## Error in nrow(recode.aedecod.list): object 'recode.aedecod.list' not found
```

```r
aedecodFile<- file.path(targetDir, "ae.aedecod.AR.csv")
write.csv(recode.aedecod.list, file=aedecodFile, row.names=FALSE)
```

```
## Error in is.data.frame(x): object 'recode.aedecod.list' not found
```

```r
cat("Written to ", aedecodFile, "\n")
```

```
## Written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-cfg/ae.aedecod.AR.csv
```
