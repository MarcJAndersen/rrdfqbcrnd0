---
title: "Create DM table as csv file"
author: "mja@statgroup.dk"
date: "2015-12-22"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create DM table as csv file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Introduction

This is a somewhat convoluted script. The idea is to take an existing
cube structure and derive the results. That was usefull initially to
extend a cube. Now, it is not as usefull. So the script may seem
pointless.  TODO(mja): fix it.

# Create DM sample table as CSV file and other files

This script creates the result and codelist for a simple DM table.


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

## Get the data and prepare for derivation of summary statistics


```r
library(rrdfcrndex)

library(foreign)
library(sqldf)
```

```
## Loading required package: gsubfn
## Loading required package: proto
## Loading required package: RSQLite
## Loading required package: DBI
```

```r
fnadsl<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfcrndex")
print(fnadsl)
```

```
## [1] ""
```

```r
if (!file.exists(fnadsl)) {
  fnadsl<- file.path("..", "extdata/sample-xpt", "adsl.xpt")
  }
if (!file.exists(fnadsl)) {
  stop("File does not exist - ",fnadsl)
}
```

```
## Error in eval(expr, envir, enclos): File does not exist - ../extdata/sample-xpt/adsl.xpt
```

```r
adsl<- read.xport(fnadsl)
```

```
## Error in lookup.xport(file): unable to open file: 'No such file or directory'
```

```r
adsl$TRT01A<- as.character(adsl$TRT01A)
```

```
## Error in eval(expr, envir, enclos): object 'adsl' not found
```

```r
adsl$RACE<- as.character(adsl$RACE)
```

```
## Error in eval(expr, envir, enclos): object 'adsl' not found
```

```r
adsl$SAFFL<- as.character(adsl$SAFFL)
```

```
## Error in eval(expr, envir, enclos): object 'adsl' not found
```

```r
adsl$SEX<- as.character(adsl$SEX)
```

```
## Error in eval(expr, envir, enclos): object 'adsl' not found
```

```r
## SASxport package maps characters and dates etc into more R like data type
## install.packages("SASxport")
## library(SASxport)
## adsl<- as.data.frame(read.xport(fnadsl,as.is=TRUE))
## str(adsl)
```


## Create frame for cube from an existing RDF data cube

The code input a turtle file with an RDF data cube. SQL statements for
calculating the measurements are derived from the cube, and used to
derive the summary statistics. Note: the SQL statements does not show
records where the combination of values lead to 0 observations. This
is handled below, in a not so clever way. A better approach would be
to include the concept of a skeleton in the SQL statements.


```r
library(rrdfcrndex)

dataCubeFile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfcrndex")
checkCube <- new.rdf(ontology=FALSE)  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= checkCube)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : java.io.FileNotFoundException:  (No such file or directory)
```

```r
summarize.rdf(checkCube)
```

```
## [1] "Number of triples: 0"
```

```r
stmtSQL<- GetSQLFromCube(checkCube) 
```

```
## Error in eval(expr, envir, enclos): could not find function "GetSQLFromCube"
```

```r
cat(stmtSQL$summStatSQL) 
```

```
## Error in cat(stmtSQL$summStatSQL): object 'stmtSQL' not found
```

```r
adsl.summ.stat.res<- sqldf( stmtSQL$summStatSQL)
```

```
## Loading required package: tcltk
```

```
## Error in is.tclObj(x): object 'stmtSQL' not found
```

```r
names(adsl.summ.stat.res)<- tolower(gsub("(a|b)\\.","", names(adsl.summ.stat.res)))
```

```
## Error in gsub("(a|b)\\.", "", names(adsl.summ.stat.res)): object 'adsl.summ.stat.res' not found
```

## Store the SQL statements to a file


```r
res.text<- stmtSQL$summStatSQL
```

```
## Error in eval(expr, envir, enclos): object 'stmtSQL' not found
```

```r
cr.text<-   paste0("create table qbframe ", "(", paste(names(stmtSQL$qbframe), "TEXT", collapse=", "), ")",";")
```

```
## Error in paste(names(stmtSQL$qbframe), "TEXT", collapse = ", "): object 'stmtSQL' not found
```

```r
in.text<-   paste0(
  paste(
  paste0("insert into qbframe ", "(", paste0(names(stmtSQL$qbframe),collapse=","), ")\n" ),
  "values\n",
  paste0( "(", apply(stmtSQL$qbframe,1,function(x) {paste0('"',x,'"', collapse=",")}), ")",  collapse=",\n"),
  collapse="\n"
  ),";\n")
```

```
## Error in paste0(names(stmtSQL$qbframe), collapse = ","): object 'stmtSQL' not found
```

```r
se.text<- "select * from qbframe;"

tempfile<- file.path(tempdir(),"temp-code.R")
cat(paste('res.text<- "', res.text,'"\n',collapse="\n"), file=tempfile)
```

```
## Error in paste("res.text<- \"", res.text, "\"\n", collapse = "\n"): object 'res.text' not found
```

```r
cat(paste("cr.text<- '", cr.text,"'\n",collapse="\n"), file=tempfile,append=TRUE)
```

```
## Error in paste("cr.text<- '", cr.text, "'\n", collapse = "\n"): object 'cr.text' not found
```

```r
cat(paste("in.text<- '", in.text,"'\n",collapse="\n"), file=tempfile,append=TRUE)
```

```
## Error in paste("in.text<- '", in.text, "'\n", collapse = "\n"): object 'in.text' not found
```

```r
cat(paste("se.text<- '", se.text,"'\n",collapse="\n"), file=tempfile,append=TRUE)
print(tempfile)
```

```
## [1] "/tmp/Rtmpdgsw8q/temp-code.R"
```

## Define SQL statements directly

The statements below are inserted from the file generated above.

Work-around: add SELECT statments below corresponding to the desired statistics.
Update the .csv file, and re-create the cube. Repeat until done. This is of course not the ideal way; waiting to the formular interface to the cube.


```r
res.text<- "
SELECT a.TRT01A, '_ALL_' as RACE, a.SEX, a.SAFFL, 'count' as procedure, 'quantity' as factor, '_ALL_' as denominator, '_NULL_' as unit, count(*) as measure from  adsl  as a   group by  a.TRT01A, a.SEX, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'mean' as procedure, 'WEIGHTBL' as factor, '_NULL_' as denominator, 'KG' as unit, avg(WEIGHTBL) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'max' as procedure, 'WEIGHTBL' as factor, '_NULL_' as denominator, 'KG' as unit, max(WEIGHTBL) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'max' as procedure, 'AGE' as factor, '_NULL_' as denominator, 'YEARS' as unit, max(AGE) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'median' as procedure, 'WEIGHTBL' as factor, '_NULL_' as denominator, 'KG' as unit, median(WEIGHTBL) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, a.RACE, '_ALL_' as SEX, a.SAFFL, 'count' as procedure, 'quantity' as factor, '_ALL_' as denominator, '_NULL_' as unit, count(*) as measure from  adsl  as a   group by  a.TRT01A, a.RACE, a.SAFFL
UNION
SELECT a.TRT01A, b.RACE, '_ALL_' as SEX, a.SAFFL, 'percent' as procedure, 'proportion' as factor, 'RACE' as denominator, '_NULL_' as unit, 100*avg(a.RACE=b.RACE) as measure from  adsl  as a , (select distinct RACE from adsl) as b group by  a.TRT01A, b.RACE, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'stdev' as procedure, 'AGE' as factor, '_NULL_' as denominator, 'YEARS' as unit, stdev(AGE) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'min' as procedure, 'AGE' as factor, '_NULL_' as denominator, 'YEARS' as unit, min(AGE) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, b.SEX, a.SAFFL, 'percent' as procedure, 'proportion' as factor, 'SEX' as denominator, '_NULL_' as unit, 100*avg(a.SEX=b.SEX) as measure from  adsl  as a , (select distinct SEX from adsl) as b group by  a.TRT01A, b.SEX, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'min' as procedure, 'WEIGHTBL' as factor, '_NULL_' as denominator, 'KG' as unit, min(WEIGHTBL) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT '_ALL_' as TRT01A, a.RACE, '_ALL_' as SEX, a.SAFFL, 'count' as procedure, 'quantity' as factor, '_ALL_' as denominator, '_NULL_' as unit, count(*) as measure from  adsl  as a   group by  a.RACE, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'mean' as procedure, 'AGE' as factor, '_NULL_' as denominator, 'YEARS' as unit, avg(AGE) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT '_ALL_' as TRT01A, '_ALL_' as RACE, a.SEX, a.SAFFL, 'count' as procedure, 'quantity' as factor, '_ALL_' as denominator, '_NULL_' as unit, count(*) as measure from  adsl  as a   group by  a.SEX, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'median' as procedure, 'AGE' as factor, '_NULL_' as denominator, 'YEARS' as unit, median(AGE) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'count' as procedure, 'quantity' as factor, '_ALL_' as denominator, '_NULL_' as unit, count(*) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
UNION
SELECT a.TRT01A, '_ALL_' as RACE, '_ALL_' as SEX, a.SAFFL, 'stdev' as procedure, 'WEIGHTBL' as factor, '_NULL_' as denominator, 'KG' as unit, stdev(WEIGHTBL) as measure from  adsl  as a   group by  a.TRT01A, a.SAFFL
"


cr.text<- '
create table qbframe (trt01a TEXT, race TEXT, factor TEXT, procedure TEXT, sex TEXT, saffl TEXT, unit TEXT, denominator TEXT);
'

in.text<- '
insert into qbframe (trt01a,race,factor,procedure,sex,saffl,unit,denominator)
 values
("Xanomeline High Dose","AMERICAN INDIAN OR ALASKA NATIVE","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Xanomeline Low Dose","AMERICAN INDIAN OR ALASKA NATIVE","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Xanomeline Low Dose","BLACK OR AFRICAN AMERICAN","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Placebo","_ALL_","quantity","count","F","Y","_NULL_","_ALL_"),
("_ALL_","WHITE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline Low Dose","_ALL_","AGE","min","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","_ALL_","AGE","stdev","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline Low Dose","_ALL_","proportion","percent","M","Y","_NULL_","SEX"),
("Placebo","_ALL_","AGE","stdev","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","WHITE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline Low Dose","WHITE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline High Dose","_ALL_","AGE","max","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","AMERICAN INDIAN OR ALASKA NATIVE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Placebo","BLACK OR AFRICAN AMERICAN","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Placebo","_ALL_","AGE","max","_ALL_","Y","YEARS","_NULL_"),
("Placebo","AMERICAN INDIAN OR ALASKA NATIVE","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Placebo","BLACK OR AFRICAN AMERICAN","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Xanomeline Low Dose","_ALL_","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Placebo","_ALL_","quantity","count","M","Y","_NULL_","_ALL_"),
("Placebo","_ALL_","proportion","percent","F","Y","_NULL_","SEX"),
("Xanomeline High Dose","_ALL_","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline Low Dose","_ALL_","quantity","count","M","Y","_NULL_","_ALL_"),
("Xanomeline High Dose","_ALL_","proportion","percent","F","Y","_NULL_","SEX"),
("Xanomeline Low Dose","_ALL_","quantity","count","F","Y","_NULL_","_ALL_"),
("Placebo","_ALL_","AGE","mean","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","_ALL_","AGE","median","_ALL_","Y","YEARS","_NULL_"),
("Placebo","_ALL_","AGE","min","_ALL_","Y","YEARS","_NULL_"),
("_ALL_","BLACK OR AFRICAN AMERICAN","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Placebo","_ALL_","AGE","median","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline Low Dose","_ALL_","AGE","stdev","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline Low Dose","AMERICAN INDIAN OR ALASKA NATIVE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline Low Dose","BLACK OR AFRICAN AMERICAN","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline Low Dose","_ALL_","AGE","max","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","BLACK OR AFRICAN AMERICAN","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Xanomeline High Dose","WHITE","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Xanomeline Low Dose","WHITE","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("_ALL_","_ALL_","quantity","count","M","Y","_NULL_","_ALL_"),
("Xanomeline High Dose","_ALL_","quantity","count","M","Y","_NULL_","_ALL_"),
("_ALL_","_ALL_","quantity","count","F","Y","_NULL_","_ALL_"),
("Xanomeline High Dose","_ALL_","quantity","count","F","Y","_NULL_","_ALL_"),
("Placebo","_ALL_","proportion","percent","M","Y","_NULL_","SEX"),
("Xanomeline Low Dose","_ALL_","proportion","percent","F","Y","_NULL_","SEX"),
("Xanomeline Low Dose","_ALL_","AGE","mean","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","_ALL_","proportion","percent","M","Y","_NULL_","SEX"),
("Placebo","AMERICAN INDIAN OR ALASKA NATIVE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline High Dose","_ALL_","AGE","mean","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","BLACK OR AFRICAN AMERICAN","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Placebo","WHITE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline Low Dose","_ALL_","AGE","median","_ALL_","Y","YEARS","_NULL_"),
("Xanomeline High Dose","_ALL_","AGE","min","_ALL_","Y","YEARS","_NULL_"),
("_ALL_","AMERICAN INDIAN OR ALASKA NATIVE","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Placebo","WHITE","proportion","percent","_ALL_","Y","_NULL_","RACE"),
("Placebo","_ALL_","quantity","count","_ALL_","Y","_NULL_","_ALL_"),
("Xanomeline Low Dose","_ALL_","WEIGHTBL","min","_ALL_","Y","KG","_NULL_"),
("Xanomeline High Dose","_ALL_","WEIGHTBL","stdev","_ALL_","Y","KG","_NULL_"),
("Placebo","_ALL_","WEIGHTBL","stdev","_ALL_","Y","KG","_NULL_"),
("Xanomeline High Dose","_ALL_","WEIGHTBL","max","_ALL_","Y","KG","_NULL_"),
("Placebo","_ALL_","WEIGHTBL","max","_ALL_","Y","KG","_NULL_"),
("Placebo","_ALL_","WEIGHTBL","mean","_ALL_","Y","KG","_NULL_"),
("Xanomeline High Dose","_ALL_","WEIGHTBL","median","_ALL_","Y","KG","_NULL_"),
("Placebo","_ALL_","WEIGHTBL","min","_ALL_","Y","KG","_NULL_"),
("Placebo","_ALL_","WEIGHTBL","median","_ALL_","Y","KG","_NULL_"),
("Xanomeline Low Dose","_ALL_","WEIGHTBL","stdev","_ALL_","Y","KG","_NULL_"),
("Xanomeline Low Dose","_ALL_","WEIGHTBL","max","_ALL_","Y","KG","_NULL_"),
("Xanomeline Low Dose","_ALL_","WEIGHTBL","mean","_ALL_","Y","KG","_NULL_"),
("Xanomeline High Dose","_ALL_","WEIGHTBL","mean","_ALL_","Y","KG","_NULL_"),
("Xanomeline Low Dose","_ALL_","WEIGHTBL","median","_ALL_","Y","KG","_NULL_"),
("Xanomeline High Dose","_ALL_","WEIGHTBL","min","_ALL_","Y","KG","_NULL_")
;
'
se.text<-'
select * from qbframe;
'
```

### Evaluate the SQL code


```r
adsl.summ.stat.res<- sqldf( res.text )
```

```
## Error in sqliteSendQuery(con, statement, bind.data): error in statement: no such table: adsl
```

```r
# adsl.summ.stat$unit<- "_NULL_"
names(adsl.summ.stat.res)<- tolower(gsub("(a|b)\\.","", names(adsl.summ.stat.res)))
```

```
## Error in gsub("(a|b)\\.", "", names(adsl.summ.stat.res)): object 'adsl.summ.stat.res' not found
```

```r
rm(qbframe)
```

```
## Warning in rm(qbframe): object 'qbframe' not found
```

```r
sqldf()
```

```
## <SQLiteConnection>
```

```r
sqldf(cr.text )
```

```
## NULL
```

```r
sqldf(in.text  )
```

```
## NULL
```

```r
qbframe<- sqldf(se.text)
sqldf()
```

```
## NULL
```

```r
# str(qbframe)
```

### Combine generated results with the cube frame and write CSV file


```r
adsl.summ.stat<- merge(qbframe,adsl.summ.stat.res,by=names(qbframe),all=TRUE)
```

```
## Error in as.data.frame(y): object 'adsl.summ.stat.res' not found
```

```r
# adsl.summ.stat<- merge(stmtSQL$qbframe,adsl.summ.stat.res,all=TRUE)
adsl.summ.stat$measure[ is.na(adsl.summ.stat$measure) & adsl.summ.stat$procedure=="count" ]<- 0
```

```
## Error in adsl.summ.stat$measure[is.na(adsl.summ.stat$measure) & adsl.summ.stat$procedure == : object 'adsl.summ.stat' not found
```

```r
adsl.summ.stat
```

```
## Error in eval(expr, envir, enclos): object 'adsl.summ.stat' not found
```

```r
dmtableFile<- file.path( system.file("extdata/sample-cfg", package="rrdfcrndex"), "dm.AR.csv" )
## dmtableFile<- file.path(tempdir(),"temp-dm.AR.csv")

write.csv(adsl.summ.stat, file=dmtableFile, row.names=FALSE)
```

```
## Error in is.data.frame(x): object 'adsl.summ.stat' not found
```

```r
cat("Written to ", dmtableFile, "\n")
```

```
## Written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfcrndex/inst/extdata/sample-cfg/dm.AR.csv
```
