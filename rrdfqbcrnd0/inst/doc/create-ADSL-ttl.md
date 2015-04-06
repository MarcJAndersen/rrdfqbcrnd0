---
title: "Create ADSL as TTL file"
author: "mja@statgroup.dk"
date: "2015-04-06"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create ADSL as TTL file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create turtle version of ADSL dataset


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

This script creates a turtle version of the ADSL dataset.

The script uses SQLite to export the ADSL dataset, and d2rq (http://d2rq.org/) to create a turle version of the file.


```r
library(foreign)
fnadsl<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfqbcrnd0")
adsl<-read.xport(fnadsl)

## Use other method for reading sas - see elsewhere

## http://cran.r-project.org/web/packages/RSQLite/RSQLite.pdf
## install.packages("RSQLite")

## Create a SQL dump - here using RSQLite - could also create the dump programically

library(RSQLite)
```

```
## Loading required package: DBI
```

```r
## create a SQLite instance and create one connection.
m <- dbDriver("SQLite")
## initialize a new database to a tempfile and copy some data.frame
## from the base package into it
tfile <- tempfile()
con <- dbConnect(m, dbname = tfile)
dbWriteTable(con, "adsl", adsl)
```

```
## [1] TRUE
```

```r
dbDisconnect(con)
```

```
## [1] TRUE
```

```r
cat("SQLite database stored as ", tfile, "\n")
```

```
## SQLite database stored as  /tmp/RtmpVpVTDb/file625c3c847e10
```

```r
dumpFn<- tempfile()
system(paste("sqlite3", tfile, ".dump >", dumpFn, sep=" "))
cat("SQLite database dump in ", dumpFn, "\n")
```

```
## SQLite database dump in  /tmp/RtmpVpVTDb/file625c686da541
```

```r
dumpAfterSedFn <- tempfile()

sedCmd<- paste("sed", "-e 's/TEXT/VARCHAR(1000)/g; s/\"MMSETOT\" REAL/\"MMSETOT\" REAL, PRIMARY KEY (USUBJID)/; s/\"adsl\"/adsl/g; 1,2 d; $ d; ' ", dumpFn, ">", dumpAfterSedFn, sep=" ")
system(sedCmd)
cat("SQLite database dump modified stored as ", dumpAfterSedFn, "\n")
```

```
## SQLite database dump modified stored as  /tmp/RtmpVpVTDb/file625c69e65036
```

```r
## Check only expected changes were applied
## not run due to large output
## system(paste("diff", dumpFn, dumpAfterSedFn, sep=" "))

## The change below are for now to be applied manually!
##   change TEXT to VARCHAR(1000)
##   remove top 2 lines with PRAGMA
##   in insert statements replace "adsl"  with adsl
##   after "MMSETOT" REAL add a comma (",") and a new line with
##   PRIMARY KEY (USUBJID)
##
## see also RSQlite on dbSendQuery-methods - that can make more
## https://stat.ethz.ch/pipermail/r-sig-db/2010q1/000813.html
## d2rq documentationsee file:///opt/d2rq-0.8.1/doc/dump-rdf.html

## -b option does not work with -l

adslmapttlFn<- file.path(tempdir(), "adsl-map.ttl")
adslttlFn<- file.path(tempdir(), "adsl.ttl")

d2rqbaseURL<- "http://www.example.org/datasets/"

system(paste("/opt/d2rq-0.8.1/generate-mapping  -o ", adslmapttlFn, " -l ", dumpAfterSedFn))
system(paste("/opt/d2rq-0.8.1/dump-rdf -b ", d2rqbaseURL,  " -o ",
             adslttlFn, " -l ", dumpAfterSedFn, " ", adslmapttlFn) )
 

### This could maybe also work ..
## m <- dbDriver("SQLite")
## tfile <- tempfile()
## con <- dbConnect(m, dbname = tfile)
## s <- sprintf("create table %s(%s, primary key(%s))", "adsl",
## 		paste(names(adsl), collapse = ", "),
## 		paste(names(adsl)[c(1,2)],collapse=", ")
##              )
## dbGetQuery(con, s)

## dbWriteTable(con, "adsl", adsl,append=TRUE)
## dbDisconnect(con)
## tfile

## system(paste("sqlite3", tfile, ".dump > /tmp/xx.sql", sep=" "))
## system(paste("/opt/d2rq-0.8.1/dump-rdf -b http://localhost:3030/ -o /tmp/adsl.ttl -l /tmp/xx.sql"))

targetDir<- system.file("extdata/sample-rdf", package="rrdfqbcrnd0")
if (file.copy(adslmapttlFn, targetDir)) {
cat( "File ", adslmapttlFn, " copied to ", targetDir, "\n")
}
```

```
## File  /tmp/RtmpVpVTDb/adsl-map.ttl  copied to  /home/ma/projects/R-packages/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf
```

```r
if (file.copy(adslttlFn, targetDir)) {
cat( "File ", adslttlFn, " copied to ", targetDir, "\n")
}
```

```
## File  /tmp/RtmpVpVTDb/adsl.ttl  copied to  /home/ma/projects/R-packages/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf
```



### Read in the file


```r
dataFilemap<- system.file("extdata/sample-rdf", "adsl-map.ttl", package="rrdfqbcrnd0")
dataFilemap
```

```
## [1] "/home/ma/projects/R-packages/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/adsl-map.ttl"
```

```r
dataFile<- system.file("extdata/sample-rdf", "adsl.ttl", package="rrdfqbcrnd0")
dataFile
```

```
## [1] "/home/ma/projects/R-packages/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/adsl.ttl"
```

```r
store <- new.rdf()  # Initialize
load.rdf(dataFilemap, format="TURTLE", appendTo= store)
load.rdf(dataFile, format="TURTLE", appendTo= store)
summarize.rdf(store)
```

```
## [1] "Number of triples: 13160"
```

```r
rq<-"
prefix map: <#> 
prefix db: <> 
prefix vocab: <vocab/> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix d2rq: <http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#> 
prefix jdbc: <http://d2rq.org/terms/jdbc/> 
select * where {
?mapColumn a d2rq:PropertyBridge ;
  d2rq:column ?d2rqcolumn ;
  d2rq:datatype ?d2rqdatatype 
.
# ?mapColumn ?p ?o.
}
"

res<- data.frame(sparql.rdf(store, rq),stringsAsFactors=FALSE)
str(res)
```

```
## 'data.frame':	20 obs. of  3 variables:
##  $ mapColumn   : chr  "map:ADSL_DISONSDT" "map:ADSL_HEIGHTBL" "map:ADSL_TRTSDT" "map:ADSL_AGE" ...
##  $ d2rqcolumn  : chr  "ADSL.DISONSDT" "ADSL.HEIGHTBL" "ADSL.TRTSDT" "ADSL.AGE" ...
##  $ d2rqdatatype: chr  "xsd:double" "xsd:double" "xsd:double" "xsd:double" ...
```

```r
res
```

```
##            mapColumn    d2rqcolumn d2rqdatatype
## 1  map:ADSL_DISONSDT ADSL.DISONSDT   xsd:double
## 2  map:ADSL_HEIGHTBL ADSL.HEIGHTBL   xsd:double
## 3    map:ADSL_TRTSDT   ADSL.TRTSDT   xsd:double
## 4       map:ADSL_AGE      ADSL.AGE   xsd:double
## 5    map:ADSL_RFENDT   ADSL.RFENDT   xsd:double
## 6  map:ADSL_VISNUMEN ADSL.VISNUMEN   xsd:double
## 7   map:ADSL_EDUCLVL  ADSL.EDUCLVL   xsd:double
## 8  map:ADSL_VISIT1DT ADSL.VISIT1DT   xsd:double
## 9  map:ADSL_WEIGHTBL ADSL.WEIGHTBL   xsd:double
## 10  map:ADSL_CUMDOSE  ADSL.CUMDOSE   xsd:double
## 11    map:ADSL_BMIBL    ADSL.BMIBL   xsd:double
## 12   map:ADSL_TRTDUR   ADSL.TRTDUR   xsd:double
## 13   map:ADSL_TRTEDT   ADSL.TRTEDT   xsd:double
## 14  map:ADSL_TRT01AN  ADSL.TRT01AN   xsd:double
## 15   map:ADSL_DURDIS   ADSL.DURDIS   xsd:double
## 16  map:ADSL_MMSETOT  ADSL.MMSETOT   xsd:double
## 17  map:ADSL_AGEGR1N  ADSL.AGEGR1N   xsd:double
## 18    map:ADSL_AVGDD    ADSL.AVGDD   xsd:double
## 19    map:ADSL_RACEN    ADSL.RACEN   xsd:double
## 20  map:ADSL_TRT01PN  ADSL.TRT01PN   xsd:double
```

```r
s<- paste0("<", d2rqbaseURL,"ADSL/01-718-1254>")
rq<-paste0("select * where {", s, " ?p ?o . }" )
print(rq)
```

```
## [1] "select * where {<http://www.example.org/datasets/ADSL/01-718-1254> ?p ?o . }"
```

```r
res<- data.frame(sparql.rdf(store, rq),stringsAsFactors=FALSE)
str(res)
```

```
## 'data.frame':	51 obs. of  2 variables:
##  $ p: chr  "http://www.example.org/datasets/vocab/ADSL_EFFFL" "http://www.example.org/datasets/vocab/ADSL_DCREASCD" "http://www.example.org/datasets/vocab/ADSL_TRT01PN" "http://www.example.org/datasets/vocab/ADSL_COMP8FL" ...
##  $ o: chr  "Y" "Completed" "54.0E0" "Y" ...
```

```r
res$pclean<- gsub(paste0(d2rqbaseURL,"vocab/ADSL_"), "", res$p)
knitr::kable(res[,c("p","o")])
```



|p                                                   |o                                             |
|:---------------------------------------------------|:---------------------------------------------|
|http://www.example.org/datasets/vocab/ADSL_EFFFL    |Y                                             |
|http://www.example.org/datasets/vocab/ADSL_DCREASCD |Completed                                     |
|http://www.example.org/datasets/vocab/ADSL_TRT01PN  |54.0E0                                        |
|http://www.example.org/datasets/vocab/ADSL_COMP8FL  |Y                                             |
|http://www.example.org/datasets/vocab/ADSL_CUMDOSE  |9936.0E0                                      |
|http://www.example.org/datasets/vocab/ADSL_TRTSDT   |19549.0E0                                     |
|http://www.example.org/datasets/vocab/ADSL_SITEGR1  |718                                           |
|http://www.example.org/datasets/vocab/ADSL_TRT01AN  |54.0E0                                        |
|http://www.example.org/datasets/vocab/ADSL_AVGDD    |54.0E0                                        |
|http://www.example.org/datasets/vocab/ADSL_DURDIS   |21.6E0                                        |
|http://www.example.org/datasets/vocab/ADSL_TRTDUR   |184.0E0                                       |
|http://www.example.org/datasets/vocab/ADSL_HEIGHTBL |170.2E0                                       |
|http://www.example.org/datasets/vocab/ADSL_COMP16FL |Y                                             |
|http://www.example.org/datasets/vocab/ADSL_DCDECOD  |COMPLETED                                     |
|http://www.example.org/datasets/vocab/ADSL_WEIGHTBL |82.1E0                                        |
|http://www.example.org/datasets/vocab/ADSL_BMIBLGR1 |25-<30                                        |
|http://www.example.org/datasets/vocab/ADSL_AGE      |78.0E0                                        |
|http://www.example.org/datasets/vocab/ADSL_SUBJID   |1254                                          |
|http://www.example.org/datasets/vocab/ADSL_TRT01A   |Xanomeline Low Dose                           |
|http://www.example.org/datasets/vocab/ADSL_DURDSGR1 |>=12                                          |
|http://www.example.org/datasets/vocab/ADSL_RFSTDTC  |2013-07-10                                    |
|http://www.example.org/datasets/vocab/ADSL_SEX      |M                                             |
|http://www.example.org/datasets/vocab/ADSL_DISCONFL |                                              |
|http://www.example.org/datasets/vocab/ADSL_DSRAEFL  |                                              |
|http://www.example.org/datasets/vocab/ADSL_COMP24FL |Y                                             |
|http://www.example.org/datasets/vocab/ADSL_RFENDT   |19732.0E0                                     |
|http://www.w3.org/2000/01/rdf-schema#label          |ADSL #01-718-1254                             |
|http://www.example.org/datasets/vocab/ADSL_SAFFL    |Y                                             |
|http://www.example.org/datasets/vocab/ADSL_AGEU     |YEARS                                         |
|http://www.example.org/datasets/vocab/ADSL_ETHNIC   |HISPANIC OR LATINO                            |
|http://www.example.org/datasets/vocab/ADSL_AGEGR1   |65-80                                         |
|http://www.example.org/datasets/vocab/ADSL_DISONSDT |18882.0E0                                     |
|http://www.example.org/datasets/vocab/ADSL_TRTEDT   |19732.0E0                                     |
|http://www.example.org/datasets/vocab/ADSL_DTHFL    |                                              |
|http://www.example.org/datasets/vocab/ADSL_MMSETOT  |16.0E0                                        |
|http://www.example.org/datasets/vocab/ADSL_VISNUMEN |12.0E0                                        |
|http://www.example.org/datasets/vocab/ADSL_USUBJID  |01-718-1254                                   |
|http://www.example.org/datasets/vocab/ADSL_ITTFL    |Y                                             |
|http://www.example.org/datasets/vocab/ADSL_BMIBL    |28.3E0                                        |
|http://www.example.org/datasets/vocab/ADSL_RFENDTC  |2014-01-09                                    |
|http://www.w3.org/1999/02/22-rdf-syntax-ns#type     |http://www.example.org/datasets/vocab/ADSL    |
|http://www.example.org/datasets/vocab/ADSL_STUDYID  |CDISCPILOT01                                  |
|http://www.example.org/datasets/vocab/ADSL_RACEN    |1.0E0                                         |
|http://www.example.org/datasets/vocab/ADSL_VISIT1DT |19537.0E0                                     |
|http://www.example.org/datasets/vocab/ADSL_AGEGR1N  |2.0E0                                         |
|http://www.example.org/datasets/vocab/ADSL_TRT01P   |Xanomeline Low Dose                           |
|http://www.example.org/datasets/vocab/ADSL_RACE     |WHITE                                         |
|http://www.example.org/datasets/vocab/ADSL_ARM      |Xanomeline Low Dose                           |
|http://www.example.org/datasets/vocab/ADSL_SITEID   |718                                           |
|http://www.example.org/datasets/vocab/ADSL_EDUCLVL  |18.0E0                                        |
|http://www.w3.org/1999/02/22-rdf-syntax-ns#type     |http://www.w3.org/2000/01/rdf-schema#Resource |
