---
title: "Execute SPARQL integrity constraints on a data cube"
author: "mja@statgroup.dk"
date: "2015-09-22"
vignette: >
  %\VignetteIndexEntry{Execute SPARQL integrity constraints on a data cube}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---


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

```r
qbfile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfqbcrnd0")
cube<- load.rdf( qbfile, format="TURTLE")

dsdName<- GetDsdNameFromCube( cube )
domainName<- GetDomainNameFromCube( cube )
forsparqlprefix<- GetForSparqlPrefix( domainName )

cdisc.rdf<- Load.cdisc.standards()
```

```
## Start loading rdf.cdisc.org contents from /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/CDISC-standards-rdf/cdisc-rdf.zip
## Done loading rdf.cdisc.org contents, number of triples: 165672
```

```r
cubeData<- combine.rdf( cube, cdisc.rdf)
```

rrdf does not implement the ASK query. As a work around the query is
transformed to a `SELECT (COUNT(*) ...)` or `SELECT *` gitquery.


```r
str(cubeData)
```

Formal class 'jobjRef' [package "rJava"] with 2 slots
  ..@ jobj  :<externalptr> 
  ..@ jclass: chr "com/hp/hpl/jena/rdf/model/Model"

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
: 0
NULL
[1] "SELECT * WHERE {\n  {\n    # Check dataset has a dsd\n    ?dataset a qb:DataSet .\n    FILTER NOT EXISTS { ?dataset qb:structure ?dsd . }\n  } UNION { \n    # Check has just one dsd\n    ?dataset a qb:DataSet ;\n       qb:structure ?dsd1, ?dsd2 .\n    FILTER (?dsd1 != ?dsd2)\n  }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  ?dsd a qb:DataStructureDefinition .\n  FILTER NOT EXISTS { ?dsd qb:component [qb:componentProperty [a qb:MeasureProperty]] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  ?dim a qb:DimensionProperty .\n  FILTER NOT EXISTS { ?dim rdfs:range [] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  ?dim a qb:DimensionProperty ;\n       rdfs:range skos:Concept .\n  FILTER NOT EXISTS { ?dim qb:codeList [] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  ?dsd qb:component ?componentSpec .\n  ?componentSpec qb:componentRequired \"false\"^^xsd:boolean ;\n                 qb:componentProperty ?component .\n  FILTER NOT EXISTS { ?component a qb:AttributeProperty }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    ?sliceKey a qb:SliceKey .\n    FILTER NOT EXISTS { [a qb:DataStructureDefinition] qb:sliceKey ?sliceKey }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  ?slicekey a qb:SliceKey;\n      qb:componentProperty ?prop .\n  ?dsd qb:sliceKey ?slicekey .\n  FILTER NOT EXISTS { ?dsd qb:component [qb:componentProperty ?prop] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  {\n    # Slice has a key\n    ?slice a qb:Slice .\n    FILTER NOT EXISTS { ?slice qb:sliceStructure ?key }\n  } UNION {\n    # Slice has just one key\n    ?slice a qb:Slice ;\n           qb:sliceStructure ?key1, ?key2;\n    FILTER (?key1 != ?key2)\n  }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  ?slice qb:sliceStructure [qb:componentProperty ?dim] .\n  FILTER NOT EXISTS { ?slice ?dim [] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty;\n    FILTER NOT EXISTS { ?obs ?dim [] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  FILTER( ?allEqual )\n  {\n    # For each pair of observations test if all the dimension values are the same\n    SELECT (MIN(?equal) AS ?allEqual) WHERE {\n        ?obs1 qb:dataSet ?dataset .\n        ?obs2 qb:dataSet ?dataset .\n        FILTER (?obs1 != ?obs2)\n        ?dataset qb:structure/qb:component/qb:componentProperty ?dim .\n        ?dim a qb:DimensionProperty .\n        ?obs1 ?dim ?value1 .\n        ?obs2 ?dim ?value2 .\n        BIND( ?value1 = ?value2 AS ?equal)\n    } GROUP BY ?obs1 ?obs2\n  }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    ?obs qb:dataSet/qb:structure/qb:component ?component .\n    ?component qb:componentRequired \"true\"^^xsd:boolean ;\n               qb:componentProperty ?attr .\n    FILTER NOT EXISTS { ?obs ?attr [] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    # Observation in a non-measureType cube\n    ?obs qb:dataSet/qb:structure ?dsd .\n    FILTER NOT EXISTS { ?dsd qb:component/qb:componentProperty qb:measureType }\n\n    # verify every measure is present\n    ?dsd qb:component/qb:componentProperty ?measure .\n    ?measure a qb:MeasureProperty;\n    FILTER NOT EXISTS { ?obs ?measure [] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    # Observation in a measureType-cube\n    ?obs qb:dataSet/qb:structure ?dsd ;\n         qb:measureType ?measure .\n    ?dsd qb:component/qb:componentProperty qb:measureType .\n    # Must have value for its measureType\n    FILTER NOT EXISTS { ?obs ?measure [] }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    # Observation with measureType\n    ?obs qb:dataSet/qb:structure ?dsd ;\n         qb:measureType ?measure ;\n         ?omeasure [] .\n    # Any measure on the observation\n    ?dsd qb:component/qb:componentProperty qb:measureType ;\n         qb:component/qb:componentProperty ?omeasure .\n    ?omeasure a qb:MeasureProperty .\n    # Must be the same as the measureType\n    FILTER (?omeasure != ?measure)\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n  {\n      # Count number of other measures found at each point \n      SELECT ?numMeasures (COUNT(?obs2) AS ?count) WHERE {\n          {\n              # Find the DSDs and check how many measures they have\n              SELECT ?dsd (COUNT(?m) AS ?numMeasures) WHERE {\n                  ?dsd qb:component/qb:componentProperty ?m.\n                  ?m a qb:MeasureProperty .\n              } GROUP BY ?dsd\n          }\n        \n          # Observation in measureType cube\n          ?obs1 qb:dataSet/qb:structure ?dsd;\n                qb:dataSet ?dataset ;\n                qb:measureType ?m1 .\n    \n          # Other observation at same dimension value\n          ?obs2 qb:dataSet ?dataset ;\n                qb:measureType ?m2 .\n          FILTER NOT EXISTS { \n              ?dsd qb:component/qb:componentProperty ?dim .\n              FILTER (?dim != qb:measureType)\n              ?dim a qb:DimensionProperty .\n              ?obs1 ?dim ?v1 . \n              ?obs2 ?dim ?v2. \n              FILTER (?v1 != ?v2)\n          }\n          \n      } GROUP BY ?obs1 ?numMeasures\n        HAVING (?count != ?numMeasures)\n  }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    ?dataset qb:slice       ?slice .\n    ?slice   qb:observation ?obs .\n    FILTER NOT EXISTS { ?obs qb:dataSet ?dataset . }\n}\n    "
: 0
NULL
[1] "SELECT * WHERE {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty ;\n        qb:codeList ?list .\n    ?list a skos:ConceptScheme .\n    ?obs ?dim ?v .\n    FILTER NOT EXISTS { ?v a skos:Concept ; skos:inScheme ?list }\n}"
: 0
NULL
[1] "SELECT * WHERE {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty ;\n        qb:codeList ?list .\n    ?list a skos:Collection .\n    ?obs ?dim ?v .\n    FILTER NOT EXISTS { ?v a skos:Concept . ?list skos:member+ ?v }\n}"
: 0

Here is the same code but wrapped into a function


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

## Checking two existing cube

The example data is from
(http://publishing-statistical-data.googlecode.com/svn/trunk/specs/src/main/example/example.ttl)


```r
qbfile1<- system.file("extdata/sample-rdf", "example.ttl", package="rrdfqbcrnd0")
cube1<- load.rdf( qbfile1, format="TURTLE")

cubeData1<- combine.rdf( cube1, cdisc.rdf)

icres1<- RunQbIC( cubeData1, forsparqlprefix )
```

```
## Executing IC-1.  Unique DataSet
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-2. Unique DSD
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-3. DSD includes measure
##  -- 0 rows returned (0 is pass, >0 fail)
## Executing IC-4. Dimensions have range
##  -- 1 rows returned (0 is pass, >0 fail)
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
##  -- 48 rows returned (0 is pass, >0 fail)
## Executing IC-12. No duplicate observations
##  -- 120 rows returned (0 is pass, >0 fail)
## Executing IC-13. Required attributes
##  -- 24 rows returned (0 is pass, >0 fail)
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
knitr::kable(icres1)
```



|ictitle                                                | icfail|
|:------------------------------------------------------|------:|
|IC-1.  Unique DataSet                                  |      0|
|IC-2. Unique DSD                                       |      0|
|IC-3. DSD includes measure                             |      0|
|IC-4. Dimensions have range                            |      1|
|IC-5. Concept dimensions have code lists               |      0|
|IC-6. Only attributes may be optional                  |      0|
|IC-7. Slice Keys must be declared                      |      0|
|IC-8. Slice Keys consistent with DSD                   |      0|
|IC-9. Unique slice structure                           |      0|
|IC-10. Slice dimensions complete                       |      0|
|IC-11. All dimensions required                         |     48|
|IC-12. No duplicate observations                       |    120|
|IC-13. Required attributes                             |     24|
|IC-14. All measures present                            |      0|
|IC-15. Measure dimension consistent                    |      0|
|IC-16. Single measure on measure dimension observation |      0|
|IC-17. All measures present in measures dimension cube |      0|
|IC-18. Consistent data set links                       |      0|
|IC-19a. Codes from code list                           |      0|
|IC-19b. Codes from code list                           |      0|

The file example-fails-IC14.ttl is example.ttl with a few triples added to make the cube non conformant with the intregity constaints.


```r
qbfile2<- system.file("extdata/sample-rdf", "example-fails-IC14.ttl", package="rrdfqbcrnd0")
cube2<- load.rdf( qbfile2, format="TURTLE")

cubeData2<- combine.rdf( cube2, cdisc.rdf)

icres2<- RunQbIC( cubeData2, forsparqlprefix,doForIC=c("ic-14") )
```

```
## Executing IC-14. All measures present
##  -- 23 rows returned (0 is pass, >0 fail)
## IC-20 and IC-21 are currently not implemented
```

```r
knitr::kable(icres2)
```



|ictitle                     | icfail|
|:---------------------------|------:|
|IC-14. All measures present |     23|

