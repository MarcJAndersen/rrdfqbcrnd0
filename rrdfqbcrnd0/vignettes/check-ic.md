---
title: "Execute SPARQL integrity constraints on a data cube"
author: "mja@statgroup.dk"
date: "2015-12-08"
vignette: >
  %\VignetteIndexEntry{Execute SPARQL integrity constraints on a data cube}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---


```r
library(rrdfqbcrnd0)
```

```
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
qbfile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfqbcrnd0")
cube<- load.rdf( qbfile, format="TURTLE")

dsdName<- GetDsdNameFromCube( cube )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDsdNameFromCube"
```

```r
domainName<- GetDomainNameFromCube( cube )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDomainNameFromCube"
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetForSparqlPrefix"
```

```r
cdisc.rdf<- Load.cdisc.standards()
```

```
## Error in eval(expr, envir, enclos): could not find function "Load.cdisc.standards"
```

```r
cubeData<- combine.rdf( cube, cdisc.rdf)
```

```
## Error in combine.rdf(cube, cdisc.rdf): object 'cdisc.rdf' not found
```

rrdf does not implement the ASK query. As a work around the query is
transformed to a `SELECT (COUNT(*) ...)` or `SELECT *` gitquery.


```r
str(cubeData)
```

```
## Error in str(cubeData): error in evaluating the argument 'object' in selecting a method for function 'str': Error: object 'cubeData' not found
```

```r
for (icall in qbIClist) {
#  print(names(icall))
  if (! icall$HasInstantiation ) {
    icSelectRq<- gsub("ASK \\{", "SELECT \\* WHERE \\{", icall$rq)
    print( icall$ittitle)
    print( icSelectRq)
    cube.ic<- sparql.rdf(cubeData, paste( forsparqlprefix, icSelectRq  )  )
    cat(paste0(icall$ictitle, ": ", nrow(cube.ic), "\n"))
   }
}
```

NULL
[1] "SELECT * WHERE {\n  {\n    # Check observation has a data set\n    ?obs a qb:Observation .\n    FILTER NOT EXISTS { ?obs qb:dataSet ?dataset1 . }\n  } UNION {\n    # Check has just one data set\n    ?obs a qb:Observation ;\n       qb:dataSet ?dataset1, ?dataset2 .\n    FILTER (?dataset1 != ?dataset2)\n  }\n}\n    "

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'cubeData' not found
```

Here is the same code but wrapped into a function


```r
icres<- RunQbIC( cubeData, forsparqlprefix )
```

```
## Error in eval(expr, envir, enclos): could not find function "RunQbIC"
```

```r
knitr::kable(icres)
```

```
## Error in is.data.frame(x): object 'icres' not found
```

## Checking two existing cube

The example data is from
(http://publishing-statistical-data.googlecode.com/svn/trunk/specs/src/main/example/example.ttl)


```r
qbfile1<- system.file("extdata/sample-rdf", "example.ttl", package="rrdfqbcrnd0")
cube1<- load.rdf( qbfile1, format="TURTLE")

cubeData1<- combine.rdf( cube1, cdisc.rdf)
```

```
## Error in combine.rdf(cube1, cdisc.rdf): object 'cdisc.rdf' not found
```

```r
icres1<- RunQbIC( cubeData1, forsparqlprefix )
```

```
## Error in eval(expr, envir, enclos): could not find function "RunQbIC"
```

```r
knitr::kable(icres1)
```

```
## Error in is.data.frame(x): object 'icres1' not found
```

The file example-fails-IC14.ttl is example.ttl with a few triples added to make the cube non conformant with the intregity constaints.


```r
qbfile2<- system.file("extdata/sample-rdf", "example-fails-IC14.ttl", package="rrdfqbcrnd0")
cube2<- load.rdf( qbfile2, format="TURTLE")

cubeData2<- combine.rdf( cube2, cdisc.rdf)
```

```
## Error in combine.rdf(cube2, cdisc.rdf): object 'cdisc.rdf' not found
```

```r
icres2<- RunQbIC( cubeData2, forsparqlprefix,doForIC=c("ic-14") )
```

```
## Error in eval(expr, envir, enclos): could not find function "RunQbIC"
```

```r
knitr::kable(icres2)
```

```
## Error in is.data.frame(x): object 'icres2' not found
```

