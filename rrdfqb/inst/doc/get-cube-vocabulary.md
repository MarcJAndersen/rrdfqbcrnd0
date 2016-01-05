---
title: "Get RDF data cube vocabulary as turtle file from qb: (http://purl.org/linked-data/cube#)"
author: "mja@statgroup.dk"
date: "2016-01-03"
---

# Get RDF data cube vocabulary as turtle file from qb: (http://purl.org/linked-data/cube#).

This script retrieves the RDF data cube vocabulary and stores it as a .ttl in the packages.

## Setup 

```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqb
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

# Get and store RDF data vocabulary


```r
library(RCurl)
library(devtools)
qbURL<-"http://purl.org/linked-data/cube#"
if (! url.exists(qbURL) ) {
  stop(paste0("Can not access URL ",qbURL))
}
cube.vocabulary.ttl <- getURL(qbURL)
savefile <- file.path(system.file("extdata/cube-vocabulary-rdf", package="rrdfqb"), "cube.ttl" )
writeLines( cube.vocabulary.ttl, savefile)
cat("written to ", normalizePath(savefile) )
```

```
## written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqb/inst/extdata/cube-vocabulary-rdf/cube.ttl
```

## SPARQL for getting the cube vocabulary using FROM in the SPARQL query 

The following is experimental and not needed for the present
package. See below for explanation.


```r
rdf.data.cube.URLstem<- qbURL
SPARQLscript<- paste(
  "CONSTRUCT { ?s ?p ?o }",
paste0( "FROM ", "<", rdf.data.cube.URLstem, ">", collapse="\n" )
  ,
  "WHERE { ?s ?p ?o }", sep="\n", collapse="\n"
)
cat(SPARQLscript,"\n")
```

CONSTRUCT { ?s ?p ?o }
FROM <http://purl.org/linked-data/cube#>
WHERE { ?s ?p ?o } 

```r
SPARQLscriptfn<- file.path(tempdir(),"get-cube.rq")
writeLines( SPARQLscript, con=SPARQLscriptfn )
cat("SPARQL script stored in  ", normalizePath(SPARQLscriptfn), "\n")
```

SPARQL script stored in   /tmp/Rtmp3PU6C1/get-cube.rq 

### Using the script with R
The R-code below does not work with rrdf.


```r
store <- new.rdf()
results <- construct.rdf(store, SPARQLscript )
summarize.rdf(results)
```

However, it works using a local Fuseki instance. 
The code below assumes a local Fuseki instance is running at `http://localhost:3030/arm/query`.
Change to follow your setup.

```r
endpoint<- "http://localhost:3030/arm/query"
results.fuseki <- construct.remote(endpoint, SPARQLscript )
summarize.rdf(results.fuseki)
```
