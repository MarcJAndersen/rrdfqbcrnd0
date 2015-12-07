---
title: "Create simple RDF data qube"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-12-08"
vignette: >
  %\VignetteIndexEntry{Create simple RDF data qube}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---

## Introduction
This vignette shows how to 
- create a very simple RDF data cube from data and metadata  
- query the cube using SPARQL
- execute the RDF data cube integrity checks

# Setup

The next command is not needed if the package have been loaded throug devtools::load_all().

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

# Create RDF data cube
The RDF data cube will be created from two data.frames containing data and metadata.

## Define data
The data are defined as data frame, and the data frame is displayed.

```r
obsData<- data.frame(
  category=c("AA-group", "BB-group"),
  procedure=c("count", "count" ),
  factor=c("quantity", "quantity" ),
  unit=c("subject", "subject" ),
  denominator=c(" ", " "),
  measure=c( 123, 456 ),
  stringsAsFactors=FALSE  )
knitr::kable(obsData)
```



|category |procedure |factor   |unit    |denominator | measure|
|:--------|:---------|:--------|:-------|:-----------|-------:|
|AA-group |count     |quantity |subject |            |     123|
|BB-group |count     |quantity |subject |            |     456|

## Define meta data
The metadata used for generating the RDF data cube are also defined as data frame and displayed.

```r
cubeMetadata<- data.frame(
  compType=c("dimension", "dimension", "dimension", "unit", "denominator", "measure", "metadata"),
  compName=c("category", "procedure", "factor", "attribute", "attribute", "measure", "domainName"),
  codeType=c("DATA", "DATA", "DATA", " ", " ", "<NA>","<NA>"),
  nciDomainValue=c(" "," "," "," ", " ", " "," "),
  compLabel=c("Category", "Statistical procedure", "Type of procedure", "Result", "Unit", "Denominator", "EXAMPLE"),
  Comment=c(" "," "," "," "," "," "," "),
  stringsAsFactors=FALSE  )
knitr::kable(cubeMetadata)
```



|compType    |compName   |codeType |nciDomainValue |compLabel             |Comment |
|:-----------|:----------|:--------|:--------------|:---------------------|:-------|
|dimension   |category   |DATA     |               |Category              |        |
|dimension   |procedure  |DATA     |               |Statistical procedure |        |
|dimension   |factor     |DATA     |               |Type of procedure     |        |
|unit        |attribute  |         |               |Result                |        |
|denominator |attribute  |         |               |Unit                  |        |
|measure     |measure    |<NA>     |               |Denominator           |        |
|metadata    |domainName |<NA>     |               |EXAMPLE               |        |

## Create RDF data cube

The RDF data cube for the data above is created using

```r
outcube<- BuildCubeFromDataFrames(cubeMetadata, obsData )
```

```
## Error in eval(expr, envir, enclos): could not find function "BuildCubeFromDataFrames"
```
This shows a simple use of the BuildCubeFromDataFrames function. 
The warning message from log4j can be ignored.

The RDF data cube is serialized in turtle format and stored as a text file in

```r
cat(normalizePath(outcube),"\n")
```

```
## Error in path.expand(path): object 'outcube' not found
```

# Query the cube using SPARQL

Now take a look at the generated cubes by loading the turle file.



```r
dataCubeFile<- outcube
```

```
## Error in eval(expr, envir, enclos): object 'outcube' not found
```

The rest of the code only depends on the value of dataCubeFile.
The code demonstrates the use of the rrdf library.


```r
cube <- new.rdf()  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= cube)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : object 'dataCubeFile' not found
```

```r
summarize.rdf(cube)
```

```
## [1] "Number of triples: 40"
```

The next statements are needed for the current implementation of the cube, and may change in future versions.

```r
## TODO: reconsider the use of domain specific prefixes
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
cat("dsdName ", dsdName, ", domainName ", domainName, "\n" )
```

```
## Error in cat("dsdName ", dsdName, ", domainName ", domainName, "\n"): object 'dsdName' not found
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetForSparqlPrefix"
```

```r
cat(forsparqlprefix,"\n")
```

```
## Error in cat(forsparqlprefix, "\n"): object 'forsparqlprefix' not found
```

The variable forsparqlprefix contains the prefix statements applicable
for the present data cube. The use of prefixes makes the SPARQL query
shorter, and more readable. The present version of the package defines
namespaces dccs: and ds: where the domainname is included.
TODO: Consider other approach for including the domainname, or use other concept.

The next statement shows the first 10 triples in the cube. This will
most often not be of interest, as the RDF cube contain general
definition and not the specific cube triples.


```
## Error in paste(forsparqlprefix, "\nselect *\nwhere {?s ?p ?o .}\nlimit 10\n", : object 'forsparqlprefix' not found
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'cube.observations1.rq' not found
```

```
## Error in head(cube.observations1, 10): error in evaluating the argument 'x' in selecting a method for function 'head': Error: object 'cube.observations1' not found
```

The next statement gets the first 30 triples in the cube where 
the subject is a qb:Observation, and shows the first 15 triples.

```r
cube.observations2.rq<-  paste( forsparqlprefix,
'
select *
where { ?s a qb:Observation ; ?p ?o .}
limit 30
',
"\n"                               
)
```

```
## Error in paste(forsparqlprefix, "\nselect *\nwhere { ?s a qb:Observation ; ?p ?o .}\nlimit 30\n", : object 'forsparqlprefix' not found
```

```r
cube.observations2<- sparql.rdf(cube, cube.observations2.rq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'cube.observations2.rq' not found
```

```r
knitr::kable(head(cube.observations2, 15))
```

```
## Error in head(cube.observations2, 15): error in evaluating the argument 'x' in selecting a method for function 'head': Error: object 'cube.observations2' not found
```

The SPARQL query for codelists are shown in the next output.

```
## Error in eval(expr, envir, enclos): could not find function "GetCodeListSparqlQuery"
```

```
## Error in cat(codelists.rq): object 'codelists.rq' not found
```

Executing the SPARQL query gives the code list as a data frame.

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'codelists.rq' not found
```

```
## Error in gsub("code:", "", cube.codelists$cl): object 'cube.codelists' not found
```

```
## Error in print(cube.codelists[, c("vn", "clc", "prefLabel")]): object 'cube.codelists' not found
```

The dimensions are shown in the next output.

```r
cube.dimensions.rq<- paste(forsparqlprefix,
'
select * where
{ [] qb:dimension ?p .  }
',
"\n"
)
```

```
## Error in paste(forsparqlprefix, "\nselect * where\n{ [] qb:dimension ?p .  }\n", : object 'forsparqlprefix' not found
```

```r
cube.dimensions<- as.data.frame(sparql.rdf(cube, cube.dimensions.rq), stringsAsFactors=FALSE)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'cube.dimensions.rq' not found
```

```r
knitr::kable(cube.dimensions)
```

```
## Error in is.data.frame(x): object 'cube.dimensions' not found
```

And finally the SPARQL query for observations.

```
## Error in paste(forsparqlprefix, "select * where { {[] qb:dimension ?p . } union {  ?p a qb:AttributeProperty . } }"): object 'forsparqlprefix' not found
```

```
## Error in paste(forsparqlprefix, "select * where {", "     ?s a qb:Observation  ;", : object 'forsparqlprefix' not found
```

This is the query for getting the observations

```r
cat(cube.observations.rq)
```

```
## Error in cat(cube.observations.rq): object 'cube.observations.rq' not found
```

And finally the observations, which is expected be the same as the starting data set.

```r
cube.observations<- as.data.frame(sparql.rdf(cube, cube.observations.rq ), stringsAsFactors=FALSE)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'cube.observations.rq' not found
```

```r
knitr::kable(cube.observations[,c(paste0(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", cube.dimensionsattr), "value"),"measure")])
```

```
## Error in is.data.frame(x): object 'cube.observations' not found
```

# Evaluating RDF data cube integrity constraints 

The cube conformance with the integrity constraints can be checked
using the RunQbIC function. The integrity checks are SPARQL queries
are stored in the list qbIClist.  The checks uses the RDF data cube
vocabulary. Therefore the RDF model must contain the RDF data cube
vocabulary.


```r
cubeVocabularyFn<- system.file("extdata/CUBE-standards-rdf","cube.ttl", package="rrdfqbcrnd0")
cubeVocabulary<- load.rdf(cubeVocabularyFn,format="TURTLE")
cubeData<- combine.rdf( cubeVocabulary, cube)
```

Note, this is not very interesting, as the cube is small.
The evaluation of the integrity contraints takes a while.

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

Here we remove one of the dimensions from the cube in observationo
ds:obs1. Note: for the remove.triple function the components must be
given as the full qualified URI. The expected result is that IC-11
fails.


```r
remove.triple(cubeData,
  subject="http://www.example.org/dc/example/ds/obs1",
  predicate="http://www.example.org/dc/dimension#category",
  object="http://www.example.org/dc/code/category-AA-group")
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

IC-12 also fails; examining the SPARQL query shows why.


```r
cat(qbIClist[["ic-12"]]$rq,"\n")
```

```
## ASK {
##   FILTER( ?allEqual )
##   {
##     # For each pair of observations test if all the dimension values are the same
##     SELECT (MIN(?equal) AS ?allEqual) WHERE {
##         ?obs1 qb:dataSet ?dataset .
##         ?obs2 qb:dataSet ?dataset .
##         FILTER (?obs1 != ?obs2)
##         ?dataset qb:structure/qb:component/qb:componentProperty ?dim .
##         ?dim a qb:DimensionProperty .
##         ?obs1 ?dim ?value1 .
##         ?obs2 ?dim ?value2 .
##         BIND( ?value1 = ?value2 AS ?equal)
##     } GROUP BY ?obs1 ?obs2
##   }
## }
## 
```

As RRDF does not support the ASK query, the IC queries are changed 
to a SELECT query returning the number of triples selected.
