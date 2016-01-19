Introduction
------------

This vignette shows - the procedure codelist

Setup
=====

``` r
devtools::load_all(pkg="../..")
```

    ## Loading rrdfqbcrnd0

``` r
library(rrdfqb)
```

Create RDF data cube
====================

The RDF data cube will be created from two data.frames containing data and metadata.

Define data
-----------

The data are defined as data frame, and the data frame is displayed.

``` r
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

| category | procedure     | factor | unit      | denominator |  measure|
|:---------|:--------------|:-------|:----------|:------------|--------:|
| AA-group | mean          | VARA   | Not given |             |        1|
| AA-group | stddev        | VARA   | Not given |             |        2|
| AA-group | stdev         | VARA   | Not given |             |        3|
| AA-group | std           | VARA   | Not given |             |        4|
| AA-group | median        | VARA   | Not given |             |        5|
| AA-group | min           | VARA   | Not given |             |        6|
| AA-group | max           | VARA   | Not given |             |        7|
| AA-group | n             | VARA   | Not given |             |        8|
| AA-group | q1            | VARA   | Not given |             |        9|
| AA-group | q3            | VARA   | Not given |             |       10|
| AA-group | count         | VARA   | Not given |             |       11|
| AA-group | countdistinct | VARA   | Not given |             |       12|
| AA-group | percent       | VARA   | Not given |             |       13|

Define meta data
----------------

The metadata used for generating the RDF data cube are also defined as data frame and displayed.

``` r
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

| compType    | compName   | codeType | nciDomainValue | compLabel             | Comment |
|:------------|:-----------|:---------|:---------------|:----------------------|:--------|
| dimension   | category   | DATA     |                | Category              |         |
| dimension   | procedure  | DATA     |                | Statistical procedure |         |
| dimension   | factor     | DATA     |                | Type of procedure     |         |
| unit        | attribute  |          |                | Result                |         |
| denominator | attribute  |          |                | Unit                  |         |
| measure     | measure    | <NA>     |                | Denominator           |         |
| metadata    | domainName | <NA>     |                | EXAMPLE               |         |

Create RDF data cube
--------------------

The RDF data cube for the data above is created using

``` r
outcube<- BuildCubeFromDataFrames(cubeMetadata, obsData )
```

    ## codeType:  DATA 
    ## nciDomainValue:    
    ## dimName:  category 
    ## underlDataSetName:  NOTGIVEN 
    ## remote.endpoint:  
    ## dimName  category 
    ## codeType:  DATA 
    ## nciDomainValue:    
    ## dimName:  procedure 
    ## underlDataSetName:  NOTGIVEN 
    ## remote.endpoint:  
    ## dimName  procedure 
    ## codeType:  DATA 
    ## nciDomainValue:    
    ## dimName:  factor 
    ## underlDataSetName:  NOTGIVEN 
    ## remote.endpoint:  
    ## dimName  factor

This shows a simple use of the BuildCubeFromDataFrames function. The warning message from log4j can be ignored.

The RDF data cube is serialized in turtle format and stored as a text file in

``` r
cat(normalizePath(outcube),"\n")
```

    ## /tmp/RtmpyKYfBq/DC-EXAMPLE-R-V-0-0-0.ttl

Query the cube using SPARQL
===========================

Now take a look at the generated cubes by loading the turle file.

``` r
dataCubeFile<- outcube
```

The rest of the code only depends on the value of dataCubeFile. The code demonstrates the use of the rrdf library.

``` r
cube <- new.rdf()  # Initialize
temp<-load.rdf(dataCubeFile, format="TURTLE", appendTo= cube)
summarize.rdf(cube)
```

    ## [1] "Number of triples: 422"

The next statements are needed for the current implementation of the cube, and may change in future versions.

``` r
## TODO: reconsider the use of domain specific prefixes
dsdName<- GetDsdNameFromCube( cube )
domainName<- GetDomainNameFromCube( cube )
cat("dsdName ", dsdName, ", domainName ", domainName, "\n" )
```

    ## dsdName  dsd-EXAMPLE , domainName  EXAMPLE

``` r
prefixlist<- Get.prefixlist.from.df(GetForSparqlPrefix.as.df(domainName=domainName))
forsparqlprefix<- GetForSparqlPrefix( domainName )
cat(forsparqlprefix,"\n")
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
    ## prefix qb: <http://purl.org/linked-data/cube#>
    ## prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/>
    ## prefix code: <http://www.example.org/dc/code/>
    ## prefix dccs: <http://www.example.org/dc/example/dccs/>
    ## prefix ds: <http://www.example.org/dc/example/ds/>
    ## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
    ## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
    ## prefix crnd-measure: <http://www.example.org/dc/measure#>
    ## 

The variable forsparqlprefix contains the prefix statements applicable for the present data cube. The use of prefixes makes the SPARQL query shorter, and more readable. The present version of the package defines namespaces dccs: and ds: where the domainname is included. TODO: Consider other approach for including the domainname, or use other concept.

Add `rdfs:seeAlso` for descriptive statistics
---------------------------------------------

``` r
        add.triple(cube,
                   paste0(prefixlist$prefixCODE, "procedure-median"),
                   paste0(prefixlist$prefixRDFS,"seeAlso" ),
                   "purl.obolibrary.org/obo/OBI_0200119")
        add.triple(cube,
                   paste0(prefixlist$prefixCODE, "procedure-stddev"),
                   paste0(prefixlist$prefixRDFS,"seeAlso" ),
                   "purl.obolibrary.org/obo/STATO_0000037")
        add.triple(cube,
                   paste0(prefixlist$prefixCODE, "procedure-mean"),
                   paste0(prefixlist$prefixRDFS,"seeAlso" ),
                   "purl.obolibrary.org/obo/IAO_0000125")
```

Getting all codelists as data.frame
-----------------------------------

The SPARQL query for codelists are shown in the next output.

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
    ## prefix qb: <http://purl.org/linked-data/cube#>
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

Executing the SPARQL query gives the code list as a data frame.

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

| vn        | clc                     | prefLabel     |
|:----------|:------------------------|:--------------|
| category  | category-AA-group       | AA-group      |
| category  | category-*ALL*          | *ALL*         |
| category  | category-*NONMISS*      | *NONMISS*     |
| factor    | factor-VARA             | VARA          |
| factor    | factor-*ALL*            | *ALL*         |
| factor    | factor-*NONMISS*        | *NONMISS*     |
| procedure | procedure-count         | count         |
| procedure | procedure-countdistinct | countdistinct |
| procedure | procedure-max           | max           |
| procedure | procedure-mean          | mean          |
| procedure | procedure-median        | median        |
| procedure | procedure-min           | min           |
| procedure | procedure-n             | n             |
| procedure | procedure-percent       | percent       |
| procedure | procedure-q1            | q1            |
| procedure | procedure-q3            | q3            |
| procedure | procedure-std           | std           |
| procedure | procedure-stddev        | stddev        |
| procedure | procedure-stdev         | stdev         |

Getting the procedure codelist as data.frame
--------------------------------------------

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
    ## prefix qb: <http://purl.org/linked-data/cube#>
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

Executing the SPARQL query gives the code list as a data frame.

    ##                                s                               p
    ## 1            code:procedure-mean                    rdfs:comment
    ## 2            code:procedure-mean                  skos:prefLabel
    ## 3            code:procedure-mean     rrdfqbcrnd0:RdescStatDefFun
    ## 4            code:procedure-mean                        rdf:type
    ## 5            code:procedure-mean rrdfqbcrnd0:R-selectionoperator
    ## 6            code:procedure-mean                        rdf:type
    ## 7            code:procedure-mean    rrdfqbcrnd0:R-selectionvalue
    ## 8            code:procedure-mean                   skos:inScheme
    ## 9            code:procedure-mean                    rdfs:seeAlso
    ## 10           code:procedure-mean               skos:topConceptOf
    ## 11              code:procedure-n               skos:topConceptOf
    ## 12              code:procedure-n                  skos:prefLabel
    ## 13              code:procedure-n                   skos:inScheme
    ## 14              code:procedure-n     rrdfqbcrnd0:RdescStatDefFun
    ## 15              code:procedure-n    rrdfqbcrnd0:R-selectionvalue
    ## 16              code:procedure-n rrdfqbcrnd0:R-selectionoperator
    ## 17              code:procedure-n                    rdfs:comment
    ## 18              code:procedure-n                        rdf:type
    ## 19              code:procedure-n                        rdf:type
    ## 20             code:procedure-q3               skos:topConceptOf
    ## 21             code:procedure-q3                  skos:prefLabel
    ## 22             code:procedure-q3                   skos:inScheme
    ## 23             code:procedure-q3     rrdfqbcrnd0:RdescStatDefFun
    ## 24             code:procedure-q3    rrdfqbcrnd0:R-selectionvalue
    ## 25             code:procedure-q3 rrdfqbcrnd0:R-selectionoperator
    ## 26             code:procedure-q3                    rdfs:comment
    ## 27             code:procedure-q3                        rdf:type
    ## 28             code:procedure-q3                        rdf:type
    ## 29  code:procedure-countdistinct               skos:topConceptOf
    ## 30  code:procedure-countdistinct                  skos:prefLabel
    ## 31  code:procedure-countdistinct                   skos:inScheme
    ## 32  code:procedure-countdistinct     rrdfqbcrnd0:RdescStatDefFun
    ## 33  code:procedure-countdistinct    rrdfqbcrnd0:R-selectionvalue
    ## 34  code:procedure-countdistinct rrdfqbcrnd0:R-selectionoperator
    ## 35  code:procedure-countdistinct                    rdfs:comment
    ## 36  code:procedure-countdistinct                        rdf:type
    ## 37  code:procedure-countdistinct                        rdf:type
    ## 38          code:procedure-count               skos:topConceptOf
    ## 39          code:procedure-count                  skos:prefLabel
    ## 40          code:procedure-count                   skos:inScheme
    ## 41          code:procedure-count     rrdfqbcrnd0:RdescStatDefFun
    ## 42          code:procedure-count    rrdfqbcrnd0:R-selectionvalue
    ## 43          code:procedure-count rrdfqbcrnd0:R-selectionoperator
    ## 44          code:procedure-count                    rdfs:comment
    ## 45          code:procedure-count                        rdf:type
    ## 46          code:procedure-count                        rdf:type
    ## 47         code:procedure-median                    rdfs:comment
    ## 48         code:procedure-median     rrdfqbcrnd0:RdescStatDefFun
    ## 49         code:procedure-median rrdfqbcrnd0:R-selectionoperator
    ## 50         code:procedure-median                        rdf:type
    ## 51         code:procedure-median                        rdf:type
    ## 52         code:procedure-median               skos:topConceptOf
    ## 53         code:procedure-median                    rdfs:seeAlso
    ## 54         code:procedure-median    rrdfqbcrnd0:R-selectionvalue
    ## 55         code:procedure-median                   skos:inScheme
    ## 56         code:procedure-median                  skos:prefLabel
    ## 57          code:procedure-stdev               skos:topConceptOf
    ## 58          code:procedure-stdev                  skos:prefLabel
    ## 59          code:procedure-stdev                   skos:inScheme
    ## 60          code:procedure-stdev     rrdfqbcrnd0:RdescStatDefFun
    ## 61          code:procedure-stdev    rrdfqbcrnd0:R-selectionvalue
    ## 62          code:procedure-stdev rrdfqbcrnd0:R-selectionoperator
    ## 63          code:procedure-stdev                    rdfs:comment
    ## 64          code:procedure-stdev                        rdf:type
    ## 65          code:procedure-stdev                        rdf:type
    ## 66            code:procedure-std               skos:topConceptOf
    ## 67            code:procedure-std                  skos:prefLabel
    ## 68            code:procedure-std                   skos:inScheme
    ## 69            code:procedure-std     rrdfqbcrnd0:RdescStatDefFun
    ## 70            code:procedure-std    rrdfqbcrnd0:R-selectionvalue
    ## 71            code:procedure-std rrdfqbcrnd0:R-selectionoperator
    ## 72            code:procedure-std                    rdfs:comment
    ## 73            code:procedure-std                        rdf:type
    ## 74            code:procedure-std                        rdf:type
    ## 75             code:procedure-q1               skos:topConceptOf
    ## 76             code:procedure-q1                  skos:prefLabel
    ## 77             code:procedure-q1                   skos:inScheme
    ## 78             code:procedure-q1     rrdfqbcrnd0:RdescStatDefFun
    ## 79             code:procedure-q1    rrdfqbcrnd0:R-selectionvalue
    ## 80             code:procedure-q1 rrdfqbcrnd0:R-selectionoperator
    ## 81             code:procedure-q1                    rdfs:comment
    ## 82             code:procedure-q1                        rdf:type
    ## 83             code:procedure-q1                        rdf:type
    ## 84        code:procedure-percent               skos:topConceptOf
    ## 85        code:procedure-percent                  skos:prefLabel
    ## 86        code:procedure-percent                   skos:inScheme
    ## 87        code:procedure-percent     rrdfqbcrnd0:RdescStatDefFun
    ## 88        code:procedure-percent    rrdfqbcrnd0:R-selectionvalue
    ## 89        code:procedure-percent rrdfqbcrnd0:R-selectionoperator
    ## 90        code:procedure-percent                    rdfs:comment
    ## 91        code:procedure-percent                        rdf:type
    ## 92        code:procedure-percent                        rdf:type
    ## 93            code:procedure-max               skos:topConceptOf
    ## 94            code:procedure-max                  skos:prefLabel
    ## 95            code:procedure-max                   skos:inScheme
    ## 96            code:procedure-max     rrdfqbcrnd0:RdescStatDefFun
    ## 97            code:procedure-max    rrdfqbcrnd0:R-selectionvalue
    ## 98            code:procedure-max rrdfqbcrnd0:R-selectionoperator
    ## 99            code:procedure-max                    rdfs:comment
    ## 100           code:procedure-max                        rdf:type
    ## 101           code:procedure-max                        rdf:type
    ## 102        code:procedure-stddev                        rdf:type
    ## 103        code:procedure-stddev rrdfqbcrnd0:R-selectionoperator
    ## 104        code:procedure-stddev                        rdf:type
    ## 105        code:procedure-stddev                   skos:inScheme
    ## 106        code:procedure-stddev     rrdfqbcrnd0:RdescStatDefFun
    ## 107        code:procedure-stddev               skos:topConceptOf
    ## 108        code:procedure-stddev    rrdfqbcrnd0:R-selectionvalue
    ## 109        code:procedure-stddev                  skos:prefLabel
    ## 110        code:procedure-stddev                    rdfs:seeAlso
    ## 111        code:procedure-stddev                    rdfs:comment
    ## 112           code:procedure-min               skos:topConceptOf
    ## 113           code:procedure-min                  skos:prefLabel
    ## 114           code:procedure-min                   skos:inScheme
    ## 115           code:procedure-min     rrdfqbcrnd0:RdescStatDefFun
    ## 116           code:procedure-min    rrdfqbcrnd0:R-selectionvalue
    ## 117           code:procedure-min rrdfqbcrnd0:R-selectionoperator
    ## 118           code:procedure-min                    rdfs:comment
    ## 119           code:procedure-min                        rdf:type
    ## 120           code:procedure-min                        rdf:type
    ## 121            code:procedure-q3                        rdf:type
    ## 122        code:procedure-stddev                        rdf:type
    ## 123         code:procedure-stdev                        rdf:type
    ## 124          code:procedure-mean                        rdf:type
    ## 125            code:procedure-q1                        rdf:type
    ## 126           code:procedure-std                        rdf:type
    ## 127         code:procedure-count                        rdf:type
    ## 128        code:procedure-median                        rdf:type
    ## 129       code:procedure-percent                        rdf:type
    ## 130 code:procedure-countdistinct                        rdf:type
    ## 131           code:procedure-min                        rdf:type
    ## 132           code:procedure-max                        rdf:type
    ## 133             code:procedure-n                        rdf:type
    ##                                                                    o
    ## 1                                        Descriptive statistics mean
    ## 2                                                               mean
    ## 3                        function (x)  {     mean(x, na.rm = TRUE) }
    ## 4                                                       skos:Concept
    ## 5                                                                 ==
    ## 6                                                     code:Procedure
    ## 7                                                               mean
    ## 8                                                     code:procedure
    ## 9                                purl.obolibrary.org/obo/IAO_0000125
    ## 10                                                    code:procedure
    ## 11                                                    code:procedure
    ## 12                                                                 n
    ## 13                                                    code:procedure
    ## 14                        function (x)  {     length(x[!is.na(x)]) }
    ## 15                                                                 n
    ## 16                                                                ==
    ## 17                                          Descriptive statistics n
    ## 18                                                      skos:Concept
    ## 19                                                    code:Procedure
    ## 20                                                    code:procedure
    ## 21                                                                q3
    ## 22                                                    code:procedure
    ## 23  function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }
    ## 24                                                                q3
    ## 25                                                                ==
    ## 26                                         Descriptive statistics q3
    ## 27                                                      skos:Concept
    ## 28                                                    code:Procedure
    ## 29                                                    code:procedure
    ## 30                                                     countdistinct
    ## 31                                                    code:procedure
    ## 32                           function (x)  {     length(unique(x)) }
    ## 33                                                     countdistinct
    ## 34                                                                ==
    ## 35                              Descriptive statistics countdistinct
    ## 36                                                      skos:Concept
    ## 37                                                    code:Procedure
    ## 38                                                    code:procedure
    ## 39                                                             count
    ## 40                                                    code:procedure
    ## 41                                   function (x)  {     length(x) }
    ## 42                                                             count
    ## 43                                                                ==
    ## 44                                      Descriptive statistics count
    ## 45                                                      skos:Concept
    ## 46                                                    code:Procedure
    ## 47                                     Descriptive statistics median
    ## 48                     function (x)  {     median(x, na.rm = TRUE) }
    ## 49                                                                ==
    ## 50                                                      skos:Concept
    ## 51                                                    code:Procedure
    ## 52                                                    code:procedure
    ## 53                               purl.obolibrary.org/obo/OBI_0200119
    ## 54                                                            median
    ## 55                                                    code:procedure
    ## 56                                                            median
    ## 57                                                    code:procedure
    ## 58                                                             stdev
    ## 59                                                    code:procedure
    ## 60                         function (x)  {     sd(x, na.rm = TRUE) }
    ## 61                                                             stdev
    ## 62                                                                ==
    ## 63                                      Descriptive statistics stdev
    ## 64                                                      skos:Concept
    ## 65                                                    code:Procedure
    ## 66                                                    code:procedure
    ## 67                                                               std
    ## 68                                                    code:procedure
    ## 69                         function (x)  {     sd(x, na.rm = TRUE) }
    ## 70                                                               std
    ## 71                                                                ==
    ## 72                                        Descriptive statistics std
    ## 73                                                      skos:Concept
    ## 74                                                    code:Procedure
    ## 75                                                    code:procedure
    ## 76                                                                q1
    ## 77                                                    code:procedure
    ## 78  function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
    ## 79                                                                q1
    ## 80                                                                ==
    ## 81                                         Descriptive statistics q1
    ## 82                                                      skos:Concept
    ## 83                                                    code:Procedure
    ## 84                                                    code:procedure
    ## 85                                                           percent
    ## 86                                                    code:procedure
    ## 87                                          function (x)  {     -1 }
    ## 88                                                           percent
    ## 89                                                                ==
    ## 90                                    Descriptive statistics percent
    ## 91                                                      skos:Concept
    ## 92                                                    code:Procedure
    ## 93                                                    code:procedure
    ## 94                                                               max
    ## 95                                                    code:procedure
    ## 96                        function (x)  {     max(x, na.rm = TRUE) }
    ## 97                                                               max
    ## 98                                                                ==
    ## 99                                        Descriptive statistics max
    ## 100                                                     skos:Concept
    ## 101                                                   code:Procedure
    ## 102                                                   code:Procedure
    ## 103                                                               ==
    ## 104                                                     skos:Concept
    ## 105                                                   code:procedure
    ## 106                        function (x)  {     sd(x, na.rm = TRUE) }
    ## 107                                                   code:procedure
    ## 108                                                           stddev
    ## 109                                                           stddev
    ## 110                            purl.obolibrary.org/obo/STATO_0000037
    ## 111                                    Descriptive statistics stddev
    ## 112                                                   code:procedure
    ## 113                                                              min
    ## 114                                                   code:procedure
    ## 115                       function (x)  {     min(x, na.rm = TRUE) }
    ## 116                                                              min
    ## 117                                                               ==
    ## 118                                       Descriptive statistics min
    ## 119                                                     skos:Concept
    ## 120                                                   code:Procedure
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
    ## 131                                                    rdfs:Resource
    ## 132                                                    rdfs:Resource
    ## 133                                                    rdfs:Resource

| s                            | p                               | o                                                           |
|:-----------------------------|:--------------------------------|:------------------------------------------------------------|
| code:procedure-mean          | rdfs:comment                    | Descriptive statistics mean                                 |
| code:procedure-mean          | skos:prefLabel                  | mean                                                        |
| code:procedure-mean          | rrdfqbcrnd0:RdescStatDefFun     | function (x) { mean(x, na.rm = TRUE) }                      |
| code:procedure-mean          | rdf:type                        | skos:Concept                                                |
| code:procedure-mean          | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-mean          | rdf:type                        | code:Procedure                                              |
| code:procedure-mean          | rrdfqbcrnd0:R-selectionvalue    | mean                                                        |
| code:procedure-mean          | skos:inScheme                   | code:procedure                                              |
| code:procedure-mean          | rdfs:seeAlso                    | purl.obolibrary.org/obo/IAO\_0000125                        |
| code:procedure-mean          | skos:topConceptOf               | code:procedure                                              |
| code:procedure-n             | skos:topConceptOf               | code:procedure                                              |
| code:procedure-n             | skos:prefLabel                  | n                                                           |
| code:procedure-n             | skos:inScheme                   | code:procedure                                              |
| code:procedure-n             | rrdfqbcrnd0:RdescStatDefFun     | function (x) { length(x[!is.na(x)]) }                       |
| code:procedure-n             | rrdfqbcrnd0:R-selectionvalue    | n                                                           |
| code:procedure-n             | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-n             | rdfs:comment                    | Descriptive statistics n                                    |
| code:procedure-n             | rdf:type                        | skos:Concept                                                |
| code:procedure-n             | rdf:type                        | code:Procedure                                              |
| code:procedure-q3            | skos:topConceptOf               | code:procedure                                              |
| code:procedure-q3            | skos:prefLabel                  | q3                                                          |
| code:procedure-q3            | skos:inScheme                   | code:procedure                                              |
| code:procedure-q3            | rrdfqbcrnd0:RdescStatDefFun     | function (x) { quantile(x, probs = c(0.75), na.rm = TRUE) } |
| code:procedure-q3            | rrdfqbcrnd0:R-selectionvalue    | q3                                                          |
| code:procedure-q3            | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-q3            | rdfs:comment                    | Descriptive statistics q3                                   |
| code:procedure-q3            | rdf:type                        | skos:Concept                                                |
| code:procedure-q3            | rdf:type                        | code:Procedure                                              |
| code:procedure-countdistinct | skos:topConceptOf               | code:procedure                                              |
| code:procedure-countdistinct | skos:prefLabel                  | countdistinct                                               |
| code:procedure-countdistinct | skos:inScheme                   | code:procedure                                              |
| code:procedure-countdistinct | rrdfqbcrnd0:RdescStatDefFun     | function (x) { length(unique(x)) }                          |
| code:procedure-countdistinct | rrdfqbcrnd0:R-selectionvalue    | countdistinct                                               |
| code:procedure-countdistinct | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-countdistinct | rdfs:comment                    | Descriptive statistics countdistinct                        |
| code:procedure-countdistinct | rdf:type                        | skos:Concept                                                |
| code:procedure-countdistinct | rdf:type                        | code:Procedure                                              |
| code:procedure-count         | skos:topConceptOf               | code:procedure                                              |
| code:procedure-count         | skos:prefLabel                  | count                                                       |
| code:procedure-count         | skos:inScheme                   | code:procedure                                              |
| code:procedure-count         | rrdfqbcrnd0:RdescStatDefFun     | function (x) { length(x) }                                  |
| code:procedure-count         | rrdfqbcrnd0:R-selectionvalue    | count                                                       |
| code:procedure-count         | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-count         | rdfs:comment                    | Descriptive statistics count                                |
| code:procedure-count         | rdf:type                        | skos:Concept                                                |
| code:procedure-count         | rdf:type                        | code:Procedure                                              |
| code:procedure-median        | rdfs:comment                    | Descriptive statistics median                               |
| code:procedure-median        | rrdfqbcrnd0:RdescStatDefFun     | function (x) { median(x, na.rm = TRUE) }                    |
| code:procedure-median        | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-median        | rdf:type                        | skos:Concept                                                |
| code:procedure-median        | rdf:type                        | code:Procedure                                              |
| code:procedure-median        | skos:topConceptOf               | code:procedure                                              |
| code:procedure-median        | rdfs:seeAlso                    | purl.obolibrary.org/obo/OBI\_0200119                        |
| code:procedure-median        | rrdfqbcrnd0:R-selectionvalue    | median                                                      |
| code:procedure-median        | skos:inScheme                   | code:procedure                                              |
| code:procedure-median        | skos:prefLabel                  | median                                                      |
| code:procedure-stdev         | skos:topConceptOf               | code:procedure                                              |
| code:procedure-stdev         | skos:prefLabel                  | stdev                                                       |
| code:procedure-stdev         | skos:inScheme                   | code:procedure                                              |
| code:procedure-stdev         | rrdfqbcrnd0:RdescStatDefFun     | function (x) { sd(x, na.rm = TRUE) }                        |
| code:procedure-stdev         | rrdfqbcrnd0:R-selectionvalue    | stdev                                                       |
| code:procedure-stdev         | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-stdev         | rdfs:comment                    | Descriptive statistics stdev                                |
| code:procedure-stdev         | rdf:type                        | skos:Concept                                                |
| code:procedure-stdev         | rdf:type                        | code:Procedure                                              |
| code:procedure-std           | skos:topConceptOf               | code:procedure                                              |
| code:procedure-std           | skos:prefLabel                  | std                                                         |
| code:procedure-std           | skos:inScheme                   | code:procedure                                              |
| code:procedure-std           | rrdfqbcrnd0:RdescStatDefFun     | function (x) { sd(x, na.rm = TRUE) }                        |
| code:procedure-std           | rrdfqbcrnd0:R-selectionvalue    | std                                                         |
| code:procedure-std           | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-std           | rdfs:comment                    | Descriptive statistics std                                  |
| code:procedure-std           | rdf:type                        | skos:Concept                                                |
| code:procedure-std           | rdf:type                        | code:Procedure                                              |
| code:procedure-q1            | skos:topConceptOf               | code:procedure                                              |
| code:procedure-q1            | skos:prefLabel                  | q1                                                          |
| code:procedure-q1            | skos:inScheme                   | code:procedure                                              |
| code:procedure-q1            | rrdfqbcrnd0:RdescStatDefFun     | function (x) { quantile(x, probs = c(0.25), na.rm = TRUE) } |
| code:procedure-q1            | rrdfqbcrnd0:R-selectionvalue    | q1                                                          |
| code:procedure-q1            | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-q1            | rdfs:comment                    | Descriptive statistics q1                                   |
| code:procedure-q1            | rdf:type                        | skos:Concept                                                |
| code:procedure-q1            | rdf:type                        | code:Procedure                                              |
| code:procedure-percent       | skos:topConceptOf               | code:procedure                                              |
| code:procedure-percent       | skos:prefLabel                  | percent                                                     |
| code:procedure-percent       | skos:inScheme                   | code:procedure                                              |
| code:procedure-percent       | rrdfqbcrnd0:RdescStatDefFun     | function (x) { -1 }                                         |
| code:procedure-percent       | rrdfqbcrnd0:R-selectionvalue    | percent                                                     |
| code:procedure-percent       | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-percent       | rdfs:comment                    | Descriptive statistics percent                              |
| code:procedure-percent       | rdf:type                        | skos:Concept                                                |
| code:procedure-percent       | rdf:type                        | code:Procedure                                              |
| code:procedure-max           | skos:topConceptOf               | code:procedure                                              |
| code:procedure-max           | skos:prefLabel                  | max                                                         |
| code:procedure-max           | skos:inScheme                   | code:procedure                                              |
| code:procedure-max           | rrdfqbcrnd0:RdescStatDefFun     | function (x) { max(x, na.rm = TRUE) }                       |
| code:procedure-max           | rrdfqbcrnd0:R-selectionvalue    | max                                                         |
| code:procedure-max           | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-max           | rdfs:comment                    | Descriptive statistics max                                  |
| code:procedure-max           | rdf:type                        | skos:Concept                                                |
| code:procedure-max           | rdf:type                        | code:Procedure                                              |
| code:procedure-stddev        | rdf:type                        | code:Procedure                                              |
| code:procedure-stddev        | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-stddev        | rdf:type                        | skos:Concept                                                |
| code:procedure-stddev        | skos:inScheme                   | code:procedure                                              |
| code:procedure-stddev        | rrdfqbcrnd0:RdescStatDefFun     | function (x) { sd(x, na.rm = TRUE) }                        |
| code:procedure-stddev        | skos:topConceptOf               | code:procedure                                              |
| code:procedure-stddev        | rrdfqbcrnd0:R-selectionvalue    | stddev                                                      |
| code:procedure-stddev        | skos:prefLabel                  | stddev                                                      |
| code:procedure-stddev        | rdfs:seeAlso                    | purl.obolibrary.org/obo/STATO\_0000037                      |
| code:procedure-stddev        | rdfs:comment                    | Descriptive statistics stddev                               |
| code:procedure-min           | skos:topConceptOf               | code:procedure                                              |
| code:procedure-min           | skos:prefLabel                  | min                                                         |
| code:procedure-min           | skos:inScheme                   | code:procedure                                              |
| code:procedure-min           | rrdfqbcrnd0:RdescStatDefFun     | function (x) { min(x, na.rm = TRUE) }                       |
| code:procedure-min           | rrdfqbcrnd0:R-selectionvalue    | min                                                         |
| code:procedure-min           | rrdfqbcrnd0:R-selectionoperator | ==                                                          |
| code:procedure-min           | rdfs:comment                    | Descriptive statistics min                                  |
| code:procedure-min           | rdf:type                        | skos:Concept                                                |
| code:procedure-min           | rdf:type                        | code:Procedure                                              |
| code:procedure-q3            | rdf:type                        | rdfs:Resource                                               |
| code:procedure-stddev        | rdf:type                        | rdfs:Resource                                               |
| code:procedure-stdev         | rdf:type                        | rdfs:Resource                                               |
| code:procedure-mean          | rdf:type                        | rdfs:Resource                                               |
| code:procedure-q1            | rdf:type                        | rdfs:Resource                                               |
| code:procedure-std           | rdf:type                        | rdfs:Resource                                               |
| code:procedure-count         | rdf:type                        | rdfs:Resource                                               |
| code:procedure-median        | rdf:type                        | rdfs:Resource                                               |
| code:procedure-percent       | rdf:type                        | rdfs:Resource                                               |
| code:procedure-countdistinct | rdf:type                        | rdfs:Resource                                               |
| code:procedure-min           | rdf:type                        | rdfs:Resource                                               |
| code:procedure-max           | rdf:type                        | rdfs:Resource                                               |
| code:procedure-n             | rdf:type                        | rdfs:Resource                                               |

Get the procedure codelist as turtle with Stato References
----------------------------------------------------------

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
    ## prefix qb: <http://purl.org/linked-data/cube#>
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

The RDF data cube is serialized in turtle format and stored as a text file in

``` r
cat(normalizePath(outcodelist),"\n")
```

    ## /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/procedure-code-list.ttl
