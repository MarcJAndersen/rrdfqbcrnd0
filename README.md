# Repository for R-RDF Data Cube for Clinical Research & Development
 
R code for presenting Analysis Results Model - work from a subgroup of
PhUSE Semantic Technology Project - with the purpose of
representing resuls in RDF, see
(http://www.phusewiki.org/wiki/index.php?title=Analysis_Results_Model)

The code is under development - so not everything works as intended.

Marc Andersen

# Contact

For more information about the Analysis Results Model subgroup, please
visit the Wiki at (http://www.phusewiki.org) or go straight to
(http://www.phusewiki.org/wiki/index.php?title=Analysis_Results_Model)


# Introduction

## Install the rrdfqbcrnd0 package
There are several ways to install the package, with the most straightforward presented first.


## First - The RRDF package

The [rrdf](https://github.com/egonw/rrdf) performs the interaction
with a Apache Jena triple store.  The packages must be installed
accoding to the instructions on the packages github page: 

```r
if (!require("rJava", character.only = TRUE)) { install.packages("rJava")  }
if (!require("rJava", character.only = TRUE)) { stop("needs rJava") }

if (!require("devtools", character.only = TRUE)) {install.packages("devtools")  }
if (!require("devtools", character.only = TRUE)) { stop("needs devtools") }

if (!require("rrdflibs", character.only = TRUE) ) {install_github("egonw/rrdf", subdir="rrdflibs") }
if (!require("rrdflibs", character.only = TRUE) ) { stop("needs rrdflibs") }

if (!require("rrdf", character.only = TRUE) ) { install_github("egonw/rrdf", subdir="rrdf", build_vignettes = FALSE) }
if (!require("rrdf", character.only = TRUE) ) { stop("needs rrdf") }
```

To check if the installation was successfull use:
```r
library(rrdflibs)
library(rrdf)
packageVersion("rrdf")
```

## Second - The knitr package
```r
install.packages("knitr") # if not present already
```

## Third - Optional dependencies for development

See below for packages needed for development.


## Installation approaches
The R-packages are made using a modular approach. After having a monolithic package that just grew and grew, it was decided to break it up into smaller packages as shown below.

|Package            |Description|
|-------------------|------------|
| `rrdfancillary`   |Ancilary functions to the rrdf package - support for the Resource|
| `rrdfcdisc`       |R-RDF CDISC standards (rrdf.cdisc.org)|
| `rrdfqb`          |RDF data cube R interface |
| `rrdfqbcrnd0`     |R-RDF Data Cube for Clinical Research & Development |
| `rrdfqbcrndex`    |R-RDF Examples for RDF data cube for Clinical Research and Development |
| `rrdfqbcrndcheck` |Check of results against underlying data in R-RDF Data Cube for Clinical Research & Development |
| `rrdfqbpresent`   |Present data cube as two dimensional table (does not work as of 06-jan-2016)  |


A crude overview of the packages is given below.

<table border="1">
<body>
<tr><td colspan="2">rrdfqbcrndex</td><td colspan="2">rrdfqbcrndcheck</td><td colspan="2">rrdfqbpresent</td></tr>
<tr></tr>
<tr><td colspan="2"></td><td colspan="2">rrdfqbcrnd0</td><td colspan="2"></td></tr>
<tr></tr>
<tr><td colspan="2">rrdfqb</td><td colspan="2"></td><td colspan="2">rrdfcdisc</td></tr>
<tr></tr>
<tr><td colspan="2">rrdf</td><td colspan="2"></td><td colspan="2">rrdfancillary</td></tr>
<tr></tr>
<tr><td colspan="2"></td><td colspan="2">rrdflibs</td><td colspan="2"></td></tr>
</body>
</table>

### Install as a package

Download rrdfqbcrnd0 project from Git from (https://github.com/MarcJAndersen/rrdfqbcrnd0/archive/master.zip).

Browse the directory rrdfqbcrnd0-master/ReleasePackages/ to identify the most recent versions of the packages.

In R change the working directory to the folder with the packages.

Tip for Rstudio: use the file explore window to navigate to the directory, then use "Set Working Director" from the "More" menu.

In R issue
```r
library(devtools)
install_local("rrdfancillary_0.2.4.tar.gz")
install_local("rrdfcdisc_0.2.4.tar.gz")    
install_local("rrdfqb_0.2.4.tar.gz")       
install_local("rrdfqbcrnd0_0.2.4.tar.gz")  
install_local("rrdfqbcrndex_0.2.4.tar.gz")
install_local("rrdfqbcrndcheck_0.2.4.tar.gz")
install_local("rrdfqbpresent_0.2.4.tar.gz")
```

Note: the package `rrdfqbcrnd0` may not be able to install using "install.packages" in Rstudio due to "rrdf(>= 2.0.4)".

#### Note - cleaning up local library

To see the contents of the libraries with packages use
```r
library()
```

The personal library may fill up over time. To remove the contents of
the personal library, usually in `.libPaths()[1]`, use the following
command

```r
remove.packages((library(lib=.libPaths()[1])$results)[,"Package"])
```

### Install in R from local directory using Rstudio

Obtain the package as a zip file, for example by downloading from
GitHub
(https://github.com/MarcJAndersen/rrdfqbcrnd0/archive/master.zip).

Extract the zip file to a directory of your choosing. 

Open the extracted directory. 

### Clone from GitHub and start using Rstudio

Clone the repository (https://github.com/MarcJAndersen/rrdfqbcrnd0.git).

Go to the directory, change to rrdfqbcrnd0 subdirectory and open the rrdfqbcrnd0.Rproj file.

### Install in R from GitHub

To install the rrdfqbcrnd0 package use

```r
library(devtools)
packageVersion("devtools") ## check the version of devTools
install_github("MarcJAndersen/rrdfqbcrnd0", subdir="rrdfqbcrnd0", build_vignettes= TRUE)
```

## Setup of R

### Note for Linux

Note for Linux: Check if there are distribution specific packages for
the components. For example for Fedora, these RCurl exists as package
R-RCurl and XML as R-XML, eg `dnf install R-RCurl R-XML`.

If RCurl install fails, it may be resolved by first installing the
libcurl and libcurl-devel packages (on fedora: install.packages( c(
"RCurl").

### Note for Windows

To build packages on windows install the
[Rtools](http://cran.r-project.org/bin/windows/Rtools/).

For updating the devtools package follow the instructions on the
github page for [devtools](https://github.com/hadley/devtools).

## Required R packages

### Packages for developing in general

You will need to install some packages for development

```r

for (checkPackage in  c("devtools", "roxygen2", "testthat", "knitr", "rmarkdown", "shiny" ) ) {
if (!require(checkPackage, character.only = TRUE)) {install.packages(checkPackage)  }
if (!require(checkPackage, character.only = TRUE)) { stop("needs ", checkPackage) }
}

```

These packages are mentioned under Imports: section in the DESCRIPTION file.

### Packages for developing the rrdfqbcrnd0 package

For using and developing the rrdfqbcrnd0 package these packages must be installed:

```r
for (checkPackage in  c( "RCurl", "rJava", "xlsx", "XML" ) ) {
if (!require(checkPackage, character.only = TRUE)) {install.packages(checkPackage)  }
if (!require(checkPackage, character.only = TRUE)) { stop("needs ", checkPackage) }
}
    
```

### Packages used for generating the data and data documentation (data-raw directories)
The scripts in inst/data-raw generates the data that are part of the packages.
These scripts uses the following packages:
```r
for (checkPackage in c( "foreign", "sqldf", "RSQLite", "igraph", "visNetwork", "DiagrammeR", "webshot" ) ) {
if (!require(checkPackage, character.only = TRUE)) {install.packages(checkPackage)  }
if (!require(checkPackage, character.only = TRUE)) { stop("needs ", checkPackage) }
}

```


## Other issues 

The R package generation may require qpdf - see R function compactPDF  help page.

If the creation of vignettes reports "Pandoc is not available. Please install Pandoc.", try setting the environment variable RSTUDIO_PANDOC before starting R as follows:

```bash
export RSTUDIO_PANDOC=`which pandoc | xargs dirname`
```
([source](http://stackoverflow.com/questions/26803652/devtoolsbuild-vignettes-yields-error-invalid-version-specification-pandoc))

The SPARQL queries are shown in knitr using the highlight package. Install highlight by
```bash
sudo dnf install highlight
```

To install pandoc use
```bash
sudo dnf install pandoc pandoc-citeproc pandoc-pdf
```

For executing pandoc, there following packages may be need: framed, titling.
([source](https://github.com/rstudio/rmarkdown/issues/39)

```bash
sudo dnf -y install texlive-framed
sudo dnf -y install texlive-titling
```

Usefull stand-alone tools for working with RDF data may be installed:
```bash
sudo dnf install raptor2
sudo dnf install graphviz
```

RCurl may need libssh2-devel should be installed:
```bash
sudo dnf install libssh2-devel
```

### Version of packages
Verify that you have the applicable versions. It may appear unnecessary, but version issues have more than once been the root cause of malfunction.

```r
sessionInfo()
packageVersion("rrdf")
```

# Documentation and examples

## Documentation for generation

|Package            |File        |Description|
|-------------------|------------|-----------|
|./rrdfcdisc|[store-cdisc-rdf-as-rrdf](./rrdfcdisc/inst/doc/store-cdisc-rdf-as-rrdf.html)| Store CDISC RDF as RRDF data model |
|./rrdfcdisc|[create-qb-CDISC-prefix](./rrdfcdisc/inst/doc/create-qb-CDISC-prefix.html)| Create prefixes for use with CDISC standards in RDF |
|./rrdfqb|[get-cube-vocabulary](./rrdfqb/inst/doc/get-cube-vocabulary.html)| Get RDF data cube vocabulary as turtle file from qb: (<http://purl.org/linked-data/cube>\#). |
|./rrdfqb|[create-qb-IC-dataset](./rrdfqb/inst/doc/create-qb-IC-dataset.html)| Create Integrity Contraints SPARQL Queries from RDF data cube definition |
|./rrdfqb|[get-qb-ex-ttlfile](./rrdfqb/inst/doc/get-qb-ex-ttlfile.html)| Get RDF data cube example file from RDF data cube specifications |
|./rrdfqbcrnd0|[codelist-procedure](./rrdfqbcrnd0/inst/doc/codelist-procedure.html)| Introduction |
|./rrdfqbcrndex|[use-demo-ttl](./rrdfqbcrndex/inst/doc/use-demo-ttl.html)| Introduction |
|./rrdfqbcrndex|[rdf-gotchas](./rrdfqbcrndex/inst/doc/rdf-gotchas.html)| Setup |
|./rrdfqbcrndex|[create-ADSL-ttl](./rrdfqbcrndex/inst/doc/create-ADSL-ttl.html)| Create turtle version of ADSL dataset |
|./rrdfqbcrndex|[using-arq-qb](./rrdfqbcrndex/inst/doc/using-arq-qb.html)| SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl) |
|./rrdfqbcrndex|[using-arq](./rrdfqbcrndex/inst/doc/using-arq.html)| SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl) |
|./rrdfqbcrndex|[create-ae-table-as-csv](./rrdfqbcrndex/inst/doc/create-ae-table-as-csv.html)| Create AE sample table as CSV file and other files |
|./rrdfqbcrndex|[create-ADAE-ttl](./rrdfqbcrndex/inst/doc/create-ADAE-ttl.html)| Create turtle version of ADAE dataset |
|./rrdfqbcrndex|[create-dm-table-as-csv](./rrdfqbcrndex/inst/doc/create-dm-table-as-csv.html)| Introduction |
|./rrdfqbcrndex|[populate-sample-xpt](./rrdfqbcrndex/inst/doc/populate-sample-xpt.html)| Populate sample-xpt with example file in SAS transport xpt format |
|./rrdfqbcrndex|[reporting-process](./rrdfqbcrndex/inst/doc/reporting-process.html)| Introduction |
|./rrdfqbcrndex|[using-python](./rrdfqbcrndex/inst/doc/using-python.html)| Using Python with SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl) |
|./rrdfqbcrndex|[using-arq-graphical-display](./rrdfqbcrndex/inst/doc/using-arq-graphical-display.html)| Graphical display of results from SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl) |
|./rrdfqbcrndex|[create-qb-examples-as-ttl](./rrdfqbcrndex/inst/doc/create-qb-examples-as-ttl.html)| Create turtle version of example files |
|./rrdfqbpresent|[two-dim-representation-of-cube](./rrdfqbpresent/inst/doc/two-dim-representation-of-cube.html)| Setup |


## Vignette documents

|Package            |File        |Description|
|-------------------|------------|-----------|
|./rrdfqb|[check-ic](./rrdfqb/vignettes/check-ic.html) |Execute SPARQL integrity constraints on a data cube|
|./rrdfqb|[explore-cube-vocabulary](./rrdfqb/vignettes/explore-cube-vocabulary.html) |Explore RDF data cube vocabulary|
|./rrdfqb|[qb-sparql-queries](./rrdfqb/vignettes/qb-sparql-queries.html) |RDF data cube SPARQL queries|
|./rrdfqbcrnd0|[SPARQL-scripts-for-qb](./rrdfqbcrnd0/vignettes/SPARQL-scripts-for-qb.html) |SPARQL scripts for RDF data cubes|
|./rrdfqbcrnd0|[SPARQL-query](./rrdfqbcrnd0/vignettes/SPARQL-query.html) |SPARQL query using Shiny to build interface|
|./rrdfqbcrnd0|[first-cube](./rrdfqbcrnd0/vignettes/first-cube.html) |Create simple RDF data qube|
|./rrdfqbcrnd0|[howto-create-vignette](./rrdfqbcrnd0/vignettes/howto-create-vignette.html) title: How to create vignette"
|./rrdfqbcrndex|[cube-from-workbook](./rrdfqbcrndex/vignettes/cube-from-workbook.html) |Data qubes from Workbook|
|./rrdfancillary|[do-update](./rrdfancillary/vignettes/do-update.html) |SPARQL update example|
|./rrdfqbpresent|[two-dim-representation-of-cube](./rrdfqbpresent/vignettes/two-dim-representation-of-cube.html) |Two dimensional representation of RDF data cube|
|./rrdfqbpresent|[vignette-two-dim-representation-of-cube](./rrdfqbpresent/vignettes/vignette-two-dim-representation-of-cube.html) |Two dimensional representation of RDF data cube|
|./rrdfqbcrndcheck|[sql-for-check-cube](./rrdfqbcrndcheck/vignettes/sql-for-check-cube.html) |SQL code for verifying results in RDF data cube|
|./rrdfqbcrndcheck|[check-cube](./rrdfqbcrndcheck/vignettes/check-cube.html) |Derive results in RDF data cube and compare with results in data cube|

## SPARQL scripts

|Package            |File        |Description|
|-------------------|------------|-----------|
|rrdfcdisc|[inst/extdata/CDISC-standards-rdf/get-rdf.disc.org](rrdfcdisc/inst/extdata/CDISC-standards-rdf/get-rdf.disc.org.rq) | CONSTRUCT { ?s ?p ?o } |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOprocedure-median](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOprocedure-median.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/qb-construct-ComponentProperty](rrdfqbcrndex/inst/extdata/sample-rdf/qb-construct-ComponentProperty.rq) | prefix rdf:            <http://www.w3.org/1999/02/22-rdf-syntax-ns#> |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOattributes](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOattributes.rq) | ## @knitr DEMOattributes   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOdimensions](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOdimensions.rq) | ## @knitr DEMOdimensions   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/ADSL-record](rrdfqbcrndex/inst/extdata/sample-rdf/ADSL-record.rq) | ## @knitr ADSL-record |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOprocedure-codelist](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOprocedure-codelist.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOobservations-R-data](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations-R-data.rq) | ## @knitr DEMOobservations-R-data |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOfactor](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOfactor.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOcodelist](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOcodelist.rq) | ## @knitr DEMOcodelist   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/get-procedure-codelist](rrdfqbcrndex/inst/extdata/sample-rdf/get-procedure-codelist.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOobservations-R-selection](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations-R-selection.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/ADSL-mapping](rrdfqbcrndex/inst/extdata/sample-rdf/ADSL-mapping.rq) | ## @knitr ADSL-mapping |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOfactor-codelist](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOfactor-codelist.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOobservations](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOprocedure](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOprocedure.rq) | ## @knitr DEMOobservations   |
|rrdfqbcrndex|[inst/extdata/sample-rdf/DEMOobservations-R-data-part-1](rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations-R-data-part-1.rq) | ## @knitr DEMOobservations-R-data |
|rrdfqbcrndex|[inst/extdata/sample-rdf/OneQBobservation](rrdfqbcrndex/inst/extdata/sample-rdf/OneQBobservation.rq) | ## @knitr DEMOobservations   |

# References, hints and acknowlegements


[R](http://www.r-project.org/)

[Writing R Extensions](http://cran.r-project.org/doc/manuals/r-release/R-exts.html)

[R packages by Hadley Wickham, to be published with O'Reilly around June 2015]( http://r-pkgs.had.co.nz)

[rrdf](https://github.com/egonw/rrdf)

[Contributing to ggplot2 development](http://cran.r-project.org/web/packages/ggplot2/vignettes/development.html)

[Semantic versioning](http://semver.org/)

# History
 
The code is based on incremental development of
* CSV file with analysis results for a sample demographics table (Ian)
* snippets of SPARQL and R code (Marc and Tim)
* R script reading CSV files and generating rdf data cube (Tim)
* R code update and and addition of AE analysis results and verification of resuts (Marc)
* Test code and skeleton R package (Ippei)
* Restructure R script into R package (Marc)
* Update code and create R package with vignettes (Marc)

Comments to code and functionality:
* Ian, Tim, Marc, Ippei, Marcelina

# Acknowledgements and contributers in general

* Ian
* Tim
* Marc
* Ippei
* Marcelina
 
# Project Status


The code here is under development - any thing may change until version 1.0.

The first major change was to change the use of the prop: prefix to using 

crnd-dimension	http://www.example.org/dc/dimension#
crnd-attribute	http://www.example.org/dc/attribute#
crnd-measure	http://www.example.org/dc/measure#

In general the prop: is replaced with 
crnd-dimension:|crnd-attribute:|crnd-measure:

The prefixes are stored in a data.frame set from the function Get.qb.crnd.prefixes when creating a cube.

The data.frame is converted into a list using qb.def.prefixlist. The list of prefixes is  
used extensively in buildCodelist.R, qb.buildObservations.R and qb.buildSkeleton.R.

The variable forsparqlprefix contains the prefix used for queries.

Here is how prefixes are defined and use:
```{r, eval=FALSE}
domainName<- "DEMOG-T123"
custom.prefixes <-Get.qb.crnd.prefixes(tolower(domainName))
  common.prefixes <-data.frame(
  prefix=names( Get.default.crnd.prefixes() ),
  namespace=as.character( Get.default.crnd.prefixes() )
  )
prefixes<- rbind(common.prefixes, custom.prefixes)                                                
prefixlist<- qb.def.prefixlist(store, prefixes)

forsparqlprefix<- GetForSparqlPrefix( domainName )
```

Create HTML version
-------------------
 
pandoc -f markdown_github -o README.html README.md

