---
title: "Using ARQ to make SPARQL queries"
author: "mja@statgroup.dk"
date: "2016-01-06"
output: rmarkdown::html_vignette
---

# SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)

The examples below uses `arq` from Apache Jena
(http://jena.apache.org). To install arq - download and unpack the
latest version of apache-jena from
(http://jena.apache.org/download/index.cgi).
Then you need some way
of invoking `arq`; I use a not-so-clever-approach: `cd ~/bin; ln -s
/opt/apache-jena-2.13.0/bin/arq`.

Given a SPARQL query and RDF data, `arq` returns the result of the
query. So this is the command line way of making a SPARQL query.

The use of arq is described many places, see for example
(http://www.learningsparql.com/).

All `arq` commands below are to be run in the directory with the
sample files, which is `inst/extdata/sample-rdf` directory or
`extdata/sample-rdf` depending on the whether the development version
or the installed version of the package is used.

The cd below in each code block is included because I could not find a
quick way to get the code chunk executed in that directory. knitr is
flexible enough to do it, I have not yet found the right way to do it.
So, ignore the repeated cd ..

## Get dimensions

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOdimensions.rq 
```

```
## Failed to load data
```

## Get attributes


```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOattributes.rq 
```

```
## Failed to load data
```

## Get observations

The SPARQL script shows for each observation the dimension, attributes and measures in a row.
Note: in the HTML version the output below can be scrolled using the left and right arrow.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations.rq 
```

```
## Failed to load data
```

## Get definition for all descriptive statistics - class `code:procedure`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure.rq 
```

```
## Failed to load data
```

## Get the codelists 

The SPARQL script shows the codelist.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOcodelist.rq 
```

```
## Failed to load data
```

## Get the codelist definition for all descriptive statistics - class `code:procedure`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-codelist.rq 
```

```
## Failed to load data
```

## Get definition for all variables used for descriptive statistics - class `code:factor`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor.rq 
```

```
## Failed to load data
```

## Get the codelist definition for all variables used for descriptive statistics - class `code:factor`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor-codelist.rq 
```

```
## Failed to load data
```

## Get definition for descriptive statistics median

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-median.rq 
```

```
## Failed to load data
```

## Get information for selection of data

The SPARQL script shows how the information for selecting data for derivation of univariate statistics is present in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations-R-selection.rq
```

```
## Failed to load data
```

## Get information on the underlying data in D2RQ format

The following two SPARQL scripts are from taken from `create-ADSL-ttl.Rmd`.

First get the mapping information.

```bash
cd ../extdata/sample-rdf
arq --data adsl-map.ttl --query ADSL-mapping.rq
```

```
## -----------------------------------------
## | mapColumn | d2rqcolumn | d2rqdatatype |
## =========================================
## -----------------------------------------
```

Then dump the contents of a record in the database.

```bash
cd ../extdata/sample-rdf
arq --data adsl.ttl --query ADSL-record.rq
```

```
## -------------
## | s | p | o |
## =============
## -------------
```

## Get underlying data for one cube observation


```bash
cd ../extdata/sample-rdf
arq --data adsl.ttl --data DC-DEMO-sample.ttl --query DEMOobservations-R-data.rq
```

```
## Failed to load data
```


# How to run this .Rmd file
.. add text ..
