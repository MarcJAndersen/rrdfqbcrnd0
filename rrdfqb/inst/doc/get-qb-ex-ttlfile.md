---
title: "Get RDF data cube example file from RDF data cube specifications"
author: "mja@statgroup.dk"
date: "2016-01-06"
---

# Get RDF data cube example file from RDF data cube specifications

This script downloads the example from the RDF data cube vocabulary and stores it in the package.
The example is normalized.

## Setup 

```r
devtools::load_all(pkg="../..")
```

```
## Loading rrdfqb
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

# R-code


```r
library(RCurl)
library(devtools)
qbURL<-"https://raw.githubusercontent.com/UKGovLD/publishing-statistical-data/master/specs/src/main/example/example.ttl"
if (! url.exists(qbURL) ) {
  stop(paste0("Can not access URL ",qbURL))
}
examplettl <- getURL(qbURL)
savefile <- file.path(system.file("extdata/sample-rdf", package="rrdfqb"), "example.ttl" )
writeLines( examplettl, savefile)
cat("written to ", normalizePath(savefile) )
```

```
## written to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqb/inst/extdata/sample-rdf/example.ttl
```

# Show one observations from the store


```r
exfile <- file.path(system.file("extdata/sample-rdf", "example.ttl", package="rrdfqb") )
store <- new.rdf(ontology=FALSE)
load.rdf( exfile, format="TURTLE", store)
```

```
## [1] "Java-Object{<ModelCom   {eg:organization @rdfs:label \"Example org\"@en; eg:organization @rdf:type foaf:Agent; eg:organization @rdf:type org:Organization; eg:o31 @eg:lifeExpectancy \"77.1\"^^http://www.w3.org/2001/XMLSchema#decimal; eg:o31 @eg:refArea ex-geo:newport_00pr; eg:o31 @qb:dataSet eg:dataset-le3; eg:o31 @rdf:type qb:Observation; eg:o44 @eg:lifeExpectancy \"79.4\"^^http://www.w3.org/2001/XMLSchema#decimal; eg:o44 @eg:refArea ex-geo:merthyr_tdfil_00ph; eg:o44 @qb:dataSet eg:dataset-le3; eg:o44 @rdf:type qb:Observation; f8d0771d7a137ec48a2f52e73c13d7f2 @qb:componentAttachment qb:Slice; f8d0771d7a137ec48a2f52e73c13d7f2 @qb:order \"3\"^^http://www.w3.org/2001/XMLSchema#integer; f8d0771d7a137ec48a2f52e73c13d7f2 @qb:dimension sdmx-dimension:sex; eg:slice3 @qb:observation eg:o34; eg:slice3 @qb:observation eg:o33; eg:slice3 @qb:observation eg:o32...} |  [http://example.org/ns#organization, http://www.w3.org/2000/01/rdf-schema#label, \"Example org\"@en] [http://example.org/ns#organization, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://xmlns.com/foaf/0.1/Agent] [http://example.org/ns#organization, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/ns/org#Organization] [http://example.org/ns#o31, http://example.org/ns#lifeExpectancy, \"77.1\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o31, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o31, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o31, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o44, http://example.org/ns#lifeExpectancy, \"79.4\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o44, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o44, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o44, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [f8d0771d7a137ec48a2f52e73c13d7f2, http://purl.org/linked-data/cube#componentAttachment, http://purl.org/linked-data/cube#Slice] [f8d0771d7a137ec48a2f52e73c13d7f2, http://purl.org/linked-data/cube#order, \"3\"^^http://www.w3.org/2001/XMLSchema#integer] [f8d0771d7a137ec48a2f52e73c13d7f2, http://purl.org/linked-data/cube#dimension, http://purl.org/linked-data/sdmx/2009/dimension#sex] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o34] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o33] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o32] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o31] [http://example.org/ns#slice3, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-M] [http://example.org/ns#slice3, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2005-01-01T00:00:00/P3Y] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice3, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#o51, http://example.org/ns#lifeExpectancy, \"77.0\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o51, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o51, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o51, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o23, http://example.org/ns#lifeExpectancy, \"81.3\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o23, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o23, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o23, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o64, http://example.org/ns#lifeExpectancy, \"79.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o64, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o64, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o64, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#sliceByRegion, http://purl.org/linked-data/cube#componentProperty, http://purl.org/linked-data/sdmx/2009/dimension#sex] [http://example.org/ns#sliceByRegion, http://purl.org/linked-data/cube#componentProperty, http://example.org/ns#refPeriod] [http://example.org/ns#sliceByRegion, http://www.w3.org/2000/01/rdf-schema#comment, \"Slice by grouping regions together, fixing sex and time values\"@en] [http://example.org/ns#sliceByRegion, http://www.w3.org/2000/01/rdf-schema#label, \"slice by region\"@en] [http://example.org/ns#sliceByRegion, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#SliceKey] [41848bdc397179ddef8be4faef6c0dfb, http://purl.org/linked-data/cube#componentAttachment, http://purl.org/linked-data/cube#Slice] [41848bdc397179ddef8be4faef6c0dfb, http://purl.org/linked-data/cube#order, \"2\"^^http://www.w3.org/2001/XMLSchema#integer] [41848bdc397179ddef8be4faef6c0dfb, http://purl.org/linked-data/cube#dimension, http://example.org/ns#refPeriod] [http://example.org/ns#o43, http://example.org/ns#lifeExpectancy, \"81.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o43, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o43, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o43, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#refPeriod, http://purl.org/linked-data/cube#concept, http://purl.org/linked-data/sdmx/2009/concept#refPeriod] [http://example.org/ns#refPeriod, http://www.w3.org/2000/01/rdf-schema#range, http://reference.data.gov.uk/def/intervals/Interval] [http://example.org/ns#refPeriod, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://purl.org/linked-data/sdmx/2009/dimension#refPeriod] [http://example.org/ns#refPeriod, http://www.w3.org/2000/01/rdf-schema#label, \"reference period\"@en] [http://example.org/ns#refPeriod, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DimensionProperty] [http://example.org/ns#refPeriod, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o24] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o23] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o22] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o21] [http://example.org/ns#slice2, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-F] [http://example.org/ns#slice2, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2004-01-01T00:00:00/P3Y] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice2, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#refArea, http://purl.org/linked-data/cube#concept, http://purl.org/linked-data/sdmx/2009/concept#refArea] [http://example.org/ns#refArea, http://www.w3.org/2000/01/rdf-schema#range, http://data.ordnancesurvey.co.uk/ontology/admingeo/UnitaryAuthority] [http://example.org/ns#refArea, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://purl.org/linked-data/sdmx/2009/dimension#refArea] [http://example.org/ns#refArea, http://www.w3.org/2000/01/rdf-schema#label, \"reference area\"@en] [http://example.org/ns#refArea, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DimensionProperty] [http://example.org/ns#refArea, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://example.org/ns#o22, http://example.org/ns#lifeExpectancy, \"83.3\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o22, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o22, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o22, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o63, http://example.org/ns#lifeExpectancy, \"81.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o63, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o63, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o63, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o42, http://example.org/ns#lifeExpectancy, \"83.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o42, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o42, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o42, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o14, http://example.org/ns#lifeExpectancy, \"75.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o14, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o14, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o14, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#sliceKey, http://example.org/ns#sliceByRegion] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, 8266bc146e6da610ef9c20efcc1357a6] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, b3f80cdfe27166c45fbdc8d5f4d8e368] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, f8d0771d7a137ec48a2f52e73c13d7f2] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, 41848bdc397179ddef8be4faef6c0dfb] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, 8c14fb31668b6bf5b63c67bc43a12f77] [http://example.org/ns#dsd-le3, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DataStructureDefinition] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o14] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o13] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o12] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o11] [http://example.org/ns#slice1, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-M] [http://example.org/ns#slice1, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2004-01-01T00:00:00/P3Y] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice1, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [8c14fb31668b6bf5b63c67bc43a12f77, http://purl.org/linked-data/cube#order, \"1\"^^http://www.w3.org/2001/XMLSchema#integer] [8c14fb31668b6bf5b63c67bc43a12f77, http://purl.org/linked-data/cube#dimension, http://example.org/ns#refArea] [8266bc146e6da610ef9c20efcc1357a6, http://purl.org/linked-data/cube#componentAttachment, http://purl.org/linked-data/cube#DataSet] [8266bc146e6da610ef9c20efcc1357a6, http://purl.org/linked-data/cube#componentRequired, \"true\"^^http://www.w3.org/2001/XMLSchema#boolean] [8266bc146e6da610ef9c20efcc1357a6, http://purl.org/linked-data/cube#attribute, http://purl.org/linked-data/sdmx/2009/attribute#unitMeasure] [http://example.org/ns#o21, http://example.org/ns#lifeExpectancy, \"80.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o21, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o21, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o21, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o62, http://example.org/ns#lifeExpectancy, \"83.4\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o62, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o62, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o62, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o34, http://example.org/ns#lifeExpectancy, \"75.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o34, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o34, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o34, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/issued, \"2010-08-11\"^^http://www.w3.org/2001/XMLSchema#date] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice1] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/description, \"Life expectancy within Welsh Unitary authorities - extracted from Stats Wales\"@en] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/subject, http://example.org/geo#wales] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice6] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice4] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/sdmx/2009/attribute#unitMeasure, http://dbpedia.org/resource/Year] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#structure, http://example.org/ns#dsd-le3] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice5] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice2] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/subject, http://purl.org/linked-data/sdmx/2009/subject#1.4] [http://example.org/ns#dataset-le3, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DataSet] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/title, \"Life expectancy\"@en] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/subject, http://purl.org/linked-data/sdmx/2009/subject#3.2] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice3] [http://example.org/ns#dataset-le3, http://www.w3.org/2000/01/rdf-schema#comment, \"Life expectancy within Welsh Unitary authorities - extracted from Stats Wales\"@en] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/publisher, http://example.org/ns#organization] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o64] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o63] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o62] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o61] [http://example.org/ns#slice6, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-F] [http://example.org/ns#slice6, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2006-01-01T00:00:00/P3Y] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice6, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#lifeExpectancy, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#lifeExpectancy, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://purl.org/linked-data/sdmx/2009/measure#obsValue] [http://example.org/ns#lifeExpectancy, http://www.w3.org/2000/01/rdf-schema#label, \"life expectancy\"@en] [http://example.org/ns#lifeExpectancy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#MeasureProperty] [http://example.org/ns#lifeExpectancy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://example.org/ns#o41, http://example.org/ns#lifeExpectancy, \"80.9\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o41, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o41, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o41, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o13, http://example.org/ns#lifeExpectancy, \"76.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o13, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o13, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o13, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o54, http://example.org/ns#lifeExpectancy, \"74.9\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o54, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o54, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o54, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [b3f80cdfe27166c45fbdc8d5f4d8e368, http://purl.org/linked-data/cube#measure, http://example.org/ns#lifeExpectancy] [http://example.org/ns#o61, http://example.org/ns#lifeExpectancy, \"81.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o61, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o61, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o61, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o33, http://example.org/ns#lifeExpectancy, \"76.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o33, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o33, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o33, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o54] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o53] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o52] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o51] [http://example.org/ns#slice5, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-M] [http://example.org/ns#slice5, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2006-01-01T00:00:00/P3Y] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice5, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#o12, http://example.org/ns#lifeExpectancy, \"78.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o12, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o12, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o12, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o53, http://example.org/ns#lifeExpectancy, \"76.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o53, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o53, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o53, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o32, http://example.org/ns#lifeExpectancy, \"78.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o32, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o32, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o32, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o44] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o43] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o42] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o41] [http://example.org/ns#slice4, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-F] [http://example.org/ns#slice4, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2005-01-01T00:00:00/P3Y] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice4, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#o11, http://example.org/ns#lifeExpectancy, \"76.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o11, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o11, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o11, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o52, http://example.org/ns#lifeExpectancy, \"78.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o52, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o52, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o52, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o24, http://example.org/ns#lifeExpectancy, \"79.1\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o24, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o24, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o24, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation]>}"
```

```r
SPARQLscript<- '
select * where {
 <http://example.org/ns#o62> ?p ?o .
}    
'

results <- sparql.rdf(store, SPARQLscript )
knitr::kable(results)
```



|p                                               |o                                            |
|:-----------------------------------------------|:--------------------------------------------|
|http://example.org/ns#lifeExpectancy            |83.4                                         |
|http://example.org/ns#refArea                   |http://example.org/geo#cardiff_00pt          |
|http://purl.org/linked-data/cube#dataSet        |http://example.org/ns#dataset-le3            |
|http://www.w3.org/1999/02/22-rdf-syntax-ns#type |http://purl.org/linked-data/cube#Observation |

```r
SPARQLscript<- '
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  
prefix skos: <http://www.w3.org/2004/02/skos/core#>  
prefix prov: <http://www.w3.org/ns/prov#>  
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>  
prefix dcat: <http://www.w3.org/ns/dcat#>  
prefix owl: <http://www.w3.org/2002/07/owl#>  
prefix xsd: <http://www.w3.org/2001/XMLSchema#>  
prefix qb: <http://purl.org/linked-data/cube#>  
prefix pav: <http://purl.org/pav>  
prefix dct: <http://purl.org/dc/terms/>  
 select * where {
?s a qb:Observation  ;
?p ?o .
values (?s) {
( <http://example.org/ns#o62> )
}
 }    
'
results <- sparql.rdf(store, SPARQLscript )
```

# Effect of using the ontology inference

See (https://jena.apache.org/documentation/ontology/#ontology-inference-overview).


```r
exfile <- file.path(system.file("extdata/sample-rdf", "example.ttl", package="rrdfqb") )
store.ontology <- load.rdf( exfile, format="TURTLE")

results.ontology <- sparql.rdf(store.ontology, SPARQLscript )
knitr::kable(results.ontology)
```



|s                         |p                                                       |o                                   |
|:-------------------------|:-------------------------------------------------------|:-----------------------------------|
|http://example.org/ns#o62 |http://example.org/ns#lifeExpectancy                    |83.4                                |
|http://example.org/ns#o62 |http://example.org/ns#refArea                           |http://example.org/geo#cardiff_00pt |
|http://example.org/ns#o62 |qb:dataSet                                              |http://example.org/ns#dataset-le3   |
|http://example.org/ns#o62 |rdf:type                                                |qb:Observation                      |
|http://example.org/ns#o62 |http://purl.org/linked-data/sdmx/2009/dimension#refArea |http://example.org/geo#cardiff_00pt |
|http://example.org/ns#o62 |http://purl.org/linked-data/sdmx/2009/measure#obsValue  |83.4                                |

The result shows inferred triples, added with respect to the query above.

# Load, normalize phase 1, normalize phase 2, and finally dump the graph

RDF data cube normalization algorihtms can be applied
(http://www.w3.org/TR/vocab-data-cube/#normalize-algorithm).
Note: the `rrdfancillary` package must be installed in R to get this to work.


```r
library(rrdfancillary)

exfile <- file.path(system.file("extdata/sample-rdf", "example.ttl", package="rrdfqb") )
store <- new.rdf(ontology=FALSE)
load.rdf( exfile, format="TURTLE", store)
```

```
## [1] "Java-Object{<ModelCom   {eg:organization @rdfs:label \"Example org\"@en; eg:organization @rdf:type foaf:Agent; eg:organization @rdf:type org:Organization; eg:o31 @eg:lifeExpectancy \"77.1\"^^http://www.w3.org/2001/XMLSchema#decimal; eg:o31 @eg:refArea ex-geo:newport_00pr; eg:o31 @qb:dataSet eg:dataset-le3; eg:o31 @rdf:type qb:Observation; eg:o44 @eg:lifeExpectancy \"79.4\"^^http://www.w3.org/2001/XMLSchema#decimal; eg:o44 @eg:refArea ex-geo:merthyr_tdfil_00ph; eg:o44 @qb:dataSet eg:dataset-le3; eg:o44 @rdf:type qb:Observation; 7fdabc9d6f8af1196c2b7e6f04529e3f @qb:componentAttachment qb:Slice; 7fdabc9d6f8af1196c2b7e6f04529e3f @qb:order \"3\"^^http://www.w3.org/2001/XMLSchema#integer; 7fdabc9d6f8af1196c2b7e6f04529e3f @qb:dimension sdmx-dimension:sex; eg:slice3 @qb:observation eg:o34; eg:slice3 @qb:observation eg:o33; eg:slice3 @qb:observation eg:o32...} |  [http://example.org/ns#organization, http://www.w3.org/2000/01/rdf-schema#label, \"Example org\"@en] [http://example.org/ns#organization, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://xmlns.com/foaf/0.1/Agent] [http://example.org/ns#organization, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/ns/org#Organization] [http://example.org/ns#o31, http://example.org/ns#lifeExpectancy, \"77.1\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o31, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o31, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o31, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o44, http://example.org/ns#lifeExpectancy, \"79.4\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o44, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o44, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o44, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [7fdabc9d6f8af1196c2b7e6f04529e3f, http://purl.org/linked-data/cube#componentAttachment, http://purl.org/linked-data/cube#Slice] [7fdabc9d6f8af1196c2b7e6f04529e3f, http://purl.org/linked-data/cube#order, \"3\"^^http://www.w3.org/2001/XMLSchema#integer] [7fdabc9d6f8af1196c2b7e6f04529e3f, http://purl.org/linked-data/cube#dimension, http://purl.org/linked-data/sdmx/2009/dimension#sex] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o34] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o33] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o32] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#observation, http://example.org/ns#o31] [http://example.org/ns#slice3, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-M] [http://example.org/ns#slice3, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2005-01-01T00:00:00/P3Y] [http://example.org/ns#slice3, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice3, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [3fa912101d4e1af39d08d092ddbdd707, http://purl.org/linked-data/cube#order, \"1\"^^http://www.w3.org/2001/XMLSchema#integer] [3fa912101d4e1af39d08d092ddbdd707, http://purl.org/linked-data/cube#dimension, http://example.org/ns#refArea] [http://example.org/ns#o51, http://example.org/ns#lifeExpectancy, \"77.0\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o51, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o51, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o51, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o23, http://example.org/ns#lifeExpectancy, \"81.3\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o23, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o23, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o23, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o64, http://example.org/ns#lifeExpectancy, \"79.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o64, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o64, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o64, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#sliceByRegion, http://purl.org/linked-data/cube#componentProperty, http://purl.org/linked-data/sdmx/2009/dimension#sex] [http://example.org/ns#sliceByRegion, http://purl.org/linked-data/cube#componentProperty, http://example.org/ns#refPeriod] [http://example.org/ns#sliceByRegion, http://www.w3.org/2000/01/rdf-schema#comment, \"Slice by grouping regions together, fixing sex and time values\"@en] [http://example.org/ns#sliceByRegion, http://www.w3.org/2000/01/rdf-schema#label, \"slice by region\"@en] [http://example.org/ns#sliceByRegion, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#SliceKey] [http://example.org/ns#o43, http://example.org/ns#lifeExpectancy, \"81.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o43, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o43, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o43, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#refPeriod, http://purl.org/linked-data/cube#concept, http://purl.org/linked-data/sdmx/2009/concept#refPeriod] [http://example.org/ns#refPeriod, http://www.w3.org/2000/01/rdf-schema#range, http://reference.data.gov.uk/def/intervals/Interval] [http://example.org/ns#refPeriod, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://purl.org/linked-data/sdmx/2009/dimension#refPeriod] [http://example.org/ns#refPeriod, http://www.w3.org/2000/01/rdf-schema#label, \"reference period\"@en] [http://example.org/ns#refPeriod, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DimensionProperty] [http://example.org/ns#refPeriod, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o24] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o23] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o22] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#observation, http://example.org/ns#o21] [http://example.org/ns#slice2, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-F] [http://example.org/ns#slice2, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2004-01-01T00:00:00/P3Y] [http://example.org/ns#slice2, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice2, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#refArea, http://purl.org/linked-data/cube#concept, http://purl.org/linked-data/sdmx/2009/concept#refArea] [http://example.org/ns#refArea, http://www.w3.org/2000/01/rdf-schema#range, http://data.ordnancesurvey.co.uk/ontology/admingeo/UnitaryAuthority] [http://example.org/ns#refArea, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://purl.org/linked-data/sdmx/2009/dimension#refArea] [http://example.org/ns#refArea, http://www.w3.org/2000/01/rdf-schema#label, \"reference area\"@en] [http://example.org/ns#refArea, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DimensionProperty] [http://example.org/ns#refArea, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://example.org/ns#o22, http://example.org/ns#lifeExpectancy, \"83.3\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o22, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o22, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o22, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o63, http://example.org/ns#lifeExpectancy, \"81.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o63, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o63, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o63, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o42, http://example.org/ns#lifeExpectancy, \"83.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o42, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o42, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o42, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o14, http://example.org/ns#lifeExpectancy, \"75.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o14, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o14, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o14, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#sliceKey, http://example.org/ns#sliceByRegion] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, 5335f036046311bd18397b1db9ee28f5] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, eb236d97f0bf3b62aaa84404e46654df] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, 7fdabc9d6f8af1196c2b7e6f04529e3f] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, 1695ce54b0a807fdea840add8110828a] [http://example.org/ns#dsd-le3, http://purl.org/linked-data/cube#component, 3fa912101d4e1af39d08d092ddbdd707] [http://example.org/ns#dsd-le3, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DataStructureDefinition] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o14] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o13] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o12] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#observation, http://example.org/ns#o11] [http://example.org/ns#slice1, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-M] [http://example.org/ns#slice1, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2004-01-01T00:00:00/P3Y] [http://example.org/ns#slice1, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice1, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#o21, http://example.org/ns#lifeExpectancy, \"80.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o21, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o21, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o21, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o62, http://example.org/ns#lifeExpectancy, \"83.4\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o62, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o62, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o62, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o34, http://example.org/ns#lifeExpectancy, \"75.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o34, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o34, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o34, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/issued, \"2010-08-11\"^^http://www.w3.org/2001/XMLSchema#date] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice1] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/description, \"Life expectancy within Welsh Unitary authorities - extracted from Stats Wales\"@en] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/subject, http://example.org/geo#wales] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice6] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice4] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/sdmx/2009/attribute#unitMeasure, http://dbpedia.org/resource/Year] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#structure, http://example.org/ns#dsd-le3] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice5] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice2] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/subject, http://purl.org/linked-data/sdmx/2009/subject#1.4] [http://example.org/ns#dataset-le3, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#DataSet] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/title, \"Life expectancy\"@en] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/subject, http://purl.org/linked-data/sdmx/2009/subject#3.2] [http://example.org/ns#dataset-le3, http://purl.org/linked-data/cube#slice, http://example.org/ns#slice3] [http://example.org/ns#dataset-le3, http://www.w3.org/2000/01/rdf-schema#comment, \"Life expectancy within Welsh Unitary authorities - extracted from Stats Wales\"@en] [http://example.org/ns#dataset-le3, http://purl.org/dc/terms/publisher, http://example.org/ns#organization] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o64] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o63] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o62] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#observation, http://example.org/ns#o61] [http://example.org/ns#slice6, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-F] [http://example.org/ns#slice6, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2006-01-01T00:00:00/P3Y] [http://example.org/ns#slice6, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice6, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#lifeExpectancy, http://www.w3.org/2000/01/rdf-schema#range, http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#lifeExpectancy, http://www.w3.org/2000/01/rdf-schema#subPropertyOf, http://purl.org/linked-data/sdmx/2009/measure#obsValue] [http://example.org/ns#lifeExpectancy, http://www.w3.org/2000/01/rdf-schema#label, \"life expectancy\"@en] [http://example.org/ns#lifeExpectancy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#MeasureProperty] [http://example.org/ns#lifeExpectancy, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://www.w3.org/1999/02/22-rdf-syntax-ns#Property] [http://example.org/ns#o41, http://example.org/ns#lifeExpectancy, \"80.9\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o41, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o41, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o41, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o13, http://example.org/ns#lifeExpectancy, \"76.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o13, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o13, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o13, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o54, http://example.org/ns#lifeExpectancy, \"74.9\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o54, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o54, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o54, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [1695ce54b0a807fdea840add8110828a, http://purl.org/linked-data/cube#componentAttachment, http://purl.org/linked-data/cube#Slice] [1695ce54b0a807fdea840add8110828a, http://purl.org/linked-data/cube#order, \"2\"^^http://www.w3.org/2001/XMLSchema#integer] [1695ce54b0a807fdea840add8110828a, http://purl.org/linked-data/cube#dimension, http://example.org/ns#refPeriod] [http://example.org/ns#o61, http://example.org/ns#lifeExpectancy, \"81.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o61, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o61, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o61, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o33, http://example.org/ns#lifeExpectancy, \"76.5\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o33, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o33, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o33, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [5335f036046311bd18397b1db9ee28f5, http://purl.org/linked-data/cube#componentAttachment, http://purl.org/linked-data/cube#DataSet] [5335f036046311bd18397b1db9ee28f5, http://purl.org/linked-data/cube#componentRequired, \"true\"^^http://www.w3.org/2001/XMLSchema#boolean] [5335f036046311bd18397b1db9ee28f5, http://purl.org/linked-data/cube#attribute, http://purl.org/linked-data/sdmx/2009/attribute#unitMeasure] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o54] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o53] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o52] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#observation, http://example.org/ns#o51] [http://example.org/ns#slice5, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-M] [http://example.org/ns#slice5, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2006-01-01T00:00:00/P3Y] [http://example.org/ns#slice5, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice5, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#o12, http://example.org/ns#lifeExpectancy, \"78.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o12, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o12, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o12, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o53, http://example.org/ns#lifeExpectancy, \"76.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o53, http://example.org/ns#refArea, http://example.org/geo#monmouthshire_00pp] [http://example.org/ns#o53, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o53, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o32, http://example.org/ns#lifeExpectancy, \"78.6\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o32, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o32, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o32, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o44] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o43] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o42] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#observation, http://example.org/ns#o41] [http://example.org/ns#slice4, http://purl.org/linked-data/sdmx/2009/dimension#sex, http://purl.org/linked-data/sdmx/2009/code#sex-F] [http://example.org/ns#slice4, http://example.org/ns#refPeriod, http://reference.data.gov.uk/id/gregorian-interval/2005-01-01T00:00:00/P3Y] [http://example.org/ns#slice4, http://purl.org/linked-data/cube#sliceStructure, http://example.org/ns#sliceByRegion] [http://example.org/ns#slice4, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Slice] [http://example.org/ns#o11, http://example.org/ns#lifeExpectancy, \"76.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o11, http://example.org/ns#refArea, http://example.org/geo#newport_00pr] [http://example.org/ns#o11, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o11, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [http://example.org/ns#o52, http://example.org/ns#lifeExpectancy, \"78.7\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o52, http://example.org/ns#refArea, http://example.org/geo#cardiff_00pt] [http://example.org/ns#o52, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o52, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation] [eb236d97f0bf3b62aaa84404e46654df, http://purl.org/linked-data/cube#measure, http://example.org/ns#lifeExpectancy] [http://example.org/ns#o24, http://example.org/ns#lifeExpectancy, \"79.1\"^^http://www.w3.org/2001/XMLSchema#decimal] [http://example.org/ns#o24, http://example.org/ns#refArea, http://example.org/geo#merthyr_tdfil_00ph] [http://example.org/ns#o24, http://purl.org/linked-data/cube#dataSet, http://example.org/ns#dataset-le3] [http://example.org/ns#o24, http://www.w3.org/1999/02/22-rdf-syntax-ns#type, http://purl.org/linked-data/cube#Observation]>}"
```

```r
normalize.phase.1.file<- file.path(system.file("extdata/cube-vocabulary-rdf", "normalize-algorithm-phase-1.ru", package="rrdfqb") )
UpdateNormPhase1 <- paste(readLines(normalize.phase.1.file), collapse="\n")
cat(UpdateNormPhase1,"\n")
```

```
## # Phase 1: Type and property closure
## # http://www.w3.org/TR/vocab-data-cube/#normalize-algorithm
## 
## PREFIX rdf:            <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
## PREFIX qb:             <http://purl.org/linked-data/cube#>
## 
## INSERT {
##     ?o rdf:type qb:Observation .
## } WHERE {
##     [] qb:observation ?o .
## };
## 
## INSERT {
##     ?o  rdf:type qb:Observation .
##     ?ds rdf:type qb:DataSet .
## } WHERE {
##     ?o qb:dataSet ?ds .
## };
## 
## INSERT {
##     ?s rdf:type qb:Slice .
## } WHERE {
##     [] qb:slice ?s.
## };
## 
## INSERT {
##     ?cs qb:componentProperty ?p .
##     ?p  rdf:type qb:DimensionProperty .
## } WHERE {
##     ?cs qb:dimension ?p .
## };
## 
## INSERT {
##     ?cs qb:componentProperty ?p .
##     ?p  rdf:type qb:MeasureProperty .
## } WHERE {
##     ?cs qb:measure ?p .
## };
## 
## INSERT {
##     ?cs qb:componentProperty ?p .
##     ?p  rdf:type qb:AttributeProperty .
## } WHERE {
##     ?cs qb:attribute ?p .
## }
```

```r
update.rdf( store, UpdateNormPhase1 )
```

```
## [1] TRUE
```

```r
normalize.phase.2.file<- file.path(system.file("extdata/cube-vocabulary-rdf", "normalize-algorithm-phase-2.ru", package="rrdfqb") )
UpdateNormPhase2 <- paste(readLines(normalize.phase.2.file), collapse="\n")
cat(UpdateNormPhase2,"\n")
```

```
## # Phase 2: Push down attachment levels
## # http://www.w3.org/TR/vocab-data-cube/#normalize-algorithm
## 
## PREFIX qb:             <http://purl.org/linked-data/cube#>
## 
## # Dataset attachments
## INSERT {
##     ?obs  ?comp ?value
## } WHERE {
##     ?spec    qb:componentProperty ?comp ;
##              qb:componentAttachment qb:DataSet .
##     ?dataset qb:structure [qb:component ?spec];
##              ?comp ?value .
##     ?obs     qb:dataSet ?dataset.
## };
## 
## # Slice attachments
## INSERT {
##     ?obs  ?comp ?value
## } WHERE {
##     ?spec    qb:componentProperty ?comp;
##              qb:componentAttachment qb:Slice .
##     ?dataset qb:structure [qb:component ?spec];
##              qb:slice ?slice .
##     ?slice ?comp ?value;
##            qb:observation ?obs .
## };
## 
## # Dimension values on slices
## INSERT {
##     ?obs  ?comp ?value
## } WHERE {
##     ?spec    qb:componentProperty ?comp .
##     ?comp a  qb:DimensionProperty .
##     ?dataset qb:structure [qb:component ?spec];
##              qb:slice ?slice .
##     ?slice ?comp ?value;
##            qb:observation ?obs .
## }
```

```r
update.rdf( store, UpdateNormPhase2 )
```

```
## [1] TRUE
```

```r
normalizedfile<- file.path(system.file("extdata/sample-rdf", package="rrdfqb"), "example-normalized.ttl"  )
save.rdf( store, normalizedfile, format="TURTLE")
```

```
## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqb/inst/extdata/sample-rdf/example-normalized.ttl"
```


# Update example cube using Fuseki
Using Fusiki to do the update.

    FUSEKI_HOME=/opt/apache-jena-fuseki-2.3.1/
    (${FUSEKI_HOME}fuseki-server --mem --update /ex2) &
The `--men` creates in memory-store,  `--update` enables updating operation and `/ex2` is the name of the dataset.

ToDo(MJA): add storing PID in file (`echo $$ > fuseki.pid; `), and redirecting output from fuseki.

Fuseki will re-use configuration files - so be sure of the contents of the run directory.

To load, normalize phase 1, normalize phase 2, and finally dump the graph
    ${FUSEKI_HOME}bin/s-put http://localhost:3030/ex2/data default ../sample-rdf/example.ttl
    ${FUSEKI_HOME}bin/s-update --server=http://localhost:3030/ex2/update --update=../cube-vocabulary-rdf/normalize-algorithm-phase-1.ru 
    ${FUSEKI_HOME}bin/s-update --server=http://localhost:3030/ex2/update --update=../cube-vocabulary-rdf/normalize-algorithm-phase-2.ru 
    ${FUSEKI_HOME}bin/s-get http://localhost:3030/ex2/get default  > ../sample-rdf/example-normalize-with-fuseki.ttl

## Using jena 2.13
This was successfull in december 2015. The approach relies on a not recent version of jena, so it is not investigated further.

    /opt/apache-jena-2.13.0/arq --desc=jena-assambler.ttl  "select * where {?s ?p ?o} limit 10"
    /opt/apache-jena-2.13.0/bin/update --desc=jena-assambler.ttl --update=normalize-algorithm-phase-1.ru --dump
	/opt/apache-jena-2.13.0/update --desc=jena-assambler.ttl --update=normalize-algorithm-phase-2.ru --verbose --debug

## Using jena 3.0.0
This does not work with jena 3.0.0 in december 2015.

	/opt/apache-jena-3.0.0/bin/tdbloader --loc=DB example.ttl 
	arq --desc=tdb-assembler.ttl  "select * where {?s ?p ?o} limit 10"


## Fuseki with customized  configuration file
Start fuseki to create the configuration files.

	(FUSEKI_HOME=/opt/apache-jena-fuseki-2.3.0 /opt/apache-jena-fuseki-2.3.0/fuseki-server )

In directory run/configuration add configuration for ex endpoint using the filename run/configuration/ex.ttl as:

	@prefix :        <#> .
	@prefix fuseki:  <http://jena.apache.org/fuseki#> .
	@prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
	@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
	@prefix tdb:     <http://jena.hpl.hp.com/2008/tdb#> .
	@prefix ja:      <http://jena.hpl.hp.com/2005/11/Assembler#> .
    ## ---------------------------------------------------------------
    ## Updatable TDB dataset with all services enabled.
    <#service_tdb_all> rdf:type fuseki:Service ;
    rdfs:label                      "TDB ex" ;
    fuseki:name                     "ex" ;
    fuseki:serviceQuery             "query" ;
    fuseki:serviceQuery             "sparql" ;
    fuseki:serviceUpdate            "update" ;
    fuseki:serviceUpload            "upload" ;
    fuseki:serviceReadWriteGraphStore      "data" ;
    # A separate read-only graph store endpoint:
    fuseki:serviceReadGraphStore       "get" ;
    fuseki:dataset           <#tdb_dataset_readwrite> ;
    .
    <#tdb_dataset_readwrite> rdf:type      tdb:DatasetTDB ;
    tdb:location "run/databases/ex" ;
    ##ja:context [ ja:cxtName "arq:queryTimeout" ;  ja:cxtValue "3000" ] ;
    ##tdb:unionDefaultGraph true ;
    .

Note - all files in run/configuration/ are read - so do not leave backup files in the directory.

Start again:
    (FUSEKI_HOME=/opt/apache-jena-fuseki-2.3.0 /opt/apache-jena-fuseki-2.3.0/fuseki-server )

To run update query

    (FUSEKI_HOME=/opt/apache-jena-fuseki-2.3.0 /opt/apache-jena-fuseki-2.3.0/bin/s-update --server=http://localhost:3030/ex/update --update=normalize-algorithm-phase-1.ru )
    (FUSEKI_HOME=/opt/apache-jena-fuseki-2.3.0 /opt/apache-jena-fuseki-2.3.0/bin/s-update --server=http://localhost:3030/ex/update --update=normalize-algorithm-phase-2.ru )

To dump the graph
    (FUSEKI_HOME=/opt/apache-jena-fuseki-2.3.0 /opt/apache-jena-fuseki-2.3.0/bin/s-get http://localhost:3030/ex/get default )



