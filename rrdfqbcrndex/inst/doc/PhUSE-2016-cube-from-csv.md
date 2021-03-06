Setup
=====

This script creates RDF data cubes from .csv files.

``` r
library(rrdfancillary)
library(rrdfcdisc)
library(rrdfqb)
library(rrdfqbcrnd0)
devtools::load_all(pkg="../..")
```

    ## Loading rrdfqbcrndex

All files are stored in the directory

``` r
targetDir<- system.file("extdata/sample-rdf", package="rrdfqbcrndex")
(targetDir)
```

    ## [1] "/home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf"

Create from demo data PhUSE scripting program
=============================================

The files are generated by a SAS program - extdata/sample-workflow/adsl1.sas. The input files are read directly from .csv files instead of using the workbook, to avoid the extra step with the workbook, as the input files may be updated by running the SAS program.

``` r
tab1x01ObsDataCsvFn<- system.file("extdata/sample-cfg", "TAB1X01.csv", package="rrdfqbcrndex")
# tab1x01ObsDataCsvFn<- "TAB1X01.csv"
tab1x01ObsData <- read.csv(tab1x01ObsDataCsvFn,stringsAsFactors=FALSE)

##TODO add measurefmt; quick hack - affects vignettes/cube-from-workbook.Rmd and
##TODO inst/data-raw/create-qb-examples-as-ttl.Rmd
if (!( "measurefmt" %in% names(tab1x01ObsData))) {
tab1x01ObsData$measurefmt<- "%6.1f"
tab1x01ObsData$measurefmt[ tab1x01ObsData$procedure %in% c("n", "nmiss", "count") ]<- "%6.0f"
## sprintf( tab1x01ObsData$measurefmt, tab1x01ObsData$measure)
}

tab1x01MetaDataCsvFn<- system.file("extdata/sample-cfg", "TAB1X01-Components.csv", package="rrdfqbcrndex")
# tab1x01MetaDataCsvFn<- "TAB1X01-Components.csv"
tab1x01MetaData <- read.csv(tab1x01MetaDataCsvFn,stringsAsFactors=FALSE)


tab1x01.cube.fn<- BuildCubeFromDataFrames(tab1x01MetaData, tab1x01ObsData )
```

    ## !!!!!!!!!
    ## !!!!!!!!!
    ## !!!!!!!!!
    ## !!!!!!!!!
    ## !!!!!!!!!
    ## !!!!!!!!!
    ## !!!!!!!!!
    ## !!!!!!!!!

``` r
cat("TAB1X01 cube stored as ", normalizePath(tab1x01.cube.fn), "\n")
```

    ## TAB1X01 cube stored as  /tmp/Rtmp4yMKXK/DC-TAB1X01-R-V-0-0-0.ttl

``` r
targetFile<- file.path(targetDir,"CDISC-pilot-TAB1X01.ttl")

if (file.copy( tab1x01.cube.fn, targetFile, overwrite=TRUE)) {
   cat("RDF data cube copied to ", normalizePath(targetFile), "\n")
 }
```

    ## RDF data cube copied to  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/CDISC-pilot-TAB1X01.ttl

Now look at the generated cubes by loading the turtle files.

``` r
dataCubeFile<- targetFile
```

The rest of the code only depends on the value of dataCubeFile.

``` r
checkCube <- new.rdf(ontology=FALSE)  # Initialize
cat("Loading RDF data cube from ", normalizePath(dataCubeFile), "\n")
```

    ## Loading RDF data cube from  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/CDISC-pilot-TAB1X01.ttl

``` r
temp<- load.rdf(dataCubeFile, format="TURTLE", appendTo= checkCube)
summarize.rdf(checkCube)
```

    ## [1] "Number of triples: 1368"

Get the values in the cube
--------------------------

First set values for accessing the cube.

``` r
dsdName<- GetDsdNameFromCube( checkCube )
domainName<- GetDomainNameFromCube( checkCube )
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

The next statement shows the first 10 triples in the cube.

``` r
observations1Rq<- paste( forsparqlprefix,
'
select *
where {?s ?p ?o .}
limit 10
',
"\n"
)
observations1<- sparql.rdf(checkCube, observations1Rq  )
knitr::kable(head(observations1))
```

| s        | p                       | o                      |
|:---------|:------------------------|:-----------------------|
| ds:obs50 | crnd-dimension:comp24fl | code:comp24fl-*ALL*    |
| ds:obs50 | rdf:type                | qb:Observation         |
| ds:obs50 | crnd-dimension:factor   | code:factor-proportion |
| ds:obs50 | crnd-dimension:ittfl    | code:ittfl-*ALL*       |
| ds:obs50 | crnd-dimension:efffl    | code:efffl-*ALL*       |
| ds:obs50 | qb:dataSet              | ds:dataset-TAB1X01     |

The next statement shows the first 10 triples in the cube, where the subject is a qb:Observation.

``` r
observations2Rq<-  paste( forsparqlprefix,
'
select *
where { ?s a qb:Observation ; ?p ?o .}
limit 10
',
"\n"                               
)
observations2<- sparql.rdf(checkCube, observations2Rq)
knitr::kable(head(observations2, 10))
```

| s        | p                          | o                                                                            |
|:---------|:---------------------------|:-----------------------------------------------------------------------------|
| ds:obs49 | rdfs:label                 | 49                                                                           |
| ds:obs49 | qb:dataSet                 | ds:dataset-TAB1X01                                                           |
| ds:obs49 | crnd-dimension:ittfl       | code:ittfl-*ALL*                                                             |
| ds:obs49 | crnd-attribute:denominator |                                                                              |
| ds:obs49 | crnd-dimension:saffl       | code:saffl-*ALL*                                                             |
| ds:obs49 | crnd-dimension:efffl       | code:efffl-*ALL*                                                             |
| ds:obs49 | crnd-attribute:unit        | NA                                                                           |
| ds:obs49 | rdfs:comment               | Statistic for number of records/Statistics for factor with the dimensions XX |
| ds:obs49 | crnd-dimension:factor      | code:factor-quantity                                                         |
| ds:obs49 | crnd-dimension:disconfl    | code:disconfl-*ALL*                                                          |

Get cube components
-------------------

The cube components are shown in the next output.

``` r
componentsRq<- GetComponentSparqlQuery( forsparqlprefix, dsdName )
components<- as.data.frame(sparql.rdf(checkCube, componentsRq), stringsAsFactors=FALSE)
components$vn<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:","",components$p)
knitr::kable(components[,c("vn", "label")])
```

| vn        | label                                       |
|:----------|:--------------------------------------------|
| comp24fl  | comp24fl                                    |
| disconfl  | disconfl                                    |
| efffl     | efffl                                       |
| factor    | Type of procedure (quantity, proportion...) |
| ittfl     | ittfl                                       |
| procedure | Statistical Procedure                       |
| saffl     | saffl                                       |
| trt01p    | Treatment Arm                               |

The codelists are shown in the next output.

``` r
codelistsRq<- GetCodeListSparqlQuery( forsparqlprefix, dsdName )
codelists<- as.data.frame(sparql.rdf(checkCube, codelistsRq), stringsAsFactors=FALSE)
codelists$vn<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:","",codelists$dimension)
codelists$clc<- gsub("code:","",codelists$cl)
knitr::kable(codelists[,c("vn", "clc", "clprefLabel")])
```

| vn        | clc                           | clprefLabel          |
|:----------|:------------------------------|:---------------------|
| comp24fl  | comp24fl-N                    | N                    |
| comp24fl  | comp24fl-Y                    | Y                    |
| comp24fl  | comp24fl-*ALL*                | *ALL*                |
| comp24fl  | comp24fl-*NONMISS*            | *NONMISS*            |
| disconfl  | disconfl-Y                    | Y                    |
| disconfl  | disconfl-*ALL*                | *ALL*                |
| disconfl  | disconfl-*NONMISS*            | *NONMISS*            |
| efffl     | efffl-N                       | N                    |
| efffl     | efffl-Y                       | Y                    |
| efffl     | efffl-*ALL*                   | *ALL*                |
| efffl     | efffl-*NONMISS*               | *NONMISS*            |
| factor    | factor-*ALL*                  | *ALL*                |
| factor    | factor-*NONMISS*              | *NONMISS*            |
| factor    | factor-proportion             | proportion           |
| factor    | factor-quantity               | quantity             |
| ittfl     | ittfl-Y                       | Y                    |
| ittfl     | ittfl-*ALL*                   | *ALL*                |
| ittfl     | ittfl-*NONMISS*               | *NONMISS*            |
| procedure | procedure-count               | count                |
| procedure | procedure-percent             | percent              |
| saffl     | saffl-Y                       | Y                    |
| saffl     | saffl-*ALL*                   | *ALL*                |
| saffl     | saffl-*NONMISS*               | *NONMISS*            |
| trt01p    | trt01p-                       |                      |
| trt01p    | trt01p-Placebo                | Placebo              |
| trt01p    | trt01p-Xanomeline\_High\_Dose | Xanomeline High Dose |
| trt01p    | trt01p-Xanomeline\_Low\_Dose  | Xanomeline Low Dose  |
| trt01p    | trt01p-*ALL*                  | *ALL*                |
| trt01p    | trt01p-*NONMISS*              | *NONMISS*            |

The dimensions are shown in the next output.

``` r
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
dimensions<- sparql.rdf(checkCube, dimensionsRq)
knitr::kable(dimensions)
```

p
-

crnd-dimension:disconfl
crnd-dimension:saffl
crnd-dimension:trt01p
crnd-dimension:factor
crnd-dimension:procedure crnd-dimension:comp24fl
crnd-dimension:ittfl
crnd-dimension:efffl

Then the attributes as shown in the next output.

``` r
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
attributes<- sparql.rdf(checkCube, attributesRq)
knitr::kable(attributes)
```

p
-

crnd-attribute:denominator crnd-attribute:unit

Get observations
----------------

And finally the SPARQL query for observations, showing only the first 10 observations.

``` r
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
cat(observationsRq)
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
    ## prefix dccs: <http://www.example.org/dc/tab1x01/dccs/>
    ## prefix ds: <http://www.example.org/dc/tab1x01/ds/>
    ## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
    ## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
    ## prefix crnd-measure: <http://www.example.org/dc/measure#>
    ## 
    ## select * where {
    ## ?s a qb:Observation  ;
    ##     qb:dataSet ds:dataset-TAB1X01 ;
    ##     crnd-dimension:disconfl ?disconfl;
    ##     crnd-dimension:saffl ?saffl;
    ##     crnd-dimension:trt01p ?trt01p;
    ##     crnd-dimension:factor ?factor;
    ##     crnd-dimension:procedure ?procedure;
    ##     crnd-dimension:comp24fl ?comp24fl;
    ##     crnd-dimension:ittfl ?ittfl;
    ##     crnd-dimension:efffl ?efffl;
    ##     crnd-attribute:denominator ?denominator;
    ##     crnd-attribute:unit ?unit;
    ##     crnd-measure:measure ?measure .      
    ## optional{ ?disconfl skos:prefLabel ?disconflvalue . }
    ## optional{ ?saffl skos:prefLabel ?safflvalue . }
    ## optional{ ?trt01p skos:prefLabel ?trt01pvalue . }
    ## optional{ ?factor skos:prefLabel ?factorvalue . }
    ## optional{ ?procedure skos:prefLabel ?procedurevalue . }
    ## optional{ ?comp24fl skos:prefLabel ?comp24flvalue . }
    ## optional{ ?ittfl skos:prefLabel ?ittflvalue . }
    ## optional{ ?efffl skos:prefLabel ?effflvalue . }
    ## } 
    ## order by ?s

``` r
observations<- as.data.frame(sparql.rdf(checkCube, observationsRq ), stringsAsFactors=FALSE)
knitr::kable(observations[ 1:10 ,
   c(paste0(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", dimensions), "value"),sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", attributes), "measure")])
```

| disconflvalue | safflvalue | trt01pvalue          | factorvalue | procedurevalue | comp24flvalue | ittflvalue | effflvalue | denominator | unit | measure |
|:--------------|:-----------|:---------------------|:------------|:---------------|:--------------|:-----------|:-----------|:------------|:-----|:--------|
| *ALL*         | *ALL*      | Placebo              | quantity    | count          | *ALL*         | Y          | *ALL*      |             | NA   | 86      |
| *ALL*         | *ALL*      | Placebo              | proportion  | percent        | *ALL*         | Y          | *ALL*      | ittfl       | NA   | 100     |
| *ALL*         | *ALL*      | Xanomeline High Dose | quantity    | count          | *ALL*         | Y          | *ALL*      |             | NA   | 84      |
| *ALL*         | *ALL*      | Xanomeline High Dose | proportion  | percent        | *ALL*         | Y          | *ALL*      | ittfl       | NA   | 100     |
| *ALL*         | *ALL*      | Xanomeline Low Dose  | quantity    | count          | *ALL*         | Y          | *ALL*      |             | NA   | 84      |
| *ALL*         | *ALL*      | Xanomeline Low Dose  | proportion  | percent        | *ALL*         | Y          | *ALL*      | ittfl       | NA   | 100     |
| *ALL*         | *ALL*      | NA                   | quantity    | count          | *ALL*         | Y          | *ALL*      |             | NA   | 254     |
| *ALL*         | *ALL*      | NA                   | proportion  | percent        | *ALL*         | Y          | *ALL*      | ittfl       | NA   | 100     |
| *ALL*         | Y          | Placebo              | quantity    | count          | *ALL*         | *ALL*      | *ALL*      |             | NA   | 86      |
| *ALL*         | Y          | Placebo              | proportion  | percent        | *ALL*         | *ALL*      | *ALL*      | saffl       | NA   | 100     |

Get observations with labels
----------------------------

The SPARQL query for observations with labels for variables, showing only the first 10 observations.

``` r
observationsDescriptionRq<- GetObservationsWithDescriptionSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
cat(observationsDescriptionRq)
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
    ## prefix dccs: <http://www.example.org/dc/tab1x01/dccs/>
    ## prefix ds: <http://www.example.org/dc/tab1x01/ds/>
    ## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
    ## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
    ## prefix crnd-measure: <http://www.example.org/dc/measure#>
    ##  select * where { 
    ##  ?s a qb:Observation  ; 
    ##  qb:dataSet ds:dataset-TAB1X01  ; 
    ##  crnd-dimension:disconfl ?disconfl;
    ## crnd-dimension:saffl ?saffl;
    ## crnd-dimension:trt01p ?trt01p;
    ## crnd-dimension:factor ?factor;
    ## crnd-dimension:procedure ?procedure;
    ## crnd-dimension:comp24fl ?comp24fl;
    ## crnd-dimension:ittfl ?ittfl;
    ## crnd-dimension:efffl ?efffl; 
    ##  crnd-attribute:denominator ?denominator;
    ## crnd-attribute:unit ?unit; 
    ##  crnd-measure:measure      ?measure .      
    ##  optional{ ?disconfl skos:prefLabel ?disconflvalue . }
    ## optional{ ?saffl skos:prefLabel ?safflvalue . }
    ## optional{ ?trt01p skos:prefLabel ?trt01pvalue . }
    ## optional{ ?factor skos:prefLabel ?factorvalue . }
    ## optional{ ?procedure skos:prefLabel ?procedurevalue . }
    ## optional{ ?comp24fl skos:prefLabel ?comp24flvalue . }
    ## optional{ ?ittfl skos:prefLabel ?ittflvalue . }
    ## optional{ ?efffl skos:prefLabel ?effflvalue . } 
    ##  optional{ crnd-dimension:disconfl rdfs:label ?disconfllabel . }
    ## optional{ crnd-dimension:saffl rdfs:label ?saffllabel . }
    ## optional{ crnd-dimension:trt01p rdfs:label ?trt01plabel . }
    ## optional{ crnd-dimension:factor rdfs:label ?factorlabel . }
    ## optional{ crnd-dimension:procedure rdfs:label ?procedurelabel . }
    ## optional{ crnd-dimension:comp24fl rdfs:label ?comp24fllabel . }
    ## optional{ crnd-dimension:ittfl rdfs:label ?ittfllabel . }
    ## optional{ crnd-dimension:efffl rdfs:label ?efffllabel . } 
    ##  BIND( IRI(crnd-dimension:disconfl) as ?disconflIRI)
    ## BIND( IRI(crnd-dimension:saffl) as ?safflIRI)
    ## BIND( IRI(crnd-dimension:trt01p) as ?trt01pIRI)
    ## BIND( IRI(crnd-dimension:factor) as ?factorIRI)
    ## BIND( IRI(crnd-dimension:procedure) as ?procedureIRI)
    ## BIND( IRI(crnd-dimension:comp24fl) as ?comp24flIRI)
    ## BIND( IRI(crnd-dimension:ittfl) as ?ittflIRI)
    ## BIND( IRI(crnd-dimension:efffl) as ?effflIRI) 
    ##  BIND( IRI( ?s ) AS ?measureIRI) 
    ##  }

``` r
observationsDesc<- as.data.frame(sparql.rdf(checkCube, observationsDescriptionRq ), stringsAsFactors=FALSE)
knitr::kable(observationsDesc[ 1:10 ,
     c(paste0(rep(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", dimensions),each=3),
       c("label", "value", "IRI")),
       sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", attributes), "measure", "measureIRI"
       )]
       )
```

| disconfllabel | disconflvalue | disconflIRI             | saffllabel | safflvalue | safflIRI             | trt01plabel   | trt01pvalue          | trt01pIRI             | factorlabel                                 | factorvalue | factorIRI             | procedurelabel        | procedurevalue | procedureIRI             | comp24fllabel | comp24flvalue | comp24flIRI             | ittfllabel | ittflvalue | ittflIRI             | efffllabel | effflvalue | effflIRI             | denominator | unit | measure      | measureIRI |
|:--------------|:--------------|:------------------------|:-----------|:-----------|:---------------------|:--------------|:---------------------|:----------------------|:--------------------------------------------|:------------|:----------------------|:----------------------|:---------------|:-------------------------|:--------------|:--------------|:------------------------|:-----------|:-----------|:---------------------|:-----------|:-----------|:---------------------|:------------|:-----|:-------------|:-----------|
| disconfl      | *ALL*         | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Placebo              | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | quantity    | crnd-dimension:factor | Statistical Procedure | count          | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | *ALL*      | crnd-dimension:efffl |             | NA   | 58           | ds:obs49   |
| disconfl      | *ALL*         | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Placebo              | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | quantity    | crnd-dimension:factor | Statistical Procedure | count          | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | Y          | crnd-dimension:efffl |             | NA   | 79           | ds:obs23   |
| disconfl      | *ALL*         | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | NA                   | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | proportion  | crnd-dimension:factor | Statistical Procedure | percent        | crnd-dimension:procedure | comp24fl      | Y             | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | *ALL*      | crnd-dimension:efffl | comp24fl    | NA   | 46.456692913 | ds:obs48   |
| disconfl      | *ALL*         | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Xanomeline Low Dose  | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | proportion  | crnd-dimension:factor | Statistical Procedure | percent        | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | N          | crnd-dimension:efffl | efffl       | NA   | 3.5714285714 | ds:obs22   |
| disconfl      | Y             | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Xanomeline High Dose | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | proportion  | crnd-dimension:factor | Statistical Procedure | percent        | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | *ALL*      | crnd-dimension:efffl | disconfl    | NA   | 67.857142857 | ds:obs58   |
| disconfl      | *ALL*         | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Xanomeline Low Dose  | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | proportion  | crnd-dimension:factor | Statistical Procedure | percent        | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | Y          | crnd-dimension:efffl | efffl       | NA   | 96.428571429 | ds:obs28   |
| disconfl      | *ALL*         | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Xanomeline Low Dose  | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | quantity    | crnd-dimension:factor | Statistical Procedure | count          | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | *ALL*      | crnd-dimension:efffl |             | NA   | 25           | ds:obs53   |
| disconfl      | Y             | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Xanomeline High Dose | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | quantity    | crnd-dimension:factor | Statistical Procedure | count          | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | *ALL*      | crnd-dimension:efffl |             | NA   | 57           | ds:obs57   |
| disconfl      | Y             | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | NA                   | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | quantity    | crnd-dimension:factor | Statistical Procedure | count          | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | *ALL*      | crnd-dimension:ittfl | efffl      | *ALL*      | crnd-dimension:efffl |             | NA   | 144          | ds:obs63   |
| disconfl      | *ALL*         | crnd-dimension:disconfl | saffl      | *ALL*      | crnd-dimension:saffl | Treatment Arm | Placebo              | crnd-dimension:trt01p | Type of procedure (quantity, proportion...) | quantity    | crnd-dimension:factor | Statistical Procedure | count          | crnd-dimension:procedure | comp24fl      | *ALL*         | crnd-dimension:comp24fl | ittfl      | Y          | crnd-dimension:ittfl | efffl      | *ALL*      | crnd-dimension:efffl |             | NA   | 86           | ds:obs01   |

Reproduce the metadata for the workbook from cube
-------------------------------------------------

Here is an example of roundtripping: make the metadata used for the workbook from RDF data cube.

First get the dimensions, measure and attribute

``` r
workbookDimAttrMeasRq<- GetDimAttrMeasInWorkbookFormatSparqlQuery( forsparqlprefix ) 
dimensionsattr<- sparql.rdf(checkCube, workbookDimAttrMeasRq )
knitr::kable(dimensionsattr)
```

| compType  | compName                   | codeType | nciDomainValue |
|:----------|:---------------------------|:---------|:---------------|
| dimension | crnd-dimension:disconfl    | NA       | NA             |
| dimension | crnd-dimension:saffl       | NA       | NA             |
| dimension | crnd-dimension:trt01p      | NA       | NA             |
| dimension | crnd-dimension:factor      | NA       | NA             |
| dimension | crnd-dimension:procedure   | NA       | NA             |
| dimension | crnd-dimension:comp24fl    | NA       | NA             |
| dimension | crnd-dimension:ittfl       | NA       | NA             |
| dimension | crnd-dimension:efffl       | NA       | NA             |
| attribute | crnd-attribute:denominator | NA       | NA             |
| attribute | crnd-attribute:unit        | NA       | NA             |
| measure   | crnd-measure:measure       | NA       | NA             |

Secondly, get the metadata for the workbook. To get the metadata element "cubeVersion" a workaround is needed. The cubeversion is not directly available but from dcat:distribution derived as the result of paste0("DC-", domainName,"-R-V-",cubeVersion,".ttl").

``` r
workbookMetadataRq<- GetMetaDataInWorkbookFormatSparqlQuery( forsparqlprefix )
metadata<- sparql.rdf(checkCube, workbookMetadataRq)
cubeVersion<- gsub("-",".", gsub("DC-.*-R-V-([^\\.]+).ttl", "\\1", metadata[ metadata[,2]=="distribution", "compLabel"], perl=TRUE))
metadataX<- rbind(metadata, cbind(compType="metadata", compName="cubeVersion", compLabel=cubeVersion))
knitr::kable(metadataX)
```

|           | compType | compName     | compLabel                            |
|-----------|:---------|:-------------|:-------------------------------------|
|           | metadata | title        | Demographics Analysis Results        |
|           | metadata | distribution | DC-TAB1X01-R-V-0-0-0.ttl             |
|           | metadata | comment      |                                      |
|           | metadata | label        | Table 14-1.01 Summary of Populations |
|           | metadata | description  | Data from adsl1.sas program          |
|           | metadata | obsFileName  | tab1x01.csv                          |
| compLabel | metadata | cubeVersion  | 0.0.0                                |

Session information
===================

``` r
sessionInfo()
```

    ## R version 3.2.3 (2015-12-10)
    ## Platform: x86_64-redhat-linux-gnu (64-bit)
    ## Running under: Fedora 23 (Workstation Edition)
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_GB.UTF-8          LC_NUMERIC=C                 
    ##  [3] LC_TIME=en_GB.UTF-8           LC_COLLATE=en_GB.UTF-8       
    ##  [5] LC_MONETARY=en_GB.UTF-8       LC_MESSAGES=en_GB.UTF-8      
    ##  [7] LC_PAPER=en_GB.UTF-8          LC_NAME=en_GB.UTF-8          
    ##  [9] LC_ADDRESS=en_GB.UTF-8        LC_TELEPHONE=en_GB.UTF-8     
    ## [11] LC_MEASUREMENT=en_GB.UTF-8    LC_IDENTIFICATION=en_GB.UTF-8
    ## 
    ## attached base packages:
    ## [1] methods   stats     graphics  grDevices utils     datasets  base     
    ## 
    ## other attached packages:
    ##  [1] rrdfqbcrndex_0.2.3  rrdfqbcrnd0_0.2.3   rrdfqb_0.3.1       
    ##  [4] xlsx_0.5.7          xlsxjars_0.6.1      rrdfcdisc_0.2.3    
    ##  [7] devtools_1.11.1     RCurl_1.95-4.8      bitops_1.0-6       
    ## [10] rrdfancillary_0.2.3 rrdf_2.1.2          rrdflibs_1.4.0     
    ## [13] rJava_0.9-8        
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] Rcpp_0.12.4     knitr_1.12.3    magrittr_1.5    roxygen2_5.0.1 
    ##  [5] highr_0.5.1     stringr_1.0.0   tools_3.2.3     withr_1.0.1    
    ##  [9] htmltools_0.3.5 yaml_2.1.13     digest_0.6.9    formatR_1.3    
    ## [13] memoise_1.0.0   evaluate_0.8.3  rmarkdown_0.9.5 stringi_1.0-1
