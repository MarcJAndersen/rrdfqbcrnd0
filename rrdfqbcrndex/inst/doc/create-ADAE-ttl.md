---
title: "Create ADAE as TTL file"
author: "mja@statgroup.dk"
date: "2016-01-03"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create ADAE as TTL file}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Create turtle version of ADAE dataset

## Setup


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

This script creates a turtle version of the ADAE dataset.

The script uses SQLite to export the ADAE dataset, and d2rq (http://d2rq.org/) to create a turle version of the file.
In the code below it is assumed that d2rq is installed in the directory `/opt/d2rq-0.8.1`.


```r
library(foreign)
fnadae<- system.file("extdata/sample-xpt", "adae.xpt", package="rrdfqbcrndex")
adae<-read.xport(fnadae)
```

```
## Error in lookup.xport(file): file not in SAS transfer format
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
dbWriteTable(con, "adae", adae)
```

```
## Error in dbWriteTable(con, "adae", adae): error in evaluating the argument 'value' in selecting a method for function 'dbWriteTable': Error: object 'adae' not found
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
## SQLite database stored as  /tmp/RtmpMMC1tG/file322a51bb9d95
```

```r
dumpFn<- tempfile()
system(paste("sqlite3", tfile, ".dump >", dumpFn, sep=" "))
cat("SQLite database dump in ", dumpFn, "\n")
```

```
## SQLite database dump in  /tmp/RtmpMMC1tG/file322a2e6fba4e
```

Next step is to process the dump, so the SQL can be used as input to d2rq.
The changes applied are:
*  change TEXT to VARCHAR(1000)
*  remove top 2 lines with PRAGMA
*  in insert statements replace "adae"  with adae
*  after "AOCC01FL" TEXT add a comma (",") and a new line with PRIMARY KEY (USUBJID,AESEQ)

This could maybe be simplified using  RSQlite on dbSendQuery-methods, see (https://stat.ethz.ch/pipermail/r-sig-db/2010q1/000813.html).
For d2rq documentation see (file:///opt/d2rq-0.8.1/doc/dump-rdf.html).


```r
dumpAfterSedFn <- tempfile()
sedCmd<- paste("sed",
               "-e 's/TEXT/VARCHAR(1000)/g; s/\"AOCC01FL\" VARCHAR(1000)/\"AOCC01FL\" VARCHAR(1000), PRIMARY KEY (USUBJID,AESEQ)/; s/\"adae\"/adae/g; 1,2 d; $ d; ' ",
               dumpFn, ">", dumpAfterSedFn, sep=" ")
system(sedCmd)
cat("SQLite database dump modified stored as ", dumpAfterSedFn, "\n")
```

```
## SQLite database dump modified stored as  /tmp/RtmpMMC1tG/file322a15072d0f
```

```r
## Check only expected changes were applied
## not run due to large output
## system(paste("diff", dumpFn, dumpAfterSedFn, sep=" "))


adaemapttlFn<- file.path(tempdir(), "adae-map.ttl")
adaettlFn<- file.path(tempdir(), "adae.ttl")

d2rqbaseURL<- "http://www.example.org/datasets/"

## -b option does not work with -l
## /opt/d2rq-0.8.1/generate-mapping reports Unknown argument: -b
system(paste("/opt/d2rq-0.8.1/generate-mapping",
             " -l ", dumpAfterSedFn,
             " -o ", adaemapttlFn
             ))

system(paste("/opt/d2rq-0.8.1/dump-rdf",
             " -b ", d2rqbaseURL,
             " -o ", adaettlFn,
             " -l ", dumpAfterSedFn,
             " ", adaemapttlFn
             ))
 


targetDir<- system.file("extdata/sample-rdf", package="rrdfqbcrndex")
if (file.copy(adaemapttlFn, targetDir, overwrite = TRUE)) {
cat( "File ", adaemapttlFn, " copied to directory ", targetDir, "\n")
}
```

```
## File  /tmp/RtmpMMC1tG/adae-map.ttl  copied to directory  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf
```

```r
if (file.copy(adaettlFn, targetDir, overwrite = TRUE)) {
cat( "File ", adaettlFn, " copied to directory ", targetDir, "\n")
}
```

```
## File  /tmp/RtmpMMC1tG/adae.ttl  copied to directory  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf
```


```r
### This could maybe also work ..
## m <- dbDriver("SQLite")
## tfile <- tempfile()
## con <- dbConnect(m, dbname = tfile)
## s <- sprintf("create table %s(%s, primary key(%s))", "adae",
## 		paste(names(adae), collapse = ", "),
## 		paste(names(adae)[c(1,2)],collapse=", ")
##              )
## dbGetQuery(con, s)

## dbWriteTable(con, "adae", adae,append=TRUE)
## dbDisconnect(con)
## tfile
```


### Read in the file

This section demostrates how to access the data for the ADAE dataset.

First the data are loaded into a RDF model.

```r
dataFilemap<- system.file("extdata/sample-rdf", "adae-map.ttl", package="rrdfqbcrndex")
dataFilemap
```

```
## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/adae-map.ttl"
```

```r
dataFile<- system.file("extdata/sample-rdf", "adae.ttl", package="rrdfqbcrndex")
dataFile
```

```
## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/adae.ttl"
```

```r
store <- new.rdf()  # Initialize
load.rdf(dataFilemap, format="TURTLE", appendTo= store)
```

```
## [1] "Java-Object{<ModelCom   {rdf:rest @rdf:type rdf:Property; rdf:rest @rdfs:domain rdf:List; rdf:rest @rdfs:range rdf:List; rdf:rest @rdfs:subPropertyOf rdf:rest; rdf:List @rdf:type rdfs:Class; rdf:List @rdfs:subClassOf rdfs:Resource; rdf:predicate @rdf:type rdf:Property; rdf:predicate @rdfs:domain rdf:Statement; rdf:predicate @rdfs:subPropertyOf rdf:predicate; rdf:Property @rdf:type rdfs:Class; rdf:Property @rdfs:subClassOf rdfs:Resource; rdfs:label @rdfs:range rdfs:Literal; rdf:Statement @rdf:type rdfs:Class; rdf:Statement @rdfs:subClassOf rdfs:Resource; rdfs:Class @rdf:type rdfs:Class; rdfs:Class @rdfs:subClassOf rdfs:Resource; rdf:type @rdfs:range rdfs:Class...} |  [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#rest] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#label, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Literal] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Resource, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#subject] [http://www.w3.org/1999/02/22-rdf-syntax-ns#XMLLiteral, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Datatype] [http://www.w3.org/2000/01/rdf-schema#comment, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Literal] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#object] [http://www.w3.org/1999/02/22-rdf-syntax-ns#nil, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#first] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#startupSQLScript, file:///tmp/RtmpMMC1tG/file322a15072d0f] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#jdbcDSN, \"jdbc:hsqldb:mem:temp\"] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#jdbcDriver, \"org.hsqldb.jdbc.JDBCDriver\"] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#Database] [http://www.w3.org/2000/01/rdf-schema#Resource, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Datatype] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Literal] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/2000/01/rdf-schema#Container, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#isDefinedBy] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#seeAlso] [http://www.w3.org/2000/01/rdf-schema#seeAlso, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#seeAlso] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Container, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#seeAlso, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#comment, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#label, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#Database, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#XMLLiteral, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#XMLLiteral, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#nil, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#seeAlso, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#comment, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#label, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Resource, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Container, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#Database, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource]>}"
```

```r
load.rdf(dataFile, format="TURTLE", appendTo= store)
```

```
## [1] "Java-Object{<ModelCom   {rdf:rest @rdf:type rdf:Property; rdf:rest @rdfs:domain rdf:List; rdf:rest @rdfs:range rdf:List; rdf:rest @rdfs:subPropertyOf rdf:rest; rdf:List @rdf:type rdfs:Class; rdf:List @rdfs:subClassOf rdfs:Resource; rdf:predicate @rdf:type rdf:Property; rdf:predicate @rdfs:domain rdf:Statement; rdf:predicate @rdfs:subPropertyOf rdf:predicate; rdf:Property @rdf:type rdfs:Class; rdf:Property @rdfs:subClassOf rdfs:Resource; rdfs:label @rdfs:range rdfs:Literal; rdf:subject @rdf:type rdf:Property; rdf:subject @rdfs:domain rdf:Statement; rdf:subject @rdfs:subPropertyOf rdf:subject; rdfs:Resource @rdf:type rdfs:Class; rdf:type @rdfs:range rdfs:Class...} |  [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#rest] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#label, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Literal] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#subject] [http://www.w3.org/2000/01/rdf-schema#Resource, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#XMLLiteral, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Datatype] [http://www.w3.org/2000/01/rdf-schema#comment, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Literal] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#object] [http://www.w3.org/1999/02/22-rdf-syntax-ns#nil, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#first] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2000/01/rdf-schema#Class] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#startupSQLScript, file:///tmp/RtmpMMC1tG/file322a15072d0f] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#jdbcDSN, \"jdbc:hsqldb:mem:temp\"] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#jdbcDriver, \"org.hsqldb.jdbc.JDBCDriver\"] [file:///home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/data-raw/#database, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#Database] [http://www.w3.org/2000/01/rdf-schema#Resource, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Datatype] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#List] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Literal] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement] [http://www.w3.org/2000/01/rdf-schema#Container, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Container] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#isDefinedBy] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#seeAlso] [http://www.w3.org/2000/01/rdf-schema#seeAlso, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/2000/01/rdf-schema#seeAlso] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Container, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#seeAlso, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#comment, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.w3.org/2000/01/rdf-schema#label, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#Database, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#XMLLiteral, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#XMLLiteral, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Class] [http://www.w3.org/1999/02/22-rdf-syntax-ns#nil, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#first, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#object, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#subject, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#predicate, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#rest, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#isDefinedBy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#seeAlso, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#subClassOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#domain, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#comment, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#label, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Property, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#List, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Resource, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Class, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Literal, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Container, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Seq, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#Datatype, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/1999/02/22-rdf-syntax-ns#Alt, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.w3.org/2000/01/rdf-schema#ContainerMembershipProperty, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource] [http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#Database, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/2000/01/rdf-schema#Resource]>}"
```

```r
summarize.rdf(store)
```

```
## [1] "Number of triples: 44"
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
s<- paste0("<", d2rqbaseURL,c("ADAE/01-701-1023/2.0E0"), ">")

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
## ( <http://www.example.org/datasets/ADAE/01-701-1023/2.0E0> )
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
records.res$pclean<- gsub(paste0(d2rqbaseURL,"vocab/ADAE_"), "", records.res$p)
knitr::kable(records.res[,c("s", "p","o")])
```

```
## Error in `[.data.frame`(records.res, , c("s", "p", "o")): undefined columns selected
```
