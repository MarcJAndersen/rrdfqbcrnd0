---
title: "SPARQL scripts for RDF data cubes"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-09-22"
output: 
  html_document
  pdf_document
vignette: >
  %\VignetteIndexEntry{SPARQL scripts for RDF data cubes}
  %\VignetteEngine{knitr::knitr}
  %\usepackage[utf8]{inputenc}
  %\SweaveUTF8
---

# SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)


## Setup

First load the package.

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

## Internals

The display of SPARQL script in markdown is done by first creating a chunk, and then using the chunk with the highlight engine in knitr. The advantage of this approach is that all formatting is handled by external packages. To make the highlight output work in markdown two blanks has to be added at the end of line according to markdown syntax.

```r
mdwrite<- function( sparqlStatements, refname ) {
# fn<- file.path(tempdir(), paste0( refname, ".rq" ) )
fn<- file.path(system.file("extdata/sample-rdf", package="rrdfqbcrnd0"), paste0( refname, ".rq" ) )
cat( paste0("## @knitr ", refname), gsub("\\n", "  \n", sparqlStatements), sep="  \n", file=fn)
knitr::read_chunk( fn, from=c(1))
invisible(fn)
}
```



## SPARQL scripts

The rrdfqbcrnd0 package uses SPARQL scripts to access the RRDF triple
store.  This is implemented by having a function generating the SPARQL
script. The generated SPARQL scripts are shown here for the
demographics cube in DC-DEMO-sample.ttl.

The turtle file and the scrips are stored in

```r
system.file("extdata/sample-xpt", package="rrdfqbcrnd0")
```

```
## [1] "/home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/sample-xpt"
```

## Setup for generating SPARQL scripts for the demographics cube (DC-DEMO-sample.TTL)

The DEMO data exists as a turtle file in the sample-rdf directory.


```r
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.ttl", package="rrdfqbcrnd0")
store <- new.rdf()  # Initialize
cat("Loading ", dataCubeFile, "\n")
```

```
## Loading  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/sample-rdf/DC-DEMO-sample.ttl
```

```r
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)
```

```
## [1] "Number of triples: 2930"
```

For the functions in the package the datasets definition in the cube is needed.

```r
dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
forsparqlprefix<- GetForSparqlPrefix( domainName )
```


## SPARQL query for dimensions in RDF data cube

The SPARQL query for the dimensions is made by the function GetDimensionsSparqlQuery.

```r
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
mdwrite( dimensionsRq, "DEMOdimensions" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2004/02/skos/core#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/prov#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2000/01/rdf-schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/dcat#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2002/07/owl#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2001/XMLSchema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/linked-data/cube#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/pav&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/dc/terms/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/mms#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/ct/schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/rrdfqbcrnd0/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/code/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/demo/dccs/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/demo/ds/&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/dimension#&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/attribute#&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/measure#&gt;</span>  
   
<span style="color:#010181">select</span> <span style="color:#000000">*</span> <span style="color:#010181">where</span>  
<span style="color:#000000">{ []</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dimension</span> ?p <span style="color:#000000">.  }</span>  

Executing the SPARQL query gives:


```r
dimensions<- sparql.rdf(store, dimensionsRq)
knitr::kable(dimensions)
```



|p                        |
|:------------------------|
|crnd-dimension:ethnic    |
|crnd-dimension:race      |
|crnd-dimension:procedure |
|crnd-dimension:agegr1    |
|crnd-dimension:factor    |
|crnd-dimension:trt01a    |
|crnd-dimension:sex       |


## SPARQL query for attributes in RDF data cube

The SPARQL query for the attributes is made by the function GetAttributesSparqlQuery.

```r
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
mdwrite( attributesRq, "DEMOattributes" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2004/02/skos/core#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/prov#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2000/01/rdf-schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/dcat#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2002/07/owl#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2001/XMLSchema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/linked-data/cube#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/pav&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/dc/terms/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/mms#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/ct/schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/rrdfqbcrnd0/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/code/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/demo/dccs/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/demo/ds/&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/dimension#&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/attribute#&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/measure#&gt;</span>  
   
<span style="color:#010181">select</span> <span style="color:#000000">*</span> <span style="color:#010181">where</span>  
<span style="color:#000000">{</span> ?p <span style="color:#010181">a</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">AttributeProperty</span> <span style="color:#000000">.  }</span>  

Executing the SPARQL query gives:


```r
attributes<- sparql.rdf(store, attributesRq)
knitr::kable(attributes)
```



|p                          |
|:--------------------------|
|crnd-attribute:cellpartno  |
|crnd-attribute:measurefmt  |
|crnd-attribute:colno       |
|crnd-attribute:denominator |
|crnd-attribute:unit        |
|crnd-attribute:rowno       |

## SPARQL query for observations from RDF data cube in workbook format

The SPARQL query for the attributes is made by the function
GetAttributesSparqlQuery, where the domainName, dimensions and
attributes for the cube is passed as parameters.


```r
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
mdwrite( observationsRq, "DEMOobservations" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2004/02/skos/core#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/prov#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2000/01/rdf-schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/dcat#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2002/07/owl#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2001/XMLSchema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/linked-data/cube#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/pav&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/dc/terms/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/mms#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/ct/schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/rrdfqbcrnd0/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/code/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/demo/dccs/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/demo/ds/&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/dimension#&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/attribute#&gt;</span>  
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/measure#&gt;</span>  
 <span style="color:#010181">select</span> <span style="color:#000000">*</span> <span style="color:#010181">where</span> <span style="color:#000000">{</span> ?s <span style="color:#010181">a</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">Observation</span>  <span style="color:#000000">;</span>   
        <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dataSet</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dataset</span><span style="color:#000000">-</span><span style="color:#010181">DEMO</span>  <span style="color:#000000">;</span>   
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">ethnic</span> ?ethnic<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">race</span> ?race<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">procedure</span> ?procedure<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">agegr1</span> ?agegr1<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">factor</span> ?factor<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">trt01a</span> ?trt01a<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">sex</span> ?sex<span style="color:#000000">;</span> <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">cellpartno</span> ?cellpartno<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">measurefmt</span> ?measurefmt<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">colno</span> ?colno<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">denominator</span> ?denominator<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">unit</span> ?unit<span style="color:#000000">;</span>  
<span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">rowno</span> ?rowno<span style="color:#000000">;</span> <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">measure</span>      ?measure <span style="color:#000000">;</span>        
 <span style="color:#010181">optional</span><span style="color:#000000">{</span> ?ethnic <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?ethnicvalue <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?race <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?racevalue <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?procedure <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?procedurevalue <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?agegr1 <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?agegr1value <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?factor <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?factorvalue <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?trt01a <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?trt01avalue <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?sex <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?sexvalue <span style="color:#000000">. }</span>   
 <span style="color:#000000">}</span>    

The first 2 rows of result of the query is:


```r
observations<- sparql.rdf(store, observationsRq)
knitr::kable(head(observations,2))
```



|s         |ethnic            |race            |procedure            |agegr1            |factor               |trt01a                          |sex            |cellpartno |measurefmt |colno |denominator |unit |rowno |measure |ethnicvalue |racevalue |procedurevalue |agegr1value |factorvalue |trt01avalue         |sexvalue |
|:---------|:-----------------|:---------------|:--------------------|:-----------------|:--------------------|:-------------------------------|:--------------|:----------|:----------|:-----|:-----------|:----|:-----|:-------|:-----------|:---------|:--------------|:-----------|:-----------|:-------------------|:--------|
|ds:obs103 |code:ethnic-_ALL_ |code:race-_ALL_ |code:procedure-q3    |code:agegr1-_ALL_ |code:factor-weightbl |code:trt01a-Placebo             |code:sex-_ALL_ |1          |%6.1f      |1     |            |NA   |30    |74.4    |_ALL_       |_ALL_     |q3             |_ALL_       |weightbl    |Placebo             |_ALL_    |
|ds:obs014 |code:ethnic-_ALL_ |code:race-_ALL_ |code:procedure-count |code:agegr1-_ALL_ |code:factor-quantity |code:trt01a-Xanomeline_Low_Dose |code:sex-M     |1          |%6.0f      |2     |            |NA   |3     |34      |_ALL_       |_ALL_     |count          |_ALL_       |quantity    |Xanomeline Low Dose |M        |

# TODO(mja): SPARQL scripts parametrised

This vignettes shows the contents of the scripts. Some of the scripts
are parametrised by one or more parameters. The parameter are shown
with as $p, $q etc, following the same convention as in the
(http://www.w3.org/TR/vocab-data-cube/#ic-20)[RDF Data Cube Vocabulary]. This
does not really work here, as some of the parameters in the R
functions are intended for vectors with more than one parameter.

# TODO(mja): Generating this output using the information in the documentation

TODO(mja): enter the commands here as example in each of the .Rd files.
Then the output here can be generated from the .Rd files.


