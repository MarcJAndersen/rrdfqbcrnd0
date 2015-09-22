---
title: "Create ADSL as TTL file"
author: "mja@statgroup.dk"
date: "2015-09-22"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create ADSL as TTL file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create turtle version of ADSL dataset

## Setup


```r
knitr::read_chunk("setup.R")
```

```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqbcrnd0
## Loading required package: rrdf
## Loading required package: rJava
## Loading required package: methods
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
In the code below it is assumed that d2rq is installed in the directory `/opt/d2rq-0.8.1`.


```r
library(foreign)
fnadsl<- system.file("extdata/sample-xpt", "adsl.xpt", package="rrdfqbcrnd0")
adsl<-read.xport(fnadsl)
```

The present code uses `read.xport` to input the sas dataset.
TODO: Date variables are note handled correctly. Other
methods are available allowing access to more of the meta data in the
datasets.

Next step is to dump the data as a SQL dump, that will serve as input
to D2RQ.  For dumping the data `sqlite` is used as it is the easies to
setup. The R-package `RSQLite`
(http://cran.r-project.org/web/packages/RSQLite/RSQLite.pdf) provides
access to `sqlite`.


```r
## install.packages("RSQLite")
```

The SQL dump is created by transfering the R data.frame to SQLite, and the invoking sqlite to create a dump.

```r
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
## SQLite database stored as  /tmp/RtmpInXUil/file22c434956ba7
```

```r
dumpFn<- tempfile()
system(paste("sqlite3", tfile, ".dump >", dumpFn, sep=" "))
cat("SQLite database dump in ", dumpFn, "\n")
```

```
## SQLite database dump in  /tmp/RtmpInXUil/file22c45722050a
```

Next step is to process the dump, so the SQL can be used as input to d2rq.
The changes applied are:
*  change TEXT to VARCHAR(1000)
*  remove top 2 lines with PRAGMA
*  in insert statements replace "adsl"  with adsl
*  after "MMSETOT" REAL add a comma (",") and a new line with PRIMARY KEY (USUBJID)

This could maybe be simplified using  RSQlite on dbSendQuery-methods, see (https://stat.ethz.ch/pipermail/r-sig-db/2010q1/000813.html).
For d2rq documentation see (file:///opt/d2rq-0.8.1/doc/dump-rdf.html).


```r
dumpAfterSedFn <- tempfile()
sedCmd<- paste("sed",
               "-e 's/TEXT/VARCHAR(1000)/g; s/\"MMSETOT\" REAL/\"MMSETOT\" REAL, PRIMARY KEY (USUBJID)/; s/\"adsl\"/adsl/g; 1,2 d; $ d; ' ",
               dumpFn, ">", dumpAfterSedFn, sep=" ")
system(sedCmd)
cat("SQLite database dump modified stored as ", dumpAfterSedFn, "\n")
```

```
## SQLite database dump modified stored as  /tmp/RtmpInXUil/file22c447d86c34
```

```r
## Check only expected changes were applied
## not run due to large output
## system(paste("diff", dumpFn, dumpAfterSedFn, sep=" "))


adslmapttlFn<- file.path(tempdir(), "adsl-map.ttl")
adslttlFn<- file.path(tempdir(), "adsl.ttl")

d2rqbaseURL<- "http://www.example.org/datasets/"

## -b option does not work with -l
## /opt/d2rq-0.8.1/generate-mapping reports Unknown argument: -b
system(paste("/opt/d2rq-0.8.1/generate-mapping",
             " -l ", dumpAfterSedFn,
             " -b ", d2rqbaseURL,
             " -o ", adslmapttlFn
             ))

system(paste("/opt/d2rq-0.8.1/dump-rdf",
             " -b ", d2rqbaseURL,
             " -o ", adslttlFn,
             " -l ", dumpAfterSedFn,
             " ", adslmapttlFn
             ))
 


targetDir<- system.file("extdata/sample-rdf", package="rrdfqbcrnd0")
if (file.copy(adslmapttlFn, targetDir)) {
cat( "File ", adslmapttlFn, " copied to ", targetDir, "\n")
}

if (file.copy(adslttlFn, targetDir)) {
cat( "File ", adslttlFn, " copied to ", targetDir, "\n")
}
```

```
## File  /tmp/RtmpInXUil/adsl.ttl  copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf
```


```r
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
```


### Read in the file

This section demostrates how to access the data for the ADSL dataset.

First the data are loaded into a RDF model.

```r
dataFilemap<- system.file("extdata/sample-rdf", "adsl-map.ttl", package="rrdfqbcrnd0")
dataFilemap
```

```
## [1] ""
```

```r
dataFile<- system.file("extdata/sample-rdf", "adsl.ttl", package="rrdfqbcrnd0")
dataFile
```

```
## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/adsl.ttl"
```

```r
store <- new.rdf()  # Initialize
load.rdf(dataFilemap, format="TURTLE", appendTo= store)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : java.io.FileNotFoundException:  (No such file or directory)
```

```r
load.rdf(dataFile, format="TURTLE", appendTo= store)
summarize.rdf(store)
```

```
## [1] "Number of triples: 40"
```

Next step is to make a query showing the mappings

```r
mapping.rq<-"
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix d2rq: <http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#> 
prefix jdbc: <http://d2rq.org/terms/jdbc/> 
select * where {
   ?mapColumn a d2rq:PropertyBridge ;
                d2rq:column ?d2rqcolumn .
   optional{ ?mapColumn d2rq:datatype ?d2rqdatatype  }
}
"

cat(mapping.rq,"\n")
```

```
## 
## prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
## prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
## prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
## prefix d2rq: <http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#> 
## prefix jdbc: <http://d2rq.org/terms/jdbc/> 
## select * where {
##    ?mapColumn a d2rq:PropertyBridge ;
##                 d2rq:column ?d2rqcolumn .
##    optional{ ?mapColumn d2rq:datatype ?d2rqdatatype  }
## }
## 
```

```r
resmapping<- data.frame(sparql.rdf(store, mapping.rq),stringsAsFactors=FALSE)
str(resmapping)
```

```
## 'data.frame':	0 obs. of  0 variables
```

```r
knitr::kable(resmapping)
```

```
## Error in kable_markdown(x = structure(character(0), .Dim = c(0L, 0L), .Dimnames = list(: the table must have a header (column names)
```


The code below gets the all values in one record

```r
s<- paste0("<", d2rqbaseURL,c("ADSL/01-718-1254"), ">")

records.rq<-paste("select * ",
           "where { ?s ?p ?o.",
           " values(?s) {",
           paste("(",s,")", collapse="\n"),
           "}",
           "}", sep="\n", collapse="\n" )
cat(records.rq,"\n")
```

```
## select * 
## where { ?s ?p ?o.
##  values(?s) {
## ( <http://www.example.org/datasets/ADSL/01-718-1254> )
## }
## }
```

```r
records.res<- data.frame(sparql.rdf(store, records.rq),stringsAsFactors=FALSE)
str(records.res)
```

```
## 'data.frame':	0 obs. of  0 variables
```

```r
records.res$pclean<- gsub(paste0(d2rqbaseURL,"vocab/ADSL_"), "", records.res$p)
knitr::kable(records.res[,c("s", "p","o")])
```

```
## Error in `[.data.frame`(records.res, , c("s", "p", "o")): undefined columns selected
```
