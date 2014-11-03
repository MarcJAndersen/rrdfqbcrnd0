Private repository for R-RDF Data Cube for Clinical Research & Development
==========================================================================
 
R code for presenting Analysis Results Model - work from a subgroup of FDA/PhUSE Semantic Technology Project - with the purpose of representing resuls in RDF.

This is a private repository until I get comfortable with publishing code in the open :-)

Please note: fields like author, contributors etc are presently not correct. 

Marc Andersen

Introduction
------------

You will need to install some packages for developmen

```
install.packages(c("devtools", "roxygen2", "testthat", "knitr", "rmarkdown"))
```



To install the package use

```
library(devtools)
install_github("MarcJAndersen/rrdfqbcrnd0", auth_token="xxx", build_vignettes= TRUE)
```

Replace xxx above with the auth_token generated from the page (https://github.com/settings/tokens/new).

For building the vignettes Fuseki endpoint serving CDISC rdf.cdisc.org and the rdf data cube must be running - see vignette for "Demograhics table from CSV file". This is not a good idea. Suggest changing endpoint to (http://www.datadriven.jp:3030/) or create local turtle file with CDISC rdf.cdisc.org and the rdf data cube definiton.

For example of usage look in the vignettes directory.

Developing
----------

Here are the commands I use for developing (see also ggplot2 in references).

```r
require(devtools)
devtools::load_all()
devtools::document()
devtools::test()
devtools::check()
devtools::install()
```

Here is what I use while developing to populate directories with files:

```
devtools::use_testthat() 
devtools::use_vignette("my-vignette")
```
 
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

