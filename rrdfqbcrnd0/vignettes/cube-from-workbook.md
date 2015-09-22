---
title: "Data qubes from Workbook"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-09-22"
vignette: >
  %\VignetteIndexEntry{Data qubes from Workbook}
  %\VignetteEngine{knitr::knitr}
  %\usepackage[utf8]{inputenc}
  %\SweaveUTF8
---

# Setup

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

# Generating RDF data cube from specification in a spreadsheet and export as turtle file

The generation of RDF data cube can be specified in a spreadsheet.
The outputs below shows the meta data for generation of the DM RDF data cube.


```r
RDFCubeWorkbook<- system.file("extdata/sample-cfg", "RDFCubeWorkbook.xlsx", package="rrdfqbcrnd0")
```

The next statement shows the metadata.

```r
cubeMetadata <- read.xlsx(RDFCubeWorkbook,
                          sheetName=paste0("DM-Components"),
                          stringsAsFactors=FALSE)
knitr::kable(
  cubeMetadata[ cubeMetadata$compType %in% c("dimension", "attribute", "measure"),
               c("codeType", "compName","nciDomainValue", "compLabel")]
  )
```



|codeType |compName    |nciDomainValue |compLabel                                                                |
|:--------|:-----------|:--------------|:------------------------------------------------------------------------|
|DATA     |trt01a      |NA             |Treatment Arm                                                            |
|SDTM     |sex         |C66731         |Sex (Gender)                                                             |
|DATA     |saffl       |NA             |Safety Population Flag                                                   |
|DATA     |procedure   |NA             |Statistical Procedure                                                    |
|DATA     |factor      |NA             |Type of procedure (quantity, proportion...)                              |
|SDTM     |race        |C74457         |Race                                                                     |
|NA       |measure     |NA             |Value of the statistical measure                                         |
|NA       |unit        |NA             |Unit of measure                                                          |
|DATA     |denominator |NA             |Denominator for a proportion (oskr) subset on which a statistic is based |

```r
knitr::kable(cubeMetadata[ cubeMetadata$compType=="metadata",c("compName","compLabel")])
```



|   |compName             |compLabel                                                                                                                                                                                                                                                            |
|:--|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|10 |obsURL               |https://phuse-scripts.googlecode.com/svn/trunk/scriptathon2014/data/adsl.xpt                                                                                                                                                                                         |
|11 |obsFileName          |dm.AR.csv                                                                                                                                                                                                                                                            |
|12 |dataCubeFileName     |DC-DM-R-V                                                                                                                                                                                                                                                            |
|13 |cubeVersion          |0.5.2                                                                                                                                                                                                                                                                |
|14 |createdBy            |Tim Williams                                                                                                                                                                                                                                                         |
|15 |description          |Cube with 6 Dimensions (factor, procedure, race, saffl, sex, trt01a), 2 Attributes (denominator, unit) and 1 measure (measure)                                                                                                                                       |
|16 |providedBy           |PhUSE Results Metadata Working Group                                                                                                                                                                                                                                 |
|17 |comment              |Example Demographics data supplied by Ian Fleming via R.. All dimensions have a Codelist and Range specified. Attributes applied from source data. Attributes as VALUES instead of URIs. Changes in current version:  codelists for factor, procedure, saffl, trt01a |
|18 |title                |Demographics Analysis Results                                                                                                                                                                                                                                        |
|19 |label                |Demographics results data set.                                                                                                                                                                                                                                       |
|20 |wasDerivedFrom       |demog.AR.csv                                                                                                                                                                                                                                                         |
|21 |domainName           |DM                                                                                                                                                                                                                                                                   |
|22 |obsFileNameDirectory |!example                                                                                                                                                                                                                                                             |
|23 |dataCubeOutDirectory |!temporary                                                                                                                                                                                                                                                           |


# Generating RDF data cube
The next statements demonstrates how to create two RDF data cubes
according to the specfications in the excel spreadsheet. Note the
contents of the RDF data cube is read from the csv file given by
obsFileName in directory given by obsFileNameDirectory. The value
"!example" specifies that the file should be read from sample data
in the package. The dataCubeOutDirectory defines the directory name for
the generated RDF data cube.


```r
dm.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "DM" )
```

```
## Start loading rdf.cdisc.org contents from /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/CDISC-standards-rdf/cdisc-rdf.zip
## Done loading rdf.cdisc.org contents, number of triples: 165700
```

```r
cat("DM cube stored as ", normalizePath(dm.cube.fn), "\n")
```

```
## DM cube stored as  /tmp/RtmpckiABp/DC-DM-R-V-0-5-2.ttl
```

```r
ae.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "AE" )
cat("AE cube stored as ", normalizePath(ae.cube.fn), "\n")
```

```
## AE cube stored as  /tmp/RtmpckiABp/DC-AE-R-V-0-5-2.ttl
```

# Create from demo data PhUSE scripting program

Note: the total of non missing values is represented using the code
"_NONMISS_", used as denominatory, categorical values the field
denominatory is populated. This is the "N[a]" item in the PhUSE
table. This is not implemented in all parts of the RRDFQBCRND0
package.

The files are generated by a SAS program -
extdata/sample-workflow/demo-export-csv.sas.  The input files are read
directly from .csv files instead of using the workbook, to avoid the
extra step with the workbook, as the input files may be updated by
running the SAS program.


```r
demoObsDataCsvFn<- system.file("extdata/sample-cfg", "demo.AR.csv", package="rrdfqbcrnd0")
demoObsData <- read.csv(demoObsDataCsvFn,stringsAsFactors=FALSE)

##TODO add measurefmt; quick hack - affects vignettes/cube-from-workbook.Rmd and
##TODO inst/data-raw/create-qb-examples-as-ttl.Rmd
if (!( "measurefmt" %in% names(demoObsData))) {
demoObsData$measurefmt<- "%6.1f"
demoObsData$measurefmt[ demoObsData$procedure %in% c("n", "nmiss", "count") ]<- "%6.0f"
## sprintf( demoObsData$measurefmt, demoObsData$measure)
}

demoMetaDataCsvFn<- system.file("extdata/sample-cfg", "DEMO-Components.csv", package="rrdfqbcrnd0")
demoMetaData <- read.csv(demoMetaDataCsvFn,stringsAsFactors=FALSE)


demo.cube.fn<- BuildCubeFromDataFrames(demoMetaData, demoObsData )
cat("DEMO cube stored as ", normalizePath(demo.cube.fn), "\n")
```

```
## DEMO cube stored as  /tmp/RtmpckiABp/DC-DEMO-R-V-0-5-2.ttl
```

### Notes 

In the read.xlsx, if all cells in a column is missing, then the input fails.  

Future version may replace the use of the DomainName, eg. DM and AE in
the examples above, with another way of deriving identification of the
table 

The attribute denominator may be changed to a dimension to handle more
complex situations. For example if there are percentages for TRT01A
and SEX using respectively TRT01A and SEX as denominator. This will be
represented by two observations with by definition the same dimensions
but different value for the attribute denominator. However, this will
violate the intergrity constraints for a RDF Data Cube (TODO: Add IC
name).  

Note: by specifying prefix the output is made shown using the
prefixes. When the prefixes are defined to the RRDF, here as part of
the turle file, then the output is also shown using the prefixes. This
makes the output more readable.  This may be a disadvantage if the
value of the prefix, say ds, changes. Also, in case of two RDF data
cubes are loaded into the model, then it makes no sense to have the ds
prefix.


# Input the generated turtle file

Now look at the generated cubes by loading the turtle files. 


```r
dataCubeFile<- demo.cube.fn
# dataCubeFile<- ae.cube.fn
# dataCubeFile<- dm.cube.fn
```

The rest of the code only depends on the value of dataCubeFile.

```r
checkCube <- new.rdf()  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= checkCube)
summarize.rdf(checkCube)
```

```
## [1] "Number of triples: 2932"
```

## Get the values in the cube
First set values for accessing the cube.

```r
dsdName<- GetDsdNameFromCube( checkCube )
domainName<- GetDomainNameFromCube( checkCube )
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

The next statement shows the first 10 triples in the cube.

```r
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



|s            |p                  |o            |
|:------------|:------------------|:------------|
|rdfs:domain  |rdfs:domain        |rdf:Property |
|rdfs:domain  |rdfs:range         |rdfs:Class   |
|rdfs:comment |rdfs:range         |rdfs:Literal |
|rdf:first    |rdf:type           |rdf:Property |
|rdf:first    |rdfs:domain        |rdf:List     |
|rdf:first    |rdfs:subPropertyOf |rdf:first    |

The next statement shows the first 10 triples in the cube, where the subject is a qb:Observation.

```r
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



|s         |p                          |o                    |
|:---------|:--------------------------|:--------------------|
|ds:obs103 |crnd-attribute:unit        |NA                   |
|ds:obs103 |crnd-attribute:cellpartno  |1                    |
|ds:obs103 |rdf:type                   |qb:Observation       |
|ds:obs103 |crnd-dimension:procedure   |code:procedure-q3    |
|ds:obs103 |crnd-dimension:ethnic      |code:ethnic-_ALL_    |
|ds:obs103 |crnd-attribute:rowno       |30                   |
|ds:obs103 |crnd-dimension:factor      |code:factor-weightbl |
|ds:obs103 |crnd-dimension:sex         |code:sex-_ALL_       |
|ds:obs103 |rdfs:label                 |103                  |
|ds:obs103 |crnd-attribute:denominator |                     |

## Get cube components

The cube components are shown in the next output.

```r
componentsRq<- GetComponentSparqlQuery( forsparqlprefix, dsdName )
components<- as.data.frame(sparql.rdf(checkCube, componentsRq), stringsAsFactors=FALSE)
components$vn<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:","",components$p)
knitr::kable(components[,c("vn", "label")])
```



|vn        |label                                       |
|:---------|:-------------------------------------------|
|agegr1    |Age group                                   |
|ethnic    |Ethnic                                      |
|factor    |Type of procedure (quantity, proportion...) |
|procedure |Statistical Procedure                       |
|race      |Race                                        |
|sex       |Sex (Gender)                                |
|trt01a    |Treatment Arm                               |

The codelists are shown in the next output.

```r
codelistsRq<- GetCodeListSparqlQuery( forsparqlprefix, dsdName )
codelists<- as.data.frame(sparql.rdf(checkCube, codelistsRq), stringsAsFactors=FALSE)
codelists$vn<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:","",codelists$p)
codelists$clc<- gsub("code:","",codelists$cl)
knitr::kable(codelists[,c("vn", "clc", "prefLabel")])
```



|vn        |clc                                            |prefLabel                                 |
|:---------|:----------------------------------------------|:-----------------------------------------|
|agegr1    |agegr1-65-80                                   |65-80                                     |
|agegr1    |agegr1-_65                                     |<65                                       |
|agegr1    |agegr1-_80                                     |>80                                       |
|agegr1    |agegr1-_ALL_                                   |_ALL_                                     |
|agegr1    |agegr1-_NONMISS_                               |_NONMISS_                                 |
|ethnic    |ethnic-HISPANIC_OR_LATINO                      |HISPANIC OR LATINO                        |
|ethnic    |ethnic-NOT_HISPANIC_OR_LATINO                  |NOT HISPANIC OR LATINO                    |
|ethnic    |ethnic-_ALL_                                   |_ALL_                                     |
|ethnic    |ethnic-_NONMISS_                               |_NONMISS_                                 |
|factor    |factor-_ALL_                                   |_ALL_                                     |
|factor    |factor-_NONMISS_                               |_NONMISS_                                 |
|factor    |factor-age                                     |age                                       |
|factor    |factor-proportion                              |proportion                                |
|factor    |factor-quantity                                |quantity                                  |
|factor    |factor-weightbl                                |weightbl                                  |
|procedure |procedure-count                                |count                                     |
|procedure |procedure-max                                  |max                                       |
|procedure |procedure-mean                                 |mean                                      |
|procedure |procedure-median                               |median                                    |
|procedure |procedure-min                                  |min                                       |
|procedure |procedure-n                                    |n                                         |
|procedure |procedure-percent                              |percent                                   |
|procedure |procedure-q1                                   |q1                                        |
|procedure |procedure-q3                                   |q3                                        |
|procedure |procedure-std                                  |std                                       |
|race      |race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          |AMERICAN INDIAN OR ALASKA NATIVE          |
|race      |race-ASIAN                                     |ASIAN                                     |
|race      |race-BLACK_OR_AFRICAN_AMERICAN                 |BLACK OR AFRICAN AMERICAN                 |
|race      |race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER |NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER |
|race      |race-WHITE                                     |WHITE                                     |
|race      |race-_ALL_                                     |_ALL_                                     |
|race      |race-_NONMISS_                                 |_NONMISS_                                 |
|sex       |sex-F                                          |F                                         |
|sex       |sex-M                                          |M                                         |
|sex       |sex-U                                          |U                                         |
|sex       |sex-UN                                         |UN                                        |
|sex       |sex-_ALL_                                      |_ALL_                                     |
|sex       |sex-_NONMISS_                                  |_NONMISS_                                 |
|trt01a    |trt01a-Placebo                                 |Placebo                                   |
|trt01a    |trt01a-Xanomeline_High_Dose                    |Xanomeline High Dose                      |
|trt01a    |trt01a-Xanomeline_Low_Dose                     |Xanomeline Low Dose                       |
|trt01a    |trt01a-_ALL_                                   |_ALL_                                     |
|trt01a    |trt01a-_NONMISS_                               |_NONMISS_                                 |


The dimensions are shown in the next output.

```r
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
dimensions<- sparql.rdf(checkCube, dimensionsRq)
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

Then the attributes as shown in the next output.

```r
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
attributes<- sparql.rdf(checkCube, attributesRq)
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

## Get observations
And finally the SPARQL query for observations, showing only the first 10 observations.

```r
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
cat(observationsRq)
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
## prefix dccs: <http://www.example.org/dc/demo/dccs/>
## prefix ds: <http://www.example.org/dc/demo/ds/>
## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
## prefix crnd-measure: <http://www.example.org/dc/measure#>
##  select * where { ?s a qb:Observation  ; 
##         qb:dataSet ds:dataset-DEMO  ; 
##  crnd-dimension:ethnic ?ethnic;
## crnd-dimension:race ?race;
## crnd-dimension:procedure ?procedure;
## crnd-dimension:agegr1 ?agegr1;
## crnd-dimension:factor ?factor;
## crnd-dimension:trt01a ?trt01a;
## crnd-dimension:sex ?sex; crnd-attribute:cellpartno ?cellpartno;
## crnd-attribute:measurefmt ?measurefmt;
## crnd-attribute:colno ?colno;
## crnd-attribute:denominator ?denominator;
## crnd-attribute:unit ?unit;
## crnd-attribute:rowno ?rowno; crnd-measure:measure      ?measure ;      
##  optional{ ?ethnic skos:prefLabel ?ethnicvalue . }
## optional{ ?race skos:prefLabel ?racevalue . }
## optional{ ?procedure skos:prefLabel ?procedurevalue . }
## optional{ ?agegr1 skos:prefLabel ?agegr1value . }
## optional{ ?factor skos:prefLabel ?factorvalue . }
## optional{ ?trt01a skos:prefLabel ?trt01avalue . }
## optional{ ?sex skos:prefLabel ?sexvalue . } 
##  }
```

```r
observations<- as.data.frame(sparql.rdf(checkCube, observationsRq ), stringsAsFactors=FALSE)
knitr::kable(observations[ 1:10 ,
   c(paste0(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", dimensions), "value"),sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", attributes), "measure")])
```



|ethnicvalue            |racevalue                        |procedurevalue |agegr1value |factorvalue |trt01avalue          |sexvalue |cellpartno |measurefmt |colno |denominator |unit |rowno |measure      |
|:----------------------|:--------------------------------|:--------------|:-----------|:-----------|:--------------------|:--------|:----------|:----------|:-----|:-----------|:----|:-----|:------------|
|_ALL_                  |_ALL_                            |q3             |_ALL_       |weightbl    |Placebo              |_ALL_    |1          |%6.1f      |1     |            |NA   |30    |74.4         |
|_ALL_                  |_ALL_                            |count          |_ALL_       |quantity    |Xanomeline Low Dose  |M        |1          |%6.0f      |2     |            |NA   |3     |34           |
|_ALL_                  |AMERICAN INDIAN OR ALASKA NATIVE |percent        |_ALL_       |proportion  |Xanomeline Low Dose  |_ALL_    |2          |%6.1f      |2     |race        |NA   |25    |0            |
|_ALL_                  |_ALL_                            |std            |_ALL_       |age         |Placebo              |_ALL_    |1          |%6.1f      |1     |            |NA   |4     |8.5901671271 |
|_ALL_                  |_ALL_                            |q3             |_ALL_       |age         |Placebo              |_ALL_    |1          |%6.1f      |1     |            |NA   |8     |82           |
|_ALL_                  |_ALL_                            |count          |_ALL_       |quantity    |Placebo              |M        |1          |%6.0f      |1     |            |NA   |3     |33           |
|NOT HISPANIC OR LATINO |_ALL_                            |percent        |_ALL_       |proportion  |Placebo              |_ALL_    |2          |%6.1f      |1     |ethnic      |NA   |38    |96.511627907 |
|_ALL_                  |BLACK OR AFRICAN AMERICAN        |percent        |_ALL_       |proportion  |Xanomeline High Dose |_ALL_    |2          |%6.1f      |3     |race        |NA   |24    |10.714285714 |
|HISPANIC OR LATINO     |_ALL_                            |count          |_ALL_       |quantity    |Xanomeline High Dose |_ALL_    |1          |%6.0f      |3     |            |NA   |40    |3            |
|_ALL_                  |AMERICAN INDIAN OR ALASKA NATIVE |percent        |_ALL_       |proportion  |Placebo              |_ALL_    |2          |%6.1f      |1     |race        |NA   |25    |0            |

## Get observations with labels

The SPARQL query for observations with labels for variables, showing only the first 10 observations.

```r
observationsDescriptionRq<- GetObservationsWithDescriptionSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
cat(observationsDescriptionRq)
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
## prefix dccs: <http://www.example.org/dc/demo/dccs/>
## prefix ds: <http://www.example.org/dc/demo/ds/>
## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
## prefix crnd-measure: <http://www.example.org/dc/measure#>
##  select * where { 
##  ?s a qb:Observation  ; 
##  qb:dataSet ds:dataset-DEMO  ; 
##  crnd-dimension:ethnic ?ethnic;
## crnd-dimension:race ?race;
## crnd-dimension:procedure ?procedure;
## crnd-dimension:agegr1 ?agegr1;
## crnd-dimension:factor ?factor;
## crnd-dimension:trt01a ?trt01a;
## crnd-dimension:sex ?sex; 
##  crnd-attribute:cellpartno ?cellpartno;
## crnd-attribute:measurefmt ?measurefmt;
## crnd-attribute:colno ?colno;
## crnd-attribute:denominator ?denominator;
## crnd-attribute:unit ?unit;
## crnd-attribute:rowno ?rowno; 
##  crnd-measure:measure      ?measure .      
##  optional{ ?ethnic skos:prefLabel ?ethnicvalue . }
## optional{ ?race skos:prefLabel ?racevalue . }
## optional{ ?procedure skos:prefLabel ?procedurevalue . }
## optional{ ?agegr1 skos:prefLabel ?agegr1value . }
## optional{ ?factor skos:prefLabel ?factorvalue . }
## optional{ ?trt01a skos:prefLabel ?trt01avalue . }
## optional{ ?sex skos:prefLabel ?sexvalue . } 
##  optional{ crnd-dimension:ethnic rdfs:label ?ethniclabel . }
## optional{ crnd-dimension:race rdfs:label ?racelabel . }
## optional{ crnd-dimension:procedure rdfs:label ?procedurelabel . }
## optional{ crnd-dimension:agegr1 rdfs:label ?agegr1label . }
## optional{ crnd-dimension:factor rdfs:label ?factorlabel . }
## optional{ crnd-dimension:trt01a rdfs:label ?trt01alabel . }
## optional{ crnd-dimension:sex rdfs:label ?sexlabel . } 
##  BIND( IRI(crnd-dimension:ethnic) as ?ethnicIRI)
## BIND( IRI(crnd-dimension:race) as ?raceIRI)
## BIND( IRI(crnd-dimension:procedure) as ?procedureIRI)
## BIND( IRI(crnd-dimension:agegr1) as ?agegr1IRI)
## BIND( IRI(crnd-dimension:factor) as ?factorIRI)
## BIND( IRI(crnd-dimension:trt01a) as ?trt01aIRI)
## BIND( IRI(crnd-dimension:sex) as ?sexIRI) 
##  BIND( IRI( ?s ) AS ?measureIRI) 
##  }
```

```r
observationsDesc<- as.data.frame(sparql.rdf(checkCube, observationsDescriptionRq ), stringsAsFactors=FALSE)
knitr::kable(observationsDesc[ 1:10 ,
     c(paste0(rep(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", dimensions),each=3),
       c("label", "value", "IRI")),
       sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", attributes), "measure", "measureIRI"
       )]
       )
```



|ethniclabel |ethnicvalue            |ethnicIRI             |racelabel |racevalue                        |raceIRI             |procedurelabel        |procedurevalue |procedureIRI             |agegr1label |agegr1value |agegr1IRI             |factorlabel                                 |factorvalue |factorIRI             |trt01alabel   |trt01avalue          |trt01aIRI             |sexlabel     |sexvalue |sexIRI             |cellpartno |measurefmt |colno |denominator |unit |rowno |measure      |measureIRI |
|:-----------|:----------------------|:---------------------|:---------|:--------------------------------|:-------------------|:---------------------|:--------------|:------------------------|:-----------|:-----------|:---------------------|:-------------------------------------------|:-----------|:---------------------|:-------------|:--------------------|:---------------------|:------------|:--------|:------------------|:----------|:----------|:-----|:-----------|:----|:-----|:------------|:----------|
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |_ALL_                            |crnd-dimension:race |Statistical Procedure |q3             |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |weightbl    |crnd-dimension:factor |Treatment Arm |Placebo              |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |1          |%6.1f      |1     |            |NA   |30    |74.4         |ds:obs103  |
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |_ALL_                            |crnd-dimension:race |Statistical Procedure |count          |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |quantity    |crnd-dimension:factor |Treatment Arm |Xanomeline Low Dose  |crnd-dimension:trt01a |Sex (Gender) |M        |crnd-dimension:sex |1          |%6.0f      |2     |            |NA   |3     |34           |ds:obs014  |
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |AMERICAN INDIAN OR ALASKA NATIVE |crnd-dimension:race |Statistical Procedure |percent        |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |proportion  |crnd-dimension:factor |Treatment Arm |Xanomeline Low Dose  |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |2          |%6.1f      |2     |race        |NA   |25    |0            |ds:obs089  |
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |_ALL_                            |crnd-dimension:race |Statistical Procedure |std            |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |age         |crnd-dimension:factor |Treatment Arm |Placebo              |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |1          |%6.1f      |1     |            |NA   |4     |8.5901671271 |ds:obs019  |
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |_ALL_                            |crnd-dimension:race |Statistical Procedure |q3             |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |age         |crnd-dimension:factor |Treatment Arm |Placebo              |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |1          |%6.1f      |1     |            |NA   |8     |82           |ds:obs031  |
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |_ALL_                            |crnd-dimension:race |Statistical Procedure |count          |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |quantity    |crnd-dimension:factor |Treatment Arm |Placebo              |crnd-dimension:trt01a |Sex (Gender) |M        |crnd-dimension:sex |1          |%6.0f      |1     |            |NA   |3     |33           |ds:obs013  |
|Ethnic      |NOT HISPANIC OR LATINO |crnd-dimension:ethnic |Race      |_ALL_                            |crnd-dimension:race |Statistical Procedure |percent        |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |proportion  |crnd-dimension:factor |Treatment Arm |Placebo              |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |2          |%6.1f      |1     |ethnic      |NA   |38    |96.511627907 |ds:obs124  |
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |BLACK OR AFRICAN AMERICAN        |crnd-dimension:race |Statistical Procedure |percent        |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |proportion  |crnd-dimension:factor |Treatment Arm |Xanomeline High Dose |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |2          |%6.1f      |3     |race        |NA   |24    |10.714285714 |ds:obs084  |
|Ethnic      |HISPANIC OR LATINO     |crnd-dimension:ethnic |Race      |_ALL_                            |crnd-dimension:race |Statistical Procedure |count          |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |quantity    |crnd-dimension:factor |Treatment Arm |Xanomeline High Dose |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |1          |%6.0f      |3     |            |NA   |40    |3            |ds:obs129  |
|Ethnic      |_ALL_                  |crnd-dimension:ethnic |Race      |AMERICAN INDIAN OR ALASKA NATIVE |crnd-dimension:race |Statistical Procedure |percent        |crnd-dimension:procedure |Age group   |_ALL_       |crnd-dimension:agegr1 |Type of procedure (quantity, proportion...) |proportion  |crnd-dimension:factor |Treatment Arm |Placebo              |crnd-dimension:trt01a |Sex (Gender) |_ALL_    |crnd-dimension:sex |2          |%6.1f      |1     |race        |NA   |25    |0            |ds:obs088  |

## Get formular expression


```r
GetFormularFromCube( checkCube, forsparqlprefix )
```

```
## expression(~trt01a * q3(weightbl) + trt01a * sex * count() + 
##     race * trt01a * percent(race) + trt01a * std(age) + trt01a * 
##     q3(age) + ethnic * trt01a * percent(ethnic) + ethnic * trt01a * 
##     count() + trt01a * min(age) + trt01a * n(weightbl) + trt01a * 
##     median(weightbl) + agegr1 * trt01a * percent(agegr1) + trt01a * 
##     std(weightbl) + trt01a * median(age) + agegr1 * trt01a * 
##     count() + trt01a * sex * percent(sex) + trt01a * q1(weightbl) + 
##     trt01a * max(weightbl) + race * trt01a * count() + trt01a * 
##     mean(weightbl) + trt01a * q1(age) + trt01a * mean(age) + 
##     trt01a * n(age) + trt01a * max(age) + trt01a * min(weightbl))
```

### Notes

Instead of using gsub the codelist values should be obtained in a more
straightforward way. This involves a new version of the ph.recode function. 

Much or the code expands the IRI's using a regulare expression. This
could instead be handled by the rrdf package, by a new add.triple
function that expand URI using the Jena expandPrefix method.


## Reproduce the metadata for the workbook from cub

Here is an example of roundtripping: make the metadata used for the
workbook from RDF data cube.

First get the dimensions, measure and attribute


```r
workbookDimAttrMeasRq<- GetDimAttrMeasInWorkbookFormatSparqlQuery( forsparqlprefix ) 
dimensionsattr<- sparql.rdf(checkCube, workbookDimAttrMeasRq )
knitr::kable(dimensionsattr)
```



|compType  |compName                   |codeType |nciDomainValue |
|:---------|:--------------------------|:--------|:--------------|
|dimension |crnd-dimension:ethnic      |NA       |NA             |
|dimension |crnd-dimension:race        |NA       |C74457         |
|dimension |crnd-dimension:procedure   |NA       |NA             |
|dimension |crnd-dimension:agegr1      |NA       |NA             |
|dimension |crnd-dimension:factor      |NA       |NA             |
|dimension |crnd-dimension:trt01a      |NA       |NA             |
|dimension |crnd-dimension:sex         |NA       |C66731         |
|attribute |crnd-attribute:cellpartno  |NA       |NA             |
|attribute |crnd-attribute:measurefmt  |NA       |NA             |
|attribute |crnd-attribute:colno       |NA       |NA             |
|attribute |crnd-attribute:denominator |NA       |NA             |
|attribute |crnd-attribute:unit        |NA       |NA             |
|attribute |crnd-attribute:rowno       |NA       |NA             |
|measure   |crnd-measure:measure       |NA       |NA             |

Secondly, get the metadata for the workbook. To get the metadata
element "cubeVersion" a workaround is needed. The cubeversion is not
directly available but from dcat:distribution derived as the result of
paste0("DC-", domainName,"-R-V-",cubeVersion,".ttl").


```r
workbookMetadataRq<- GetMetaDataInWorkbookFormatSparqlQuery( forsparqlprefix )
metadata<- sparql.rdf(checkCube, workbookMetadataRq)
cubeVersion<- gsub("-",".", gsub("DC-.*-R-V-([^\\.]+).ttl", "\\1", metadata[ metadata[,2]=="distribution", "compLabel"], perl=TRUE))
metadataX<- rbind(metadata, cbind(compType="metadata", compName="cubeVersion", compLabel=cubeVersion))
knitr::kable(metadataX)
```



|          |compType |compName     |compLabel                                        |
|:---------|:--------|:------------|:------------------------------------------------|
|          |metadata |title        |Demographics Analysis Results                    |
|          |metadata |distribution |DC-DEMO-R-V-0-5-2.ttl                            |
|          |metadata |comment      |Example demographics table from demo.sas program |
|          |metadata |label        |Demographics results data set.                   |
|          |metadata |description  |Data from demo.sas program                       |
|          |metadata |obsFileName  |demo.AR.csv                                      |
|compLabel |metadata |cubeVersion  |0.5.2                                            |

For comparison, see the meta data from the excel workbook in the beginning of the document.

# Session information

```r
sessionInfo()
```

```
## R version 3.2.2 (2015-08-14)
## Platform: x86_64-redhat-linux-gnu (64-bit)
## Running under: Fedora 22 (Twenty Two)
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
## [1] rrdfqbcrnd0_0.1.6 RCurl_1.95-4.7    bitops_1.0-6      xlsx_0.5.7       
## [5] xlsxjars_0.6.1    rrdf_2.1.0        rrdflibs_1.4.0    rJava_0.9-7      
## 
## loaded via a namespace (and not attached):
## [1] magrittr_1.5  formatR_1.2   tools_3.2.2   stringi_0.5-5 highr_0.5    
## [6] knitr_1.10.5  stringr_1.0.0 evaluate_0.7
```

