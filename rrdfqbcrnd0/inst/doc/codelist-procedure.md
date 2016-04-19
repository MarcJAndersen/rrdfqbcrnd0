Introduction
------------

This vignette shows - the procedure codelist

Setup
=====

``` r
library(rrdfancillary)
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

    ## [1] "prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\nprefix skos: <http://www.w3.org/2004/02/skos/core#>\nprefix prov: <http://www.w3.org/ns/prov#>\nprefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>\nprefix dcat: <http://www.w3.org/ns/dcat#>\nprefix owl: <http://www.w3.org/2002/07/owl#>\nprefix xsd: <http://www.w3.org/2001/XMLSchema#>\nprefix pav: <http://purl.org/pav>\nprefix dc: <http://purl.org/dc/elements/1.1/>\nprefix dct: <http://purl.org/dc/terms/>\nprefix mms: <http://rdf.cdisc.org/mms#>\nprefix cts: <http://rdf.cdisc.org/ct/schema#>\nprefix cdiscs: <http://rdf.cdisc.org/std/schema#>\nprefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#>\nprefix cdashct: <http://rdf.cdisc.org/cdash-terminology#>\nprefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#>\nprefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#>\nprefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#>\nprefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#>\nprefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#>\nprefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#>\nprefix sendct: <http://rdf.cdisc.org/send-terminology#>\nprefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#>\nprefix adamct: <http://rdf.cdisc.org/adam-terminology#>\nprefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#>\nprefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#>\nprefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#>\nprefix qb: <http://purl.org/linked-data/cube#>\nprefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/>\nprefix code: <http://www.example.org/dc/code/>\nprefix dccs: <http://www.example.org/dc/example/dccs/>\nprefix ds: <http://www.example.org/dc/example/ds/>\nprefix crnd-dimension: <http://www.example.org/dc/dimension#>\nprefix crnd-attribute: <http://www.example.org/dc/attribute#>\nprefix crnd-measure: <http://www.example.org/dc/measure#>\n \nselect distinct ?DataStructureDefinition ?dimension ?cprefLabel ?cl ?clprefLabel ?vn ?vct ?vnop ?vnval\nwhere {\n   ?DataStructureDefinition a qb:DataStructureDefinition ;\n        qb:component ?component .\n   ?component a qb:ComponentSpecification .\n   ?component qb:dimension ?dimension .\n\n   ?dimension qb:codeList ?c .\n   OPTIONAL { ?c skos:prefLabel ?cprefLabel .   }\n   OPTIONAL { ?c rrdfqbcrnd0:DataSetRefD2RQ ?vnop . }\n   OPTIONAL { ?c rrdfqbcrnd0:R-columnname ?vn . }\n   OPTIONAL { ?c rrdfqbcrnd0:codeType     ?vct .          }\n\n   ?c skos:hasTopConcept ?cl .\n   OPTIONAL { ?cl skos:prefLabel ?clprefLabel . }\n   OPTIONAL { ?cl rrdfqbcrnd0:R-selectionoperator ?vnop . }\n   OPTIONAL { ?cl rrdfqbcrnd0:R-selectionvalue ?vnval .   }\n values ( ?DataStructureDefinition ) {\n(ds:dsd-EXAMPLE)\n} \n}\norder by ?dimension ?cl ?dimensionrefLabel\n"
    ##    DataStructureDefinition                dimension
    ## 1           ds:dsd-EXAMPLE  crnd-dimension:category
    ## 2           ds:dsd-EXAMPLE  crnd-dimension:category
    ## 3           ds:dsd-EXAMPLE  crnd-dimension:category
    ## 4           ds:dsd-EXAMPLE    crnd-dimension:factor
    ## 5           ds:dsd-EXAMPLE    crnd-dimension:factor
    ## 6           ds:dsd-EXAMPLE    crnd-dimension:factor
    ## 7           ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 8           ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 9           ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 10          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 11          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 12          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 13          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 14          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 15          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 16          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 17          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 18          ds:dsd-EXAMPLE crnd-dimension:procedure
    ## 19          ds:dsd-EXAMPLE crnd-dimension:procedure
    ##                    cprefLabel                           cl   clprefLabel
    ## 1   Codelist scheme: category       code:category-AA-group      AA-group
    ## 2   Codelist scheme: category          code:category-_ALL_         _ALL_
    ## 3   Codelist scheme: category      code:category-_NONMISS_     _NONMISS_
    ## 4     Codelist scheme: factor             code:factor-VARA          VARA
    ## 5     Codelist scheme: factor            code:factor-_ALL_         _ALL_
    ## 6     Codelist scheme: factor        code:factor-_NONMISS_     _NONMISS_
    ## 7  Codelist scheme: procedure         code:procedure-count         count
    ## 8  Codelist scheme: procedure code:procedure-countdistinct countdistinct
    ## 9  Codelist scheme: procedure           code:procedure-max           max
    ## 10 Codelist scheme: procedure          code:procedure-mean          mean
    ## 11 Codelist scheme: procedure        code:procedure-median        median
    ## 12 Codelist scheme: procedure           code:procedure-min           min
    ## 13 Codelist scheme: procedure             code:procedure-n             n
    ## 14 Codelist scheme: procedure       code:procedure-percent       percent
    ## 15 Codelist scheme: procedure            code:procedure-q1            q1
    ## 16 Codelist scheme: procedure            code:procedure-q3            q3
    ## 17 Codelist scheme: procedure           code:procedure-std           std
    ## 18 Codelist scheme: procedure        code:procedure-stddev        stddev
    ## 19 Codelist scheme: procedure         code:procedure-stdev         stdev
    ##           vn  vct                          vnop         vnval
    ## 1   category DATA rrdfqbcrnd0:NOTGIVEN_CATEGORY      AA-group
    ## 2   category DATA rrdfqbcrnd0:NOTGIVEN_CATEGORY          <NA>
    ## 3   category DATA rrdfqbcrnd0:NOTGIVEN_CATEGORY          <NA>
    ## 4     factor DATA                            ==          VARA
    ## 5     factor DATA                          <NA>          <NA>
    ## 6     factor DATA                          <NA>          <NA>
    ## 7  procedure DATA                            ==         count
    ## 8  procedure DATA                            == countdistinct
    ## 9  procedure DATA                            ==           max
    ## 10 procedure DATA                            ==          mean
    ## 11 procedure DATA                            ==        median
    ## 12 procedure DATA                            ==           min
    ## 13 procedure DATA                            ==             n
    ## 14 procedure DATA                            ==       percent
    ## 15 procedure DATA                            ==            q1
    ## 16 procedure DATA                            ==            q3
    ## 17 procedure DATA                            ==           std
    ## 18 procedure DATA                            ==        stddev
    ## 19 procedure DATA                            ==         stdev
    ## crnd-dimension:category crnd-dimension:category crnd-dimension:category crnd-dimension:factor crnd-dimension:factor crnd-dimension:factor crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure crnd-dimension:procedure 
    ##   DataStructureDefinition dimension                cprefLabel
    ## 1          ds:dsd-EXAMPLE  category Codelist scheme: category
    ## 2          ds:dsd-EXAMPLE  category Codelist scheme: category
    ## 3          ds:dsd-EXAMPLE  category Codelist scheme: category
    ##                        cl clprefLabel       vn  vct
    ## 1  code:category-AA-group    AA-group category DATA
    ## 2     code:category-_ALL_       _ALL_ category DATA
    ## 3 code:category-_NONMISS_   _NONMISS_ category DATA
    ##                            vnop    vnval      vn1      vn2       clc
    ## 1 rrdfqbcrnd0:NOTGIVEN_CATEGORY AA-group category category  AA-group
    ## 2 rrdfqbcrnd0:NOTGIVEN_CATEGORY     <NA> category category     _ALL_
    ## 3 rrdfqbcrnd0:NOTGIVEN_CATEGORY     <NA> category category _NONMISS_
    ## $`AA-group`
    ## [1] "AA-group"
    ## 
    ## $`_ALL_`
    ## [1] "_ALL_"
    ## 
    ## $`_NONMISS_`
    ## [1] "_NONMISS_"
    ## 
    ##   DataStructureDefinition dimension              cprefLabel
    ## 4          ds:dsd-EXAMPLE    factor Codelist scheme: factor
    ## 5          ds:dsd-EXAMPLE    factor Codelist scheme: factor
    ## 6          ds:dsd-EXAMPLE    factor Codelist scheme: factor
    ##                      cl clprefLabel     vn  vct vnop vnval    vn1    vn2
    ## 4      code:factor-VARA        VARA factor DATA   ==  VARA factor factor
    ## 5     code:factor-_ALL_       _ALL_ factor DATA <NA>  <NA> factor factor
    ## 6 code:factor-_NONMISS_   _NONMISS_ factor DATA <NA>  <NA> factor factor
    ##         clc
    ## 4      VARA
    ## 5     _ALL_
    ## 6 _NONMISS_
    ## $VARA
    ## [1] "VARA"
    ## 
    ## $`_ALL_`
    ## [1] "_ALL_"
    ## 
    ## $`_NONMISS_`
    ## [1] "_NONMISS_"
    ## 
    ##    DataStructureDefinition dimension                 cprefLabel
    ## 7           ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 8           ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 9           ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 10          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 11          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 12          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 13          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 14          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 15          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 16          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 17          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 18          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ## 19          ds:dsd-EXAMPLE procedure Codelist scheme: procedure
    ##                              cl   clprefLabel        vn  vct vnop
    ## 7          code:procedure-count         count procedure DATA   ==
    ## 8  code:procedure-countdistinct countdistinct procedure DATA   ==
    ## 9            code:procedure-max           max procedure DATA   ==
    ## 10          code:procedure-mean          mean procedure DATA   ==
    ## 11        code:procedure-median        median procedure DATA   ==
    ## 12           code:procedure-min           min procedure DATA   ==
    ## 13             code:procedure-n             n procedure DATA   ==
    ## 14       code:procedure-percent       percent procedure DATA   ==
    ## 15            code:procedure-q1            q1 procedure DATA   ==
    ## 16            code:procedure-q3            q3 procedure DATA   ==
    ## 17           code:procedure-std           std procedure DATA   ==
    ## 18        code:procedure-stddev        stddev procedure DATA   ==
    ## 19         code:procedure-stdev         stdev procedure DATA   ==
    ##            vnval       vn1       vn2           clc
    ## 7          count procedure procedure         count
    ## 8  countdistinct procedure procedure countdistinct
    ## 9            max procedure procedure           max
    ## 10          mean procedure procedure          mean
    ## 11        median procedure procedure        median
    ## 12           min procedure procedure           min
    ## 13             n procedure procedure             n
    ## 14       percent procedure procedure       percent
    ## 15            q1 procedure procedure            q1
    ## 16            q3 procedure procedure            q3
    ## 17           std procedure procedure           std
    ## 18        stddev procedure procedure        stddev
    ## 19         stdev procedure procedure         stdev
    ## $count
    ## [1] "count"
    ## 
    ## $countdistinct
    ## [1] "countdistinct"
    ## 
    ## $max
    ## [1] "max"
    ## 
    ## $mean
    ## [1] "mean"
    ## 
    ## $median
    ## [1] "median"
    ## 
    ## $min
    ## [1] "min"
    ## 
    ## $n
    ## [1] "n"
    ## 
    ## $percent
    ## [1] "percent"
    ## 
    ## $q1
    ## [1] "q1"
    ## 
    ## $q3
    ## [1] "q3"
    ## 
    ## $std
    ## [1] "std"
    ## 
    ## $stddev
    ## [1] "stddev"
    ## 
    ## $stdev
    ## [1] "stdev"

This shows a simple use of the BuildCubeFromDataFrames function. The warning message from log4j can be ignored.

The RDF data cube is serialized in turtle format and stored as a text file in

``` r
cat(normalizePath(outcube),"\n")
```

    ## /tmp/RtmpZyZL6j/DC-EXAMPLE-R-V-0-0-0.ttl

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

    ## [1] "Number of triples: 425"

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
    ## prefix pav: <http://purl.org/pav>
    ## prefix dc: <http://purl.org/dc/elements/1.1/>
    ## prefix dct: <http://purl.org/dc/terms/>
    ## prefix mms: <http://rdf.cdisc.org/mms#>
    ## prefix cts: <http://rdf.cdisc.org/ct/schema#>
    ## prefix cdiscs: <http://rdf.cdisc.org/std/schema#>
    ## prefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#>
    ## prefix cdashct: <http://rdf.cdisc.org/cdash-terminology#>
    ## prefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#>
    ## prefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#>
    ## prefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#>
    ## prefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#>
    ## prefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#>
    ## prefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#>
    ## prefix sendct: <http://rdf.cdisc.org/send-terminology#>
    ## prefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#>
    ## prefix adamct: <http://rdf.cdisc.org/adam-terminology#>
    ## prefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#>
    ## prefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#>
    ## prefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#>
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
    ## prefix pav: <http://purl.org/pav>
    ## prefix dc: <http://purl.org/dc/elements/1.1/>
    ## prefix dct: <http://purl.org/dc/terms/>
    ## prefix mms: <http://rdf.cdisc.org/mms#>
    ## prefix cts: <http://rdf.cdisc.org/ct/schema#>
    ## prefix cdiscs: <http://rdf.cdisc.org/std/schema#>
    ## prefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#>
    ## prefix cdashct: <http://rdf.cdisc.org/cdash-terminology#>
    ## prefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#>
    ## prefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#>
    ## prefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#>
    ## prefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#>
    ## prefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#>
    ## prefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#>
    ## prefix sendct: <http://rdf.cdisc.org/send-terminology#>
    ## prefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#>
    ## prefix adamct: <http://rdf.cdisc.org/adam-terminology#>
    ## prefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#>
    ## prefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#>
    ## prefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#>
    ## prefix qb: <http://purl.org/linked-data/cube#>
    ## prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/>
    ## prefix code: <http://www.example.org/dc/code/>
    ## prefix dccs: <http://www.example.org/dc/example/dccs/>
    ## prefix ds: <http://www.example.org/dc/example/ds/>
    ## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
    ## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
    ## prefix crnd-measure: <http://www.example.org/dc/measure#>
    ##  
    ## select distinct ?DataStructureDefinition ?dimension ?cprefLabel ?cl ?clprefLabel ?vn ?vct ?vnop ?vnval
    ## where {
    ##    ?DataStructureDefinition a qb:DataStructureDefinition ;
    ##         qb:component ?component .
    ##    ?component a qb:ComponentSpecification .
    ##    ?component qb:dimension ?dimension .
    ## 
    ##    ?dimension qb:codeList ?c .
    ##    OPTIONAL { ?c skos:prefLabel ?cprefLabel .   }
    ##    OPTIONAL { ?c rrdfqbcrnd0:DataSetRefD2RQ ?vnop . }
    ##    OPTIONAL { ?c rrdfqbcrnd0:R-columnname ?vn . }
    ##    OPTIONAL { ?c rrdfqbcrnd0:codeType     ?vct .          }
    ## 
    ##    ?c skos:hasTopConcept ?cl .
    ##    OPTIONAL { ?cl skos:prefLabel ?clprefLabel . }
    ##    OPTIONAL { ?cl rrdfqbcrnd0:R-selectionoperator ?vnop . }
    ##    OPTIONAL { ?cl rrdfqbcrnd0:R-selectionvalue ?vnval .   }
    ##  values ( ?DataStructureDefinition ) {
    ## (ds:dsd-EXAMPLE)
    ## } 
    ## }
    ## order by ?dimension ?cl ?dimensionrefLabel

Executing the SPARQL query gives the code list as a data frame.

    ##           vn                     clc   clprefLabel
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

| vn        | clc                     | clprefLabel   |
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
    ## prefix pav: <http://purl.org/pav>
    ## prefix dc: <http://purl.org/dc/elements/1.1/>
    ## prefix dct: <http://purl.org/dc/terms/>
    ## prefix mms: <http://rdf.cdisc.org/mms#>
    ## prefix cts: <http://rdf.cdisc.org/ct/schema#>
    ## prefix cdiscs: <http://rdf.cdisc.org/std/schema#>
    ## prefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#>
    ## prefix cdashct: <http://rdf.cdisc.org/cdash-terminology#>
    ## prefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#>
    ## prefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#>
    ## prefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#>
    ## prefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#>
    ## prefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#>
    ## prefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#>
    ## prefix sendct: <http://rdf.cdisc.org/send-terminology#>
    ## prefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#>
    ## prefix adamct: <http://rdf.cdisc.org/adam-terminology#>
    ## prefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#>
    ## prefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#>
    ## prefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#>
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
    ## 121                       code:n                        rdf:type
    ## 122                    code:mean                        rdf:type
    ## 123                   code:count                        rdf:type
    ## 124                      code:q3                        rdf:type
    ## 125                      code:q1                        rdf:type
    ## 126                  code:stddev                        rdf:type
    ## 127                 code:percent                        rdf:type
    ## 128                   code:stdev                        rdf:type
    ## 129                     code:max                        rdf:type
    ## 130                  code:median                        rdf:type
    ## 131                     code:std                        rdf:type
    ## 132                     code:min                        rdf:type
    ## 133           code:countdistinct                        rdf:type
    ## 134                       code:n                        rdf:type
    ## 135                    code:mean                        rdf:type
    ## 136                   code:count                        rdf:type
    ## 137                      code:q3                        rdf:type
    ## 138                      code:q1                        rdf:type
    ## 139                  code:stddev                        rdf:type
    ## 140                 code:percent                        rdf:type
    ## 141                   code:stdev                        rdf:type
    ## 142                     code:max                        rdf:type
    ## 143                  code:median                        rdf:type
    ## 144                     code:std                        rdf:type
    ## 145                     code:min                        rdf:type
    ## 146           code:countdistinct                        rdf:type
    ## 147            code:procedure-q3                        rdf:type
    ## 148        code:procedure-stddev                        rdf:type
    ## 149         code:procedure-stdev                        rdf:type
    ## 150          code:procedure-mean                        rdf:type
    ## 151            code:procedure-q1                        rdf:type
    ## 152           code:procedure-std                        rdf:type
    ## 153         code:procedure-count                        rdf:type
    ## 154        code:procedure-median                        rdf:type
    ## 155       code:procedure-percent                        rdf:type
    ## 156 code:procedure-countdistinct                        rdf:type
    ## 157           code:procedure-min                        rdf:type
    ## 158           code:procedure-max                        rdf:type
    ## 159             code:procedure-n                        rdf:type
    ## 160                       code:n                        rdf:type
    ## 161                    code:mean                        rdf:type
    ## 162                   code:count                        rdf:type
    ## 163                      code:q3                        rdf:type
    ## 164                      code:q1                        rdf:type
    ## 165                  code:stddev                        rdf:type
    ## 166                 code:percent                        rdf:type
    ## 167                   code:stdev                        rdf:type
    ## 168                     code:max                        rdf:type
    ## 169                  code:median                        rdf:type
    ## 170                     code:std                        rdf:type
    ## 171                     code:min                        rdf:type
    ## 172           code:countdistinct                        rdf:type
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
    ## 121                                                   code:Procedure
    ## 122                                                   code:Procedure
    ## 123                                                   code:Procedure
    ## 124                                                   code:Procedure
    ## 125                                                   code:Procedure
    ## 126                                                   code:Procedure
    ## 127                                                   code:Procedure
    ## 128                                                   code:Procedure
    ## 129                                                   code:Procedure
    ## 130                                                   code:Procedure
    ## 131                                                   code:Procedure
    ## 132                                                   code:Procedure
    ## 133                                                   code:Procedure
    ## 134                                                     skos:Concept
    ## 135                                                     skos:Concept
    ## 136                                                     skos:Concept
    ## 137                                                     skos:Concept
    ## 138                                                     skos:Concept
    ## 139                                                     skos:Concept
    ## 140                                                     skos:Concept
    ## 141                                                     skos:Concept
    ## 142                                                     skos:Concept
    ## 143                                                     skos:Concept
    ## 144                                                     skos:Concept
    ## 145                                                     skos:Concept
    ## 146                                                     skos:Concept
    ## 147                                                    rdfs:Resource
    ## 148                                                    rdfs:Resource
    ## 149                                                    rdfs:Resource
    ## 150                                                    rdfs:Resource
    ## 151                                                    rdfs:Resource
    ## 152                                                    rdfs:Resource
    ## 153                                                    rdfs:Resource
    ## 154                                                    rdfs:Resource
    ## 155                                                    rdfs:Resource
    ## 156                                                    rdfs:Resource
    ## 157                                                    rdfs:Resource
    ## 158                                                    rdfs:Resource
    ## 159                                                    rdfs:Resource
    ## 160                                                    rdfs:Resource
    ## 161                                                    rdfs:Resource
    ## 162                                                    rdfs:Resource
    ## 163                                                    rdfs:Resource
    ## 164                                                    rdfs:Resource
    ## 165                                                    rdfs:Resource
    ## 166                                                    rdfs:Resource
    ## 167                                                    rdfs:Resource
    ## 168                                                    rdfs:Resource
    ## 169                                                    rdfs:Resource
    ## 170                                                    rdfs:Resource
    ## 171                                                    rdfs:Resource
    ## 172                                                    rdfs:Resource

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
| code:n                       | rdf:type                        | code:Procedure                                              |
| code:mean                    | rdf:type                        | code:Procedure                                              |
| code:count                   | rdf:type                        | code:Procedure                                              |
| code:q3                      | rdf:type                        | code:Procedure                                              |
| code:q1                      | rdf:type                        | code:Procedure                                              |
| code:stddev                  | rdf:type                        | code:Procedure                                              |
| code:percent                 | rdf:type                        | code:Procedure                                              |
| code:stdev                   | rdf:type                        | code:Procedure                                              |
| code:max                     | rdf:type                        | code:Procedure                                              |
| code:median                  | rdf:type                        | code:Procedure                                              |
| code:std                     | rdf:type                        | code:Procedure                                              |
| code:min                     | rdf:type                        | code:Procedure                                              |
| code:countdistinct           | rdf:type                        | code:Procedure                                              |
| code:n                       | rdf:type                        | skos:Concept                                                |
| code:mean                    | rdf:type                        | skos:Concept                                                |
| code:count                   | rdf:type                        | skos:Concept                                                |
| code:q3                      | rdf:type                        | skos:Concept                                                |
| code:q1                      | rdf:type                        | skos:Concept                                                |
| code:stddev                  | rdf:type                        | skos:Concept                                                |
| code:percent                 | rdf:type                        | skos:Concept                                                |
| code:stdev                   | rdf:type                        | skos:Concept                                                |
| code:max                     | rdf:type                        | skos:Concept                                                |
| code:median                  | rdf:type                        | skos:Concept                                                |
| code:std                     | rdf:type                        | skos:Concept                                                |
| code:min                     | rdf:type                        | skos:Concept                                                |
| code:countdistinct           | rdf:type                        | skos:Concept                                                |
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
| code:n                       | rdf:type                        | rdfs:Resource                                               |
| code:mean                    | rdf:type                        | rdfs:Resource                                               |
| code:count                   | rdf:type                        | rdfs:Resource                                               |
| code:q3                      | rdf:type                        | rdfs:Resource                                               |
| code:q1                      | rdf:type                        | rdfs:Resource                                               |
| code:stddev                  | rdf:type                        | rdfs:Resource                                               |
| code:percent                 | rdf:type                        | rdfs:Resource                                               |
| code:stdev                   | rdf:type                        | rdfs:Resource                                               |
| code:max                     | rdf:type                        | rdfs:Resource                                               |
| code:median                  | rdf:type                        | rdfs:Resource                                               |
| code:std                     | rdf:type                        | rdfs:Resource                                               |
| code:min                     | rdf:type                        | rdfs:Resource                                               |
| code:countdistinct           | rdf:type                        | rdfs:Resource                                               |

Get the procedure codelist as turtle with Stato References
----------------------------------------------------------

    ## prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    ## prefix skos: <http://www.w3.org/2004/02/skos/core#>
    ## prefix prov: <http://www.w3.org/ns/prov#>
    ## prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    ## prefix dcat: <http://www.w3.org/ns/dcat#>
    ## prefix owl: <http://www.w3.org/2002/07/owl#>
    ## prefix xsd: <http://www.w3.org/2001/XMLSchema#>
    ## prefix pav: <http://purl.org/pav>
    ## prefix dc: <http://purl.org/dc/elements/1.1/>
    ## prefix dct: <http://purl.org/dc/terms/>
    ## prefix mms: <http://rdf.cdisc.org/mms#>
    ## prefix cts: <http://rdf.cdisc.org/ct/schema#>
    ## prefix cdiscs: <http://rdf.cdisc.org/std/schema#>
    ## prefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#>
    ## prefix cdashct: <http://rdf.cdisc.org/cdash-terminology#>
    ## prefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#>
    ## prefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#>
    ## prefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#>
    ## prefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#>
    ## prefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#>
    ## prefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#>
    ## prefix sendct: <http://rdf.cdisc.org/send-terminology#>
    ## prefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#>
    ## prefix adamct: <http://rdf.cdisc.org/adam-terminology#>
    ## prefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#>
    ## prefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#>
    ## prefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#>
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

    ## /home/ma/projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/sample-rdf/procedure-code-list.ttl

The triples are:

``` r
cat(readLines(procedure.codelist.fn),"\n")
```

    ## @prefix dccs:  <http://www.example.org/dc/example/dccs/> . @prefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#> . @prefix code:  <http://www.example.org/dc/code/> . @prefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#> . @prefix owl:   <http://www.w3.org/2002/07/owl#> . @prefix xsd:   <http://www.w3.org/2001/XMLSchema#> . @prefix skos:  <http://www.w3.org/2004/02/skos/core#> . @prefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#> . @prefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#> . @prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> . @prefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#> . @prefix crnd-attribute: <http://www.example.org/dc/attribute#> . @prefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#> . @prefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#> . @prefix ds:    <http://www.example.org/dc/example/ds/> . @prefix qb:    <http://purl.org/linked-data/cube#> . @prefix mms:   <http://rdf.cdisc.org/mms#> . @prefix crnd-dimension: <http://www.example.org/dc/dimension#> . @prefix dct:   <http://purl.org/dc/terms/> . @prefix cdiscs: <http://rdf.cdisc.org/std/schema#> . @prefix dcat:  <http://www.w3.org/ns/dcat#> . @prefix cdashct: <http://rdf.cdisc.org/cdash-terminology#> . @prefix prov:  <http://www.w3.org/ns/prov#> . @prefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#> . @prefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#> . @prefix crnd-measure: <http://www.example.org/dc/measure#> . @prefix cts:   <http://rdf.cdisc.org/ct/schema#> . @prefix pav:   <http://purl.org/pav> . @prefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#> . @prefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#> . @prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> . @prefix adamct: <http://rdf.cdisc.org/adam-terminology#> . @prefix sendct: <http://rdf.cdisc.org/send-terminology#> . @prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/> . @prefix dc:    <http://purl.org/dc/elements/1.1/> .  code:q3  a      code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-q1  a                  code:Procedure , rdfs:Resource , skos:Concept ;         rdfs:comment                  "Descriptive statistics q1"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "q1"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "q1"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:median  a  code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-stddev         a                             code:Procedure , skos:Concept , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics stddev"@en ;         rdfs:seeAlso                  <purl.obolibrary.org/obo/STATO_0000037> ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "stddev"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     sd(x, na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "stddev"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:min  a     code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-n  a                   code:Procedure , skos:Concept , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics n"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "n"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     length(x[!is.na(x)]) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "n"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:n  a       code:Procedure , skos:Concept , rdfs:Resource .  code:stdev  a   code:Procedure , skos:Concept , rdfs:Resource .  code:max  a     code:Procedure , skos:Concept , rdfs:Resource .  code:percent  a  code:Procedure , skos:Concept , rdfs:Resource .  code:countdistinct  a  code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-std  a                 code:Procedure , skos:Concept , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics std"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "std"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     sd(x, na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "std"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:Procedure  a        rdfs:Resource , rdfs:Class , owl:Class ;         rdfs:comment     "Specifies the procedure for each observation"@en ;         rdfs:label       "Class for code list: procedure"@en ;         rdfs:seeAlso     code:procedure ;         rdfs:subClassOf  code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-countdistinct         a                             skos:Concept , code:Procedure , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics countdistinct"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "countdistinct"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     length(unique(x)) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "countdistinct"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:count  a   code:Procedure , skos:Concept , rdfs:Resource .  code:q1  a      code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-stdev  a               code:Procedure , skos:Concept , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics stdev"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "stdev"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     sd(x, na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "stdev"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:procedure-median         a                             rdfs:Resource , skos:Concept , code:Procedure ;         rdfs:comment                  "Descriptive statistics median"@en ;         rdfs:seeAlso                  <purl.obolibrary.org/obo/OBI_0200119> ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "median"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     median(x, na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "median"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:procedure-min  a                 skos:Concept , rdfs:Resource , code:Procedure ;         rdfs:comment                  "Descriptive statistics min"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "min"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     min(x, na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "min"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:stddev  a  code:Procedure , skos:Concept , rdfs:Resource .  code:mean  a    code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-percent         a                             skos:Concept , code:Procedure , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics percent"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "percent"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     -1 }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "percent"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:procedure-q3  a                  code:Procedure , skos:Concept , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics q3"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "q3"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "q3"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:procedure-max  a                 skos:Concept , code:Procedure , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics max"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "max"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     max(x, na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "max"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:std  a     code:Procedure , skos:Concept , rdfs:Resource .  code:procedure-mean  a                skos:Concept , code:Procedure , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics mean"@en ;         rdfs:seeAlso                  <purl.obolibrary.org/obo/IAO_0000125> ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "mean"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     mean(x, na.rm = TRUE) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "mean"^^xsd:string ;         skos:topConceptOf             code:procedure .  code:procedure-count  a               code:Procedure , skos:Concept , rdfs:Resource ;         rdfs:comment                  "Descriptive statistics count"@en ;         rrdfqbcrnd0:R-selectionoperator                 "=="^^xsd:string ;         rrdfqbcrnd0:R-selectionvalue  "count"^^xsd:string ;         rrdfqbcrnd0:RdescStatDefFun   "function (x)  {     length(x) }" ;         skos:inScheme                 code:procedure ;         skos:prefLabel                "count"^^xsd:string ;         skos:topConceptOf             code:procedure .
