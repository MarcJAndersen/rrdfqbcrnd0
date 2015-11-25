# Repository for R-RDF Data Cube for Clinical Research & Development
 
R code for presenting Analysis Results Model - work from a subgroup of
PhUSE Semantic Technology Project - with the purpose of
representing resuls in RDF, see
(http://www.phusewiki.org/wiki/index.php?title=Analysis_Results_Model)

The code is under development - so not everything works as intended.

Marc Andersen

# Contact

For more information about the Analysis Results Model subgroup, please
visit the Wiki at [phusewiki.org]() or go straight to
[http://www.phusewiki.org/wiki/index.php?title=Analysis_Results_Model]()


# Introduction

## Install the rrdfqbcrnd0 package
There are several ways to install the package, with the most straightforward presented first.


## First - The RRDF package

The [rrdf](https://github.com/egonw/rrdf) performs the interaction
with a Apache Jena triple store.  The packages must be installed
accoding to the instructions on the packages github page: 

```r
install.packages("rJava") # if not present already
install.packages("devtools") # if not present already
library(devtools)
install_github("egonw/rrdf", subdir="rrdflibs")
install_github("egonw/rrdf", subdir="rrdf", build_vignettes = FALSE)
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

## Installation approaches

### Install as a package

Download rrdfqbcrnd0 project from Git from (https://github.com/MarcJAndersen/rrdfqbcrnd0/archive/master.zip).

Extract the most recent package (rrdfqbcrnd0_0.1.6.tar.gz) from rrdfqbcrnd0-master/ReleasePackages/ subfolder of the downloaded archive. 

Put rrdfqbcrnd0_0.1.6.tar.gz in the current working directory of the R process - or change the working directory to the folder with the package.
Tip for Rstudio: use the file explore window to navigate to the directory, then use "Set Working Director" from the "More" menu.

In R issue
```r
library(devtools)
install_local("rrdfqbcrnd0_0.1.6.tar.gz")
```

Note: the package may not be able to install using "install.packages" in Rstudio due to "rrdf(>= 2.0.4)".

#### Note - cleaning up local library

To see the contents of the libraries with packages use
```r
library()
```

To do a cleanup of the personal library, usually `.libPaths()[1]`, use the following command

```r
remove.packages((library(lib=.libPaths()[1])$results)[,"Package"])
```

### Install in R from local directory using Rstudio

Obtain the package as a zip file, for example by downloading from
GitHub
(https://github.com/MarcJAndersen/rrdfqbcrnd0/archive/master.zip).

Extract the zip file to a directory of your choosing. 

Open the extracted directory. Change to rrdfqbcrnd0 subdirectory and open the rrdfqbcrnd0.Rproj file.

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
install.packages( c("devtools", "roxygen2", "testthat", "knitr", "rmarkdown", "shiny" ) )
```

These packages are mentioned under Imports: section in the DESCRIPTION file.

### Packages for developing the rrdfqbcrnd0 package

For using and developing the rrdfqbcrnd0 package these packages must be installed:

```r
install.packages( c( "RCurl", "rJava", "xlsx", "XML" ) )
```

### Packages used for generating the data
The scripts in inst/data-raw generates the data that are part of the packages.
These scripts uses the following packages:
```r
install.packages( c( "foreign", "sqldf" ) )
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


# References, hints and acknowlegements


[R](http://www.r-project.org/)

[Writing R Extensions](http://cran.r-project.org/doc/manuals/r-release/R-exts.html)

[R packages by Hadley Wickham, to be published with O'Reilly around June 2015]( http://r-pkgs.had.co.nz)

[rrdf](https://github.com/egonw/rrdf)

[Contributing to ggplot2 development](http://cran.r-project.org/web/packages/ggplot2/vignettes/development.html)

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

