---
title: "SQL code for verifying results in RDF data cube"
author: "mja@statgroup.dk"
date: "2016-03-07"
vignette: >
  %\VignetteIndexEntry{SQL code for verifying results in RDF data cube}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---

# Derive results in RDF data cube and compare with results in data cube

## Setup
Here all libraries are loaded; this should not be necessary.

```r
options(width=200) # long lines
library(xlsx)
```

```
## Loading required package: rJava
```

```
## Loading required package: methods
```

```
## Loading required package: xlsxjars
```

```r
library(foreign)
library(rrdf)
```

```
## Loading required package: rrdflibs
```

```r
library(rrdfqb)
```

```
## Loading required package: RCurl
```

```
## Loading required package: bitops
```

```
## 
## Attaching package: 'RCurl'
```

```
## The following object is masked from 'package:rJava':
## 
##     clone
```

```
## Loading required package: rrdfancillary
```

```r
library(rrdfqbcrnd0)
```

```
## Loading required package: rrdfcdisc
```

```
## Loading required package: devtools
```

```
## 
## Attaching package: 'rrdfqbcrnd0'
```

```
## The following object is masked from 'package:rrdfcdisc':
## 
##     summarize.rdf.noprint
```

```r
library(rrdfqbcrndex)
library(rrdfqbcrndcheck)
```

## Load the data
The SAS dataset is loaded, and factors converted to character.

```r
obsFile<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfqbcrndex")
adsl<-read.xport(obsFile)
ii <- sapply(adsl, is.factor)
adsl[ii] <- lapply(adsl[ii], as.character)
```

The conversion to character can be avoided by using
`library(SASxport)`, see
(../../rrdfqbcrndex/inst/data-raw/create-dm-table-as-csv.Rmd).

## Load the RDF data cube
The RDF data cube is loaded.

```r
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfqbcrndex")
store <- new.rdf()  # Initialize
cat("Reading turtle definition from ", dataCubeFile, "\n")
```

```
## Reading turtle definition from  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrndex/extdata/sample-rdf/DC-DM-sample.ttl
```

```r
temp<- load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)
```

```
## [1] "Number of triples: 1450"
```

The mean values for the `WEIGHTBL` variable in RDF data cube is:

```r
rq<-'
prefix crnd-measure: <http://www.example.org/dc/measure#> 
prefix code:  <http://www.example.org/dc/code/> 
prefix crnd-attribute: <http://www.example.org/dc/attribute#> 
prefix ds:    <http://www.example.org/dc/dm/ds/> 
prefix qb:    <http://purl.org/linked-data/cube#> 
prefix crnd-dimension: <http://www.example.org/dc/dimension#> 
select * where {
?obs  a                         qb:Observation ;
    qb:dataSet                  ds:dataset-DM ;
        crnd-dimension:factor       code:factor-WEIGHTBL ;
        crnd-dimension:procedure    code:procedure-mean ;
        crnd-dimension:race         code:race-_ALL_ ;
        crnd-dimension:saffl        code:saffl-Y ;
        crnd-dimension:sex          code:sex-_ALL_ ;
        crnd-dimension:trt01a       ?trt01a ;
    crnd-measure:measure        ?measure .
}
'
knitr::kable(data.frame(sparql.rdf( store, rq)))
```



|obs      |trt01a                           |measure          |
|:--------|:--------------------------------|:----------------|
|ds:obs38 |code:trt01a-Xanomeline_High_Dose |70.0047619047619 |
|ds:obs17 |code:trt01a-Placebo              |62.7593023255814 |
|ds:obs59 |code:trt01a-Xanomeline_Low_Dose  |67.2795180722892 |
The SPARQL query about can be made more generic. 
## Generate SQL statements
From the RDF data cube loading in the store, the function `GetSQLFromCube` generates the SQL statements for reproducing the data cube.
Only the first two select statements are shown.

```r
stmtSQL<- GetSQLFromCube( store, srcDsName="adsl" )
cat(paste(unlist(strsplit(stmtSQL$summStatSQL,split="\n"))[1:3],collapse="\n"),"\n")
```

```
## SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'min' as procedure, 'AGE' as factor, '_NULL_' as denominator, 'YEARS' as unit, min(AGE) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
## UNION
## SELECT a.TRT01A, '_ALL_' as RACE, a.SEX, a.SAFFL, 'count' as procedure, 'quantity' as factor, '_ALL_' as denominator, '_NULL_' as unit, count(*) as measure from  adsl  as a   group by  a.TRT01A, a.SEX, a.SAFFL
```

## Derive the descriptive statistics


```r
library(sqldf)
```

```
## Loading required package: gsubfn
```

```
## Loading required package: proto
```

```
## Loading required package: RSQLite
```

```
## Loading required package: DBI
```

```r
adsl.summ.stat.res<- sqldf( stmtSQL$summStatSQL)
```

```
## Loading required package: tcltk
```

```r
names(adsl.summ.stat.res)<- tolower(gsub("(a|b)\\.","", names(adsl.summ.stat.res)))
knitr::kable(adsl.summ.stat.res)
```



|trt01a               |race                             |sex   |saffl |procedure |factor     |denominator |unit   |    measure|
|:--------------------|:--------------------------------|:-----|:-----|:---------|:----------|:-----------|:------|----------:|
|Placebo              |AMERICAN INDIAN OR ALASKA NATIVE |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |   0.000000|
|Placebo              |BLACK OR AFRICAN AMERICAN        |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |   8.000000|
|Placebo              |BLACK OR AFRICAN AMERICAN        |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |   9.302326|
|Placebo              |WHITE                            |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |  78.000000|
|Placebo              |WHITE                            |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |  90.697674|
|Placebo              |_ALL_                            |F     |Y     |count     |quantity   |_ALL_       |_NULL_ |  53.000000|
|Placebo              |_ALL_                            |F     |Y     |percent   |proportion |SEX         |_NULL_ |  61.627907|
|Placebo              |_ALL_                            |M     |Y     |count     |quantity   |_ALL_       |_NULL_ |  33.000000|
|Placebo              |_ALL_                            |M     |Y     |percent   |proportion |SEX         |_NULL_ |  38.372093|
|Placebo              |_ALL_                            |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |  86.000000|
|Placebo              |_ALL_                            |_ALL_ |Y     |max       |AGE        |_NULL_      |YEARS  |  89.000000|
|Placebo              |_ALL_                            |_ALL_ |Y     |max       |WEIGHTBL   |_NULL_      |KG     |  86.200000|
|Placebo              |_ALL_                            |_ALL_ |Y     |mean      |AGE        |_NULL_      |YEARS  |  75.209302|
|Placebo              |_ALL_                            |_ALL_ |Y     |mean      |WEIGHTBL   |_NULL_      |KG     |  62.759302|
|Placebo              |_ALL_                            |_ALL_ |Y     |median    |AGE        |_NULL_      |YEARS  |  76.000000|
|Placebo              |_ALL_                            |_ALL_ |Y     |median    |WEIGHTBL   |_NULL_      |KG     |  60.550000|
|Placebo              |_ALL_                            |_ALL_ |Y     |min       |AGE        |_NULL_      |YEARS  |  52.000000|
|Placebo              |_ALL_                            |_ALL_ |Y     |min       |WEIGHTBL   |_NULL_      |KG     |  34.000000|
|Placebo              |_ALL_                            |_ALL_ |Y     |stdev     |AGE        |_NULL_      |YEARS  |   8.590167|
|Placebo              |_ALL_                            |_ALL_ |Y     |stdev     |WEIGHTBL   |_NULL_      |KG     |  12.771543|
|Xanomeline High Dose |AMERICAN INDIAN OR ALASKA NATIVE |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |   1.000000|
|Xanomeline High Dose |AMERICAN INDIAN OR ALASKA NATIVE |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |   1.190476|
|Xanomeline High Dose |BLACK OR AFRICAN AMERICAN        |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |   9.000000|
|Xanomeline High Dose |BLACK OR AFRICAN AMERICAN        |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |  10.714286|
|Xanomeline High Dose |WHITE                            |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |  74.000000|
|Xanomeline High Dose |WHITE                            |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |  88.095238|
|Xanomeline High Dose |_ALL_                            |F     |Y     |count     |quantity   |_ALL_       |_NULL_ |  40.000000|
|Xanomeline High Dose |_ALL_                            |F     |Y     |percent   |proportion |SEX         |_NULL_ |  47.619048|
|Xanomeline High Dose |_ALL_                            |M     |Y     |count     |quantity   |_ALL_       |_NULL_ |  44.000000|
|Xanomeline High Dose |_ALL_                            |M     |Y     |percent   |proportion |SEX         |_NULL_ |  52.380952|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |  84.000000|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |max       |AGE        |_NULL_      |YEARS  |  88.000000|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |max       |WEIGHTBL   |_NULL_      |KG     | 108.000000|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |mean      |AGE        |_NULL_      |YEARS  |  74.380952|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |mean      |WEIGHTBL   |_NULL_      |KG     |  70.004762|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |median    |AGE        |_NULL_      |YEARS  |  76.000000|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |median    |WEIGHTBL   |_NULL_      |KG     |  69.200000|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |min       |AGE        |_NULL_      |YEARS  |  56.000000|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |min       |WEIGHTBL   |_NULL_      |KG     |  41.700000|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |stdev     |AGE        |_NULL_      |YEARS  |   7.886094|
|Xanomeline High Dose |_ALL_                            |_ALL_ |Y     |stdev     |WEIGHTBL   |_NULL_      |KG     |  14.653433|
|Xanomeline Low Dose  |AMERICAN INDIAN OR ALASKA NATIVE |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |   0.000000|
|Xanomeline Low Dose  |BLACK OR AFRICAN AMERICAN        |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |   6.000000|
|Xanomeline Low Dose  |BLACK OR AFRICAN AMERICAN        |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |   7.142857|
|Xanomeline Low Dose  |WHITE                            |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |  78.000000|
|Xanomeline Low Dose  |WHITE                            |_ALL_ |Y     |percent   |proportion |RACE        |_NULL_ |  92.857143|
|Xanomeline Low Dose  |_ALL_                            |F     |Y     |count     |quantity   |_ALL_       |_NULL_ |  50.000000|
|Xanomeline Low Dose  |_ALL_                            |F     |Y     |percent   |proportion |SEX         |_NULL_ |  59.523809|
|Xanomeline Low Dose  |_ALL_                            |M     |Y     |count     |quantity   |_ALL_       |_NULL_ |  34.000000|
|Xanomeline Low Dose  |_ALL_                            |M     |Y     |percent   |proportion |SEX         |_NULL_ |  40.476191|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |  84.000000|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |max       |AGE        |_NULL_      |YEARS  |  88.000000|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |max       |WEIGHTBL   |_NULL_      |KG     | 106.100000|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |mean      |AGE        |_NULL_      |YEARS  |  75.666667|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |mean      |WEIGHTBL   |_NULL_      |KG     |  67.279518|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |median    |AGE        |_NULL_      |YEARS  |  77.500000|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |median    |WEIGHTBL   |_NULL_      |KG     |  64.900000|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |min       |AGE        |_NULL_      |YEARS  |  51.000000|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |min       |WEIGHTBL   |_NULL_      |KG     |  45.400000|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |stdev     |AGE        |_NULL_      |YEARS  |   8.286051|
|Xanomeline Low Dose  |_ALL_                            |_ALL_ |Y     |stdev     |WEIGHTBL   |_NULL_      |KG     |  14.123599|
|_ALL_                |AMERICAN INDIAN OR ALASKA NATIVE |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |   1.000000|
|_ALL_                |BLACK OR AFRICAN AMERICAN        |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ |  23.000000|
|_ALL_                |WHITE                            |_ALL_ |Y     |count     |quantity   |_ALL_       |_NULL_ | 230.000000|
|_ALL_                |_ALL_                            |F     |Y     |count     |quantity   |_ALL_       |_NULL_ | 143.000000|
|_ALL_                |_ALL_                            |M     |Y     |count     |quantity   |_ALL_       |_NULL_ | 111.000000|

## Quick check
Sometimes it is usefull to see that there is an actual derivation going on.
The calculated mean values for the `WEIGHTBL` variable is

```r
knitr::kable(adsl.summ.stat.res[adsl.summ.stat.res$factor=="WEIGHTBL" & adsl.summ.stat.res$procedure=="mean",])
```



|   |trt01a               |race  |sex   |saffl |procedure |factor   |denominator |unit |  measure|
|:--|:--------------------|:-----|:-----|:-----|:---------|:--------|:-----------|:----|--------:|
|14 |Placebo              |_ALL_ |_ALL_ |Y     |mean      |WEIGHTBL |_NULL_      |KG   | 62.75930|
|35 |Xanomeline High Dose |_ALL_ |_ALL_ |Y     |mean      |WEIGHTBL |_NULL_      |KG   | 70.00476|
|55 |Xanomeline Low Dose  |_ALL_ |_ALL_ |Y     |mean      |WEIGHTBL |_NULL_      |KG   | 67.27952|

If `WEIGHTBL` is multiplied by 100, then mean should also be multiplied with 100:

```r
adsl$WEIGHTBL<- adsl$WEIGHTBL*100
adsl.summ.stat.mod.res<- sqldf( stmtSQL$summStatSQL)
knitr::kable(adsl.summ.stat.mod.res[adsl.summ.stat.mod.res$factor=="WEIGHTBL" & adsl.summ.stat.mod.res$procedure=="mean",])
```



|   |a.TRT01A             |RACE  |SEX   |a.SAFFL |procedure |factor   |denominator |unit |  measure|
|:--|:--------------------|:-----|:-----|:-------|:---------|:--------|:-----------|:----|--------:|
|14 |Placebo              |_ALL_ |_ALL_ |Y       |mean      |WEIGHTBL |_NULL_      |KG   | 6275.930|
|35 |Xanomeline High Dose |_ALL_ |_ALL_ |Y       |mean      |WEIGHTBL |_NULL_      |KG   | 7000.476|
|55 |Xanomeline Low Dose  |_ALL_ |_ALL_ |Y       |mean      |WEIGHTBL |_NULL_      |KG   | 6727.952|
