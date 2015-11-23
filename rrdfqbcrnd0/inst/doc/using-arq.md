---
title: "Using ARQ to make SPARQL queries"
author: "mja@statgroup.dk"
date: "2015-11-23"
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
## ----------------------------
## | p                        |
## ============================
## | crnd-dimension:ethnic    |
## | crnd-dimension:race      |
## | crnd-dimension:procedure |
## | crnd-dimension:agegr1    |
## | crnd-dimension:factor    |
## | crnd-dimension:trt01a    |
## | crnd-dimension:sex       |
## ----------------------------
```

## Get attributes


```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOattributes.rq 
```

```
## ------------------------------
## | p                          |
## ==============================
## | crnd-attribute:cellpartno  |
## | crnd-attribute:measurefmt  |
## | crnd-attribute:colno       |
## | crnd-attribute:denominator |
## | crnd-attribute:unit        |
## | crnd-attribute:rowno       |
## ------------------------------
```

## Get observations

The SPARQL script shows for each observation the dimension, attributes and measures in a row.
Note: in the HTML version the output below can be scrolled using the left and right arrow.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations.rq 
```

```
## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## | s         | ethnic                             | race                                       | procedure              | agegr1                | factor                 | trt01a                           | sex                | cellpartno      | measurefmt          | colno           | denominator | unit             | rowno            | measure                    | ethnicvalue              | racevalue                          | procedurevalue | agegr1value | factorvalue  | trt01avalue            | sexvalue    |
## =================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
## | ds:obs103 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "30"^^xsd:string | "74.4"                     | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs014 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-M         | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "3"^^xsd:string  | "34"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "M"         |
## | ds:obs089 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "race"      | "NA"^^xsd:string | "25"^^xsd:string | "0"^^xsd:double            | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs019 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "4"^^xsd:string  | "8.5901671271"             | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs031 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "8"^^xsd:string  | "82"                       | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs013 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-M         | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "3"^^xsd:string  | "33"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "M"         |
## | ds:obs124 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "38"^^xsd:string | "96.511627907"^^xsd:double | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs084 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "race"      | "NA"^^xsd:string | "24"^^xsd:string | "10.714285714"^^xsd:double | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs129 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "40"^^xsd:string | "3"^^xsd:int               | "HISPANIC OR LATINO"     | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs088 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "race"      | "NA"^^xsd:string | "25"^^xsd:string | "0"^^xsd:double            | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs041 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "11"^^xsd:string | "51"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs123 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "38"^^xsd:string | "81"^^xsd:int              | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs094 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "27"^^xsd:string | "86"                       | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs098 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "28"^^xsd:string | "64.9"^^xsd:double         | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs048 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_NONMISS_ | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "18"^^xsd:string | "100"^^xsd:double          | "_ALL_"                  | "_ALL_"                            | "percent"      | "_NONMISS_" | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs093 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "26"^^xsd:string | "14.653433372"             | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs097 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "28"^^xsd:string | "60.55"^^xsd:double        | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs021 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "4"^^xsd:string  | "7.8860938487"             | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs058 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-65-80     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "20"^^xsd:string | "48.837209302"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "65-80"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs132 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "40"^^xsd:string | "3.5714285714"^^xsd:double | "HISPANIC OR LATINO"     | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs027 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "6"^^xsd:string  | "76"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs020 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "4"^^xsd:string  | "8.2860505995"             | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs056 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-65-80     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "20"^^xsd:string | "47"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "65-80"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs130 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "40"^^xsd:string | "3.488372093"^^xsd:double  | "HISPANIC OR LATINO"     | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs051 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_65       | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "19"^^xsd:string | "11"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "<65"       | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs007 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-F         | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "2"^^xsd:string  | "53"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "F"         |
## | ds:obs055 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-65-80     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "20"^^xsd:string | "42"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "65-80"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs076 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "race"      | "NA"^^xsd:string | "23"^^xsd:string | "90.697674419"^^xsd:double | "_ALL_"                  | "WHITE"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs117 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "36"^^xsd:string | "84"^^xsd:int              | "_NONMISS_"              | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs072 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "race"      | "NA"^^xsd:string | "22"^^xsd:string | "100"^^xsd:double          | "_ALL_"                  | "_NONMISS_"                        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs001 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_NONMISS_ | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "1"^^xsd:string  | "86"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_NONMISS_" |
## | ds:obs026 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "6"^^xsd:string  | "77.5"^^xsd:double         | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs006 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_NONMISS_ | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "sex"       | "NA"^^xsd:string | "1"^^xsd:string  | "100"^^xsd:double          | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_NONMISS_" |
## | ds:obs106 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "31"^^xsd:string | "53.5"                     | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs061 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_80       | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "21"^^xsd:string | "30"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | ">80"       | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs065 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_80       | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "21"^^xsd:string | "34.523809524"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | ">80"       | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs111 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "32"^^xsd:string | "108"^^xsd:double          | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs071 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "race"      | "NA"^^xsd:string | "22"^^xsd:string | "100"^^xsd:double          | "_ALL_"                  | "_NONMISS_"                        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs116 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "36"^^xsd:string | "84"^^xsd:int              | "_NONMISS_"              | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs075 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "23"^^xsd:string | "74"^^xsd:int              | "_ALL_"                  | "WHITE"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs100 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "29"^^xsd:string | "62.759302326"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs105 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "30"^^xsd:string | "80.3"                     | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs060 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-65-80     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "20"^^xsd:string | "65.476190476"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "65-80"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs016 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-M         | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "sex"       | "NA"^^xsd:string | "3"^^xsd:string  | "38.372093023"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "M"         |
## | ds:obs064 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_80       | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "21"^^xsd:string | "34.88372093"^^xsd:double  | "_ALL_"                  | "_ALL_"                            | "percent"      | ">80"       | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs036 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "9"^^xsd:string  | "70.5"                     | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs110 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "32"^^xsd:string | "106.1"^^xsd:double        | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs126 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "38"^^xsd:string | "96.428571429"^^xsd:double | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs081 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "24"^^xsd:string | "9"^^xsd:int               | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs010 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-F         | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "sex"       | "NA"^^xsd:string | "2"^^xsd:string  | "61.627906977"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "F"         |
## | ds:obs085 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "25"^^xsd:string | "0"^^xsd:int               | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs035 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "9"^^xsd:string  | "71"                       | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs120 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "36"^^xsd:string | "100"^^xsd:double          | "_NONMISS_"              | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs080 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "24"^^xsd:string | "6"^^xsd:int               | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs033 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "8"^^xsd:string  | "80"                       | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs090 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "race"      | "NA"^^xsd:string | "25"^^xsd:string | "1.1904761905"^^xsd:double | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs015 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-M         | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "3"^^xsd:string  | "44"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "M"         |
## | ds:obs043 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_NONMISS_ | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "18"^^xsd:string | "86"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_NONMISS_" | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs125 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "38"^^xsd:string | "92.857142857"^^xsd:double | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs042 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "11"^^xsd:string | "56"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs095 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "27"^^xsd:string | "83"                       | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs099 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "28"^^xsd:string | "69.2"^^xsd:double         | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs052 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_65       | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "19"^^xsd:string | "16.279069767"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "<65"       | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs029 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "7"^^xsd:string  | "75.666666667"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs023 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "5"^^xsd:string  | "84"                       | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs059 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-65-80     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "20"^^xsd:string | "55.952380952"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "65-80"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs028 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "7"^^xsd:string  | "75.209302326"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs022 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "5"^^xsd:string  | "86"                       | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs009 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-F         | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "2"^^xsd:string  | "40"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "F"         |
## | ds:obs057 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-65-80     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "20"^^xsd:string | "55"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "65-80"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs038 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "10"^^xsd:string | "88"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs003 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_NONMISS_ | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "1"^^xsd:string  | "84"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_NONMISS_" |
## | ds:obs119 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "36"^^xsd:string | "100"^^xsd:double          | "_NONMISS_"              | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs078 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "race"      | "NA"^^xsd:string | "23"^^xsd:string | "88.095238095"^^xsd:double | "_ALL_"                  | "WHITE"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs008 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-F         | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "2"^^xsd:string  | "50"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "F"         |
## | ds:obs108 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "31"^^xsd:string | "56.75"                    | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs118 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "36"^^xsd:string | "100"^^xsd:double          | "_NONMISS_"              | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs067 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "22"^^xsd:string | "86"^^xsd:int              | "_ALL_"                  | "_NONMISS_"                        | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs018 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-M         | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "sex"       | "NA"^^xsd:string | "3"^^xsd:string  | "52.380952381"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "M"         |
## | ds:obs113 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "33"^^xsd:string | "45.4"^^xsd:double         | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs073 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "23"^^xsd:string | "78"^^xsd:int              | "_ALL_"                  | "WHITE"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs002 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_NONMISS_ | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "1"^^xsd:string  | "84"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_NONMISS_" |
## | ds:obs102 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "29"^^xsd:string | "70.004761905"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs077 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "race"      | "NA"^^xsd:string | "23"^^xsd:string | "92.857142857"^^xsd:double | "_ALL_"                  | "WHITE"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs107 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "31"^^xsd:string | "55.8"                     | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs062 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_80       | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "21"^^xsd:string | "29"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | ">80"       | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs030 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "7"^^xsd:string  | "74.380952381"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs066 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_80       | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "21"^^xsd:string | "21.428571429"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | ">80"       | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs112 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "33"^^xsd:string | "34"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs128 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "40"^^xsd:string | "6"^^xsd:int               | "HISPANIC OR LATINO"     | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs083 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "race"      | "NA"^^xsd:string | "24"^^xsd:string | "7.1428571429"^^xsd:double | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs101 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "29"^^xsd:string | "67.279518072"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs012 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-F         | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "sex"       | "NA"^^xsd:string | "2"^^xsd:string  | "47.619047619"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "F"         |
## | ds:obs017 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-M         | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "sex"       | "NA"^^xsd:string | "3"^^xsd:string  | "40.476190476"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "M"         |
## | ds:obs087 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "25"^^xsd:string | "1"^^xsd:int               | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs037 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "10"^^xsd:string | "89"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs122 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "38"^^xsd:string | "78"^^xsd:int              | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs127 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "40"^^xsd:string | "3"^^xsd:int               | "HISPANIC OR LATINO"     | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs011 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-F         | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "sex"       | "NA"^^xsd:string | "2"^^xsd:string  | "59.523809524"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "F"         |
## | ds:obs082 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "race"      | "NA"^^xsd:string | "24"^^xsd:string | "9.3023255814"^^xsd:double | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs086 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "25"^^xsd:string | "0"^^xsd:int               | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs047 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_NONMISS_ | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "18"^^xsd:string | "100"^^xsd:double          | "_ALL_"                  | "_ALL_"                            | "percent"      | "_NONMISS_" | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs121 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "38"^^xsd:string | "83"^^xsd:int              | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs092 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "26"^^xsd:string | "14.123598649"             | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs096 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "27"^^xsd:string | "84"                       | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs046 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_NONMISS_ | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "18"^^xsd:string | "100"^^xsd:double          | "_ALL_"                  | "_ALL_"                            | "percent"      | "_NONMISS_" | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs045 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_NONMISS_ | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "18"^^xsd:string | "84"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_NONMISS_" | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs131 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "ethnic"    | "NA"^^xsd:string | "40"^^xsd:string | "7.1428571429"^^xsd:double | "HISPANIC OR LATINO"     | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs091 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "26"^^xsd:string | "12.771543533"             | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs040 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "11"^^xsd:string | "52"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs044 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_NONMISS_ | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "18"^^xsd:string | "84"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "_NONMISS_" | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs050 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_65       | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "19"^^xsd:string | "8"^^xsd:int               | "_ALL_"                  | "_ALL_"                            | "count"        | "<65"       | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs054 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_65       | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "19"^^xsd:string | "13.095238095"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "<65"       | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs005 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_NONMISS_ | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "sex"       | "NA"^^xsd:string | "1"^^xsd:string  | "100"^^xsd:double          | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_NONMISS_" |
## | ds:obs053 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_65       | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | "agegr1"    | "NA"^^xsd:string | "19"^^xsd:string | "9.5238095238"^^xsd:double | "_ALL_"                  | "_ALL_"                            | "percent"      | "<65"       | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs025 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "6"^^xsd:string  | "76"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs115 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "36"^^xsd:string | "86"^^xsd:int              | "_NONMISS_"              | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs070 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "race"      | "NA"^^xsd:string | "22"^^xsd:string | "100"^^xsd:double          | "_ALL_"                  | "_NONMISS_"                        | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
## | ds:obs074 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "23"^^xsd:string | "78"^^xsd:int              | "_ALL_"                  | "WHITE"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs104 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "30"^^xsd:string | "77.8"                     | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs024 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "5"^^xsd:string  | "84"                       | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs063 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_80       | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "21"^^xsd:string | "18"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | ">80"       | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs034 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "9"^^xsd:string  | "69"                       | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
## | ds:obs039 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "10"^^xsd:string | "88"^^xsd:double           | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs069 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "22"^^xsd:string | "84"^^xsd:int              | "_ALL_"                  | "_NONMISS_"                        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
## | ds:obs004 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_NONMISS_ | "2"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | "sex"       | "NA"^^xsd:string | "1"^^xsd:string  | "100"^^xsd:double          | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_NONMISS_" |
## | ds:obs079 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "24"^^xsd:string | "8"^^xsd:int               | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs109 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "32"^^xsd:string | "86.2"^^xsd:double         | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
## | ds:obs068 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "22"^^xsd:string | "84"^^xsd:int              | "_ALL_"                  | "_NONMISS_"                        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs032 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "2"^^xsd:string | ""          | "NA"^^xsd:string | "8"^^xsd:string  | "82"                       | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
## | ds:obs049 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_65       | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | "1"^^xsd:string | "%6.0f"^^xsd:string | "1"^^xsd:string | ""          | "NA"^^xsd:string | "19"^^xsd:string | "14"^^xsd:int              | "_ALL_"                  | "_ALL_"                            | "count"        | "<65"       | "quantity"   | "Placebo"              | "_ALL_"     |
## | ds:obs114 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "1"^^xsd:string | "%6.1f"^^xsd:string | "3"^^xsd:string | ""          | "NA"^^xsd:string | "33"^^xsd:string | "41.7"^^xsd:double         | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
```

## Get definition for all descriptive statistics - class `code:procedure`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure.rq 
```

```
## -----------------------------------------------------------------------------------------------------------
## | procedure              | prefLabel | functiondef                                                        |
## ===========================================================================================================
## | code:procedure-max     | "max"     | "function (x)  {     max(x, na.rm = TRUE) }"                       |
## | code:procedure-std     | "std"     | "function (x)  {     sd(x, na.rm = TRUE) }"                        |
## | code:procedure-mean    | "mean"    | "function (x)  {     mean(x, na.rm = TRUE) }"                      |
## | code:procedure-min     | "min"     | "function (x)  {     min(x, na.rm = TRUE) }"                       |
## | code:procedure-percent | "percent" | "function (x)  {     -1 }"                                         |
## | code:procedure-count   | "count"   | "function (x)  {     length(x) }"                                  |
## | code:procedure-q3      | "q3"      | "function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }" |
## | code:procedure-n       | "n"       | "function (x)  {     length(x[!is.na(x)]) }"                       |
## | code:procedure-median  | "median"  | "function (x)  {     median(x, na.rm = TRUE) }"                    |
## | code:procedure-q1      | "q1"      | "function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }" |
## -----------------------------------------------------------------------------------------------------------
```

## Get the codelist definition for all descriptive statistics - class `code:procedure`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-codelist.rq 
```

```
## ---------------------------------------------------------------------------------------------------------------------------------
## | s                      | p                               | o                                                                  |
## =================================================================================================================================
## | code:procedure-min     | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-min     | skos:prefLabel                  | "min"                                                              |
## | code:procedure-min     | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-min     | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     min(x, na.rm = TRUE) }"                       |
## | code:procedure-min     | rrdfqbcrnd0:R-selectionvalue    | "min"                                                              |
## | code:procedure-min     | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-min     | rdfs:comment                    | "Descriptive statistics min"@en                                    |
## | code:procedure-min     | rdf:type                        | skos:Concept                                                       |
## | code:procedure-min     | rdf:type                        | code:Procedure                                                     |
## | code:procedure-std     | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-std     | skos:prefLabel                  | "std"                                                              |
## | code:procedure-std     | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-std     | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     sd(x, na.rm = TRUE) }"                        |
## | code:procedure-std     | rrdfqbcrnd0:R-selectionvalue    | "std"                                                              |
## | code:procedure-std     | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-std     | rdfs:comment                    | "Descriptive statistics std"@en                                    |
## | code:procedure-std     | rdf:type                        | skos:Concept                                                       |
## | code:procedure-std     | rdf:type                        | code:Procedure                                                     |
## | code:procedure-q3      | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-q3      | skos:prefLabel                  | "q3"                                                               |
## | code:procedure-q3      | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-q3      | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }" |
## | code:procedure-q3      | rrdfqbcrnd0:R-selectionvalue    | "q3"                                                               |
## | code:procedure-q3      | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-q3      | rdfs:comment                    | "Descriptive statistics q3"@en                                     |
## | code:procedure-q3      | rdf:type                        | skos:Concept                                                       |
## | code:procedure-q3      | rdf:type                        | code:Procedure                                                     |
## | code:procedure-median  | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-median  | skos:prefLabel                  | "median"                                                           |
## | code:procedure-median  | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-median  | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     median(x, na.rm = TRUE) }"                    |
## | code:procedure-median  | rrdfqbcrnd0:R-selectionvalue    | "median"                                                           |
## | code:procedure-median  | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-median  | rdfs:comment                    | "Descriptive statistics median"@en                                 |
## | code:procedure-median  | rdf:type                        | skos:Concept                                                       |
## | code:procedure-median  | rdf:type                        | code:Procedure                                                     |
## | code:procedure-count   | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-count   | skos:prefLabel                  | "count"                                                            |
## | code:procedure-count   | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-count   | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     length(x) }"                                  |
## | code:procedure-count   | rrdfqbcrnd0:R-selectionvalue    | "count"                                                            |
## | code:procedure-count   | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-count   | rdfs:comment                    | "Descriptive statistics count"@en                                  |
## | code:procedure-count   | rdf:type                        | skos:Concept                                                       |
## | code:procedure-count   | rdf:type                        | code:Procedure                                                     |
## | code:procedure-max     | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-max     | skos:prefLabel                  | "max"                                                              |
## | code:procedure-max     | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-max     | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     max(x, na.rm = TRUE) }"                       |
## | code:procedure-max     | rrdfqbcrnd0:R-selectionvalue    | "max"                                                              |
## | code:procedure-max     | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-max     | rdfs:comment                    | "Descriptive statistics max"@en                                    |
## | code:procedure-max     | rdf:type                        | skos:Concept                                                       |
## | code:procedure-max     | rdf:type                        | code:Procedure                                                     |
## | code:procedure-mean    | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-mean    | skos:prefLabel                  | "mean"                                                             |
## | code:procedure-mean    | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-mean    | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     mean(x, na.rm = TRUE) }"                      |
## | code:procedure-mean    | rrdfqbcrnd0:R-selectionvalue    | "mean"                                                             |
## | code:procedure-mean    | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-mean    | rdfs:comment                    | "Descriptive statistics mean"@en                                   |
## | code:procedure-mean    | rdf:type                        | skos:Concept                                                       |
## | code:procedure-mean    | rdf:type                        | code:Procedure                                                     |
## | code:procedure-q1      | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-q1      | skos:prefLabel                  | "q1"                                                               |
## | code:procedure-q1      | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-q1      | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }" |
## | code:procedure-q1      | rrdfqbcrnd0:R-selectionvalue    | "q1"                                                               |
## | code:procedure-q1      | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-q1      | rdfs:comment                    | "Descriptive statistics q1"@en                                     |
## | code:procedure-q1      | rdf:type                        | skos:Concept                                                       |
## | code:procedure-q1      | rdf:type                        | code:Procedure                                                     |
## | code:procedure-n       | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-n       | skos:prefLabel                  | "n"                                                                |
## | code:procedure-n       | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-n       | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     length(x[!is.na(x)]) }"                       |
## | code:procedure-n       | rrdfqbcrnd0:R-selectionvalue    | "n"                                                                |
## | code:procedure-n       | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-n       | rdfs:comment                    | "Descriptive statistics n"@en                                      |
## | code:procedure-n       | rdf:type                        | skos:Concept                                                       |
## | code:procedure-n       | rdf:type                        | code:Procedure                                                     |
## | code:procedure-percent | skos:topConceptOf               | code:procedure                                                     |
## | code:procedure-percent | skos:prefLabel                  | "percent"                                                          |
## | code:procedure-percent | skos:inScheme                   | code:procedure                                                     |
## | code:procedure-percent | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     -1 }"                                         |
## | code:procedure-percent | rrdfqbcrnd0:R-selectionvalue    | "percent"                                                          |
## | code:procedure-percent | rrdfqbcrnd0:R-selectionoperator | "=="                                                               |
## | code:procedure-percent | rdfs:comment                    | "Descriptive statistics percent"@en                                |
## | code:procedure-percent | rdf:type                        | skos:Concept                                                       |
## | code:procedure-percent | rdf:type                        | code:Procedure                                                     |
## ---------------------------------------------------------------------------------------------------------------------------------
```

## Get definition for all variables used for descriptive statistics - class `code:factor`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor.rq 
```

```
## ---------------------------------------------------------------------------------------
## | factor                 | prefLabel    | DataSetRefD2RQ            | Rselectionvalue |
## =======================================================================================
## | code:factor-_ALL_      | "_ALL_"      |                           |                 |
## | code:factor-proportion | "proportion" |                           | "proportion"    |
## | code:factor-weightbl   | "weightbl"   | rrdfqbcrnd0:ADSL_WEIGHTBL | "weightbl"      |
## | code:factor-_NONMISS_  | "_NONMISS_"  |                           |                 |
## | code:factor-quantity   | "quantity"   |                           | "quantity"      |
## | code:factor-age        | "age"        | rrdfqbcrnd0:ADSL_AGE      | "age"           |
## ---------------------------------------------------------------------------------------
```

## Get the codelist definition for all variables used for descriptive statistics - class `code:factor`

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor-codelist.rq 
```

```
## ---------------------------------------------------------------------------------------------------------------------------------------------------------------
## | s                      | p                               | o                                                                                                |
## ===============================================================================================================================================================
## | code:factor-weightbl   | skos:topConceptOf               | code:factor                                                                                      |
## | code:factor-weightbl   | skos:prefLabel                  | "weightbl"                                                                                       |
## | code:factor-weightbl   | skos:inScheme                   | code:factor                                                                                      |
## | code:factor-weightbl   | rrdfqbcrnd0:R-selectionvalue    | "weightbl"                                                                                       |
## | code:factor-weightbl   | rrdfqbcrnd0:R-selectionoperator | "=="                                                                                             |
## | code:factor-weightbl   | rrdfqbcrnd0:DataSetRefD2RQ      | rrdfqbcrnd0:ADSL_WEIGHTBL                                                                        |
## | code:factor-weightbl   | rdfs:comment                    | "Coded values from data source. No reconciliation against another source"@en                     |
## | code:factor-weightbl   | rdf:type                        | skos:Concept                                                                                     |
## | code:factor-weightbl   | rdf:type                        | code:Factor                                                                                      |
## | code:factor-age        | skos:topConceptOf               | code:factor                                                                                      |
## | code:factor-age        | skos:prefLabel                  | "age"                                                                                            |
## | code:factor-age        | skos:inScheme                   | code:factor                                                                                      |
## | code:factor-age        | rrdfqbcrnd0:R-selectionvalue    | "age"                                                                                            |
## | code:factor-age        | rrdfqbcrnd0:R-selectionoperator | "=="                                                                                             |
## | code:factor-age        | rrdfqbcrnd0:DataSetRefD2RQ      | rrdfqbcrnd0:ADSL_AGE                                                                             |
## | code:factor-age        | rdfs:comment                    | "Coded values from data source. No reconciliation against another source"@en                     |
## | code:factor-age        | rdf:type                        | skos:Concept                                                                                     |
## | code:factor-age        | rdf:type                        | code:Factor                                                                                      |
## | code:factor-_ALL_      | skos:topConceptOf               | code:factor                                                                                      |
## | code:factor-_ALL_      | skos:prefLabel                  | "_ALL_"                                                                                          |
## | code:factor-_ALL_      | skos:inScheme                   | code:factor                                                                                      |
## | code:factor-_ALL_      | rdfs:comment                    | "NON-CDISC: Represents all codelist categories."@en                                              |
## | code:factor-_ALL_      | rdf:type                        | skos:Concept                                                                                     |
## | code:factor-_ALL_      | rdf:type                        | code:Factor                                                                                      |
## | code:factor-quantity   | skos:topConceptOf               | code:factor                                                                                      |
## | code:factor-quantity   | skos:prefLabel                  | "quantity"                                                                                       |
## | code:factor-quantity   | skos:inScheme                   | code:factor                                                                                      |
## | code:factor-quantity   | rrdfqbcrnd0:R-selectionvalue    | "quantity"                                                                                       |
## | code:factor-quantity   | rrdfqbcrnd0:R-selectionoperator | "=="                                                                                             |
## | code:factor-quantity   | rdfs:comment                    | "Coded values from data source. No reconciliation against another source"@en                     |
## | code:factor-quantity   | rdf:type                        | skos:Concept                                                                                     |
## | code:factor-quantity   | rdf:type                        | code:Factor                                                                                      |
## | code:factor-_NONMISS_  | skos:topConceptOf               | code:factor                                                                                      |
## | code:factor-_NONMISS_  | skos:prefLabel                  | "_NONMISS_"                                                                                      |
## | code:factor-_NONMISS_  | skos:inScheme                   | code:factor                                                                                      |
## | code:factor-_NONMISS_  | rrdfqbcrnd0:R-selectionfunction | "is.na"                                                                                          |
## | code:factor-_NONMISS_  | rdfs:comment                    | "NON-CDISC: Represents the non-missing codelist categories. Does not include missing values."@en |
## | code:factor-_NONMISS_  | rdf:type                        | skos:Concept                                                                                     |
## | code:factor-_NONMISS_  | rdf:type                        | code:Factor                                                                                      |
## | code:factor-proportion | skos:topConceptOf               | code:factor                                                                                      |
## | code:factor-proportion | skos:prefLabel                  | "proportion"                                                                                     |
## | code:factor-proportion | skos:inScheme                   | code:factor                                                                                      |
## | code:factor-proportion | rrdfqbcrnd0:R-selectionvalue    | "proportion"                                                                                     |
## | code:factor-proportion | rrdfqbcrnd0:R-selectionoperator | "=="                                                                                             |
## | code:factor-proportion | rdfs:comment                    | "Coded values from data source. No reconciliation against another source"@en                     |
## | code:factor-proportion | rdf:type                        | skos:Concept                                                                                     |
## | code:factor-proportion | rdf:type                        | code:Factor                                                                                      |
## ---------------------------------------------------------------------------------------------------------------------------------------------------------------
```

## Get definition for descriptive statistics median

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-median.rq 
```

```
## -------------------------------------------------------------------------------------------------------------
## | s                     | p                               | o                                               |
## =============================================================================================================
## | code:procedure-median | skos:topConceptOf               | code:procedure                                  |
## | code:procedure-median | skos:prefLabel                  | "median"                                        |
## | code:procedure-median | skos:inScheme                   | code:procedure                                  |
## | code:procedure-median | rrdfqbcrnd0:RdescStatDefFun     | "function (x)  {     median(x, na.rm = TRUE) }" |
## | code:procedure-median | rrdfqbcrnd0:R-selectionvalue    | "median"                                        |
## | code:procedure-median | rrdfqbcrnd0:R-selectionoperator | "=="                                            |
## | code:procedure-median | rdfs:comment                    | "Descriptive statistics median"@en              |
## | code:procedure-median | rdf:type                        | skos:Concept                                    |
## | code:procedure-median | rdf:type                        | code:Procedure                                  |
## -------------------------------------------------------------------------------------------------------------
```

## Get information for selection of data

The SPARQL script shows how the information for selecting data for derivation of univariate statistics is present in the cube.

```bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations-R-selection.rq
```

```
## ------------------------------------------------------------------------------------
## | obs       | rrdfqbcrnd0Rcolumnname | Rselectionoperator | Rselectionvalue        |
## ====================================================================================
## | ds:obs027 | "trt01a"               | "=="               | "Xanomeline High Dose" |
## | ds:obs056 | "agegr1"               | "=="               | "65-80"                |
## | ds:obs056 | "trt01a"               | "=="               | "Xanomeline Low Dose"  |
## ------------------------------------------------------------------------------------
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
## | <adsl-map.ttl#ADSL_AGEU>     | "ADSL.AGEU"     |              |
## | <adsl-map.ttl#ADSL_TRT01PN>  | "ADSL.TRT01PN"  | xsd:double   |
## | <adsl-map.ttl#ADSL_SUBJID>   | "ADSL.SUBJID"   |              |
## | <adsl-map.ttl#ADSL_AVGDD>    | "ADSL.AVGDD"    | xsd:double   |
## | <adsl-map.ttl#ADSL_COMP24FL> | "ADSL.COMP24FL" |              |
## | <adsl-map.ttl#ADSL_USUBJID>  | "ADSL.USUBJID"  |              |
## | <adsl-map.ttl#ADSL_TRTSDT>   | "ADSL.TRTSDT"   | xsd:double   |
## | <adsl-map.ttl#ADSL_TRTEDT>   | "ADSL.TRTEDT"   | xsd:double   |
## | <adsl-map.ttl#ADSL_DSRAEFL>  | "ADSL.DSRAEFL"  |              |
## | <adsl-map.ttl#ADSL_AGEGR1>   | "ADSL.AGEGR1"   |              |
## | <adsl-map.ttl#ADSL_DCREASCD> | "ADSL.DCREASCD" |              |
## | <adsl-map.ttl#ADSL_DTHFL>    | "ADSL.DTHFL"    |              |
## | <adsl-map.ttl#ADSL_VISNUMEN> | "ADSL.VISNUMEN" | xsd:double   |
## | <adsl-map.ttl#ADSL_DCDECOD>  | "ADSL.DCDECOD"  |              |
## | <adsl-map.ttl#ADSL_STUDYID>  | "ADSL.STUDYID"  |              |
## | <adsl-map.ttl#ADSL_RFENDTC>  | "ADSL.RFENDTC"  |              |
## | <adsl-map.ttl#ADSL_SITEGR1>  | "ADSL.SITEGR1"  |              |
## | <adsl-map.ttl#ADSL_COMP16FL> | "ADSL.COMP16FL" |              |
## | <adsl-map.ttl#ADSL_CUMDOSE>  | "ADSL.CUMDOSE"  | xsd:double   |
## | <adsl-map.ttl#ADSL_BMIBL>    | "ADSL.BMIBL"    | xsd:double   |
## | <adsl-map.ttl#ADSL_ITTFL>    | "ADSL.ITTFL"    |              |
## | <adsl-map.ttl#ADSL_HEIGHTBL> | "ADSL.HEIGHTBL" | xsd:double   |
## | <adsl-map.ttl#ADSL_TRT01P>   | "ADSL.TRT01P"   |              |
## | <adsl-map.ttl#ADSL_ARM>      | "ADSL.ARM"      |              |
## | <adsl-map.ttl#ADSL_TRT01AN>  | "ADSL.TRT01AN"  | xsd:double   |
## | <adsl-map.ttl#ADSL_MMSETOT>  | "ADSL.MMSETOT"  | xsd:double   |
## | <adsl-map.ttl#ADSL_DURDSGR1> | "ADSL.DURDSGR1" |              |
## | <adsl-map.ttl#ADSL_RFENDT>   | "ADSL.RFENDT"   | xsd:double   |
## | <adsl-map.ttl#ADSL_SEX>      | "ADSL.SEX"      |              |
## | <adsl-map.ttl#ADSL_RACE>     | "ADSL.RACE"     |              |
## | <adsl-map.ttl#ADSL_AGE>      | "ADSL.AGE"      | xsd:double   |
## | <adsl-map.ttl#ADSL_TRT01A>   | "ADSL.TRT01A"   |              |
## | <adsl-map.ttl#ADSL_EFFFL>    | "ADSL.EFFFL"    |              |
## | <adsl-map.ttl#ADSL_RFSTDTC>  | "ADSL.RFSTDTC"  |              |
## | <adsl-map.ttl#ADSL_ETHNIC>   | "ADSL.ETHNIC"   |              |
## | <adsl-map.ttl#ADSL_DISONSDT> | "ADSL.DISONSDT" | xsd:double   |
## | <adsl-map.ttl#ADSL_WEIGHTBL> | "ADSL.WEIGHTBL" | xsd:double   |
## | <adsl-map.ttl#ADSL_RACEN>    | "ADSL.RACEN"    | xsd:double   |
## | <adsl-map.ttl#ADSL_VISIT1DT> | "ADSL.VISIT1DT" | xsd:double   |
## | <adsl-map.ttl#ADSL_BMIBLGR1> | "ADSL.BMIBLGR1" |              |
## | <adsl-map.ttl#ADSL_COMP8FL>  | "ADSL.COMP8FL"  |              |
## | <adsl-map.ttl#ADSL_AGEGR1N>  | "ADSL.AGEGR1N"  | xsd:double   |
## | <adsl-map.ttl#ADSL_SAFFL>    | "ADSL.SAFFL"    |              |
## | <adsl-map.ttl#ADSL_TRTDUR>   | "ADSL.TRTDUR"   | xsd:double   |
## | <adsl-map.ttl#ADSL_DISCONFL> | "ADSL.DISCONFL" |              |
## | <adsl-map.ttl#ADSL_DURDIS>   | "ADSL.DURDIS"   | xsd:double   |
## | <adsl-map.ttl#ADSL_SITEID>   | "ADSL.SITEID"   |              |
## | <adsl-map.ttl#ADSL_EDUCLVL>  | "ADSL.EDUCLVL"  | xsd:double   |
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
## -------------------------------------------
## | record | p | o | CountCrit | XCountCrit |
## ===========================================
## -------------------------------------------
```


# How to run this .Rmd file
.. add text ..
