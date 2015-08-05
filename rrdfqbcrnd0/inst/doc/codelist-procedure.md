---
title: "Show the procedure codelist"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-07-27"
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
This shows a simple use of the BuildCubeFromDataFrames function. 
The warning message from log4j can be ignored.

The RDF data cube is serialized in turtle format and stored as a text file in

```r
cat(normalizePath(outcube),"\n")
```

```
## /tmp/RtmpIihHkr/DC-EXAMPLE-R-V-0-0-0.ttl
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
## [1] "Number of triples: 402"
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

## Codelist

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
##           vn                     clc     prefLabel
## 1   category       category-AA-group      AA-group
## 2   category          category-_ALL_         _ALL_
## 3   category      category-_NONMISS_     _NONMISS_
## 4     factor             factor-VARA          VARA
## 5     factor            factor-_ALL_         _ALL_
## 6     factor        factor-_NONMISS_     _NONMISS_
## 7  procedure         procedure-count         count
## 8  procedure procedure-countdistinct countdistinct
## 9  procedure           procedure-max           max
## 10 procedure          procedure-mean          mean
## 11 procedure        procedure-median        median
## 12 procedure           procedure-min           min
## 13 procedure             procedure-n             n
## 14 procedure       procedure-percent       percent
## 15 procedure            procedure-q1            q1
## 16 procedure            procedure-q3            q3
## 17 procedure           procedure-std           std
## 18 procedure        procedure-stddev        stddev
## 19 procedure         procedure-stdev         stdev
```



|vn        |clc                     |prefLabel     |
|:---------|:-----------------------|:-------------|
|category  |category-AA-group       |AA-group      |
|category  |category-_ALL_          |_ALL_         |
|category  |category-_NONMISS_      |_NONMISS_     |
|factor    |factor-VARA             |VARA          |
|factor    |factor-_ALL_            |_ALL_         |
|factor    |factor-_NONMISS_        |_NONMISS_     |
|procedure |procedure-count         |count         |
|procedure |procedure-countdistinct |countdistinct |
|procedure |procedure-max           |max           |
|procedure |procedure-mean          |mean          |
|procedure |procedure-median        |median        |
|procedure |procedure-min           |min           |
|procedure |procedure-n             |n             |
|procedure |procedure-percent       |percent       |
|procedure |procedure-q1            |q1            |
|procedure |procedure-q3            |q3            |
|procedure |procedure-std           |std           |
|procedure |procedure-stddev        |stddev        |
|procedure |procedure-stdev         |stdev         |

## Procedure codelist


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
## select ?s ?p ?o
## where { 
## ?s ?p ?o .
## ?s a code:Procedure
##  }    
## 
```

Executing the SPARQL query gives the code list as a data frame.

```
##                                s                               p
## 1            code:procedure-mean               skos:topConceptOf
## 2            code:procedure-mean                  skos:prefLabel
## 3            code:procedure-mean                   skos:inScheme
## 4            code:procedure-mean     rrdfqbcrnd0:RdescStatDefFun
## 5            code:procedure-mean    rrdfqbcrnd0:R-selectionvalue
## 6            code:procedure-mean rrdfqbcrnd0:R-selectionoperator
## 7            code:procedure-mean                    rdfs:comment
## 8            code:procedure-mean                        rdf:type
## 9            code:procedure-mean                        rdf:type
## 10              code:procedure-n               skos:topConceptOf
## 11              code:procedure-n                  skos:prefLabel
## 12              code:procedure-n                   skos:inScheme
## 13              code:procedure-n     rrdfqbcrnd0:RdescStatDefFun
## 14              code:procedure-n    rrdfqbcrnd0:R-selectionvalue
## 15              code:procedure-n rrdfqbcrnd0:R-selectionoperator
## 16              code:procedure-n                    rdfs:comment
## 17              code:procedure-n                        rdf:type
## 18              code:procedure-n                        rdf:type
## 19             code:procedure-q3               skos:topConceptOf
## 20             code:procedure-q3                  skos:prefLabel
## 21             code:procedure-q3                   skos:inScheme
## 22             code:procedure-q3     rrdfqbcrnd0:RdescStatDefFun
## 23             code:procedure-q3    rrdfqbcrnd0:R-selectionvalue
## 24             code:procedure-q3 rrdfqbcrnd0:R-selectionoperator
## 25             code:procedure-q3                    rdfs:comment
## 26             code:procedure-q3                        rdf:type
## 27             code:procedure-q3                        rdf:type
## 28  code:procedure-countdistinct               skos:topConceptOf
## 29  code:procedure-countdistinct                  skos:prefLabel
## 30  code:procedure-countdistinct                   skos:inScheme
## 31  code:procedure-countdistinct     rrdfqbcrnd0:RdescStatDefFun
## 32  code:procedure-countdistinct    rrdfqbcrnd0:R-selectionvalue
## 33  code:procedure-countdistinct rrdfqbcrnd0:R-selectionoperator
## 34  code:procedure-countdistinct                    rdfs:comment
## 35  code:procedure-countdistinct                        rdf:type
## 36  code:procedure-countdistinct                        rdf:type
## 37          code:procedure-count               skos:topConceptOf
## 38          code:procedure-count                  skos:prefLabel
## 39          code:procedure-count                   skos:inScheme
## 40          code:procedure-count     rrdfqbcrnd0:RdescStatDefFun
## 41          code:procedure-count    rrdfqbcrnd0:R-selectionvalue
## 42          code:procedure-count rrdfqbcrnd0:R-selectionoperator
## 43          code:procedure-count                    rdfs:comment
## 44          code:procedure-count                        rdf:type
## 45          code:procedure-count                        rdf:type
## 46         code:procedure-median               skos:topConceptOf
## 47         code:procedure-median                  skos:prefLabel
## 48         code:procedure-median                   skos:inScheme
## 49         code:procedure-median     rrdfqbcrnd0:RdescStatDefFun
## 50         code:procedure-median    rrdfqbcrnd0:R-selectionvalue
## 51         code:procedure-median rrdfqbcrnd0:R-selectionoperator
## 52         code:procedure-median                    rdfs:comment
## 53         code:procedure-median                        rdf:type
## 54         code:procedure-median                        rdf:type
## 55          code:procedure-stdev               skos:topConceptOf
## 56          code:procedure-stdev                  skos:prefLabel
## 57          code:procedure-stdev                   skos:inScheme
## 58          code:procedure-stdev     rrdfqbcrnd0:RdescStatDefFun
## 59          code:procedure-stdev    rrdfqbcrnd0:R-selectionvalue
## 60          code:procedure-stdev rrdfqbcrnd0:R-selectionoperator
## 61          code:procedure-stdev                    rdfs:comment
## 62          code:procedure-stdev                        rdf:type
## 63          code:procedure-stdev                        rdf:type
## 64            code:procedure-std               skos:topConceptOf
## 65            code:procedure-std                  skos:prefLabel
## 66            code:procedure-std                   skos:inScheme
## 67            code:procedure-std     rrdfqbcrnd0:RdescStatDefFun
## 68            code:procedure-std    rrdfqbcrnd0:R-selectionvalue
## 69            code:procedure-std rrdfqbcrnd0:R-selectionoperator
## 70            code:procedure-std                    rdfs:comment
## 71            code:procedure-std                        rdf:type
## 72            code:procedure-std                        rdf:type
## 73             code:procedure-q1               skos:topConceptOf
## 74             code:procedure-q1                  skos:prefLabel
## 75             code:procedure-q1                   skos:inScheme
## 76             code:procedure-q1     rrdfqbcrnd0:RdescStatDefFun
## 77             code:procedure-q1    rrdfqbcrnd0:R-selectionvalue
## 78             code:procedure-q1 rrdfqbcrnd0:R-selectionoperator
## 79             code:procedure-q1                    rdfs:comment
## 80             code:procedure-q1                        rdf:type
## 81             code:procedure-q1                        rdf:type
## 82        code:procedure-percent               skos:topConceptOf
## 83        code:procedure-percent                  skos:prefLabel
## 84        code:procedure-percent                   skos:inScheme
## 85        code:procedure-percent     rrdfqbcrnd0:RdescStatDefFun
## 86        code:procedure-percent    rrdfqbcrnd0:R-selectionvalue
## 87        code:procedure-percent rrdfqbcrnd0:R-selectionoperator
## 88        code:procedure-percent                    rdfs:comment
## 89        code:procedure-percent                        rdf:type
## 90        code:procedure-percent                        rdf:type
## 91            code:procedure-max               skos:topConceptOf
## 92            code:procedure-max                  skos:prefLabel
## 93            code:procedure-max                   skos:inScheme
## 94            code:procedure-max     rrdfqbcrnd0:RdescStatDefFun
## 95            code:procedure-max    rrdfqbcrnd0:R-selectionvalue
## 96            code:procedure-max rrdfqbcrnd0:R-selectionoperator
## 97            code:procedure-max                    rdfs:comment
## 98            code:procedure-max                        rdf:type
## 99            code:procedure-max                        rdf:type
## 100        code:procedure-stddev               skos:topConceptOf
## 101        code:procedure-stddev                  skos:prefLabel
## 102        code:procedure-stddev                   skos:inScheme
## 103        code:procedure-stddev     rrdfqbcrnd0:RdescStatDefFun
## 104        code:procedure-stddev    rrdfqbcrnd0:R-selectionvalue
## 105        code:procedure-stddev rrdfqbcrnd0:R-selectionoperator
## 106        code:procedure-stddev                    rdfs:comment
## 107        code:procedure-stddev                        rdf:type
## 108        code:procedure-stddev                        rdf:type
## 109           code:procedure-min               skos:topConceptOf
## 110           code:procedure-min                  skos:prefLabel
## 111           code:procedure-min                   skos:inScheme
## 112           code:procedure-min     rrdfqbcrnd0:RdescStatDefFun
## 113           code:procedure-min    rrdfqbcrnd0:R-selectionvalue
## 114           code:procedure-min rrdfqbcrnd0:R-selectionoperator
## 115           code:procedure-min                    rdfs:comment
## 116           code:procedure-min                        rdf:type
## 117           code:procedure-min                        rdf:type
## 118            code:procedure-q3                        rdf:type
## 119        code:procedure-stddev                        rdf:type
## 120         code:procedure-stdev                        rdf:type
## 121          code:procedure-mean                        rdf:type
## 122            code:procedure-q1                        rdf:type
## 123           code:procedure-std                        rdf:type
## 124         code:procedure-count                        rdf:type
## 125        code:procedure-median                        rdf:type
## 126       code:procedure-percent                        rdf:type
## 127 code:procedure-countdistinct                        rdf:type
## 128           code:procedure-min                        rdf:type
## 129           code:procedure-max                        rdf:type
## 130             code:procedure-n                        rdf:type
##                                                                    o
## 1                                                     code:procedure
## 2                                                               mean
## 3                                                     code:procedure
## 4                        function (x)  {     mean(x, na.rm = TRUE) }
## 5                                                               mean
## 6                                                                 ==
## 7                                        Descriptive statistics mean
## 8                                                       skos:Concept
## 9                                                     code:Procedure
## 10                                                    code:procedure
## 11                                                                 n
## 12                                                    code:procedure
## 13                        function (x)  {     length(x[!is.na(x)]) }
## 14                                                                 n
## 15                                                                ==
## 16                                          Descriptive statistics n
## 17                                                      skos:Concept
## 18                                                    code:Procedure
## 19                                                    code:procedure
## 20                                                                q3
## 21                                                    code:procedure
## 22  function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }
## 23                                                                q3
## 24                                                                ==
## 25                                         Descriptive statistics q3
## 26                                                      skos:Concept
## 27                                                    code:Procedure
## 28                                                    code:procedure
## 29                                                     countdistinct
## 30                                                    code:procedure
## 31                           function (x)  {     length(unique(x)) }
## 32                                                     countdistinct
## 33                                                                ==
## 34                              Descriptive statistics countdistinct
## 35                                                      skos:Concept
## 36                                                    code:Procedure
## 37                                                    code:procedure
## 38                                                             count
## 39                                                    code:procedure
## 40                                   function (x)  {     length(x) }
## 41                                                             count
## 42                                                                ==
## 43                                      Descriptive statistics count
## 44                                                      skos:Concept
## 45                                                    code:Procedure
## 46                                                    code:procedure
## 47                                                            median
## 48                                                    code:procedure
## 49                     function (x)  {     median(x, na.rm = TRUE) }
## 50                                                            median
## 51                                                                ==
## 52                                     Descriptive statistics median
## 53                                                      skos:Concept
## 54                                                    code:Procedure
## 55                                                    code:procedure
## 56                                                             stdev
## 57                                                    code:procedure
## 58                         function (x)  {     sd(x, na.rm = TRUE) }
## 59                                                             stdev
## 60                                                                ==
## 61                                      Descriptive statistics stdev
## 62                                                      skos:Concept
## 63                                                    code:Procedure
## 64                                                    code:procedure
## 65                                                               std
## 66                                                    code:procedure
## 67                         function (x)  {     sd(x, na.rm = TRUE) }
## 68                                                               std
## 69                                                                ==
## 70                                        Descriptive statistics std
## 71                                                      skos:Concept
## 72                                                    code:Procedure
## 73                                                    code:procedure
## 74                                                                q1
## 75                                                    code:procedure
## 76  function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
## 77                                                                q1
## 78                                                                ==
## 79                                         Descriptive statistics q1
## 80                                                      skos:Concept
## 81                                                    code:Procedure
## 82                                                    code:procedure
## 83                                                           percent
## 84                                                    code:procedure
## 85                                          function (x)  {     -1 }
## 86                                                           percent
## 87                                                                ==
## 88                                    Descriptive statistics percent
## 89                                                      skos:Concept
## 90                                                    code:Procedure
## 91                                                    code:procedure
## 92                                                               max
## 93                                                    code:procedure
## 94                        function (x)  {     max(x, na.rm = TRUE) }
## 95                                                               max
## 96                                                                ==
## 97                                        Descriptive statistics max
## 98                                                      skos:Concept
## 99                                                    code:Procedure
## 100                                                   code:procedure
## 101                                                           stddev
## 102                                                   code:procedure
## 103                        function (x)  {     sd(x, na.rm = TRUE) }
## 104                                                           stddev
## 105                                                               ==
## 106                                    Descriptive statistics stddev
## 107                                                     skos:Concept
## 108                                                   code:Procedure
## 109                                                   code:procedure
## 110                                                              min
## 111                                                   code:procedure
## 112                       function (x)  {     min(x, na.rm = TRUE) }
## 113                                                              min
## 114                                                               ==
## 115                                       Descriptive statistics min
## 116                                                     skos:Concept
## 117                                                   code:Procedure
## 118                                                    rdfs:Resource
## 119                                                    rdfs:Resource
## 120                                                    rdfs:Resource
## 121                                                    rdfs:Resource
## 122                                                    rdfs:Resource
## 123                                                    rdfs:Resource
## 124                                                    rdfs:Resource
## 125                                                    rdfs:Resource
## 126                                                    rdfs:Resource
## 127                                                    rdfs:Resource
## 128                                                    rdfs:Resource
## 129                                                    rdfs:Resource
## 130                                                    rdfs:Resource
```



|s                            |p                               |o                                                                |
|:----------------------------|:-------------------------------|:----------------------------------------------------------------|
|code:procedure-mean          |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-mean          |skos:prefLabel                  |mean                                                             |
|code:procedure-mean          |skos:inScheme                   |code:procedure                                                   |
|code:procedure-mean          |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     mean(x, na.rm = TRUE) }                      |
|code:procedure-mean          |rrdfqbcrnd0:R-selectionvalue    |mean                                                             |
|code:procedure-mean          |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-mean          |rdfs:comment                    |Descriptive statistics mean                                      |
|code:procedure-mean          |rdf:type                        |skos:Concept                                                     |
|code:procedure-mean          |rdf:type                        |code:Procedure                                                   |
|code:procedure-n             |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-n             |skos:prefLabel                  |n                                                                |
|code:procedure-n             |skos:inScheme                   |code:procedure                                                   |
|code:procedure-n             |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     length(x[!is.na(x)]) }                       |
|code:procedure-n             |rrdfqbcrnd0:R-selectionvalue    |n                                                                |
|code:procedure-n             |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-n             |rdfs:comment                    |Descriptive statistics n                                         |
|code:procedure-n             |rdf:type                        |skos:Concept                                                     |
|code:procedure-n             |rdf:type                        |code:Procedure                                                   |
|code:procedure-q3            |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-q3            |skos:prefLabel                  |q3                                                               |
|code:procedure-q3            |skos:inScheme                   |code:procedure                                                   |
|code:procedure-q3            |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) } |
|code:procedure-q3            |rrdfqbcrnd0:R-selectionvalue    |q3                                                               |
|code:procedure-q3            |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-q3            |rdfs:comment                    |Descriptive statistics q3                                        |
|code:procedure-q3            |rdf:type                        |skos:Concept                                                     |
|code:procedure-q3            |rdf:type                        |code:Procedure                                                   |
|code:procedure-countdistinct |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-countdistinct |skos:prefLabel                  |countdistinct                                                    |
|code:procedure-countdistinct |skos:inScheme                   |code:procedure                                                   |
|code:procedure-countdistinct |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     length(unique(x)) }                          |
|code:procedure-countdistinct |rrdfqbcrnd0:R-selectionvalue    |countdistinct                                                    |
|code:procedure-countdistinct |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-countdistinct |rdfs:comment                    |Descriptive statistics countdistinct                             |
|code:procedure-countdistinct |rdf:type                        |skos:Concept                                                     |
|code:procedure-countdistinct |rdf:type                        |code:Procedure                                                   |
|code:procedure-count         |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-count         |skos:prefLabel                  |count                                                            |
|code:procedure-count         |skos:inScheme                   |code:procedure                                                   |
|code:procedure-count         |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     length(x) }                                  |
|code:procedure-count         |rrdfqbcrnd0:R-selectionvalue    |count                                                            |
|code:procedure-count         |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-count         |rdfs:comment                    |Descriptive statistics count                                     |
|code:procedure-count         |rdf:type                        |skos:Concept                                                     |
|code:procedure-count         |rdf:type                        |code:Procedure                                                   |
|code:procedure-median        |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-median        |skos:prefLabel                  |median                                                           |
|code:procedure-median        |skos:inScheme                   |code:procedure                                                   |
|code:procedure-median        |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     median(x, na.rm = TRUE) }                    |
|code:procedure-median        |rrdfqbcrnd0:R-selectionvalue    |median                                                           |
|code:procedure-median        |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-median        |rdfs:comment                    |Descriptive statistics median                                    |
|code:procedure-median        |rdf:type                        |skos:Concept                                                     |
|code:procedure-median        |rdf:type                        |code:Procedure                                                   |
|code:procedure-stdev         |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-stdev         |skos:prefLabel                  |stdev                                                            |
|code:procedure-stdev         |skos:inScheme                   |code:procedure                                                   |
|code:procedure-stdev         |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     sd(x, na.rm = TRUE) }                        |
|code:procedure-stdev         |rrdfqbcrnd0:R-selectionvalue    |stdev                                                            |
|code:procedure-stdev         |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-stdev         |rdfs:comment                    |Descriptive statistics stdev                                     |
|code:procedure-stdev         |rdf:type                        |skos:Concept                                                     |
|code:procedure-stdev         |rdf:type                        |code:Procedure                                                   |
|code:procedure-std           |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-std           |skos:prefLabel                  |std                                                              |
|code:procedure-std           |skos:inScheme                   |code:procedure                                                   |
|code:procedure-std           |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     sd(x, na.rm = TRUE) }                        |
|code:procedure-std           |rrdfqbcrnd0:R-selectionvalue    |std                                                              |
|code:procedure-std           |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-std           |rdfs:comment                    |Descriptive statistics std                                       |
|code:procedure-std           |rdf:type                        |skos:Concept                                                     |
|code:procedure-std           |rdf:type                        |code:Procedure                                                   |
|code:procedure-q1            |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-q1            |skos:prefLabel                  |q1                                                               |
|code:procedure-q1            |skos:inScheme                   |code:procedure                                                   |
|code:procedure-q1            |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) } |
|code:procedure-q1            |rrdfqbcrnd0:R-selectionvalue    |q1                                                               |
|code:procedure-q1            |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-q1            |rdfs:comment                    |Descriptive statistics q1                                        |
|code:procedure-q1            |rdf:type                        |skos:Concept                                                     |
|code:procedure-q1            |rdf:type                        |code:Procedure                                                   |
|code:procedure-percent       |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-percent       |skos:prefLabel                  |percent                                                          |
|code:procedure-percent       |skos:inScheme                   |code:procedure                                                   |
|code:procedure-percent       |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     -1 }                                         |
|code:procedure-percent       |rrdfqbcrnd0:R-selectionvalue    |percent                                                          |
|code:procedure-percent       |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-percent       |rdfs:comment                    |Descriptive statistics percent                                   |
|code:procedure-percent       |rdf:type                        |skos:Concept                                                     |
|code:procedure-percent       |rdf:type                        |code:Procedure                                                   |
|code:procedure-max           |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-max           |skos:prefLabel                  |max                                                              |
|code:procedure-max           |skos:inScheme                   |code:procedure                                                   |
|code:procedure-max           |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     max(x, na.rm = TRUE) }                       |
|code:procedure-max           |rrdfqbcrnd0:R-selectionvalue    |max                                                              |
|code:procedure-max           |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-max           |rdfs:comment                    |Descriptive statistics max                                       |
|code:procedure-max           |rdf:type                        |skos:Concept                                                     |
|code:procedure-max           |rdf:type                        |code:Procedure                                                   |
|code:procedure-stddev        |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-stddev        |skos:prefLabel                  |stddev                                                           |
|code:procedure-stddev        |skos:inScheme                   |code:procedure                                                   |
|code:procedure-stddev        |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     sd(x, na.rm = TRUE) }                        |
|code:procedure-stddev        |rrdfqbcrnd0:R-selectionvalue    |stddev                                                           |
|code:procedure-stddev        |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-stddev        |rdfs:comment                    |Descriptive statistics stddev                                    |
|code:procedure-stddev        |rdf:type                        |skos:Concept                                                     |
|code:procedure-stddev        |rdf:type                        |code:Procedure                                                   |
|code:procedure-min           |skos:topConceptOf               |code:procedure                                                   |
|code:procedure-min           |skos:prefLabel                  |min                                                              |
|code:procedure-min           |skos:inScheme                   |code:procedure                                                   |
|code:procedure-min           |rrdfqbcrnd0:RdescStatDefFun     |function (x)  {     min(x, na.rm = TRUE) }                       |
|code:procedure-min           |rrdfqbcrnd0:R-selectionvalue    |min                                                              |
|code:procedure-min           |rrdfqbcrnd0:R-selectionoperator |==                                                               |
|code:procedure-min           |rdfs:comment                    |Descriptive statistics min                                       |
|code:procedure-min           |rdf:type                        |skos:Concept                                                     |
|code:procedure-min           |rdf:type                        |code:Procedure                                                   |
|code:procedure-q3            |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-stddev        |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-stdev         |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-mean          |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-q1            |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-std           |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-count         |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-median        |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-percent       |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-countdistinct |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-min           |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-max           |rdf:type                        |rdfs:Resource                                                    |
|code:procedure-n             |rdf:type                        |rdfs:Resource                                                    |


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
## construct { ?s ?p ?o } 
## where { 
## { ?s ?p ?o . ?s a code:Procedure. }
## union
## { ?s ?p ?o . values(?s) {(code:Procedure)} }
##  }    
## 
```



The RDF data cube is serialized in turtle format and stored as a text file in

```r
cat(normalizePath(outcodelist),"\n")
```

```
## /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/procedure-code-list.ttl
```
