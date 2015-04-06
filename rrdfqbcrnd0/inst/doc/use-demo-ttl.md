---
title: "Usage of cube DEMO"
author: "mja@statgroup.dk"
date: "2015-04-06"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Usage of cube DEMO}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Introduction

This is not a good example yet.
TODO(mja): fix it.

# Create DEMO sample table from CSV file

This script creates the result and codelist for a simple DEMO table.


```r
library(rrdfqbcrnd0)
```

```
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
## Warning: replacing previous import by 'rJava::clone' when loading
## 'rrdfqbcrnd0'
```

```r
dataCubeSpec<- system.file("extdata/CUBE-standards-rdf", "cube.ttl", package="rrdfqbcrnd0")

dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.TTL", package="rrdfqbcrnd0")

store <- new.rdf()  # Initialize

cat("Loading cube specfication from ", dataCubeSpec, "\n")
```

```
## Loading cube specfication from
```

```r
load.rdf(dataCubeSpec, format="TURTLE", appendTo= store)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : java.io.FileNotFoundException:  (No such file or directory)
```

```r
cat("Loading cube from ", dataCubeFile, "\n")
```

```
## Loading cube from
```

```r
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : java.io.FileNotFoundException:  (No such file or directory)
```

```r
summarize.rdf(store)
```

```
## [1] "Number of triples: 40"
```


## This works do not change


```r
rq<-  paste( forsparqlprefix,
'
select *
where { 
?s a qb:Observation ; 
?p ?o ;
.
[] qb:dimension ?p .
values (?s) {
(ds:obs114)
}
}
# limit 30
',
"\n"                               
)
```

```
## Error in paste(forsparqlprefix, "\nselect *\nwhere { \n?s a qb:Observation ; \n?p ?o ;\n.\n[] qb:dimension ?p .\nvalues (?s) {\n(ds:obs114)\n}\n}\n# limit 30\n", : object 'forsparqlprefix' not found
```

```r
cube.observations<- sparql.rdf(store, rq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'rq' not found
```

```r
knitr::kable(cube.observations)
```

```
## Error in is.data.frame(x): object 'cube.observations' not found
```

### Check the statistics


```r
stmtSQL<- GetSQLFromCube(store) 
```

```
## Error in strsplit(dsdName, "-"): non-character argument
```

```r
cat(stmtSQL$summStatSQL) 
```

```
## Error in cat(stmtSQL$summStatSQL): object 'stmtSQL' not found
```
