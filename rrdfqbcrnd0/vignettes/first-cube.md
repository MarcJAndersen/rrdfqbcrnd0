---
title: "Create simple RDF data qube"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-09-22"
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
This shows a simple use of the BuildCubeFromDataFrames function. 
The warning message from log4j can be ignored.

The RDF data cube is serialized in turtle format and stored as a text file in

```r
cat(normalizePath(outcube),"\n")
```

```
## /tmp/RtmpUKNHX9/DC-EXAMPLE-R-V-0-0-0.ttl
```

# Query the cube using SPARQL

Now take a look at the generated cubes by loading the turle file.



```r
dataCubeFile<- outcube
```

The rest of the code only depends on the value of dataCubeFile.
The code demonstrates the use of the rrdf library.


```r
cube <- new.rdf()  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= cube)
summarize.rdf(cube)
```

```
## [1] "Number of triples: 215"
```

The next statements are needed for the current implementation of the cube, and may change in future versions.

```r
## TODO: reconsider the use of domain specific prefixes
dsdName<- GetDsdNameFromCube( cube )
domainName<- GetDomainNameFromCube( cube )
cat("dsdName ", dsdName, ", domainName ", domainName, "\n" )
```

```
## dsdName  dsd-EXAMPLE , domainName  EXAMPLE
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
cat(forsparqlprefix,"\n")
```

```
## prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
## prefix skos: <http://www.w3.org/2004/02/skos/core#>
## prefix prov: <http://www.w3.org/ns/prov#>
## prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
## prefix dcat: <http://www.w3.org/ns/dcat#>
## prefix owl: <http://www.w3.org/2002/07/owl#>
## prefix xsd: <http://www.w3.org/2001/XMLSchema#>
## prefix qb: <http://purl.org/linked-data/cube#>
## prefix pav: <http://purl.org/pav>
## prefix dct: <http://purl.org/dc/terms/>
## prefix mms: <http://rdf.cdisc.org/mms#>
## prefix cts: <http://rdf.cdisc.org/ct/schema#>
## prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/>
## prefix code: <http://www.example.org/dc/code/>
## prefix dccs: <http://www.example.org/dc/example/dccs/>
## prefix ds: <http://www.example.org/dc/example/ds/>
## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
## prefix crnd-measure: <http://www.example.org/dc/measure#>
## 
```

The variable forsparqlprefix contains the prefix statements applicable
for the present data cube. The use of prefixes makes the SPARQL query
shorter, and more readable. The present version of the package defines
namespaces dccs: and ds: where the domainname is included.
TODO: Consider other approach for including the domainname, or use other concept.

The next statement shows the first 10 triples in the cube. This will
most often not be of interest, as the RDF cube contain general
definition and not the specific cube triples.


|s             |p                  |o             |
|:-------------|:------------------|:-------------|
|rdf:rest      |rdf:type           |rdf:Property  |
|rdf:rest      |rdfs:domain        |rdf:List      |
|rdf:rest      |rdfs:range         |rdf:List      |
|rdf:rest      |rdfs:subPropertyOf |rdf:rest      |
|rdf:List      |rdf:type           |rdfs:Class    |
|rdf:List      |rdfs:subClassOf    |rdfs:Resource |
|code:Category |rdfs:subClassOf    |rdfs:Resource |
|rdf:predicate |rdf:type           |rdf:Property  |
|rdf:predicate |rdfs:domain        |rdf:Statement |
|rdf:predicate |rdfs:subPropertyOf |rdf:predicate |

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

cube.observations2<- sparql.rdf(cube, cube.observations2.rq)
knitr::kable(head(cube.observations2, 15))
```



|s       |p                        |o                      |
|:-------|:------------------------|:----------------------|
|ds:obs1 |crnd-measure:measure     |123                    |
|ds:obs1 |crnd-dimension:procedure |code:procedure-count   |
|ds:obs1 |crnd-dimension:factor    |code:factor-quantity   |
|ds:obs1 |crnd-dimension:category  |code:category-AA-group |
|ds:obs1 |qb:dataSet               |ds:dataset-EXAMPLE     |
|ds:obs1 |rdfs:label               |1                      |
|ds:obs1 |rdf:type                 |qb:Observation         |
|ds:obs2 |crnd-measure:measure     |456                    |
|ds:obs2 |crnd-dimension:procedure |code:procedure-count   |
|ds:obs2 |crnd-dimension:factor    |code:factor-quantity   |
|ds:obs2 |crnd-dimension:category  |code:category-BB-group |
|ds:obs2 |qb:dataSet               |ds:dataset-EXAMPLE     |
|ds:obs2 |rdfs:label               |2                      |
|ds:obs2 |rdf:type                 |qb:Observation         |

The SPARQL query for codelists are shown in the next output.

```
## prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
## prefix skos: <http://www.w3.org/2004/02/skos/core#>
## prefix prov: <http://www.w3.org/ns/prov#>
## prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
## prefix dcat: <http://www.w3.org/ns/dcat#>
## prefix owl: <http://www.w3.org/2002/07/owl#>
## prefix xsd: <http://www.w3.org/2001/XMLSchema#>
## prefix qb: <http://purl.org/linked-data/cube#>
## prefix pav: <http://purl.org/pav>
## prefix dct: <http://purl.org/dc/terms/>
## prefix mms: <http://rdf.cdisc.org/mms#>
## prefix cts: <http://rdf.cdisc.org/ct/schema#>
## prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/>
## prefix code: <http://www.example.org/dc/code/>
## prefix dccs: <http://www.example.org/dc/example/dccs/>
## prefix ds: <http://www.example.org/dc/example/ds/>
## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
## prefix crnd-measure: <http://www.example.org/dc/measure#>
##  
## select distinct ?p ?vn ?cl ?prefLabel 
## where {
## ?DataStructureDefinition a qb:DataStructureDefinition ;
##    qb:component ?component .
## ?component a qb:ComponentSpecification .
## ?component qb:dimension ?p .
## ?p qb:codeList ?c .
## ?c skos:hasTopConcept ?cl .
## ?cl skos:prefLabel ?prefLabel .
## OPTIONAL { ?c rrdfqbcrnd0:R-columnname ?vn } 
## values ( ?DataStructureDefinition ) {
##  (ds:dsd-EXAMPLE) 
## }
## }
## order by ?p ?cl ?prefLabel
```

Executing the SPARQL query gives the code list as a data frame.

```
##          vn                clc prefLabel
## 1  category  category-AA-group  AA-group
## 2  category  category-BB-group  BB-group
## 3  category     category-_ALL_     _ALL_
## 4  category category-_NONMISS_ _NONMISS_
## 5    factor       factor-_ALL_     _ALL_
## 6    factor   factor-_NONMISS_ _NONMISS_
## 7    factor    factor-quantity  quantity
## 8 procedure    procedure-count     count
```



|vn        |clc                |prefLabel |
|:---------|:------------------|:---------|
|category  |category-AA-group  |AA-group  |
|category  |category-BB-group  |BB-group  |
|category  |category-_ALL_     |_ALL_     |
|category  |category-_NONMISS_ |_NONMISS_ |
|factor    |factor-_ALL_       |_ALL_     |
|factor    |factor-_NONMISS_   |_NONMISS_ |
|factor    |factor-quantity    |quantity  |
|procedure |procedure-count    |count     |

The dimensions are shown in the next output.

```r
cube.dimensions.rq<- paste(forsparqlprefix,
'
select * where
{ [] qb:dimension ?p .  }
',
"\n"
)
cube.dimensions<- as.data.frame(sparql.rdf(cube, cube.dimensions.rq), stringsAsFactors=FALSE)
knitr::kable(cube.dimensions)
```



|p                        |
|:------------------------|
|crnd-dimension:factor    |
|crnd-dimension:procedure |
|crnd-dimension:category  |

And finally the SPARQL query for observations.


This is the query for getting the observations

```r
cat(cube.observations.rq)
```

```
## prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
## prefix skos: <http://www.w3.org/2004/02/skos/core#>
## prefix prov: <http://www.w3.org/ns/prov#>
## prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
## prefix dcat: <http://www.w3.org/ns/dcat#>
## prefix owl: <http://www.w3.org/2002/07/owl#>
## prefix xsd: <http://www.w3.org/2001/XMLSchema#>
## prefix qb: <http://purl.org/linked-data/cube#>
## prefix pav: <http://purl.org/pav>
## prefix dct: <http://purl.org/dc/terms/>
## prefix mms: <http://rdf.cdisc.org/mms#>
## prefix cts: <http://rdf.cdisc.org/ct/schema#>
## prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/>
## prefix code: <http://www.example.org/dc/code/>
## prefix dccs: <http://www.example.org/dc/example/dccs/>
## prefix ds: <http://www.example.org/dc/example/ds/>
## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
## prefix crnd-measure: <http://www.example.org/dc/measure#>
## 
## select * where {
##      ?s a qb:Observation  ;
##      qb:dataSet ds:dataset-EXAMPLE  ;
##      crnd-dimension:factor ?factor;
##      crnd-dimension:procedure ?procedure;
##      crnd-dimension:category ?category;
##      crnd-measure:measure      ?measure ;
##      optional{ ?factor skos:prefLabel ?factorvalue . }
##      optional{ ?procedure skos:prefLabel ?procedurevalue . }
##      optional{ ?category skos:prefLabel ?categoryvalue . }
## }
```

And finally the observations, which is expected be the same as the starting data set.

```r
cube.observations<- as.data.frame(sparql.rdf(cube, cube.observations.rq ), stringsAsFactors=FALSE)
knitr::kable(cube.observations[,c(paste0(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", cube.dimensionsattr), "value"),"measure")])
```



|factorvalue |procedurevalue |categoryvalue |measure |
|:-----------|:--------------|:-------------|:-------|
|quantity    |count          |AA-group      |123     |
|quantity    |count          |BB-group      |456     |

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
## Executing IC-1.  Unique DataSet
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-2. Unique DSD
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-3. DSD includes measure
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-4. Dimensions have range
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-5. Concept dimensions have code lists
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-6. Only attributes may be optional
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-7. Slice Keys must be declared
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-8. Slice Keys consistent with DSD
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-9. Unique slice structure
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-10. Slice dimensions complete
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-11. All dimensions required
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-12. No duplicate observations
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-13. Required attributes
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-14. All measures present
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-15. Measure dimension consistent
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-16. Single measure on measure dimension observation
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-17. All measures present in measures dimension cube 
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-18. Consistent data set links
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-19a. Codes from code list
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-19b. Codes from code list
##  -- 0 rows returned (0 is pass, >0 fail)
## IC-20 and IC-21 are currently not implemented
```

```r
knitr::kable(icres)
```



|ictitle                                                | icfail|
|:------------------------------------------------------|------:|
|IC-1.  Unique DataSet                                  |      0|
|IC-2. Unique DSD                                       |      0|
|IC-3. DSD includes measure                             |      0|
|IC-4. Dimensions have range                            |      0|
|IC-5. Concept dimensions have code lists               |      0|
|IC-6. Only attributes may be optional                  |      0|
|IC-7. Slice Keys must be declared                      |      0|
|IC-8. Slice Keys consistent with DSD                   |      0|
|IC-9. Unique slice structure                           |      0|
|IC-10. Slice dimensions complete                       |      0|
|IC-11. All dimensions required                         |      0|
|IC-12. No duplicate observations                       |      0|
|IC-13. Required attributes                             |      0|
|IC-14. All measures present                            |      0|
|IC-15. Measure dimension consistent                    |      0|
|IC-16. Single measure on measure dimension observation |      0|
|IC-17. All measures present in measures dimension cube |      0|
|IC-18. Consistent data set links                       |      0|
|IC-19a. Codes from code list                           |      0|
|IC-19b. Codes from code list                           |      0|

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
## Executing IC-1.  Unique DataSet
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-2. Unique DSD
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-3. DSD includes measure
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-4. Dimensions have range
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-5. Concept dimensions have code lists
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-6. Only attributes may be optional
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-7. Slice Keys must be declared
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-8. Slice Keys consistent with DSD
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-9. Unique slice structure
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-10. Slice dimensions complete
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-11. All dimensions required
##  -- 1 rows returned (0 is pass, >0 fail)
## Executing IC-12. No duplicate observations
##  -- 2 rows returned (0 is pass, >0 fail)
## Executing IC-13. Required attributes
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-14. All measures present
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-15. Measure dimension consistent
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-16. Single measure on measure dimension observation
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-17. All measures present in measures dimension cube 
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-18. Consistent data set links
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-19a. Codes from code list
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-19b. Codes from code list
##  -- 0 rows returned (0 is pass, >0 fail)
## IC-20 and IC-21 are currently not implemented
```

```r
knitr::kable(icres)
```



|ictitle                                                | icfail|
|:------------------------------------------------------|------:|
|IC-1.  Unique DataSet                                  |      0|
|IC-2. Unique DSD                                       |      0|
|IC-3. DSD includes measure                             |      0|
|IC-4. Dimensions have range                            |      0|
|IC-5. Concept dimensions have code lists               |      0|
|IC-6. Only attributes may be optional                  |      0|
|IC-7. Slice Keys must be declared                      |      0|
|IC-8. Slice Keys consistent with DSD                   |      0|
|IC-9. Unique slice structure                           |      0|
|IC-10. Slice dimensions complete                       |      0|
|IC-11. All dimensions required                         |      1|
|IC-12. No duplicate observations                       |      2|
|IC-13. Required attributes                             |      0|
|IC-14. All measures present                            |      0|
|IC-15. Measure dimension consistent                    |      0|
|IC-16. Single measure on measure dimension observation |      0|
|IC-17. All measures present in measures dimension cube |      0|
|IC-18. Consistent data set links                       |      0|
|IC-19a. Codes from code list                           |      0|
|IC-19b. Codes from code list                           |      0|

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
