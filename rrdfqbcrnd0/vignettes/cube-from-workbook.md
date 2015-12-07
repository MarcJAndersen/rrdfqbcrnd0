---
title: "Data qubes from Workbook"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-12-08"
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
## Error in eval(expr, envir, enclos): could not find function "BuildCubeFromWorkbook"
```

```r
cat("DM cube stored as ", normalizePath(dm.cube.fn), "\n")
```

```
## Error in path.expand(path): object 'dm.cube.fn' not found
```

```r
ae.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "AE" )
```

```
## Error in eval(expr, envir, enclos): could not find function "BuildCubeFromWorkbook"
```

```r
cat("AE cube stored as ", normalizePath(ae.cube.fn), "\n")
```

```
## Error in path.expand(path): object 'ae.cube.fn' not found
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
```

```
## Error in eval(expr, envir, enclos): could not find function "BuildCubeFromDataFrames"
```

```r
cat("DEMO cube stored as ", normalizePath(demo.cube.fn), "\n")
```

```
## Error in path.expand(path): object 'demo.cube.fn' not found
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
```

```
## Error in eval(expr, envir, enclos): object 'demo.cube.fn' not found
```

```r
# dataCubeFile<- ae.cube.fn
# dataCubeFile<- dm.cube.fn
```

The rest of the code only depends on the value of dataCubeFile.

```r
checkCube <- new.rdf()  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= checkCube)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : object 'dataCubeFile' not found
```

```r
summarize.rdf(checkCube)
```

```
## [1] "Number of triples: 40"
```

## Get the values in the cube
First set values for accessing the cube.

```r
dsdName<- GetDsdNameFromCube( checkCube )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDsdNameFromCube"
```

```r
domainName<- GetDomainNameFromCube( checkCube )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDomainNameFromCube"
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetForSparqlPrefix"
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
```

```
## Error in paste(forsparqlprefix, "\nselect *\nwhere {?s ?p ?o .}\nlimit 10\n", : object 'forsparqlprefix' not found
```

```r
observations1<- sparql.rdf(checkCube, observations1Rq  )
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'observations1Rq' not found
```

```r
knitr::kable(head(observations1))
```

```
## Error in head(observations1): error in evaluating the argument 'x' in selecting a method for function 'head': Error: object 'observations1' not found
```

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
```

```
## Error in paste(forsparqlprefix, "\nselect *\nwhere { ?s a qb:Observation ; ?p ?o .}\nlimit 10\n", : object 'forsparqlprefix' not found
```

```r
observations2<- sparql.rdf(checkCube, observations2Rq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'observations2Rq' not found
```

```r
knitr::kable(head(observations2, 10))
```

```
## Error in head(observations2, 10): error in evaluating the argument 'x' in selecting a method for function 'head': Error: object 'observations2' not found
```

## Get cube components

The cube components are shown in the next output.

```r
componentsRq<- GetComponentSparqlQuery( forsparqlprefix, dsdName )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetComponentSparqlQuery"
```

```r
components<- as.data.frame(sparql.rdf(checkCube, componentsRq), stringsAsFactors=FALSE)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'componentsRq' not found
```

```r
components$vn<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:","",components$p)
```

```
## Error in gsub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", components$p): object 'components' not found
```

```r
knitr::kable(components[,c("vn", "label")])
```

```
## Error in is.data.frame(x): object 'components' not found
```

The codelists are shown in the next output.

```r
codelistsRq<- GetCodeListSparqlQuery( forsparqlprefix, dsdName )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetCodeListSparqlQuery"
```

```r
codelists<- as.data.frame(sparql.rdf(checkCube, codelistsRq), stringsAsFactors=FALSE)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'codelistsRq' not found
```

```r
codelists$vn<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:","",codelists$p)
```

```
## Error in gsub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", codelists$p): object 'codelists' not found
```

```r
codelists$clc<- gsub("code:","",codelists$cl)
```

```
## Error in gsub("code:", "", codelists$cl): object 'codelists' not found
```

```r
knitr::kable(codelists[,c("vn", "clc", "prefLabel")])
```

```
## Error in is.data.frame(x): object 'codelists' not found
```


The dimensions are shown in the next output.

```r
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDimensionsSparqlQuery"
```

```r
dimensions<- sparql.rdf(checkCube, dimensionsRq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'dimensionsRq' not found
```

```r
knitr::kable(dimensions)
```

```
## Error in is.data.frame(x): object 'dimensions' not found
```

Then the attributes as shown in the next output.

```r
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetAttributesSparqlQuery"
```

```r
attributes<- sparql.rdf(checkCube, attributesRq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'attributesRq' not found
```

```r
knitr::kable(attributes)
```

```
## Error in as.data.frame.default(x): cannot coerce class ""function"" to a data.frame
```

## Get observations
And finally the SPARQL query for observations, showing only the first 10 observations.

```r
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetObservationsSparqlQuery"
```

```r
cat(observationsRq)
```

```
## Error in cat(observationsRq): object 'observationsRq' not found
```

```r
observations<- as.data.frame(sparql.rdf(checkCube, observationsRq ), stringsAsFactors=FALSE)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'observationsRq' not found
```

```r
knitr::kable(observations[ 1:10 ,
   c(paste0(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", dimensions), "value"),sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", attributes), "measure")])
```

```
## Error in is.data.frame(x): object 'observations' not found
```

## Get observations with labels

The SPARQL query for observations with labels for variables, showing only the first 10 observations.

```r
observationsDescriptionRq<- GetObservationsWithDescriptionSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetObservationsWithDescriptionSparqlQuery"
```

```r
cat(observationsDescriptionRq)
```

```
## Error in cat(observationsDescriptionRq): object 'observationsDescriptionRq' not found
```

```r
observationsDesc<- as.data.frame(sparql.rdf(checkCube, observationsDescriptionRq ), stringsAsFactors=FALSE)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'observationsDescriptionRq' not found
```

```r
knitr::kable(observationsDesc[ 1:10 ,
     c(paste0(rep(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", dimensions),each=3),
       c("label", "value", "IRI")),
       sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", attributes), "measure", "measureIRI"
       )]
       )
```

```
## Error in is.data.frame(x): object 'observationsDesc' not found
```

## Get formular expression


```r
GetFormularFromCube( checkCube, forsparqlprefix )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetFormularFromCube"
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
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDimAttrMeasInWorkbookFormatSparqlQuery"
```

```r
dimensionsattr<- sparql.rdf(checkCube, workbookDimAttrMeasRq )
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'workbookDimAttrMeasRq' not found
```

```r
knitr::kable(dimensionsattr)
```

```
## Error in is.data.frame(x): object 'dimensionsattr' not found
```

Secondly, get the metadata for the workbook. To get the metadata
element "cubeVersion" a workaround is needed. The cubeversion is not
directly available but from dcat:distribution derived as the result of
paste0("DC-", domainName,"-R-V-",cubeVersion,".ttl").


```r
workbookMetadataRq<- GetMetaDataInWorkbookFormatSparqlQuery( forsparqlprefix )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetMetaDataInWorkbookFormatSparqlQuery"
```

```r
metadata<- sparql.rdf(checkCube, workbookMetadataRq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : object 'workbookMetadataRq' not found
```

```r
cubeVersion<- gsub("-",".", gsub("DC-.*-R-V-([^\\.]+).ttl", "\\1", metadata[ metadata[,2]=="distribution", "compLabel"], perl=TRUE))
```

```
## Error in gsub("DC-.*-R-V-([^\\.]+).ttl", "\\1", metadata[metadata[, 2] == : object 'metadata' not found
```

```r
metadataX<- rbind(metadata, cbind(compType="metadata", compName="cubeVersion", compLabel=cubeVersion))
```

```
## Error in rbind(metadata, cbind(compType = "metadata", compName = "cubeVersion", : object 'metadata' not found
```

```r
knitr::kable(metadataX)
```

```
## Error in is.data.frame(x): object 'metadataX' not found
```

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
## [1] rrdfqbcrnd0_0.1.7 rrdf_2.1.2        rrdflibs_1.4.0    RCurl_1.95-4.7   
## [5] bitops_1.0-6      xlsx_0.5.7        xlsxjars_0.6.1    rJava_0.9-7      
## 
## loaded via a namespace (and not attached):
## [1] magrittr_1.5  formatR_1.2.1 tools_3.2.2   stringi_1.0-1 highr_0.5.1  
## [6] knitr_1.11    stringr_1.0.0 evaluate_0.8
```

