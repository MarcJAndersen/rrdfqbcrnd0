---
title: "Show the procedure codelist"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-12-20"
vignette: >
  %\VignetteIndexEntry{Show the procedure codelist}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---

## Introduction
This vignette shows
- the procedure codelist

# Setup


```r
knitr::read_chunk("setup.R")
```


```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqbcrnd0
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
thisGetDescrStatProcedure<- GetDescrStatProcedure()
procedureName<- gsub( "code:procedure-", "", names(thisGetDescrStatProcedure))
obsData<- data.frame(
  category=rep( "AA-group", length(procedureName)),
  procedure=procedureName,
  factor=rep( "VARA", length(procedureName)),
  unit=rep( "Not given", length(procedureName)),
  denominator=rep( " ", length(procedureName)),
  measure=seq(length(procedureName)),
  stringsAsFactors=FALSE  )
knitr::kable(obsData)
```



|category |procedure     |factor |unit      |denominator | measure|
|:--------|:-------------|:------|:---------|:-----------|-------:|
|AA-group |mean          |VARA   |Not given |            |       1|
|AA-group |stddev        |VARA   |Not given |            |       2|
|AA-group |stdev         |VARA   |Not given |            |       3|
|AA-group |std           |VARA   |Not given |            |       4|
|AA-group |median        |VARA   |Not given |            |       5|
|AA-group |min           |VARA   |Not given |            |       6|
|AA-group |max           |VARA   |Not given |            |       7|
|AA-group |n             |VARA   |Not given |            |       8|
|AA-group |q1            |VARA   |Not given |            |       9|
|AA-group |q3            |VARA   |Not given |            |      10|
|AA-group |count         |VARA   |Not given |            |      11|
|AA-group |countdistinct |VARA   |Not given |            |      12|
|AA-group |percent       |VARA   |Not given |            |      13|

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
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : com.hp.hpl.jena.query.QueryParseException: Line 10, column 28: Unresolved prefixed name: qb:DataStructureDefinition
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
temp<-load.rdf(dataCubeFile, format="TURTLE", appendTo= cube)
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
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : com.hp.hpl.jena.query.QueryParseException: Line 5, column 8: Unresolved prefixed name: qb:DataStructureDefinition
```

```r
domainName<- GetDomainNameFromCube( cube )
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : com.hp.hpl.jena.query.QueryParseException: Line 5, column 8: Unresolved prefixed name: qb:DataStructureDefinition
```

```r
cat("dsdName ", dsdName, ", domainName ", domainName, "\n" )
```

```
## Error in cat("dsdName ", dsdName, ", domainName ", domainName, "\n"): object 'dsdName' not found
```

```r
prefixlist<- Get.prefixlist.from.df(GetForSparqlPrefix.as.df(domainName=domainName))
```

```
## Error in GetForSparqlPrefix.as.df(domainName = domainName): object 'domainName' not found
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

```
## Error in GetForSparqlPrefix.as.df(domainName = domainName, common.prefixes = common.prefixes, : object 'domainName' not found
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

## Add `rdfs:seeAlso` for descriptive statistics


```r
        add.triple(cube,
                   paste0(prefixlist$prefixCODE, "procedure-median"),
                   paste0(prefixlist$prefixRDFS,"seeAlso" ),
                   "purl.obolibrary.org/obo/OBI_0200119")
```

```
## Error in paste0(prefixlist$prefixCODE, "procedure-median"): object 'prefixlist' not found
```

```r
        add.triple(cube,
                   paste0(prefixlist$prefixCODE, "procedure-stddev"),
                   paste0(prefixlist$prefixRDFS,"seeAlso" ),
                   "purl.obolibrary.org/obo/STATO_0000037")
```

```
## Error in paste0(prefixlist$prefixCODE, "procedure-stddev"): object 'prefixlist' not found
```

```r
        add.triple(cube,
                   paste0(prefixlist$prefixCODE, "procedure-mean"),
                   paste0(prefixlist$prefixRDFS,"seeAlso" ),
                   "purl.obolibrary.org/obo/IAO_0000125")
```

```
## Error in paste0(prefixlist$prefixCODE, "procedure-mean"): object 'prefixlist' not found
```


## Getting all codelists as data.frame

The SPARQL query for codelists are shown in the next output.

```
## Error in paste(forsparqlprefix, "\nselect distinct ?p ?vn ?cl ?prefLabel \nwhere {\n?DataStructureDefinition a qb:DataStructureDefinition ;\n   qb:component ?component .\n?component a qb:ComponentSpecification .\n?component qb:dimension ?p .\n?p qb:codeList ?c .\n?c skos:hasTopConcept ?cl .\n?cl skos:prefLabel ?prefLabel .\nOPTIONAL { ?c rrdfqbcrnd0:R-columnname ?vn } \nvalues ( ?DataStructureDefinition ) {\n", : object 'forsparqlprefix' not found
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

## Getting the procedure codelist as data.frame


```
## Error in paste(forsparqlprefix, "\nselect ?s ?p ?o\nwhere { \n?s ?p ?o .\n?s a code:Procedure\n }    \n", : object 'forsparqlprefix' not found
```

```
## Error in cat(procedure.codelists.rq): object 'procedure.codelists.rq' not found
```

Executing the SPARQL query gives the code list as a data frame.

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'procedure.codelists.rq' not found
```

```
## Error in print(cube.procedure.codelists): object 'cube.procedure.codelists' not found
```

## Get the procedure codelist as turtle with Stato References


```
## Error in paste(forsparqlprefix, "\nconstruct { ?s ?p ?o } \nwhere { \n{ ?s ?p ?o . ?s a code:Procedure. }\nunion\n{ ?s ?p ?o . values(?s) {(code:Procedure)} }\n } \n", : object 'forsparqlprefix' not found
```

```
## Error in cat(construct.codelists.rq): object 'construct.codelists.rq' not found
```


```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : object 'construct.codelists.rq' not found
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "V", "saveRdf", store, : object 'procedure.codelist.store' not found
```

The RDF data cube is serialized in turtle format and stored as a text file in

```r
cat(normalizePath(outcodelist),"\n")
```

```
## Error in path.expand(path): object 'outcodelist' not found
```
