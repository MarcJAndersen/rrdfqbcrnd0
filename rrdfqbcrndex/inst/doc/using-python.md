Using Python with SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)
===============================================================================

The examples below uses `rdflib` from (<https://github.com/RDFLib/rdflib>).

As of 28-jun-2015 the code is still in development.

Requirement
-----------

The python package `rdflib` must be installed, see description at (<https://github.com/RDFLib/rdflib>).

Get dimensions
--------------

``` python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOdimensions.rq", "r") as myfile:
    dimensionsQuery=myfile.read()
qres = g.query(dimensionsQuery)
for row in qres:
    print("%s" %row)
```

    ## INFO:rdflib:RDFLib Version: 4.2.0
    ## http://www.example.org/dc/dimension#agegr1
    ## http://www.example.org/dc/dimension#trt01a
    ## http://www.example.org/dc/dimension#sex
    ## http://www.example.org/dc/dimension#ethnic
    ## http://www.example.org/dc/dimension#race
    ## http://www.example.org/dc/dimension#factor
    ## http://www.example.org/dc/dimension#procedure

Get attributes
--------------

``` python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOattributes.rq", "r") as myfile:
    attributesQuery=myfile.read()
qres = g.query(attributesQuery)
for row in qres:
    print("%s" %row)
```

    ## INFO:rdflib:RDFLib Version: 4.2.0
    ## http://www.example.org/dc/attribute#cellpartno
    ## http://www.example.org/dc/attribute#unit
    ## http://www.example.org/dc/attribute#colno
    ## http://www.example.org/dc/attribute#denominator
    ## http://www.example.org/dc/attribute#measurefmt
    ## http://www.example.org/dc/attribute#rowno

Get observations
----------------

The SPARQL script shows for each observation the dimension, attributes and measures in a row. The python code shows each variable on a line - that is not the right way to do it.

``` python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOobservations.rq", "r") as myfile:
    observationsQuery=myfile.read()

qres = g.query(observationsQuery)

for row in qres:
   for t in row:
     print("%s" %t)
 
```

    ## INFO:rdflib:RDFLib Version: 4.2.0
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs001
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _NONMISS_
    ## 1
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## 86.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs002
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _NONMISS_
    ## 1
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs003
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _NONMISS_
    ## 1
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs004
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _NONMISS_
    ## 1
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs005
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _NONMISS_
    ## 1
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs006
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _NONMISS_
    ## 1
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs007
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## F
    ## 2
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-F
    ## 53.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs008
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## F
    ## 2
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-F
    ## 50.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs009
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## F
    ## 2
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-F
    ## 40.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs010
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## F
    ## 2
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-F
    ## 61.627906977
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs011
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## F
    ## 2
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-F
    ## 59.523809524
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs012
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## F
    ## 2
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-F
    ## 47.619047619
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs013
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## M
    ## 3
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-M
    ## 33.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs014
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## M
    ## 3
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-M
    ## 34.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs015
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## M
    ## 3
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-M
    ## 44.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs016
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## M
    ## 3
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-M
    ## 38.372093023
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs017
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## M
    ## 3
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-M
    ## 40.476190476
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs018
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## M
    ## 3
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## sex
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-M
    ## 52.380952381
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs019
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-std
    ## _ALL_
    ## _ALL_
    ## 4
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## std
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 8.5901671271
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs020
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-std
    ## _ALL_
    ## _ALL_
    ## 4
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## std
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 8.2860505995
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs021
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-std
    ## _ALL_
    ## _ALL_
    ## 4
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## std
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 7.8860938487
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs022
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-n
    ## _ALL_
    ## _ALL_
    ## 5
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## n
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 86.0
    ## NA
    ## age
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs023
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-n
    ## _ALL_
    ## _ALL_
    ## 5
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## n
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## age
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs024
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-n
    ## _ALL_
    ## _ALL_
    ## 5
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## n
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## age
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs025
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-median
    ## _ALL_
    ## _ALL_
    ## 6
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## median
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 76.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs026
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-median
    ## _ALL_
    ## _ALL_
    ## 6
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## median
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 77.5
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs027
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-median
    ## _ALL_
    ## _ALL_
    ## 6
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## median
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 76.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs028
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-mean
    ## _ALL_
    ## _ALL_
    ## 7
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## mean
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 75.209302326
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs029
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-mean
    ## _ALL_
    ## _ALL_
    ## 7
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## mean
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 75.666666667
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs030
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-mean
    ## _ALL_
    ## _ALL_
    ## 7
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## mean
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 74.380952381
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs031
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q3
    ## _ALL_
    ## _ALL_
    ## 8
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## q3
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 82.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs032
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q3
    ## _ALL_
    ## _ALL_
    ## 8
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## q3
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 82.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs033
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q3
    ## _ALL_
    ## _ALL_
    ## 8
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## q3
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 80.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs034
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q1
    ## _ALL_
    ## _ALL_
    ## 9
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## q1
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 69.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs035
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q1
    ## _ALL_
    ## _ALL_
    ## 9
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## q1
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 71.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs036
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q1
    ## _ALL_
    ## _ALL_
    ## 9
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## q1
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 70.5
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs037
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-max
    ## _ALL_
    ## _ALL_
    ## 10
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## max
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 89.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs038
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-max
    ## _ALL_
    ## _ALL_
    ## 10
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## max
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 88.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs039
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-max
    ## _ALL_
    ## _ALL_
    ## 10
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## max
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 88.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs040
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-min
    ## _ALL_
    ## _ALL_
    ## 11
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## min
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 52.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs041
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-min
    ## _ALL_
    ## _ALL_
    ## 11
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## min
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 51.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs042
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-min
    ## _ALL_
    ## _ALL_
    ## 11
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## min
    ## http://www.example.org/dc/code/factor-age
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 56.0
    ## NA
    ## age
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs043
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _NONMISS_
    ## _ALL_
    ## 18
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 86.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs044
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _NONMISS_
    ## _ALL_
    ## 18
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs045
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _NONMISS_
    ## _ALL_
    ## 18
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs046
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _NONMISS_
    ## _ALL_
    ## 18
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs047
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _NONMISS_
    ## _ALL_
    ## 18
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs048
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _NONMISS_
    ## _ALL_
    ## 18
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs049
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## <65
    ## _ALL_
    ## 19
    ## http://www.example.org/dc/code/agegr1-_65
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 14.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs050
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## <65
    ## _ALL_
    ## 19
    ## http://www.example.org/dc/code/agegr1-_65
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 8.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs051
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## <65
    ## _ALL_
    ## 19
    ## http://www.example.org/dc/code/agegr1-_65
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 11.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs052
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## <65
    ## _ALL_
    ## 19
    ## http://www.example.org/dc/code/agegr1-_65
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 16.279069767
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs053
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## <65
    ## _ALL_
    ## 19
    ## http://www.example.org/dc/code/agegr1-_65
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 9.5238095238
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs054
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## <65
    ## _ALL_
    ## 19
    ## http://www.example.org/dc/code/agegr1-_65
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 13.095238095
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs055
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## 65-80
    ## _ALL_
    ## 20
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 42.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs056
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## 65-80
    ## _ALL_
    ## 20
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 47.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs057
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## 65-80
    ## _ALL_
    ## 20
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 55.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs058
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## 65-80
    ## _ALL_
    ## 20
    ## http://www.example.org/dc/code/agegr1-65-80
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 48.837209302
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs059
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## 65-80
    ## _ALL_
    ## 20
    ## http://www.example.org/dc/code/agegr1-65-80
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 55.952380952
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs060
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## 65-80
    ## _ALL_
    ## 20
    ## http://www.example.org/dc/code/agegr1-65-80
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 65.476190476
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs061
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## >80
    ## _ALL_
    ## 21
    ## http://www.example.org/dc/code/agegr1-_80
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 30.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs062
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## >80
    ## _ALL_
    ## 21
    ## http://www.example.org/dc/code/agegr1-_80
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 29.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs063
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## >80
    ## _ALL_
    ## 21
    ## http://www.example.org/dc/code/agegr1-_80
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 18.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs064
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## >80
    ## _ALL_
    ## 21
    ## http://www.example.org/dc/code/agegr1-_80
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 34.88372093
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs065
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## >80
    ## _ALL_
    ## 21
    ## http://www.example.org/dc/code/agegr1-_80
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 34.523809524
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs066
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## >80
    ## _ALL_
    ## 21
    ## http://www.example.org/dc/code/agegr1-_80
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 21.428571429
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs067
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 22
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _NONMISS_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 86.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs068
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 22
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _NONMISS_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs069
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 22
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _NONMISS_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs070
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 22
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _NONMISS_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs071
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 22
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _NONMISS_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs072
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 22
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _NONMISS_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs073
    ## http://www.example.org/dc/code/race-WHITE
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 23
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## WHITE
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 78.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs074
    ## http://www.example.org/dc/code/race-WHITE
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 23
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## WHITE
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 78.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs075
    ## http://www.example.org/dc/code/race-WHITE
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 23
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## WHITE
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 74.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs076
    ## http://www.example.org/dc/code/race-WHITE
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 23
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## WHITE
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 90.697674419
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs077
    ## http://www.example.org/dc/code/race-WHITE
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 23
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## WHITE
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 92.857142857
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs078
    ## http://www.example.org/dc/code/race-WHITE
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 23
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## WHITE
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 88.095238095
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs079
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 24
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## BLACK OR AFRICAN AMERICAN
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 8.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs080
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 24
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 6.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs081
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 24
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 9.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs082
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 24
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## BLACK OR AFRICAN AMERICAN
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 9.3023255814
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs083
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 24
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 7.1428571429
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs084
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 24
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 10.714285714
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs085
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 25
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 0.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs086
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 25
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 0.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs087
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 25
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 1.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs088
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 25
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 0.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs089
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 25
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 0.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs090
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 25
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## race
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 1.1904761905
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs091
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-std
    ## _ALL_
    ## _ALL_
    ## 26
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## std
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 12.771543533
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs092
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-std
    ## _ALL_
    ## _ALL_
    ## 26
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## std
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 14.123598649
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs093
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-std
    ## _ALL_
    ## _ALL_
    ## 26
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## std
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 14.653433372
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs094
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-n
    ## _ALL_
    ## _ALL_
    ## 27
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## n
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 86.0
    ## NA
    ## weightbl
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs095
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-n
    ## _ALL_
    ## _ALL_
    ## 27
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## n
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 83.0
    ## NA
    ## weightbl
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs096
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-n
    ## _ALL_
    ## _ALL_
    ## 27
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## n
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## weightbl
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs097
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-median
    ## _ALL_
    ## _ALL_
    ## 28
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## median
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 60.55
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs098
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-median
    ## _ALL_
    ## _ALL_
    ## 28
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## median
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 64.9
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs099
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-median
    ## _ALL_
    ## _ALL_
    ## 28
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## median
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 69.2
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs100
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-mean
    ## _ALL_
    ## _ALL_
    ## 29
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## mean
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 62.759302326
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs101
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-mean
    ## _ALL_
    ## _ALL_
    ## 29
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## mean
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 67.279518072
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs102
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-mean
    ## _ALL_
    ## _ALL_
    ## 29
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## mean
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 70.004761905
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs103
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q3
    ## _ALL_
    ## _ALL_
    ## 30
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## q3
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 74.4
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs104
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q3
    ## _ALL_
    ## _ALL_
    ## 30
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## q3
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 77.8
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs105
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q3
    ## _ALL_
    ## _ALL_
    ## 30
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## q3
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 80.3
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs106
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q1
    ## _ALL_
    ## _ALL_
    ## 31
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## q1
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 53.5
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs107
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q1
    ## _ALL_
    ## _ALL_
    ## 31
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## q1
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 55.8
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs108
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-q1
    ## _ALL_
    ## _ALL_
    ## 31
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## q1
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 56.75
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs109
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-max
    ## _ALL_
    ## _ALL_
    ## 32
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## max
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 86.2
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs110
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-max
    ## _ALL_
    ## _ALL_
    ## 32
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## max
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 106.1
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs111
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-max
    ## _ALL_
    ## _ALL_
    ## 32
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## max
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 108.0
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs112
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-min
    ## _ALL_
    ## _ALL_
    ## 33
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Placebo
    ## min
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 34.0
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs113
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-min
    ## _ALL_
    ## _ALL_
    ## 33
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline Low Dose
    ## min
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 45.4
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs114
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-min
    ## _ALL_
    ## _ALL_
    ## 33
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## _ALL_
    ## Xanomeline High Dose
    ## min
    ## http://www.example.org/dc/code/factor-weightbl
    ## _ALL_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 41.7
    ## NA
    ## weightbl
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs115
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 36
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _NONMISS_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 86.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs116
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 36
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _NONMISS_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs117
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 36
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## _NONMISS_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 84.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs118
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 36
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 1
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _NONMISS_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs119
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 36
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 2
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _NONMISS_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs120
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 36
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 3
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## _NONMISS_
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 100.0
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs121
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 38
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 83.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs122
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 38
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 78.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs123
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 38
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 81.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs124
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 38
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 1
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 96.511627907
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs125
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 38
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 2
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 92.857142857
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs126
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 38
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 3
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 96.428571429
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs127
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 40
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 1
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## _ALL_
    ## Placebo
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 3.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs128
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 40
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 2
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline Low Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 6.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs129
    ## http://www.example.org/dc/code/race-_ALL_
    ## 1
    ## http://www.example.org/dc/code/procedure-count
    ## _ALL_
    ## _ALL_
    ## 40
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 
    ## 3
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline High Dose
    ## count
    ## http://www.example.org/dc/code/factor-quantity
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 3.0
    ## NA
    ## quantity
    ## %6.0f
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## http://www.example.org/dc/demo/ds/obs130
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 40
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 1
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## _ALL_
    ## Placebo
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 3.488372093
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## http://www.example.org/dc/demo/ds/obs131
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 40
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 2
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline Low Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 7.1428571429
    ## NA
    ## proportion
    ## %6.1f
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## http://www.example.org/dc/demo/ds/obs132
    ## http://www.example.org/dc/code/race-_ALL_
    ## 2
    ## http://www.example.org/dc/code/procedure-percent
    ## _ALL_
    ## _ALL_
    ## 40
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## ethnic
    ## 3
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## _ALL_
    ## Xanomeline High Dose
    ## percent
    ## http://www.example.org/dc/code/factor-proportion
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/sex-_ALL_
    ## 3.5714285714
    ## NA
    ## proportion
    ## %6.1f

Get definition for all descriptive statistics
---------------------------------------------

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

``` python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOprocedure.rq", "r") as myfile:
    procedureQuery=myfile.read()
qres = g.query(procedureQuery)
for row in qres:
     print("%s| %s| %s" %row)
```

    ## INFO:rdflib:RDFLib Version: 4.2.0
    ## http://www.example.org/dc/code/procedure-q1| q1| function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-mean| mean| function (x)  {     mean(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-n| n| function (x)  {     length(x[!is.na(x)]) }
    ## http://www.example.org/dc/code/procedure-count| count| function (x)  {     length(x) }
    ## http://www.example.org/dc/code/procedure-median| median| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-min| min| function (x)  {     min(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-std| std| function (x)  {     sd(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-q3| q3| function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-percent| percent| function (x)  {     -1 }
    ## http://www.example.org/dc/code/procedure-max| max| function (x)  {     max(x, na.rm = TRUE) }

Get definition for descriptive statistics median
------------------------------------------------

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

``` python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOprocedure-median.rq", "r") as myfile:
    proceduremedianQuery=myfile.read()
qres = g.query(proceduremedianQuery)
for row in qres:
     print("%s| %s| %s" %row)
```

    ## INFO:rdflib:RDFLib Version: 4.2.0
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionoperator| ==
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.w3.org/2004/02/skos/core#Concept
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#inScheme| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionvalue| median
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2000/01/rdf-schema#comment| Descriptive statistics median
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#topConceptOf| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.example.org/dc/code/Procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/RdescStatDefFun| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#prefLabel| median

Get information for selection of data
-------------------------------------

The SPARQL script shows how the information for selecting data for derivation of univariate statistics is present in the cube.

``` python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOobservations-R-selection.rq", "r") as myfile:
    observationsRselection=myfile.read()
qres = g.query(observationsRselection)
for row in qres:
     print("%s| %s| %s| %s" %row)
```

    ## INFO:rdflib:RDFLib Version: 4.2.0
    ## http://www.example.org/dc/demo/ds/obs056| agegr1| ==| 65-80
    ## http://www.example.org/dc/demo/ds/obs056| trt01a| ==| Xanomeline Low Dose
    ## http://www.example.org/dc/demo/ds/obs027| trt01a| ==| Xanomeline High Dose
