Private repository for R-RDF Data Cube for Clinical Research & Development
==========================================================================
 
R code for presenting Analysis Results Model - work from a subgroup of FDA/PhUSE Semantic Technology Project - with the purpose of representing resuls in RDF.

This is a private repository until I get comfortable with publishing code in the open :-)

Please note: fields like author, contributors etc are presently not correct. 

Marc Andersen

Introduction
------------

You will need to install some packages for development

```
install.packages( c("devtools", "roxygen2", "testthat", "knitr", "rmarkdown", "xlsx" ) )
```

Furthermore, the [rrdf](https://github.com/egonw/rrdf) package must be
installed. The packages must be installed accoding to the instructions
on the packages github page.


To install the package use

```
library(devtools)
install_github("MarcJAndersen/rrdfqbcrnd0", auth_token="xxx", build_vignettes= TRUE)
```

Replace xxx above with the auth_token generated from the page (https://github.com/settings/tokens/new).


Developing
----------

Here are the commands I use for developing. The [ggplot2 development](http://cran.r-project.org/web/packages/ggplot2/vignettes/development.html) webpage also provides suggestions for development strategies.

TIP: To single step line by line use ESS in emacs

TIP: To single step line by line use rstudio 



```r
library(devtools)
library(knitr)
devtools::load_all()
devtools::document()
devtools::test()
devtools::check()
devtools::install()
```

Here is what I use while developing.

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
* Creation of R package (Ippei)
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

