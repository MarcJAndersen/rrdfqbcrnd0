Create turtle version of example files
======================================

This script creates the result and codelist for a simple DEMO table.

``` r
library(rrdfqb)
library(rrdfqbcrnd0)
library(rrdfcdisc)
devtools::load_all(pkg="../..")
```

    ## Loading rrdfqbcrndex

All files are stored in the directory

``` r
targetDir<- system.file("extdata/sample-rdf", package="rrdfqbcrndex")
(targetDir)
```

    ## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf"

RDF data cubes specified in workbook
------------------------------------

``` r
RDFCubeWorkbook<- system.file("extdata/sample-cfg", "RDFCubeWorkbook.xlsx", package="rrdfqbcrndex")
(RDFCubeWorkbook)
```

    ## [1] "/home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-cfg/RDFCubeWorkbook.xlsx"

``` r
dm.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "DM" )
```

    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  trt01a 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  trt01a 
    ## codeType:  SDTM 
    ## nciDomainValue:  C66731 
    ## dimName:  sex 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  sex 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  saffl 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  saffl 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  procedure 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  procedure 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  factor 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  factor 
    ## codeType:  SDTM 
    ## nciDomainValue:  C74457 
    ## dimName:  race 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  race

``` r
cat("DM cube stored as ", dm.cube.fn, "\n")
```

    ## DM cube stored as  /tmp/Rtmp2EsEh7/DC-DM-R-V-0-5-2.ttl

``` r
targetFile<- file.path(targetDir,"DC-DM-sample.ttl")

if (file.copy( dm.cube.fn, targetFile, overwrite=TRUE)) {
  cat("DM cube copied to ", normalizePath(targetFile), "\n")
}
```

    ## DM cube copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DC-DM-sample.ttl

``` r
ae.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "AE" )
```

    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  trta 
    ## underlDataSetName:  ADAE 
    ## remote.endpoint:  
    ## dimName  trta 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  saffl 
    ## underlDataSetName:  ADAE 
    ## remote.endpoint:  
    ## dimName  saffl 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  aesoc 
    ## underlDataSetName:  ADAE 
    ## remote.endpoint:  
    ## dimName  aesoc 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  aedecod 
    ## underlDataSetName:  ADAE 
    ## remote.endpoint:  
    ## dimName  aedecod 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  procedure 
    ## underlDataSetName:  ADAE 
    ## remote.endpoint:  
    ## dimName  procedure 
    ## codeType:  DATA 
    ## nciDomainValue:  NA 
    ## dimName:  factor 
    ## underlDataSetName:  ADAE 
    ## remote.endpoint:  
    ## dimName  factor

``` r
cat("AE cube stored as ", ae.cube.fn, "\n")
```

    ## AE cube stored as  /tmp/Rtmp2EsEh7/DC-AE-R-V-0-5-2.ttl

``` r
targetFile<- file.path(targetDir,"DC-AE-sample.ttl")
if (file.copy( ae.cube.fn, targetFile, overwrite=TRUE)) {
  cat("AE cube copied to ", normalizePath(targetFile), "\n")
}
```

    ## AE cube copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DC-AE-sample.ttl

RDF data cube in csv files
--------------------------

``` r
demoObsDataCsvFn<- system.file("extdata/sample-cfg", "demo.AR.csv", package="rrdfqbcrndex")
demoObsData <- read.csv(demoObsDataCsvFn,stringsAsFactors=FALSE)

##TODO add measurefmt; quick hack - affects vignettes/cube-from-workbook.Rmd and
##TODO inst/data-raw/create-qb-examples-as-ttl.Rmd
if (!( "measurefmt" %in% names(demoObsData))) {
demoObsData$measurefmt<- "%6.1f"
demoObsData$measurefmt[ demoObsData$procedure %in% c("n", "nmiss", "count") ]<- "%6.0f"
## sprintf( demoObsData$measurefmt, demoObsData$measure)
}

demoMetaDataCsvFn<- system.file("extdata/sample-cfg", "DEMO-Components.csv", package="rrdfqbcrndex")
demoMetaData <- read.csv(demoMetaDataCsvFn,stringsAsFactors=FALSE)

demo.cube.fn<- BuildCubeFromDataFrames(demoMetaData, demoObsData )
```

    ## codeType:  DATA 
    ## nciDomainValue:   
    ## dimName:  trt01a 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  trt01a 
    ## codeType:  SDTM 
    ## nciDomainValue:  C66731 
    ## dimName:  sex 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  sex 
    ## codeType:  SDTM 
    ## nciDomainValue:  C74457 
    ## dimName:  race 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  race 
    ## codeType:  DATA 
    ## nciDomainValue:   
    ## dimName:  ethnic 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  ethnic 
    ## codeType:  DATA 
    ## nciDomainValue:   
    ## dimName:  agegr1 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  agegr1 
    ## codeType:  DATA 
    ## nciDomainValue:   
    ## dimName:  procedure 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  procedure 
    ## codeType:  DATA 
    ## nciDomainValue:   
    ## dimName:  factor 
    ## underlDataSetName:  ADSL 
    ## remote.endpoint:  
    ## dimName  factor

``` r
cat("DEMO cube stored as ", normalizePath(demo.cube.fn), "\n")
```

    ## DEMO cube stored as  /tmp/Rtmp2EsEh7/DC-DEMO-R-V-0-5-2.ttl

``` r
targetFile<- file.path(targetDir,"DC-DEMO-sample.ttl")

if (file.copy( demo.cube.fn, targetFile, overwrite=TRUE)) {
   cat("DEMO cube copied to ", normalizePath(targetFile), "\n")
 }
```

    ## DEMO cube copied to  /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DC-DEMO-sample.ttl
