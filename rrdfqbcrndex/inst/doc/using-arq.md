SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)
=============================================================

The examples below uses `arq` from Apache Jena (<http://jena.apache.org>). To install arq - download and unpack the latest version of apache-jena from (<http://jena.apache.org/download/index.cgi>). Then you need some way of invoking `arq`; I use a not-so-clever-approach: `cd ~/bin; ln -s /opt/apache-jena-2.13.0/bin/arq`.

Given a SPARQL query and RDF data, `arq` returns the result of the query. So this is the command line way of making a SPARQL query.

The use of arq is described many places, see for example (<http://www.learningsparql.com/>).

All `arq` commands below are to be run in the directory with the sample files, which is `inst/extdata/sample-rdf` directory or `extdata/sample-rdf` depending on the whether the development version or the installed version of the package is used.

The cd below in each code block is included because I could not find a quick way to get the code chunk executed in that directory. knitr is flexible enough to do it, I have not yet found the right way to do it. So, ignore the repeated cd ..

Get dimensions
--------------

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOdimensions.rq 
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

Get attributes
--------------

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOattributes.rq 
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

Get observations
----------------

The SPARQL script shows for each observation the dimension, attributes and measures in a row. Note: in the HTML version the output below can be scrolled using the left and right arrow.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations.rq 
```

    ## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ## | s         | ethnic                             | race                                       | procedure              | agegr1                | factor                 | trt01a                           | sex                | denominator | measure                    | unit | cellpartno | measurefmt | colno | rowno | ethnicvalue              | racevalue                          | procedurevalue | agegr1value | factorvalue  | trt01avalue            | sexvalue    |
    ## ==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
    ## | ds:obs103 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "74.4"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "1"   | "30"  | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs014 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-M         | ""          | "34"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "3"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "M"         |
    ## | ds:obs089 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "race"      | "0"^^xsd:double            | "NA" | "2"        | "%6.1f"    | "2"   | "25"  | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs019 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "8.5901671271"^^xsd:double | "NA" | "1"        | "%6.1f"    | "1"   | "4"   | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs031 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "82"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "1"   | "8"   | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs013 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-M         | ""          | "33"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "3"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "M"         |
    ## | ds:obs124 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "ethnic"    | "96.511627907"^^xsd:double | "NA" | "2"        | "%6.1f"    | "1"   | "38"  | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs084 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "race"      | "10.714285714"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "24"  | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs129 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "3"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "3"   | "40"  | "HISPANIC OR LATINO"     | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs088 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "race"      | "0"^^xsd:double            | "NA" | "2"        | "%6.1f"    | "1"   | "25"  | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs041 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "51"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "2"   | "11"  | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs123 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "81"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "38"  | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs094 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "86"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "27"  | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs098 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "64.9"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "2"   | "28"  | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs048 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_NONMISS_ | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "agegr1"    | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "3"   | "18"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "_NONMISS_" | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs093 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "14.653433372"^^xsd:double | "NA" | "1"        | "%6.1f"    | "3"   | "26"  | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs097 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "60.55"^^xsd:double        | "NA" | "1"        | "%6.1f"    | "1"   | "28"  | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs021 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "7.8860938487"^^xsd:double | "NA" | "1"        | "%6.1f"    | "3"   | "4"   | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs058 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-65-80     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "agegr1"    | "48.837209302"^^xsd:double | "NA" | "2"        | "%6.1f"    | "1"   | "20"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "65-80"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs132 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "ethnic"    | "3.5714285714"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "40"  | "HISPANIC OR LATINO"     | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs027 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "76"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "3"   | "6"   | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs020 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "8.2860505995"^^xsd:double | "NA" | "1"        | "%6.1f"    | "2"   | "4"   | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs056 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-65-80     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "47"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "20"  | "_ALL_"                  | "_ALL_"                            | "count"        | "65-80"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs130 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "ethnic"    | "3.488372093"^^xsd:double  | "NA" | "2"        | "%6.1f"    | "1"   | "40"  | "HISPANIC OR LATINO"     | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs051 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_65       | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "11"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "19"  | "_ALL_"                  | "_ALL_"                            | "count"        | "<65"       | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs007 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-F         | ""          | "53"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "2"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "F"         |
    ## | ds:obs055 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-65-80     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "42"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "20"  | "_ALL_"                  | "_ALL_"                            | "count"        | "65-80"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs076 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "race"      | "90.697674419"^^xsd:double | "NA" | "2"        | "%6.1f"    | "1"   | "23"  | "_ALL_"                  | "WHITE"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs117 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "36"  | "_NONMISS_"              | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs072 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "race"      | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "3"   | "22"  | "_ALL_"                  | "_NONMISS_"                        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs001 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_NONMISS_ | ""          | "86"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "1"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_NONMISS_" |
    ## | ds:obs026 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "77.5"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "2"   | "6"   | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs006 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_NONMISS_ | "sex"       | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "3"   | "1"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_NONMISS_" |
    ## | ds:obs106 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "53.5"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "1"   | "31"  | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs061 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_80       | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "30"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "21"  | "_ALL_"                  | "_ALL_"                            | "count"        | ">80"       | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs065 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_80       | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "agegr1"    | "34.523809524"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "21"  | "_ALL_"                  | "_ALL_"                            | "percent"      | ">80"       | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs111 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "108"^^xsd:double          | "NA" | "1"        | "%6.1f"    | "3"   | "32"  | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs071 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "race"      | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "2"   | "22"  | "_ALL_"                  | "_NONMISS_"                        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs116 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "36"  | "_NONMISS_"              | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs075 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "74"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "23"  | "_ALL_"                  | "WHITE"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs100 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "62.759302326"^^xsd:double | "NA" | "1"        | "%6.1f"    | "1"   | "29"  | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs105 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "80.3"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "3"   | "30"  | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs060 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-65-80     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "agegr1"    | "65.476190476"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "20"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "65-80"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs016 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-M         | "sex"       | "38.372093023"^^xsd:double | "NA" | "2"        | "%6.1f"    | "1"   | "3"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "M"         |
    ## | ds:obs064 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_80       | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "agegr1"    | "34.88372093"^^xsd:double  | "NA" | "2"        | "%6.1f"    | "1"   | "21"  | "_ALL_"                  | "_ALL_"                            | "percent"      | ">80"       | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs036 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "70.5"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "3"   | "9"   | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs110 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "106.1"^^xsd:double        | "NA" | "1"        | "%6.1f"    | "2"   | "32"  | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs126 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "ethnic"    | "96.428571429"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "38"  | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs081 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "9"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "3"   | "24"  | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs010 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-F         | "sex"       | "61.627906977"^^xsd:double | "NA" | "2"        | "%6.1f"    | "1"   | "2"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "F"         |
    ## | ds:obs085 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "0"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "1"   | "25"  | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs035 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "71"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "2"   | "9"   | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs120 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "ethnic"    | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "3"   | "36"  | "_NONMISS_"              | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs080 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "6"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "2"   | "24"  | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs033 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "80"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "3"   | "8"   | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs090 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "race"      | "1.1904761905"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "25"  | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs015 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-M         | ""          | "44"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "3"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "M"         |
    ## | ds:obs043 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_NONMISS_ | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "86"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "18"  | "_ALL_"                  | "_ALL_"                            | "count"        | "_NONMISS_" | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs125 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "ethnic"    | "92.857142857"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "38"  | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs042 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "56"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "3"   | "11"  | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs095 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "83"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "27"  | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs099 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "69.2"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "3"   | "28"  | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs052 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_65       | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "agegr1"    | "16.279069767"^^xsd:double | "NA" | "2"        | "%6.1f"    | "1"   | "19"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "<65"       | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs029 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "75.666666667"^^xsd:double | "NA" | "1"        | "%6.1f"    | "2"   | "7"   | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs023 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "5"   | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs059 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-65-80     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "agegr1"    | "55.952380952"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "20"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "65-80"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs028 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "75.209302326"^^xsd:double | "NA" | "1"        | "%6.1f"    | "1"   | "7"   | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs022 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "86"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "5"   | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs009 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-F         | ""          | "40"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "2"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "F"         |
    ## | ds:obs057 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-65-80     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "55"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "20"  | "_ALL_"                  | "_ALL_"                            | "count"        | "65-80"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs038 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "88"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "2"   | "10"  | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs003 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_NONMISS_ | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "1"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_NONMISS_" |
    ## | ds:obs119 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "ethnic"    | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "2"   | "36"  | "_NONMISS_"              | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs078 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "race"      | "88.095238095"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "23"  | "_ALL_"                  | "WHITE"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs008 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-F         | ""          | "50"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "2"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "F"         |
    ## | ds:obs108 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "56.75"^^xsd:double        | "NA" | "1"        | "%6.1f"    | "3"   | "31"  | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs118 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "ethnic"    | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "1"   | "36"  | "_NONMISS_"              | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs067 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "86"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "22"  | "_ALL_"                  | "_NONMISS_"                        | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs018 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-M         | "sex"       | "52.380952381"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "3"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "M"         |
    ## | ds:obs113 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "45.4"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "2"   | "33"  | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs073 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "78"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "23"  | "_ALL_"                  | "WHITE"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs002 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_NONMISS_ | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "1"   | "_ALL_"                  | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_NONMISS_" |
    ## | ds:obs102 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "70.004761905"^^xsd:double | "NA" | "1"        | "%6.1f"    | "3"   | "29"  | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs077 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "race"      | "92.857142857"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "23"  | "_ALL_"                  | "WHITE"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs107 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "55.8"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "2"   | "31"  | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs062 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_80       | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "29"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "21"  | "_ALL_"                  | "_ALL_"                            | "count"        | ">80"       | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs030 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "74.380952381"^^xsd:double | "NA" | "1"        | "%6.1f"    | "3"   | "7"   | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs066 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_80       | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "agegr1"    | "21.428571429"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "21"  | "_ALL_"                  | "_ALL_"                            | "percent"      | ">80"       | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs112 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "34"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "1"   | "33"  | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs128 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "6"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "2"   | "40"  | "HISPANIC OR LATINO"     | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs083 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "race"      | "7.1428571429"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "24"  | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs101 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-mean    | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "67.279518072"^^xsd:double | "NA" | "1"        | "%6.1f"    | "2"   | "29"  | "_ALL_"                  | "_ALL_"                            | "mean"         | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs012 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-F         | "sex"       | "47.619047619"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "2"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline High Dose" | "F"         |
    ## | ds:obs017 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-M         | "sex"       | "40.476190476"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "3"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "M"         |
    ## | ds:obs087 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "1"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "3"   | "25"  | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs037 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "89"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "1"   | "10"  | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs122 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "78"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "38"  | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs127 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "3"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "1"   | "40"  | "HISPANIC OR LATINO"     | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs011 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-F         | "sex"       | "59.523809524"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "2"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "F"         |
    ## | ds:obs082 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "race"      | "9.3023255814"^^xsd:double | "NA" | "2"        | "%6.1f"    | "1"   | "24"  | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs086 | code:ethnic-_ALL_                  | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "0"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "2"   | "25"  | "_ALL_"                  | "AMERICAN INDIAN OR ALASKA NATIVE" | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs047 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_NONMISS_ | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "agegr1"    | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "2"   | "18"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "_NONMISS_" | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs121 | code:ethnic-NOT_HISPANIC_OR_LATINO | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "83"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "38"  | "NOT HISPANIC OR LATINO" | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs092 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "14.123598649"^^xsd:double | "NA" | "1"        | "%6.1f"    | "2"   | "26"  | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs096 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "27"  | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs046 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_NONMISS_ | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "agegr1"    | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "1"   | "18"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "_NONMISS_" | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs045 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_NONMISS_ | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "18"  | "_ALL_"                  | "_ALL_"                            | "count"        | "_NONMISS_" | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs131 | code:ethnic-HISPANIC_OR_LATINO     | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "ethnic"    | "7.1428571429"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "40"  | "HISPANIC OR LATINO"     | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs091 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-std     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "12.771543533"^^xsd:double | "NA" | "1"        | "%6.1f"    | "1"   | "26"  | "_ALL_"                  | "_ALL_"                            | "std"          | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs040 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "52"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "1"   | "11"  | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs044 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_NONMISS_ | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "18"  | "_ALL_"                  | "_ALL_"                            | "count"        | "_NONMISS_" | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs050 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_65       | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "8"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "2"   | "19"  | "_ALL_"                  | "_ALL_"                            | "count"        | "<65"       | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs054 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_65       | code:factor-proportion | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | "agegr1"    | "13.095238095"^^xsd:double | "NA" | "2"        | "%6.1f"    | "3"   | "19"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "<65"       | "proportion" | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs005 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_NONMISS_ | "sex"       | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "2"   | "1"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Xanomeline Low Dose"  | "_NONMISS_" |
    ## | ds:obs053 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_65       | code:factor-proportion | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | "agegr1"    | "9.5238095238"^^xsd:double | "NA" | "2"        | "%6.1f"    | "2"   | "19"  | "_ALL_"                  | "_ALL_"                            | "percent"      | "<65"       | "proportion" | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs025 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-median  | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "76"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "1"   | "6"   | "_ALL_"                  | "_ALL_"                            | "median"       | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs115 | code:ethnic-_NONMISS_              | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "86"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "36"  | "_NONMISS_"              | "_ALL_"                            | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs070 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_ALL_     | "race"      | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "1"   | "22"  | "_ALL_"                  | "_NONMISS_"                        | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_ALL_"     |
    ## | ds:obs074 | code:ethnic-_ALL_                  | code:race-WHITE                            | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "78"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "23"  | "_ALL_"                  | "WHITE"                            | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs104 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "77.8"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "2"   | "30"  | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "weightbl"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs024 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-n       | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "5"   | "_ALL_"                  | "_ALL_"                            | "n"            | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs063 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_80       | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "18"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "21"  | "_ALL_"                  | "_ALL_"                            | "count"        | ">80"       | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs034 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q1      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "69"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "1"   | "9"   | "_ALL_"                  | "_ALL_"                            | "q1"           | "_ALL_"     | "age"        | "Placebo"              | "_ALL_"     |
    ## | ds:obs039 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "88"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "3"   | "10"  | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "age"        | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs069 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "3"   | "22"  | "_ALL_"                  | "_NONMISS_"                        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline High Dose" | "_ALL_"     |
    ## | ds:obs004 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-percent | code:agegr1-_ALL_     | code:factor-proportion | code:trt01a-Placebo              | code:sex-_NONMISS_ | "sex"       | "100"^^xsd:double          | "NA" | "2"        | "%6.1f"    | "1"   | "1"   | "_ALL_"                  | "_ALL_"                            | "percent"      | "_ALL_"     | "proportion" | "Placebo"              | "_NONMISS_" |
    ## | ds:obs079 | code:ethnic-_ALL_                  | code:race-BLACK_OR_AFRICAN_AMERICAN        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "8"^^xsd:double            | "NA" | "1"        | "%6.0f"    | "1"   | "24"  | "_ALL_"                  | "BLACK OR AFRICAN AMERICAN"        | "count"        | "_ALL_"     | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs109 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-max     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "86.2"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "1"   | "32"  | "_ALL_"                  | "_ALL_"                            | "max"          | "_ALL_"     | "weightbl"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs068 | code:ethnic-_ALL_                  | code:race-_NONMISS_                        | code:procedure-count   | code:agegr1-_ALL_     | code:factor-quantity   | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "84"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "2"   | "22"  | "_ALL_"                  | "_NONMISS_"                        | "count"        | "_ALL_"     | "quantity"   | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs032 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-q3      | code:agegr1-_ALL_     | code:factor-age        | code:trt01a-Xanomeline_Low_Dose  | code:sex-_ALL_     | ""          | "82"^^xsd:double           | "NA" | "1"        | "%6.1f"    | "2"   | "8"   | "_ALL_"                  | "_ALL_"                            | "q3"           | "_ALL_"     | "age"        | "Xanomeline Low Dose"  | "_ALL_"     |
    ## | ds:obs049 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-count   | code:agegr1-_65       | code:factor-quantity   | code:trt01a-Placebo              | code:sex-_ALL_     | ""          | "14"^^xsd:double           | "NA" | "1"        | "%6.0f"    | "1"   | "19"  | "_ALL_"                  | "_ALL_"                            | "count"        | "<65"       | "quantity"   | "Placebo"              | "_ALL_"     |
    ## | ds:obs114 | code:ethnic-_ALL_                  | code:race-_ALL_                            | code:procedure-min     | code:agegr1-_ALL_     | code:factor-weightbl   | code:trt01a-Xanomeline_High_Dose | code:sex-_ALL_     | ""          | "41.7"^^xsd:double         | "NA" | "1"        | "%6.1f"    | "3"   | "33"  | "_ALL_"                  | "_ALL_"                            | "min"          | "_ALL_"     | "weightbl"   | "Xanomeline High Dose" | "_ALL_"     |
    ## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get definition for all descriptive statistics - class `code:procedure`
----------------------------------------------------------------------

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure.rq 
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

Get the codelists
-----------------

The SPARQL script shows the codelist.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOcodelist.rq 
```

    ## ---------------------------------------------------------------------------------------------------------------------------------------
    ## | codeList       | codelevel                                           | codelist       | prefLabel                                   |
    ## =======================================================================================================================================
    ## | code:ethnic    | code:factor-quantity                                | code:factor    | "quantity"                                  |
    ## | code:ethnic    | code:procedure-max                                  | code:procedure | "max"                                       |
    ## | code:ethnic    | code:procedure-q3                                   | code:procedure | "q3"                                        |
    ## | code:ethnic    | code:sex-F                                          | code:sex       | "F"                                         |
    ## | code:ethnic    | code:agegr1-_65                                     | code:agegr1    | "<65"                                       |
    ## | code:ethnic    | code:factor-proportion                              | code:factor    | "proportion"                                |
    ## | code:ethnic    | code:agegr1-_80                                     | code:agegr1    | ">80"                                       |
    ## | code:ethnic    | code:race-_ALL_                                     | code:race      | "_ALL_"                                     |
    ## | code:ethnic    | code:procedure-mean                                 | code:procedure | "mean"                                      |
    ## | code:ethnic    | code:trt01a-_ALL_                                   | code:trt01a    | "_ALL_"                                     |
    ## | code:ethnic    | code:sex-M                                          | code:sex       | "M"                                         |
    ## | code:ethnic    | code:ethnic-HISPANIC_OR_LATINO                      | code:ethnic    | "HISPANIC OR LATINO"                        |
    ## | code:ethnic    | code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER | code:race      | "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" |
    ## | code:ethnic    | code:ethnic-NOT_HISPANIC_OR_LATINO                  | code:ethnic    | "NOT HISPANIC OR LATINO"                    |
    ## | code:ethnic    | code:procedure-median                               | code:procedure | "median"                                    |
    ## | code:ethnic    | code:ethnic-_NONMISS_                               | code:ethnic    | "_NONMISS_"                                 |
    ## | code:ethnic    | code:procedure-q1                                   | code:procedure | "q1"                                        |
    ## | code:ethnic    | code:trt01a-Xanomeline_High_Dose                    | code:trt01a    | "Xanomeline High Dose"                      |
    ## | code:ethnic    | code:agegr1-_ALL_                                   | code:agegr1    | "_ALL_"                                     |
    ## | code:ethnic    | code:sex-UN                                         | code:sex       | "UN"                                        |
    ## | code:ethnic    | code:sex-_ALL_                                      | code:sex       | "_ALL_"                                     |
    ## | code:ethnic    | code:race-ASIAN                                     | code:race      | "ASIAN"                                     |
    ## | code:ethnic    | code:race-WHITE                                     | code:race      | "WHITE"                                     |
    ## | code:ethnic    | code:trt01a-_NONMISS_                               | code:trt01a    | "_NONMISS_"                                 |
    ## | code:ethnic    | code:sex-_NONMISS_                                  | code:sex       | "_NONMISS_"                                 |
    ## | code:ethnic    | code:factor-age                                     | code:factor    | "age"                                       |
    ## | code:ethnic    | code:ethnic-_ALL_                                   | code:ethnic    | "_ALL_"                                     |
    ## | code:ethnic    | code:procedure-n                                    | code:procedure | "n"                                         |
    ## | code:ethnic    | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          | code:race      | "AMERICAN INDIAN OR ALASKA NATIVE"          |
    ## | code:ethnic    | code:trt01a-Placebo                                 | code:trt01a    | "Placebo"                                   |
    ## | code:ethnic    | code:factor-weightbl                                | code:factor    | "weightbl"                                  |
    ## | code:ethnic    | code:trt01a-Xanomeline_Low_Dose                     | code:trt01a    | "Xanomeline Low Dose"                       |
    ## | code:ethnic    | code:factor-_ALL_                                   | code:factor    | "_ALL_"                                     |
    ## | code:ethnic    | code:procedure-percent                              | code:procedure | "percent"                                   |
    ## | code:ethnic    | code:agegr1-65-80                                   | code:agegr1    | "65-80"                                     |
    ## | code:ethnic    | code:procedure-min                                  | code:procedure | "min"                                       |
    ## | code:ethnic    | code:race-_NONMISS_                                 | code:race      | "_NONMISS_"                                 |
    ## | code:ethnic    | code:agegr1-_NONMISS_                               | code:agegr1    | "_NONMISS_"                                 |
    ## | code:ethnic    | code:race-BLACK_OR_AFRICAN_AMERICAN                 | code:race      | "BLACK OR AFRICAN AMERICAN"                 |
    ## | code:ethnic    | code:factor-_NONMISS_                               | code:factor    | "_NONMISS_"                                 |
    ## | code:ethnic    | code:sex-U                                          | code:sex       | "U"                                         |
    ## | code:ethnic    | code:procedure-count                                | code:procedure | "count"                                     |
    ## | code:ethnic    | code:procedure-std                                  | code:procedure | "std"                                       |
    ## | code:agegr1    | code:factor-quantity                                | code:factor    | "quantity"                                  |
    ## | code:agegr1    | code:procedure-max                                  | code:procedure | "max"                                       |
    ## | code:agegr1    | code:procedure-q3                                   | code:procedure | "q3"                                        |
    ## | code:agegr1    | code:sex-F                                          | code:sex       | "F"                                         |
    ## | code:agegr1    | code:agegr1-_65                                     | code:agegr1    | "<65"                                       |
    ## | code:agegr1    | code:factor-proportion                              | code:factor    | "proportion"                                |
    ## | code:agegr1    | code:agegr1-_80                                     | code:agegr1    | ">80"                                       |
    ## | code:agegr1    | code:race-_ALL_                                     | code:race      | "_ALL_"                                     |
    ## | code:agegr1    | code:procedure-mean                                 | code:procedure | "mean"                                      |
    ## | code:agegr1    | code:trt01a-_ALL_                                   | code:trt01a    | "_ALL_"                                     |
    ## | code:agegr1    | code:sex-M                                          | code:sex       | "M"                                         |
    ## | code:agegr1    | code:ethnic-HISPANIC_OR_LATINO                      | code:ethnic    | "HISPANIC OR LATINO"                        |
    ## | code:agegr1    | code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER | code:race      | "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" |
    ## | code:agegr1    | code:ethnic-NOT_HISPANIC_OR_LATINO                  | code:ethnic    | "NOT HISPANIC OR LATINO"                    |
    ## | code:agegr1    | code:procedure-median                               | code:procedure | "median"                                    |
    ## | code:agegr1    | code:ethnic-_NONMISS_                               | code:ethnic    | "_NONMISS_"                                 |
    ## | code:agegr1    | code:procedure-q1                                   | code:procedure | "q1"                                        |
    ## | code:agegr1    | code:trt01a-Xanomeline_High_Dose                    | code:trt01a    | "Xanomeline High Dose"                      |
    ## | code:agegr1    | code:agegr1-_ALL_                                   | code:agegr1    | "_ALL_"                                     |
    ## | code:agegr1    | code:sex-UN                                         | code:sex       | "UN"                                        |
    ## | code:agegr1    | code:sex-_ALL_                                      | code:sex       | "_ALL_"                                     |
    ## | code:agegr1    | code:race-ASIAN                                     | code:race      | "ASIAN"                                     |
    ## | code:agegr1    | code:race-WHITE                                     | code:race      | "WHITE"                                     |
    ## | code:agegr1    | code:trt01a-_NONMISS_                               | code:trt01a    | "_NONMISS_"                                 |
    ## | code:agegr1    | code:sex-_NONMISS_                                  | code:sex       | "_NONMISS_"                                 |
    ## | code:agegr1    | code:factor-age                                     | code:factor    | "age"                                       |
    ## | code:agegr1    | code:ethnic-_ALL_                                   | code:ethnic    | "_ALL_"                                     |
    ## | code:agegr1    | code:procedure-n                                    | code:procedure | "n"                                         |
    ## | code:agegr1    | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          | code:race      | "AMERICAN INDIAN OR ALASKA NATIVE"          |
    ## | code:agegr1    | code:trt01a-Placebo                                 | code:trt01a    | "Placebo"                                   |
    ## | code:agegr1    | code:factor-weightbl                                | code:factor    | "weightbl"                                  |
    ## | code:agegr1    | code:trt01a-Xanomeline_Low_Dose                     | code:trt01a    | "Xanomeline Low Dose"                       |
    ## | code:agegr1    | code:factor-_ALL_                                   | code:factor    | "_ALL_"                                     |
    ## | code:agegr1    | code:procedure-percent                              | code:procedure | "percent"                                   |
    ## | code:agegr1    | code:agegr1-65-80                                   | code:agegr1    | "65-80"                                     |
    ## | code:agegr1    | code:procedure-min                                  | code:procedure | "min"                                       |
    ## | code:agegr1    | code:race-_NONMISS_                                 | code:race      | "_NONMISS_"                                 |
    ## | code:agegr1    | code:agegr1-_NONMISS_                               | code:agegr1    | "_NONMISS_"                                 |
    ## | code:agegr1    | code:race-BLACK_OR_AFRICAN_AMERICAN                 | code:race      | "BLACK OR AFRICAN AMERICAN"                 |
    ## | code:agegr1    | code:factor-_NONMISS_                               | code:factor    | "_NONMISS_"                                 |
    ## | code:agegr1    | code:sex-U                                          | code:sex       | "U"                                         |
    ## | code:agegr1    | code:procedure-count                                | code:procedure | "count"                                     |
    ## | code:agegr1    | code:procedure-std                                  | code:procedure | "std"                                       |
    ## | code:procedure | code:factor-quantity                                | code:factor    | "quantity"                                  |
    ## | code:procedure | code:procedure-max                                  | code:procedure | "max"                                       |
    ## | code:procedure | code:procedure-q3                                   | code:procedure | "q3"                                        |
    ## | code:procedure | code:sex-F                                          | code:sex       | "F"                                         |
    ## | code:procedure | code:agegr1-_65                                     | code:agegr1    | "<65"                                       |
    ## | code:procedure | code:factor-proportion                              | code:factor    | "proportion"                                |
    ## | code:procedure | code:agegr1-_80                                     | code:agegr1    | ">80"                                       |
    ## | code:procedure | code:race-_ALL_                                     | code:race      | "_ALL_"                                     |
    ## | code:procedure | code:procedure-mean                                 | code:procedure | "mean"                                      |
    ## | code:procedure | code:trt01a-_ALL_                                   | code:trt01a    | "_ALL_"                                     |
    ## | code:procedure | code:sex-M                                          | code:sex       | "M"                                         |
    ## | code:procedure | code:ethnic-HISPANIC_OR_LATINO                      | code:ethnic    | "HISPANIC OR LATINO"                        |
    ## | code:procedure | code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER | code:race      | "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" |
    ## | code:procedure | code:ethnic-NOT_HISPANIC_OR_LATINO                  | code:ethnic    | "NOT HISPANIC OR LATINO"                    |
    ## | code:procedure | code:procedure-median                               | code:procedure | "median"                                    |
    ## | code:procedure | code:ethnic-_NONMISS_                               | code:ethnic    | "_NONMISS_"                                 |
    ## | code:procedure | code:procedure-q1                                   | code:procedure | "q1"                                        |
    ## | code:procedure | code:trt01a-Xanomeline_High_Dose                    | code:trt01a    | "Xanomeline High Dose"                      |
    ## | code:procedure | code:agegr1-_ALL_                                   | code:agegr1    | "_ALL_"                                     |
    ## | code:procedure | code:sex-UN                                         | code:sex       | "UN"                                        |
    ## | code:procedure | code:sex-_ALL_                                      | code:sex       | "_ALL_"                                     |
    ## | code:procedure | code:race-ASIAN                                     | code:race      | "ASIAN"                                     |
    ## | code:procedure | code:race-WHITE                                     | code:race      | "WHITE"                                     |
    ## | code:procedure | code:trt01a-_NONMISS_                               | code:trt01a    | "_NONMISS_"                                 |
    ## | code:procedure | code:sex-_NONMISS_                                  | code:sex       | "_NONMISS_"                                 |
    ## | code:procedure | code:factor-age                                     | code:factor    | "age"                                       |
    ## | code:procedure | code:ethnic-_ALL_                                   | code:ethnic    | "_ALL_"                                     |
    ## | code:procedure | code:procedure-n                                    | code:procedure | "n"                                         |
    ## | code:procedure | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          | code:race      | "AMERICAN INDIAN OR ALASKA NATIVE"          |
    ## | code:procedure | code:trt01a-Placebo                                 | code:trt01a    | "Placebo"                                   |
    ## | code:procedure | code:factor-weightbl                                | code:factor    | "weightbl"                                  |
    ## | code:procedure | code:trt01a-Xanomeline_Low_Dose                     | code:trt01a    | "Xanomeline Low Dose"                       |
    ## | code:procedure | code:factor-_ALL_                                   | code:factor    | "_ALL_"                                     |
    ## | code:procedure | code:procedure-percent                              | code:procedure | "percent"                                   |
    ## | code:procedure | code:agegr1-65-80                                   | code:agegr1    | "65-80"                                     |
    ## | code:procedure | code:procedure-min                                  | code:procedure | "min"                                       |
    ## | code:procedure | code:race-_NONMISS_                                 | code:race      | "_NONMISS_"                                 |
    ## | code:procedure | code:agegr1-_NONMISS_                               | code:agegr1    | "_NONMISS_"                                 |
    ## | code:procedure | code:race-BLACK_OR_AFRICAN_AMERICAN                 | code:race      | "BLACK OR AFRICAN AMERICAN"                 |
    ## | code:procedure | code:factor-_NONMISS_                               | code:factor    | "_NONMISS_"                                 |
    ## | code:procedure | code:sex-U                                          | code:sex       | "U"                                         |
    ## | code:procedure | code:procedure-count                                | code:procedure | "count"                                     |
    ## | code:procedure | code:procedure-std                                  | code:procedure | "std"                                       |
    ## | code:factor    | code:factor-quantity                                | code:factor    | "quantity"                                  |
    ## | code:factor    | code:procedure-max                                  | code:procedure | "max"                                       |
    ## | code:factor    | code:procedure-q3                                   | code:procedure | "q3"                                        |
    ## | code:factor    | code:sex-F                                          | code:sex       | "F"                                         |
    ## | code:factor    | code:agegr1-_65                                     | code:agegr1    | "<65"                                       |
    ## | code:factor    | code:factor-proportion                              | code:factor    | "proportion"                                |
    ## | code:factor    | code:agegr1-_80                                     | code:agegr1    | ">80"                                       |
    ## | code:factor    | code:race-_ALL_                                     | code:race      | "_ALL_"                                     |
    ## | code:factor    | code:procedure-mean                                 | code:procedure | "mean"                                      |
    ## | code:factor    | code:trt01a-_ALL_                                   | code:trt01a    | "_ALL_"                                     |
    ## | code:factor    | code:sex-M                                          | code:sex       | "M"                                         |
    ## | code:factor    | code:ethnic-HISPANIC_OR_LATINO                      | code:ethnic    | "HISPANIC OR LATINO"                        |
    ## | code:factor    | code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER | code:race      | "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" |
    ## | code:factor    | code:ethnic-NOT_HISPANIC_OR_LATINO                  | code:ethnic    | "NOT HISPANIC OR LATINO"                    |
    ## | code:factor    | code:procedure-median                               | code:procedure | "median"                                    |
    ## | code:factor    | code:ethnic-_NONMISS_                               | code:ethnic    | "_NONMISS_"                                 |
    ## | code:factor    | code:procedure-q1                                   | code:procedure | "q1"                                        |
    ## | code:factor    | code:trt01a-Xanomeline_High_Dose                    | code:trt01a    | "Xanomeline High Dose"                      |
    ## | code:factor    | code:agegr1-_ALL_                                   | code:agegr1    | "_ALL_"                                     |
    ## | code:factor    | code:sex-UN                                         | code:sex       | "UN"                                        |
    ## | code:factor    | code:sex-_ALL_                                      | code:sex       | "_ALL_"                                     |
    ## | code:factor    | code:race-ASIAN                                     | code:race      | "ASIAN"                                     |
    ## | code:factor    | code:race-WHITE                                     | code:race      | "WHITE"                                     |
    ## | code:factor    | code:trt01a-_NONMISS_                               | code:trt01a    | "_NONMISS_"                                 |
    ## | code:factor    | code:sex-_NONMISS_                                  | code:sex       | "_NONMISS_"                                 |
    ## | code:factor    | code:factor-age                                     | code:factor    | "age"                                       |
    ## | code:factor    | code:ethnic-_ALL_                                   | code:ethnic    | "_ALL_"                                     |
    ## | code:factor    | code:procedure-n                                    | code:procedure | "n"                                         |
    ## | code:factor    | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          | code:race      | "AMERICAN INDIAN OR ALASKA NATIVE"          |
    ## | code:factor    | code:trt01a-Placebo                                 | code:trt01a    | "Placebo"                                   |
    ## | code:factor    | code:factor-weightbl                                | code:factor    | "weightbl"                                  |
    ## | code:factor    | code:trt01a-Xanomeline_Low_Dose                     | code:trt01a    | "Xanomeline Low Dose"                       |
    ## | code:factor    | code:factor-_ALL_                                   | code:factor    | "_ALL_"                                     |
    ## | code:factor    | code:procedure-percent                              | code:procedure | "percent"                                   |
    ## | code:factor    | code:agegr1-65-80                                   | code:agegr1    | "65-80"                                     |
    ## | code:factor    | code:procedure-min                                  | code:procedure | "min"                                       |
    ## | code:factor    | code:race-_NONMISS_                                 | code:race      | "_NONMISS_"                                 |
    ## | code:factor    | code:agegr1-_NONMISS_                               | code:agegr1    | "_NONMISS_"                                 |
    ## | code:factor    | code:race-BLACK_OR_AFRICAN_AMERICAN                 | code:race      | "BLACK OR AFRICAN AMERICAN"                 |
    ## | code:factor    | code:factor-_NONMISS_                               | code:factor    | "_NONMISS_"                                 |
    ## | code:factor    | code:sex-U                                          | code:sex       | "U"                                         |
    ## | code:factor    | code:procedure-count                                | code:procedure | "count"                                     |
    ## | code:factor    | code:procedure-std                                  | code:procedure | "std"                                       |
    ## | code:trt01a    | code:factor-quantity                                | code:factor    | "quantity"                                  |
    ## | code:trt01a    | code:procedure-max                                  | code:procedure | "max"                                       |
    ## | code:trt01a    | code:procedure-q3                                   | code:procedure | "q3"                                        |
    ## | code:trt01a    | code:sex-F                                          | code:sex       | "F"                                         |
    ## | code:trt01a    | code:agegr1-_65                                     | code:agegr1    | "<65"                                       |
    ## | code:trt01a    | code:factor-proportion                              | code:factor    | "proportion"                                |
    ## | code:trt01a    | code:agegr1-_80                                     | code:agegr1    | ">80"                                       |
    ## | code:trt01a    | code:race-_ALL_                                     | code:race      | "_ALL_"                                     |
    ## | code:trt01a    | code:procedure-mean                                 | code:procedure | "mean"                                      |
    ## | code:trt01a    | code:trt01a-_ALL_                                   | code:trt01a    | "_ALL_"                                     |
    ## | code:trt01a    | code:sex-M                                          | code:sex       | "M"                                         |
    ## | code:trt01a    | code:ethnic-HISPANIC_OR_LATINO                      | code:ethnic    | "HISPANIC OR LATINO"                        |
    ## | code:trt01a    | code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER | code:race      | "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" |
    ## | code:trt01a    | code:ethnic-NOT_HISPANIC_OR_LATINO                  | code:ethnic    | "NOT HISPANIC OR LATINO"                    |
    ## | code:trt01a    | code:procedure-median                               | code:procedure | "median"                                    |
    ## | code:trt01a    | code:ethnic-_NONMISS_                               | code:ethnic    | "_NONMISS_"                                 |
    ## | code:trt01a    | code:procedure-q1                                   | code:procedure | "q1"                                        |
    ## | code:trt01a    | code:trt01a-Xanomeline_High_Dose                    | code:trt01a    | "Xanomeline High Dose"                      |
    ## | code:trt01a    | code:agegr1-_ALL_                                   | code:agegr1    | "_ALL_"                                     |
    ## | code:trt01a    | code:sex-UN                                         | code:sex       | "UN"                                        |
    ## | code:trt01a    | code:sex-_ALL_                                      | code:sex       | "_ALL_"                                     |
    ## | code:trt01a    | code:race-ASIAN                                     | code:race      | "ASIAN"                                     |
    ## | code:trt01a    | code:race-WHITE                                     | code:race      | "WHITE"                                     |
    ## | code:trt01a    | code:trt01a-_NONMISS_                               | code:trt01a    | "_NONMISS_"                                 |
    ## | code:trt01a    | code:sex-_NONMISS_                                  | code:sex       | "_NONMISS_"                                 |
    ## | code:trt01a    | code:factor-age                                     | code:factor    | "age"                                       |
    ## | code:trt01a    | code:ethnic-_ALL_                                   | code:ethnic    | "_ALL_"                                     |
    ## | code:trt01a    | code:procedure-n                                    | code:procedure | "n"                                         |
    ## | code:trt01a    | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          | code:race      | "AMERICAN INDIAN OR ALASKA NATIVE"          |
    ## | code:trt01a    | code:trt01a-Placebo                                 | code:trt01a    | "Placebo"                                   |
    ## | code:trt01a    | code:factor-weightbl                                | code:factor    | "weightbl"                                  |
    ## | code:trt01a    | code:trt01a-Xanomeline_Low_Dose                     | code:trt01a    | "Xanomeline Low Dose"                       |
    ## | code:trt01a    | code:factor-_ALL_                                   | code:factor    | "_ALL_"                                     |
    ## | code:trt01a    | code:procedure-percent                              | code:procedure | "percent"                                   |
    ## | code:trt01a    | code:agegr1-65-80                                   | code:agegr1    | "65-80"                                     |
    ## | code:trt01a    | code:procedure-min                                  | code:procedure | "min"                                       |
    ## | code:trt01a    | code:race-_NONMISS_                                 | code:race      | "_NONMISS_"                                 |
    ## | code:trt01a    | code:agegr1-_NONMISS_                               | code:agegr1    | "_NONMISS_"                                 |
    ## | code:trt01a    | code:race-BLACK_OR_AFRICAN_AMERICAN                 | code:race      | "BLACK OR AFRICAN AMERICAN"                 |
    ## | code:trt01a    | code:factor-_NONMISS_                               | code:factor    | "_NONMISS_"                                 |
    ## | code:trt01a    | code:sex-U                                          | code:sex       | "U"                                         |
    ## | code:trt01a    | code:procedure-count                                | code:procedure | "count"                                     |
    ## | code:trt01a    | code:procedure-std                                  | code:procedure | "std"                                       |
    ## | code:sex       | code:factor-quantity                                | code:factor    | "quantity"                                  |
    ## | code:sex       | code:procedure-max                                  | code:procedure | "max"                                       |
    ## | code:sex       | code:procedure-q3                                   | code:procedure | "q3"                                        |
    ## | code:sex       | code:sex-F                                          | code:sex       | "F"                                         |
    ## | code:sex       | code:agegr1-_65                                     | code:agegr1    | "<65"                                       |
    ## | code:sex       | code:factor-proportion                              | code:factor    | "proportion"                                |
    ## | code:sex       | code:agegr1-_80                                     | code:agegr1    | ">80"                                       |
    ## | code:sex       | code:race-_ALL_                                     | code:race      | "_ALL_"                                     |
    ## | code:sex       | code:procedure-mean                                 | code:procedure | "mean"                                      |
    ## | code:sex       | code:trt01a-_ALL_                                   | code:trt01a    | "_ALL_"                                     |
    ## | code:sex       | code:sex-M                                          | code:sex       | "M"                                         |
    ## | code:sex       | code:ethnic-HISPANIC_OR_LATINO                      | code:ethnic    | "HISPANIC OR LATINO"                        |
    ## | code:sex       | code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER | code:race      | "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" |
    ## | code:sex       | code:ethnic-NOT_HISPANIC_OR_LATINO                  | code:ethnic    | "NOT HISPANIC OR LATINO"                    |
    ## | code:sex       | code:procedure-median                               | code:procedure | "median"                                    |
    ## | code:sex       | code:ethnic-_NONMISS_                               | code:ethnic    | "_NONMISS_"                                 |
    ## | code:sex       | code:procedure-q1                                   | code:procedure | "q1"                                        |
    ## | code:sex       | code:trt01a-Xanomeline_High_Dose                    | code:trt01a    | "Xanomeline High Dose"                      |
    ## | code:sex       | code:agegr1-_ALL_                                   | code:agegr1    | "_ALL_"                                     |
    ## | code:sex       | code:sex-UN                                         | code:sex       | "UN"                                        |
    ## | code:sex       | code:sex-_ALL_                                      | code:sex       | "_ALL_"                                     |
    ## | code:sex       | code:race-ASIAN                                     | code:race      | "ASIAN"                                     |
    ## | code:sex       | code:race-WHITE                                     | code:race      | "WHITE"                                     |
    ## | code:sex       | code:trt01a-_NONMISS_                               | code:trt01a    | "_NONMISS_"                                 |
    ## | code:sex       | code:sex-_NONMISS_                                  | code:sex       | "_NONMISS_"                                 |
    ## | code:sex       | code:factor-age                                     | code:factor    | "age"                                       |
    ## | code:sex       | code:ethnic-_ALL_                                   | code:ethnic    | "_ALL_"                                     |
    ## | code:sex       | code:procedure-n                                    | code:procedure | "n"                                         |
    ## | code:sex       | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          | code:race      | "AMERICAN INDIAN OR ALASKA NATIVE"          |
    ## | code:sex       | code:trt01a-Placebo                                 | code:trt01a    | "Placebo"                                   |
    ## | code:sex       | code:factor-weightbl                                | code:factor    | "weightbl"                                  |
    ## | code:sex       | code:trt01a-Xanomeline_Low_Dose                     | code:trt01a    | "Xanomeline Low Dose"                       |
    ## | code:sex       | code:factor-_ALL_                                   | code:factor    | "_ALL_"                                     |
    ## | code:sex       | code:procedure-percent                              | code:procedure | "percent"                                   |
    ## | code:sex       | code:agegr1-65-80                                   | code:agegr1    | "65-80"                                     |
    ## | code:sex       | code:procedure-min                                  | code:procedure | "min"                                       |
    ## | code:sex       | code:race-_NONMISS_                                 | code:race      | "_NONMISS_"                                 |
    ## | code:sex       | code:agegr1-_NONMISS_                               | code:agegr1    | "_NONMISS_"                                 |
    ## | code:sex       | code:race-BLACK_OR_AFRICAN_AMERICAN                 | code:race      | "BLACK OR AFRICAN AMERICAN"                 |
    ## | code:sex       | code:factor-_NONMISS_                               | code:factor    | "_NONMISS_"                                 |
    ## | code:sex       | code:sex-U                                          | code:sex       | "U"                                         |
    ## | code:sex       | code:procedure-count                                | code:procedure | "count"                                     |
    ## | code:sex       | code:procedure-std                                  | code:procedure | "std"                                       |
    ## | code:race      | code:factor-quantity                                | code:factor    | "quantity"                                  |
    ## | code:race      | code:procedure-max                                  | code:procedure | "max"                                       |
    ## | code:race      | code:procedure-q3                                   | code:procedure | "q3"                                        |
    ## | code:race      | code:sex-F                                          | code:sex       | "F"                                         |
    ## | code:race      | code:agegr1-_65                                     | code:agegr1    | "<65"                                       |
    ## | code:race      | code:factor-proportion                              | code:factor    | "proportion"                                |
    ## | code:race      | code:agegr1-_80                                     | code:agegr1    | ">80"                                       |
    ## | code:race      | code:race-_ALL_                                     | code:race      | "_ALL_"                                     |
    ## | code:race      | code:procedure-mean                                 | code:procedure | "mean"                                      |
    ## | code:race      | code:trt01a-_ALL_                                   | code:trt01a    | "_ALL_"                                     |
    ## | code:race      | code:sex-M                                          | code:sex       | "M"                                         |
    ## | code:race      | code:ethnic-HISPANIC_OR_LATINO                      | code:ethnic    | "HISPANIC OR LATINO"                        |
    ## | code:race      | code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER | code:race      | "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" |
    ## | code:race      | code:ethnic-NOT_HISPANIC_OR_LATINO                  | code:ethnic    | "NOT HISPANIC OR LATINO"                    |
    ## | code:race      | code:procedure-median                               | code:procedure | "median"                                    |
    ## | code:race      | code:ethnic-_NONMISS_                               | code:ethnic    | "_NONMISS_"                                 |
    ## | code:race      | code:procedure-q1                                   | code:procedure | "q1"                                        |
    ## | code:race      | code:trt01a-Xanomeline_High_Dose                    | code:trt01a    | "Xanomeline High Dose"                      |
    ## | code:race      | code:agegr1-_ALL_                                   | code:agegr1    | "_ALL_"                                     |
    ## | code:race      | code:sex-UN                                         | code:sex       | "UN"                                        |
    ## | code:race      | code:sex-_ALL_                                      | code:sex       | "_ALL_"                                     |
    ## | code:race      | code:race-ASIAN                                     | code:race      | "ASIAN"                                     |
    ## | code:race      | code:race-WHITE                                     | code:race      | "WHITE"                                     |
    ## | code:race      | code:trt01a-_NONMISS_                               | code:trt01a    | "_NONMISS_"                                 |
    ## | code:race      | code:sex-_NONMISS_                                  | code:sex       | "_NONMISS_"                                 |
    ## | code:race      | code:factor-age                                     | code:factor    | "age"                                       |
    ## | code:race      | code:ethnic-_ALL_                                   | code:ethnic    | "_ALL_"                                     |
    ## | code:race      | code:procedure-n                                    | code:procedure | "n"                                         |
    ## | code:race      | code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE          | code:race      | "AMERICAN INDIAN OR ALASKA NATIVE"          |
    ## | code:race      | code:trt01a-Placebo                                 | code:trt01a    | "Placebo"                                   |
    ## | code:race      | code:factor-weightbl                                | code:factor    | "weightbl"                                  |
    ## | code:race      | code:trt01a-Xanomeline_Low_Dose                     | code:trt01a    | "Xanomeline Low Dose"                       |
    ## | code:race      | code:factor-_ALL_                                   | code:factor    | "_ALL_"                                     |
    ## | code:race      | code:procedure-percent                              | code:procedure | "percent"                                   |
    ## | code:race      | code:agegr1-65-80                                   | code:agegr1    | "65-80"                                     |
    ## | code:race      | code:procedure-min                                  | code:procedure | "min"                                       |
    ## | code:race      | code:race-_NONMISS_                                 | code:race      | "_NONMISS_"                                 |
    ## | code:race      | code:agegr1-_NONMISS_                               | code:agegr1    | "_NONMISS_"                                 |
    ## | code:race      | code:race-BLACK_OR_AFRICAN_AMERICAN                 | code:race      | "BLACK OR AFRICAN AMERICAN"                 |
    ## | code:race      | code:factor-_NONMISS_                               | code:factor    | "_NONMISS_"                                 |
    ## | code:race      | code:sex-U                                          | code:sex       | "U"                                         |
    ## | code:race      | code:procedure-count                                | code:procedure | "count"                                     |
    ## | code:race      | code:procedure-std                                  | code:procedure | "std"                                       |
    ## ---------------------------------------------------------------------------------------------------------------------------------------

Get the codelist definition for all descriptive statistics - class `code:procedure`
-----------------------------------------------------------------------------------

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-codelist.rq 
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

Get definition for all variables used for descriptive statistics - class `code:factor`
--------------------------------------------------------------------------------------

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor.rq 
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

Get the codelist definition for all variables used for descriptive statistics - class `code:factor`
---------------------------------------------------------------------------------------------------

The SPARQL script shows how the R function definition for the descriptive statistics is stored in the cube.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOfactor-codelist.rq 
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

Get definition for descriptive statistics median
------------------------------------------------

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOprocedure-median.rq 
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

Get information for selection of data
-------------------------------------

The SPARQL script shows how the information for selecting data for derivation of univariate statistics is present in the cube.

``` bash
cd ../extdata/sample-rdf
arq --data DC-DEMO-sample.ttl --query DEMOobservations-R-selection.rq
```

    ## ------------------------------------------------------------------------------------
    ## | obs       | rrdfqbcrnd0Rcolumnname | Rselectionoperator | Rselectionvalue        |
    ## ====================================================================================
    ## | ds:obs027 | "trt01a"               | "=="               | "Xanomeline High Dose" |
    ## | ds:obs056 | "agegr1"               | "=="               | "65-80"                |
    ## | ds:obs056 | "trt01a"               | "=="               | "Xanomeline Low Dose"  |
    ## ------------------------------------------------------------------------------------

Get information on the underlying data in D2RQ format
-----------------------------------------------------

The following two SPARQL scripts are from taken from `create-ADSL-ttl.Rmd`.

First get the mapping information.

``` bash
cd ../extdata/sample-rdf
arq --data adsl-map.ttl --query ADSL-mapping.rq
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

Then dump the contents of a record in the database.

``` bash
cd ../extdata/sample-rdf
arq --data adsl.ttl --query ADSL-record.rq
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

Get underlying data for one cube observation
--------------------------------------------

``` bash
cd ../extdata/sample-rdf
arq --data adsl.ttl --data DC-DEMO-sample.ttl --query DEMOobservations-R-data.rq
```

    ## -------------------------------------------------------------------------------------------------------------------------------------------------------------
    ## | record                                             | p                                                     | o                                            |
    ## =============================================================================================================================================================
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19821.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1001"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-04-08"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 15.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 73.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 25.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | rdfs:label                                            | "ADSL #01-709-1001"                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 76.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18657.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19639.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-709-1001"                                |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19621.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 31.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19821.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-10-08"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 170.2E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-709-1001> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-701-1203"                                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 25.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-02-02"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 66.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19573.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-08-03"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "BLACK OR AFRICAN AMERICAN"                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18736.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | rdfs:label                                            | "ADSL #01-701-1203"                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19391.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19573.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 81.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19383.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 21.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 160.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 21.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1203> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1203"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19412.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 57.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1375"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 78.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 60.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 149.9E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19415.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | rdfs:label                                            | "ADSL #01-714-1375"                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-09-07"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 25.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19608.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "714"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 194.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19608.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-714-1375"                                |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17572.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 17.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-02-26"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1375> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19697.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 20.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 54.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18098.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 123.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | rdfs:label                                            | "ADSL #01-705-1059"                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-705-1059"                                |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 66.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-08-05"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 162.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Adverse Event"                              |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19572.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1059"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19575.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-12-05"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19697.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 48.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1059> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "ADVERSE EVENT"                              |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 142.2E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19731.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-02-07"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 39.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 19.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19749.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 5.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | rdfs:label                                            | "ADSL #01-705-1186"                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1186"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Physician Decision"                         |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 84.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-705-1186"                                |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "PHYSICIAN DECISION"                         |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 15.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 19.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19761.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18811.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-01-08"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19726.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 30.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1186> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 86.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19609.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "HISPANIC OR LATINO"                         |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17248.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19609.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-705-1349"                                |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1349"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 21.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19427.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 144.8E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-09-08"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | rdfs:label                                            | "ADSL #01-705-1349"                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 71.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19413.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 44.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-03-10"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 15.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1349> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1078"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19607.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19805.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 21.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-09-17"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 152.4E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 41.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18864.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19618.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 18.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 81.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 188.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | rdfs:label                                            | "ADSL #01-710-1078"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-23"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1078"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 24.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19805.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1078> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-05-25"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | rdfs:label                                            | "ADSL #01-710-1314"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-04-24"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "WITHDRAWAL BY SUBJECT"                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19469.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 6.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Withdrew Consent"                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19472.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 22.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18731.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1314"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 42.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 137.2E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19503.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 78.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19501.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 24.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 30.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1314> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1314"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1158"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 162.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18475.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-22"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-02-08"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 73.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Adverse Event"                              |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 81.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 27.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "ADVERSE EVENT"                              |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | rdfs:label                                            | "ADSL #01-708-1158"                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 7.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19755.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19762.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19803.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 42.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 42.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19804.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1158> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-708-1158"                                |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 19.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 48.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-08-30"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19301.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19235.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 9.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19228.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 67.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1260"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Withdrew Consent"                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "WITHDRAWAL BY SUBJECT"                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-704-1260"                                |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | rdfs:label                                            | "ADSL #01-704-1260"                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 15673.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 71.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19376.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 160.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-01-18"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 116.8E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1260> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19652.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | rdfs:label                                            | "ADSL #01-710-1368"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-04-24"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 88.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 34.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18912.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1368"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1368"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 184.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19837.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-10-23"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19837.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19654.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 24.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 147.3E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 15.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1368> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 21.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 26.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 180.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1108"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-02-12"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-08-10"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 52.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 142.2E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | rdfs:label                                            | "ADSL #01-716-1108"                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 86.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | "<12"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19580.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 11.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19580.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19393.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-716-1108"                                |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 19037.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1108> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19401.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 20.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | rdfs:label                                            | "ADSL #01-708-1171"                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19513.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-708-1171"                                |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 26.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19322.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19513.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 77.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19333.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18529.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-06-04"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 181.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1171"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 54.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 9.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 162.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1171> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-12-06"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1024"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19183.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | "<12"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 154.9E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 54.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19378.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19378.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 87.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-716-1024"                                |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-01-20"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | rdfs:label                                            | "ADSL #01-716-1024"                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-07-09"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18962.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 7.2E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19180.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 22.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 196.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1024> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17786.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 60.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1127"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | rdfs:label                                            | "ADSL #01-704-1127"                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-31"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 84.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 41.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-10-02"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-704-1127"                                |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19633.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19617.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19813.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 181.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19813.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 165.1E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1127> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 15.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 22.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-07-05"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18222.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 18.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19539.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 4.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | rdfs:label                                            | "ADSL #01-705-1018"                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1018"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 43.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "WITHDRAWAL BY SUBJECT"                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 6.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 147.3E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-705-1018"                                |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19551.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 69.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19544.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Withdrew Consent"                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19551.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 49.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-07-12"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1018> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-07-29"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 167.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19933.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1041"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 58.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-12-31"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 64.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19723.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19713.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 20.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19932.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | rdfs:label                                            | "ADSL #01-706-1041"                          |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18949.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "BLACK OR AFRICAN AMERICAN"                  |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-706-1041"                                |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 210.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "706"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 20.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 15.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 25.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-706-1041> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 7.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-715-1207"                                |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 191.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1207"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19309.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 78.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19505.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 31.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | rdfs:label                                            | "ADSL #01-715-1207"                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-11-18"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-06-01"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19315.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "715"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 152.4E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 21.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19510.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 49.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18358.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1207> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 20.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 74.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-01"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18847.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 191.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 23.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-708-1316"                                |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | rdfs:label                                            | "ADSL #01-708-1316"                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19593.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19783.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1316"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 160.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 59.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 24.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19585.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-08-23"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19783.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1316> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 23.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 6.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 30.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19446.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | ">=30"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19380.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18104.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 67.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | rdfs:label                                            | "ADSL #01-701-1047"                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-02-12"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 85.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 148.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "ADVERSE EVENT"                              |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 42.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-701-1047"                                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19401.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Adverse Event"                              |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19426.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 26.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1047"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1047> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-03-29"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18598.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 61.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 186.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | rdfs:label                                            | "ADSL #01-703-1100"                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1100"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19615.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 84.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-09-14"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 26.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19417.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-703-1100"                                |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 167.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 21.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-03-13"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19615.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1100> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19430.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 11.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Adverse Event"                              |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 56.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 152.4E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19555.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1315"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18859.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 17.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 83.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19401.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-02-27"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19545.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19416.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "ADVERSE EVENT"                              |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 24.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 130.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1315"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-07-16"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | rdfs:label                                            | "ADSL #01-710-1315"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1315> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 49.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 157.5E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19452.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18690.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1164"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 18.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-704-1164"                                |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19452.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 198.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-09-19"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19255.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 67.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19247.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | rdfs:label                                            | "ADSL #01-704-1164"                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-04-04"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 20.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1164> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 64.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 165.1E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18751.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1179"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-08-09"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19550.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 181.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19759.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 55.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19579.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 26.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 20.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "713"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 21.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19759.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-713-1179"                                |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "713"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-02-05"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | rdfs:label                                            | "ADSL #01-713-1179"                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-713-1179> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 163.5E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1344"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 21.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "717"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | rdfs:label                                            | "ADSL #01-717-1344"                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19796.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17785.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 64.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19734.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-14"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Lack of Efficacy"                           |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 63.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-01-11"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19796.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 58.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "LACK OF EFFICACY"                           |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 21.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19724.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-717-1344"                                |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 63.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1344> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18218.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-716-1308"                                |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 58.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 76.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1308"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-08-28"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19638.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "WITHDRAWAL BY SUBJECT"                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19638.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Withdrew Consent"                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 41.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19598.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | rdfs:label                                            | "ADSL #01-716-1308"                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-10-07"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 7.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 157.5E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 23.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 45.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19593.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1308> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19611.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | rdfs:label                                            | "ADSL #01-708-1286"                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 180.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 142.8E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19790.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "BLACK OR AFRICAN AMERICAN"                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1286"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-09-10"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 152.4E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 80.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 76.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 15251.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-08"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19790.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 32.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-708-1286"                                |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19595.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | ">=30"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1286> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-04-28"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 66.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | rdfs:label                                            | "ADSL #01-708-1087"                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1087"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 189.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 74.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19476.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 26.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19476.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19272.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19288.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-10-22"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-708-1087"                                |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 157.5E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 49.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17777.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1087> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 17.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-718-1150"                                |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19377.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 156.2E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19568.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 22.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 10.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "718"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 192.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 19063.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19570.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | rdfs:label                                            | "ADSL #01-718-1150"                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 73.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 54.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-01-19"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "718"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | "<12"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-07-31"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19370.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-718-1150> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1150"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1183"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | rdfs:label                                            | "ADSL #01-710-1183"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19860.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 80.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-11-16"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 149.9E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-05-17"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19678.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19655.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1183"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 21.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19860.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 19291.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 47.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1183> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | "<12"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 23.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 153.7E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-03-13"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | rdfs:label                                            | "ADSL #01-703-1299"                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19243.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 45.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19248.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 19.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-09-12"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19430.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19430.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1299"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-703-1299"                                |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18886.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 11.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 81.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-703-1299> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 49.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 72.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | rdfs:label                                            | "ADSL #01-703-1210"                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19425.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 36.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18311.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 144.8E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19607.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19607.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 19.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-03-16"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-703-1210"                                |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1210"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 175.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 23.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-09-06"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19433.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1210> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 170.2E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19537.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 59.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19537.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 26.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 20.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18529.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-06-28"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 59.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 182.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-708-1342"                                |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | rdfs:label                                            | "ADSL #01-708-1342"                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "708"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19356.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-12-29"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19348.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1342"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 18.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-708-1342> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 68.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-12-19"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 160.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-717-1201"                                |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19711.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19775.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Lack of Efficacy"                           |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 65.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 26.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 23.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19704.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "LACK OF EFFICACY"                           |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19775.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1201"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-02-21"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 32.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | rdfs:label                                            | "ADSL #01-717-1201"                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 85.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18709.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "717"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-717-1201> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1026"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 20012.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 20012.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18507.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 79.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 198.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | rdfs:label                                            | "ADSL #01-716-1026"                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 33.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-716-1026"                                |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | ">=30"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19815.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-10-16"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 11.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 154.9E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-04-02"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 73.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19805.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 42.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1026> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 182.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1363"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19689.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19508.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 91.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 81.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-05-30"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19498.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 161.3E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "BLACK OR AFRICAN AMERICAN"                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19689.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 24.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 16729.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-701-1363"                                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | rdfs:label                                            | "ADSL #01-701-1363"                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 64.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-11-27"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1363> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 68.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1312"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-10-19"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 20015.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 160.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 53.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19833.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-04-20"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 13.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | rdfs:label                                            | "ADSL #01-709-1312"                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-709-1312"                                |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 20015.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 20.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18473.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19826.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 14.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 44.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1312> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "STUDY TERMINATED BY SPONSOR"                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-10-08"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19800.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | rdfs:label                                            | "ADSL #01-701-1345"                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 23.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Sponsor Decision"                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 56.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19632.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 34.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19800.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1345"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 63.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 18.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 162.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 174.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-701-1345"                                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-18"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18571.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19639.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 15.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1345> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 35.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-04-26"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 23.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 63.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19691.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | rdfs:label                                            | "ADSL #01-715-1155"                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 7.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19705.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Withdrew Consent"                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "WITHDRAWAL BY SUBJECT"                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 165.1E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 59.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 44.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-715-1155"                                |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18605.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "715"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1155"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19748.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19839.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-12-13"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-715-1155> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 4.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 126.3E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-03-25"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Protocol Violation"                         |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19807.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 162.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 22.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 14.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | rdfs:label                                            | "ADSL #01-701-1387"                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19807.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-701-1387"                                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "PROTOCOL VIOLATION"                         |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19777.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-03-12"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1387"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19794.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 59.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 15934.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 87.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 11.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-701-1387> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Adverse Event"                              |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19899.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19757.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | rdfs:label                                            | "ADSL #01-709-1306"                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-02-03"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-06-25"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 11.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "ADVERSE EVENT"                              |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 134.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19890.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 21.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 18.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 44.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17930.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 60.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 154.9E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1306"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 59.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-709-1306"                                |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19742.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1306> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 88.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18719.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 20012.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 54.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19830.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19816.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-04-17"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | rdfs:label                                            | "ADSL #01-714-1035"                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "714"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 148.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 24.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 20012.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 17.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-10-16"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-714-1035"                                |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1035"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-714-1035> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 36.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18782.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | rdfs:label                                            | "ADSL #01-716-1160"                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 157.5E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19642.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "716"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19440.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1160"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-716-1160"                                |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-04-05"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19453.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 23.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 24.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 83.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-10-11"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 59.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 21.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19642.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-716-1160> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 190.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1233"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | rdfs:label                                            | "ADSL #01-704-1233"                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19438.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-03-21"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Withdrew Consent"                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 116.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-704-1233"                                |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19553.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 87.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-07-14"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 15.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "704"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19425.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 46.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 25.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19553.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18642.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 147.3E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 11.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 21.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "WITHDRAWAL BY SUBJECT"                      |
    ## | <http://www.example.org/datasets/ADSL/01-704-1233> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 50.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19553.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19740.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19740.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1301"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | rdfs:label                                            | "ADSL #01-709-1301"                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 146.1E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19558.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "709"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-709-1301"                                |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17932.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-01-17"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 53.3E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 23.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-07-19"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 62.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-709-1301> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-09-23"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-701-1153"                                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19814.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | rdfs:label                                            | "ADSL #01-701-1153"                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 156.2E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 23.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-04-01"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 99.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 16569.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19798.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1153"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19607.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 79.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 58.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 175.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19624.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1153> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 6.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-01-25"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 81.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | ">=30"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19446.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-703-1096"                                |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | rdfs:label                                            | "ADSL #01-703-1096"                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 160.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17155.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "LOST TO FOLLOW-UP"                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 6.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 7.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19433.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 72.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "703"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 31.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 81.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19346.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Lost to Follow-up"                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1096"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 51.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-03-29"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-703-1096> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19383.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1397"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 22.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 11.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 10.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 76.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | "<12"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19451.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-715-1397"                                |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19437.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-10-03"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 152.4E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | rdfs:label                                            | "ADSL #01-715-1397"                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19634.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-04-03"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 19129.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "715"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19633.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "900"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 28.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 67.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-715-1397> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 14.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 47.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-08-03"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19548.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | rdfs:label                                            | "ADSL #01-710-1083"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-07-22"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1083"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18827.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 14.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 157.5E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19573.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 19.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19561.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Death"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 23.7E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "DEATH"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 4.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 89.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19571.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1083"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 11.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1083> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19725.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "25-<30"                                     |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 43.9E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 25.1E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | rdfs:label                                            | "ADSL #01-701-1015"                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 54.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "HISPANIC OR LATINO"                         |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19906.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 23.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18382.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "<65"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1015"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 63.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-07-02"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-701-1015"                                |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19718.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 182.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2014-01-02"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19906.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "701"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 147.3E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-701-1015> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 72.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-12-26"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-705-1282"                                |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19533.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19353.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1282"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | ">=30"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2013-06-24"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 17141.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 10.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "705"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 181.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 154.9E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19350.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | rdfs:label                                            | "ADSL #01-705-1282"                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19533.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 30.4E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "BLACK OR AFRICAN AMERICAN"                  |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 70.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-705-1282> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 73.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | rdfs:label                                            | "ADSL #01-710-1077"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19861.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2013-11-17"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 14.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1077"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 183.0E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Completed"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | "65-80"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 28.8E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 162.6E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 76.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2014-05-18"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1077"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "COMPLETED"                                  |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19679.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19861.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 49.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 18.5E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 2.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19665.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18789.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1077> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_WEIGHTBL> | 47.6E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_TRT01P>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DISONSDT> | 18875.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_TRTSDT>   | 19263.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DURDSGR1> | ">=12"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_VISIT1DT> | 19240.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_USUBJID>  | "01-710-1271"                                |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_TRTEDT>   | 19318.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DCREASCD> | "Adverse Event"                              |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_SITEGR1>  | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_TRT01PN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_SEX>      | "F"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_STUDYID>  | "CDISCPILOT01"                               |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_BMIBL>    | 21.2E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_BMIBLGR1> | "<25"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | rdfs:label                                            | "ADSL #01-710-1271"                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DTHFL>    | ""                                           |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_VISNUMEN> | 8.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_TRTDUR>   | 56.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_EFFFL>    | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DSRAEFL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_EDUCLVL>  | 16.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DCDECOD>  | "ADVERSE EVENT"                              |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DURDIS>   | 12.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_TRT01A>   | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_COMP8FL>  | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1N>  | 3.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_TRT01AN>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_AVGDD>    | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_CUMDOSE>  | 0.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | rdf:type                                              | <http://www.example.org/datasets/vocab/ADSL> |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_RFENDT>   | 19329.0E0                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_RACEN>    | 1.0E0                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_HEIGHTBL> | 149.9E0                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_COMP16FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_ETHNIC>   | "NOT HISPANIC OR LATINO"                     |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_SUBJID>   | "1271"                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_AGEGR1>   | ">80"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_ARM>      | "Placebo"                                    |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_AGEU>     | "YEARS"                                      |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_COMP24FL> | "N"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_RFSTDTC>  | "2012-09-27"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_SITEID>   | "710"                                        |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_SAFFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_MMSETOT>  | 18.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_DISCONFL> | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_RFENDTC>  | "2012-12-02"                                 |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_ITTFL>    | "Y"                                          |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_AGE>      | 86.0E0                                       |
    ## | <http://www.example.org/datasets/ADSL/01-710-1271> | <http://www.example.org/datasets/vocab/ADSL_RACE>     | "WHITE"                                      |
    ## -------------------------------------------------------------------------------------------------------------------------------------------------------------

How to run this .Rmd file
=========================

.. add text ..
