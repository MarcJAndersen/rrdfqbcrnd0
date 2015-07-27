---
title: "Store CDISC RDF as RRDF data model"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-07-27"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Store CDISC RDF as RRDF data model}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---



# Preliminaries


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

## Directory for storing rdf.cdisc.org and RDF data cube specification


```bash
echo change below to suit your setup
export CDISCRDF_HOME=~/projects/phrmwg
```

## Make local copy of the rdf.cdisc.org
Here is how to make a local copy of the rdf.cdisc.org - with Bash Shell on Linux.
In my setup the ~/projects/phrmwg directory contains a git pull of rdf.cdisc.org.


```bash
echo only if directory does not exist 
mkdir -p ${CDISCRDF_HOME}  
cd ${CDISCRDF_HOME}

git clone https://github.com/phuse-org/rdf.cdisc.org.git

mkdir rdf-data-cube
cd rdf-data-cube
wget http://publishing-statistical-data.googlecode.com/svn/trunk/specs/src/main/vocab/cube.ttl
```

## Finding the files

Replace directory for find with the appropriate directory for your setup.
Here the the 
Also change below in R code.

```
find ${CDISCRDF_HOME} -name "*.rdf" -o -name "*.owl" -o -name "*.ttl"
```

The result of the function call Get.filenames.for.cdisc.standards() in
the rrdfqbcrdn0 package is intended to match the output from find.

```r
Get.filenames.for.cdisc.standards()
```

Note: this is not a straightforward way to do it.

# R-code

## Setup 

```r
library(rrdf)
library(tools)
```

## Create local version using RRDF from local directory conting rdf.cdisc.org

To conserve space in the R package the files are located outside the package.

The files are stored beneath the directory given by fileStemDirectory. The path relative to fileStemDirectory is stored in filesToLoad.


```r
fileStemDirectory<- "~/projects/phrmwg"

filesToLoad<- c(
"rdf.cdisc.org/resources/w3.org/skos.rdf", 
"rdf.cdisc.org/resources/dublincore.org/dcam.rdf", 
"rdf.cdisc.org/resources/dublincore.org/dcelements.rdf", 
"rdf.cdisc.org/resources/dublincore.org/dcterms.rdf", 
"rdf.cdisc.org/terminology-2013-06-28/glossary-terminology.owl", 
"rdf.cdisc.org/terminology-2013-06-28/cdash-terminology.owl", 
"rdf.cdisc.org/terminology-2013-06-28/sdtm-terminology.owl", 
"rdf.cdisc.org/terminology-2013-06-28/qs-terminology.owl", 
"rdf.cdisc.org/terminology-2013-06-28/send-terminology.owl", 
"rdf.cdisc.org/terminology-2013-06-28/adam-terminology.owl", 
"rdf.cdisc.org/std/sdtm-1-2.ttl",
"rdf.cdisc.org/std/all-standards.ttl",
"rdf.cdisc.org/std/cdash-1-1.ttl",
"rdf.cdisc.org/std/sdtmig-3-1-3.ttl",
"rdf.cdisc.org/std/sdtmig-3-1-2.ttl",
"rdf.cdisc.org/std/adamig-1-0.ttl",
"rdf.cdisc.org/std/sendig-3-0.ttl",
"rdf.cdisc.org/std/sdtm-1-3.ttl",
"rdf.cdisc.org/std/adam-2-1.ttl", 
"rdf.cdisc.org/schemas/ct-schema.owl", 
"rdf.cdisc.org/schemas/meta-model-schema.owl", 
"rdf.cdisc.org/schemas/cdisc-schema.owl",
"rdf-data-cube/cube.ttl"
  )
```

Then the files are input and the size of the resulting file is reported.


```r
cdisc.save.zip<- Create.cdisc.standards.from.local(
  cdisc.files.dir= fileStemDirectory,
  CDISCfilelist= filesToLoad
  )
```

```
## Warning in normalizePath(file.path(cdisc.files.dir, fn)): path[1]="/home/
## ma/projects/phrmwg/rdf.cdisc.org/resources/w3.org/skos.rdf": No such file
## or directory
```

```
## Loading /home/ma/projects/phrmwg/rdf.cdisc.org/resources/w3.org/skos.rdf ..
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : java.io.FileNotFoundException: /home/ma/projects/phrmwg/rdf.cdisc.org/resources/w3.org/skos.rdf (No such file or directory)
```

```r
cdisc.save.zip.info<- file.info(cdisc.save.zip)
```

```
## Error in file.info(cdisc.save.zip): object 'cdisc.save.zip' not found
```

```r
message("File ", cdisc.save.zip, " created ", cdisc.save.zip.info$ctime, " size ", cdisc.save.zip.info$size, " bytes")
```

```
## Error in message("File ", cdisc.save.zip, " created ", cdisc.save.zip.info$ctime, : object 'cdisc.save.zip' not found
```

### Loading using Load.cdisc.standards 

The code below shows the call for loading the zipped rdf file and store in triple store.
This is currently handled in the .onLoad function for the package. The rrdf model is then stored in the package environment.


```r
cdisc.rdf<- Load.cdisc.standards()
```

```
## Start loading rdf.cdisc.org contents from /home/ma/projects/R-projects/rrdfqbcrnd0/rrdfqbcrnd0/inst/extdata/CDISC-standards-rdf/cdisc-rdf.zip
## Done loading rdf.cdisc.org contents, number of triples: 165614
```

```r
message(".. total number of triples: ", summarize.rdf.noprint(cdisc.rdf) )
```

```
## .. total number of triples: 165614
```

### Creating SPARQL script for getting CDISC standard using FROM dataset

The following is experimental and not needed for the present
package. See below for explanation.


```r
rdf.cdisc.org.URLstem<- "https://github.com/phuse-org/rdf.cdisc.org/raw/master"
rdf.data.cube.URLstem<- "http://publishing-statistical-data.googlecode.com/svn/trunk/specs/src/main/vocab"
rqfilesToLoad<- filesToLoad
rqfilesToLoad<- gsub("rdf.cdisc.org", rdf.cdisc.org.URLstem, rqfilesToLoad )
rqfilesToLoad<- gsub("rdf-data-cube", rdf.data.cube.URLstem, rqfilesToLoad )


SPARQLscript<- paste(
  "CONSTRUCT { ?s ?p ?o }",
paste0( "FROM ", "<", rqfilesToLoad, ">", collapse="\n" )
  ,
  "WHERE { ?s ?p ?o }", sep="\n", collapse="\n"
)

cat(SPARQLscript,"\n")
```

CONSTRUCT { ?s ?p ?o }
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/resources/w3.org/skos.rdf>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/resources/dublincore.org/dcam.rdf>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/resources/dublincore.org/dcelements.rdf>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/resources/dublincore.org/dcterms.rdf>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/terminology-2013-06-28/glossary-terminology.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/terminology-2013-06-28/cdash-terminology.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/terminology-2013-06-28/sdtm-terminology.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/terminology-2013-06-28/qs-terminology.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/terminology-2013-06-28/send-terminology.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/terminology-2013-06-28/adam-terminology.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/sdtm-1-2.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/all-standards.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/cdash-1-1.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/sdtmig-3-1-3.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/sdtmig-3-1-2.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/adamig-1-0.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/sendig-3-0.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/sdtm-1-3.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/std/adam-2-1.ttl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/schemas/ct-schema.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/schemas/meta-model-schema.owl>
FROM <https://github.com/phuse-org/rdf.cdisc.org/raw/master/schemas/cdisc-schema.owl>
FROM <http://publishing-statistical-data.googlecode.com/svn/trunk/specs/src/main/vocab/cube.ttl>
WHERE { ?s ?p ?o } 

```r
SPARQLscriptfn<- file.path(tempdir(),"get-rdf.disc.org.rq")
writeLines( SPARQLscript, con=SPARQLscriptfn )
```

### Using the script with R
The R-code below does not work with rrdf.


```r
cdisc.rdf.store <- new.rdf()
results <- construct.rdf(cdisc.rdf.store, SPARQLscript )
summarize.rdf(results)
```

The code below assumes a locate fuseki instance is running.
As of 22-feb-2015 the code appears to stop at the first file skos.rdf, which in XML/RDF format.
Maybe because the jena implementation of from expects a turtle file?

```r
endpoint<- "http://localhost:3030/sparql"
results.fuseki <- construct.remote(endpoint, SPARQLscript )
summarize.rdf(results.fuseki)
```

### Using the script with jena arq
The generated SPARQL query works with arq when using a local endpoint.
The code below is expected to run in the directory given by tempdir().
Replace _get-rdf.disc.org.rq_ with the path to the generated file (see above).

```
export JENAROOT=/opt/apache-jena-2.12.1
export PATH=$PATH:$JENAROOT/bin
arq --query=get-rdf.disc.org.rq > construct-rdf.disc.org.ttl
```

The next statements loads the turtle files generated by the arq invocation above.

```r
arqCDISCTtl<- file.path(tempdir(), "construct-rdf.disc.org.ttl")
cdisc.rdf.arq<- load.rdf( arqCDISCTtl, format="TURTLE")
summarize.rdf(cdisc.rdf.arq)
```



