Private repository for R-RDF Data Cube for Clinical Research & Development
==========================================================================
 
R code for presenting Analysis Results Model - work from a subgroup of FDA/PhUSE Semantic Technology Project - with the purpose of representing resuls in RDF.

This is a private repository until I get comfortable with publishing code in the open :-)

Marc Andersen

Introduction
------------
 
 
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

