Private repository for R-RDF Data Cube for Clinical Research & Development
==========================================================================
 
R code for presenting Analysis Results Model - work from a subgroup of FDA/PhUSE Semantic Technology Project - with the purpose of representing resuls in RDF.
This is a private repository until I get comfortable with publishing code in the open :-)

Please note: fields like author, contributors etc are presently not correct. 

Marc Andersen

Introduction
------------

## Setup of R

### Note for Linux

Note for Linux: Check if there are distribution specific packages for the components. For example for Fedora, these RCurl exists as package R-RCurl and XML as R-XML, eg yum install R-RCurl R-XML.

If RCurl install fails, it may be resolved by first installing the libcurl and libcurl-devel packages (on fedora: install.packages( c( "RCurl"). 

### Note for Windows

To build packages on windows install the [Rtools](http://cran.r-project.org/bin/windows/Rtools/).

For updating the devtools package follow the instructions on the github page for [devtools](https://github.com/hadley/devtools).

## Required R packages

### Packages for developing in general

You will need to install some packages for development

```r
install.packages( c("devtools", "roxygen2", "testthat", "knitr", "rmarkdown", "shiny" ) )
```

These packages are mentioned under Imports: section in the DESCRIPTION file.

### Packages for developing the rrdfqbcrnd0 package

For using and developing the rrdfqbcrnd0 package uses the following packages must be installed:
```r
install.packages( c( "RCurl", "rJava", "xlsx", "XML" ) )
```

### Packages used for generating the data
The scripts in inst/data-raw generates the data that are part of the packages.
These scripts uses the following packages:
```r
install.packages( c( "foreign)", "sqldf" ) )
```

### The RRDF package

Finally, the [rrdf](https://github.com/egonw/rrdf) package must be
installed. The packages must be installed accoding to the instructions
on the packages github page. Well, almost, due changes in install_github, you need to use

```r
library(devtools)
install_github("egonw/rrdf", subdir="rrdflibs")
install_github("egonw/rrdf", subdir="rrdf", build_vignettes = FALSE)
library(rrdflibs)
library(rrdf)
# check the version loaded
packageVersion("rrdf")
```


## Install the rrdfqbcrnd0 package

### Install in R from local directory using Rstudio
Obtain the package as a zip file, for example by downloading from GitHub (https://github.com/MarcJAndersen/rrdfqbcrnd0/archive/master.zip).

Extract the zip file to a directory of your choosing. 

Go to the directory and open the rrdfqbcrnd0.Rproj file.

### Clone from GitHub and start use Rstudio

Clone the repository (https://github.com/MarcJAndersen/rrdfqbcrnd0.git).

Go to the directory and open the rrdfqbcrnd0.Rproj file.

### Install in R from GitHub

To install the rrdfqbcrnd0 package use

```r
library(devtools)
install_github("MarcJAndersen/rrdfqbcrnd0", auth_token="xxx", build_vignettes= TRUE)
packageVersion("devtools")
```

Replace xxx above with the auth_token generated from the page (https://github.com/settings/tokens/new).


## Other issues 

The R package generation may require qpdf - see R function compactPDF  help page.

If the creation of vignettes reports "Pandoc is not available. Please install Pandoc.", the setting the environment variable RSTUDIO_PANDOC before starting R as follows:

```bash
export RSTUDIO_PANDOC=`which pandoc | xargs dirname`
```
([source](http://stackoverflow.com/questions/26803652/devtoolsbuild-vignettes-yields-error-invalid-version-specification-pandoc))

### Version of packages
Verify that you have the applicable versions. It appears unnessary, but version issues have more than once been the root cause of malfunction.

```r
sessionInfo()
packageVersion("rrdf")
```

Developing
----------

Here are the commands I use for developing. The [ggplot2 development](http://cran.r-project.org/web/packages/ggplot2/vignettes/development.html) webpage also provides suggestions for development strategies.

TIP: To single step line by line use ESS in emacs

TIP: To single step line by line use rstudio 

TIP: In Rstudio I open README.md (this file) and execute code lines one by one.

```r
library(devtools)
library(knitr)
devtools::load_all()
devtools::document()
devtools::test()
devtools::check()
devtools::install()
devtools::build_vignettes()
```

## Commands used for developing

Creating vignettes
##################

The command below creates the vignette my-vignette.Rmd.

```
devtools::use_vignette("my-vignette")
```
 
Setup test directories
######################

The command below creates the test directories for the testhat environment.

```
devtools::use_testthat() 
```
 
Setup data-raw directory
########################

The command below creates the data-raw directories for the reproducing the datasets environment.

```
devtools::use_data_raw() 
```

In a script to actually add a foo use:
```
devtools::use_data(foo) 
```
 
Makefile in root directory
########################

The makefile in the root directory is used for keeping track of the tasks to do before releasing the package. It would make sense to split the file into several makefiles going into the applicable subdirectories - that will be done when it is agreed on how to do it.


References, hints and acknowlegements
-------------------------------------

[R](http://www.r-project.org/)

[Writing R Extensions](http://cran.r-project.org/doc/manuals/r-release/R-exts.html)

[R packages by Hadley Wickham, to be published with O'Reilly around June 2015]( http://r-pkgs.had.co.nz)

[rrdf](https://github.com/egonw/rrdf)

[Contributing to ggplot2 development](http://cran.r-project.org/web/packages/ggplot2/vignettes/development.html)

History
-------
 
The code is based on incremental development of
* CSV file with analysis results for a sample demographics table (Ian)
* snippets of SPARQL and R code (Marc and Tim)
* R script reading CSV files and generating rdf data cube (Tim)
* R code update and and addition of AE analysis results and verification of resuts (Marc)
* Creation of skeleton R package (Ippei)
* Restructure R script into R pacakge (Marc)
* Update code and create R package with vignettes (Marc)

Comments to code and functionality:
* Ian, Tim, Marc, Ippei, Marcelina

Persons
-------

* Ian
* Tim
* Marc
* Ippei
* Marcelina
 
Project Status
--------------

The code here is under development - any thing may change until version 1.0.

Contact
-------

For more information about the Analysis Results Model subgroup, please
visit the Wiki at [phusewiki.org]() or go straight to
[http://www.phusewiki.org/wiki/index.php?title=Analysis_Results_Model]()

Create HTML version
-------------------
 
pandoc -f markdown_github -o README.html README.md

