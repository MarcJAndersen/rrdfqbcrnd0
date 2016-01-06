---
title: "Using ARQ to make SPARQL queries"
author: "mja@statgroup.dk"
date: "2016-01-06"
output: rmarkdown::html_vignette
---

# SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)

The examples below uses `arq` from Apache Jena
(http://jena.apache.org). To install arq - download and unpack the
latest version of apache-jena from
(http://jena.apache.org/download/index.cgi).
Then you need some way
of invoking `arq`; I use a not-so-clever-approach: `cd ~/bin; ln -s
/opt/apache-jena-2.13.0/bin/arq`.

Given a SPARQL query and RDF data, `arq` returns the result of the
query. So this is the command line way of making a SPARQL query.

The use of arq is described many places, see for example
(http://www.learningsparql.com/).

All `arq` commands below are to be run in the directory with the
sample files, which is `inst/extdata/sample-rdf` directory or
`extdata/sample-rdf` depending on the whether the development version
or the installed version of the package is used.

The cd below in each code block is included because I could not find a
quick way to get the code chunk executed in that directory. knitr is
flexible enough to do it, I have not yet found the right way to do it.
So, ignore the repeated cd ..

## Get dimensions

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOdimensions.rq 
```

```
## Failed to load data
```

## Get attributes


```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOattributes.rq 
```

```
## Failed to load data
```

## Get observations

The SPARQL script shows for each observation the dimension, attributes and measures in a row.
Note: in the HTML version the output below can be scrolled using the left and right arrow.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations.rq 
```

```
## Failed to load data
```

## Get definition for all descriptive statistics - class `code:procedure`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure.rq 
```

```
## Failed to load data
```

## Get the codelists 

The SPARQL script shows the codelist.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOcodelist.rq 
```

```
## Failed to load data
```

## Get the codelist definition for all descriptive statistics - class `code:procedure`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-codelist.rq 
```

```
## Failed to load data
```

## Get definition for all variables used for descriptive statistics - class `code:factor`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor.rq 
```

```
## Failed to load data
```

## Get the codelist definition for all variables used for descriptive statistics - class `code:factor`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor-codelist.rq 
```

```
## Failed to load data
```

## Get definition for descriptive statistics median

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-median.rq 
```

```
## Failed to load data
```

## Get information for selection of data

The SPARQL script shows how the information for selecting data for derivation of univariate statistics is present in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations-R-selection.rq
```

```
## Failed to load data
```

## Get information on the underlying data in D2RQ format

The following two SPARQL scripts are from taken from `create-ADSL-ttl.Rmd`.

First get the mapping information.

```bash
cd ../extdata/sample-rdf
arq --data adsl-map.ttl --query ADSL-mapping.rq
```

```
## -----------------------------------------------------------------
## | mapColumn                    | d2rqcolumn      | d2rqdatatype |
## =================================================================
## | <adsl-map.ttl#ADSL_MMSETOT>  | "ADSL.MMSETOT"  | xsd:double   |
## | <adsl-map.ttl#ADSL_RACE>     | "ADSL.RACE"     |              |
## | <adsl-map.ttl#ADSL_DURDIS>   | "ADSL.DURDIS"   | xsd:double   |
## | <adsl-map.ttl#ADSL_TRTDUR>   | "ADSL.TRTDUR"   | xsd:double   |
## | <adsl-map.ttl#ADSL_HEIGHTBL> | "ADSL.HEIGHTBL" | xsd:double   |
## | <adsl-map.ttl#ADSL_DCREASCD> | "ADSL.DCREASCD" |              |
## | <adsl-map.ttl#ADSL_AGEGR1>   | "ADSL.AGEGR1"   |              |
## | <adsl-map.ttl#ADSL_RFENDTC>  | "ADSL.RFENDTC"  |              |
## | <adsl-map.ttl#ADSL_USUBJID>  | "ADSL.USUBJID"  |              |
## | <adsl-map.ttl#ADSL_AGEGR1N>  | "ADSL.AGEGR1N"  | xsd:double   |
## | <adsl-map.ttl#ADSL_TRT01A>   | "ADSL.TRT01A"   |              |
## | <adsl-map.ttl#ADSL_AGE>      | "ADSL.AGE"      | xsd:double   |
## | <adsl-map.ttl#ADSL_TRT01AN>  | "ADSL.TRT01AN"  | xsd:double   |
## | <adsl-map.ttl#ADSL_SITEGR1>  | "ADSL.SITEGR1"  |              |
## | <adsl-map.ttl#ADSL_DISCONFL> | "ADSL.DISCONFL" |              |
## | <adsl-map.ttl#ADSL_TRTEDT>   | "ADSL.TRTEDT"   | xsd:double   |
## | <adsl-map.ttl#ADSL_SUBJID>   | "ADSL.SUBJID"   |              |
## | <adsl-map.ttl#ADSL_SAFFL>    | "ADSL.SAFFL"    |              |
## | <adsl-map.ttl#ADSL_DURDSGR1> | "ADSL.DURDSGR1" |              |
## | <adsl-map.ttl#ADSL_EFFFL>    | "ADSL.EFFFL"    |              |
## | <adsl-map.ttl#ADSL_TRT01PN>  | "ADSL.TRT01PN"  | xsd:double   |
## | <adsl-map.ttl#ADSL_WEIGHTBL> | "ADSL.WEIGHTBL" | xsd:double   |
## | <adsl-map.ttl#ADSL_STUDYID>  | "ADSL.STUDYID"  |              |
## | <adsl-map.ttl#ADSL_AGEU>     | "ADSL.AGEU"     |              |
## | <adsl-map.ttl#ADSL_AVGDD>    | "ADSL.AVGDD"    | xsd:double   |
## | <adsl-map.ttl#ADSL_SEX>      | "ADSL.SEX"      |              |
## | <adsl-map.ttl#ADSL_ARM>      | "ADSL.ARM"      |              |
## | <adsl-map.ttl#ADSL_RFENDT>   | "ADSL.RFENDT"   | xsd:double   |
## | <adsl-map.ttl#ADSL_RACEN>    | "ADSL.RACEN"    | xsd:double   |
## | <adsl-map.ttl#ADSL_TRTSDT>   | "ADSL.TRTSDT"   | xsd:double   |
## | <adsl-map.ttl#ADSL_EDUCLVL>  | "ADSL.EDUCLVL"  | xsd:double   |
## | <adsl-map.ttl#ADSL_DSRAEFL>  | "ADSL.DSRAEFL"  |              |
## | <adsl-map.ttl#ADSL_COMP16FL> | "ADSL.COMP16FL" |              |
## | <adsl-map.ttl#ADSL_RFSTDTC>  | "ADSL.RFSTDTC"  |              |
## | <adsl-map.ttl#ADSL_BMIBLGR1> | "ADSL.BMIBLGR1" |              |
## | <adsl-map.ttl#ADSL_DTHFL>    | "ADSL.DTHFL"    |              |
## | <adsl-map.ttl#ADSL_BMIBL>    | "ADSL.BMIBL"    | xsd:double   |
## | <adsl-map.ttl#ADSL_COMP8FL>  | "ADSL.COMP8FL"  |              |
## | <adsl-map.ttl#ADSL_DISONSDT> | "ADSL.DISONSDT" | xsd:double   |
## | <adsl-map.ttl#ADSL_ITTFL>    | "ADSL.ITTFL"    |              |
## | <adsl-map.ttl#ADSL_TRT01P>   | "ADSL.TRT01P"   |              |
## | <adsl-map.ttl#ADSL_VISNUMEN> | "ADSL.VISNUMEN" | xsd:double   |
## | <adsl-map.ttl#ADSL_DCDECOD>  | "ADSL.DCDECOD"  |              |
## | <adsl-map.ttl#ADSL_VISIT1DT> | "ADSL.VISIT1DT" | xsd:double   |
## | <adsl-map.ttl#ADSL_CUMDOSE>  | "ADSL.CUMDOSE"  | xsd:double   |
## | <adsl-map.ttl#ADSL_SITEID>   | "ADSL.SITEID"   |              |
## | <adsl-map.ttl#ADSL_COMP24FL> | "ADSL.COMP24FL" |              |
## | <adsl-map.ttl#ADSL_ETHNIC>   | "ADSL.ETHNIC"   |              |
## -----------------------------------------------------------------
```

Then dump the contents of a record in the database.

```bash
cd ../extdata/sample-rdf
arq --data adsl.ttl --query ADSL-record.rq
```

```
## -------------------------------------------------------------------------------------------------------------------------------------------------------------
## | s                                                  | p                                                     | o                                            |
## =============================================================================================================================================================
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 54.0E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 9936.0E0                                     |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19549.0E0                                    |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "718"                                        |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 54.0E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 54.0E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 21.6E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 184.0E0                                      |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 170.2E0                                      |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 82.1E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 78.0E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1254"                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Xanomeline Low Dose"                        |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-07-10"                                 |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "M"                                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19732.0E0                                    |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.w3.org/2000/01/rdf-schema#label>          | "ADSL #01-718-1254"                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "HISPANIC OR LATINO"                         |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18882.0E0                                    |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19732.0E0                                    |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 16.0E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-718-1254"                                |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 28.3E0                                       |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-01-09"                                 |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>     | <http://www.example.org/datasets/vocab/ADSL> |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19537.0E0                                    |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Xanomeline Low Dose"                        |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Xanomeline Low Dose"                        |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "718"                                        |
## | <http://www.example.org/datasets/ADSL/01-718-1254> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 18.0E0                                       |
## -------------------------------------------------------------------------------------------------------------------------------------------------------------
```

## Get underlying data for one cube observation


```bash
cd ../extdata/sample-rdf
arq --data adsl.ttl --data DC-DEMO-sample.ttl --query DEMOobservations-R-data.rq
```

```
## Failed to load data
```


# How to run this .Rmd file
.. add text ..
