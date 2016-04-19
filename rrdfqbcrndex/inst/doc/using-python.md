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
    ## http://www.example.org/dc/dimension#trt01a
    ## http://www.example.org/dc/dimension#ethnic
    ## http://www.example.org/dc/dimension#procedure
    ## http://www.example.org/dc/dimension#sex
    ## http://www.example.org/dc/dimension#race
    ## http://www.example.org/dc/dimension#factor
    ## http://www.example.org/dc/dimension#agegr1

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
    ## http://www.example.org/dc/attribute#measurefmt
    ## http://www.example.org/dc/attribute#denominator
    ## http://www.example.org/dc/attribute#unit
    ## http://www.example.org/dc/attribute#colno
    ## http://www.example.org/dc/attribute#rowno
    ## http://www.example.org/dc/attribute#cellpartno

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
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## _NONMISS_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs001
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## quantity
    ## NA
    ## %6.0f
    ## 86.0
    ## count
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## _NONMISS_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs002
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## _NONMISS_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs003
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## _NONMISS_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs004
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## _NONMISS_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs005
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## _NONMISS_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs006
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## F
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs007
    ## http://www.example.org/dc/code/sex-F
    ## quantity
    ## NA
    ## %6.0f
    ## 53.0
    ## count
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## F
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs008
    ## http://www.example.org/dc/code/sex-F
    ## quantity
    ## NA
    ## %6.0f
    ## 50.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## F
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs009
    ## http://www.example.org/dc/code/sex-F
    ## quantity
    ## NA
    ## %6.0f
    ## 40.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## F
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs010
    ## http://www.example.org/dc/code/sex-F
    ## proportion
    ## NA
    ## %6.1f
    ## 61.627906977
    ## percent
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## F
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs011
    ## http://www.example.org/dc/code/sex-F
    ## proportion
    ## NA
    ## %6.1f
    ## 59.523809524
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## F
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs012
    ## http://www.example.org/dc/code/sex-F
    ## proportion
    ## NA
    ## %6.1f
    ## 47.619047619
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## M
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs013
    ## http://www.example.org/dc/code/sex-M
    ## quantity
    ## NA
    ## %6.0f
    ## 33.0
    ## count
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## M
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs014
    ## http://www.example.org/dc/code/sex-M
    ## quantity
    ## NA
    ## %6.0f
    ## 34.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## M
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs015
    ## http://www.example.org/dc/code/sex-M
    ## quantity
    ## NA
    ## %6.0f
    ## 44.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## M
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs016
    ## http://www.example.org/dc/code/sex-M
    ## proportion
    ## NA
    ## %6.1f
    ## 38.372093023
    ## percent
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## M
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs017
    ## http://www.example.org/dc/code/sex-M
    ## proportion
    ## NA
    ## %6.1f
    ## 40.476190476
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## M
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs018
    ## http://www.example.org/dc/code/sex-M
    ## proportion
    ## NA
    ## %6.1f
    ## 52.380952381
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 4
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs019
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 8.5901671271
    ## std
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 4
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs020
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 8.2860505995
    ## std
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 4
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs021
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 7.8860938487
    ## std
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 5
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs022
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.0f
    ## 86.0
    ## n
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 5
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs023
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.0f
    ## 84.0
    ## n
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 5
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs024
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.0f
    ## 84.0
    ## n
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 6
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs025
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 76.0
    ## median
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 6
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs026
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 77.5
    ## median
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 6
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs027
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 76.0
    ## median
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 7
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs028
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 75.209302326
    ## mean
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 7
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs029
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 75.666666667
    ## mean
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 7
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs030
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 74.380952381
    ## mean
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 8
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs031
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 82.0
    ## q3
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 8
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs032
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 82.0
    ## q3
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 8
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs033
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 80.0
    ## q3
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 9
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs034
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 69.0
    ## q1
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 9
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs035
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 71.0
    ## q1
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 9
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs036
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 70.5
    ## q1
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 10
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs037
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 89.0
    ## max
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 10
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs038
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 88.0
    ## max
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 10
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs039
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 88.0
    ## max
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 11
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs040
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 52.0
    ## min
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 11
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs041
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 51.0
    ## min
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 11
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs042
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## NA
    ## %6.1f
    ## 56.0
    ## min
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs043
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 86.0
    ## count
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs044
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs045
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs046
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs047
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs048
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## <65
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs049
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 14.0
    ## count
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs050
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 8.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs051
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 11.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## <65
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs052
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 16.279069767
    ## percent
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs053
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 9.5238095238
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs054
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 13.095238095
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## 65-80
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs055
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 42.0
    ## count
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs056
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 47.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs057
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 55.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## 65-80
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs058
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 48.837209302
    ## percent
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs059
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 55.952380952
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs060
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 65.476190476
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## >80
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs061
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 30.0
    ## count
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs062
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 29.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs063
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 18.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## >80
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs064
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 34.88372093
    ## percent
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs065
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 34.523809524
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs066
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 21.428571429
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## http://www.example.org/dc/demo/ds/obs067
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 86.0
    ## count
    ## Placebo
    ## _NONMISS_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## http://www.example.org/dc/demo/ds/obs068
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline Low Dose
    ## _NONMISS_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## http://www.example.org/dc/demo/ds/obs069
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline High Dose
    ## _NONMISS_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## http://www.example.org/dc/demo/ds/obs070
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Placebo
    ## _NONMISS_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## http://www.example.org/dc/demo/ds/obs071
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline Low Dose
    ## _NONMISS_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## http://www.example.org/dc/demo/ds/obs072
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline High Dose
    ## _NONMISS_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-WHITE
    ## http://www.example.org/dc/demo/ds/obs073
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 78.0
    ## count
    ## Placebo
    ## WHITE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-WHITE
    ## http://www.example.org/dc/demo/ds/obs074
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 78.0
    ## count
    ## Xanomeline Low Dose
    ## WHITE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-WHITE
    ## http://www.example.org/dc/demo/ds/obs075
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 74.0
    ## count
    ## Xanomeline High Dose
    ## WHITE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-WHITE
    ## http://www.example.org/dc/demo/ds/obs076
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 90.697674419
    ## percent
    ## Placebo
    ## WHITE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-WHITE
    ## http://www.example.org/dc/demo/ds/obs077
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 92.857142857
    ## percent
    ## Xanomeline Low Dose
    ## WHITE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-WHITE
    ## http://www.example.org/dc/demo/ds/obs078
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 88.095238095
    ## percent
    ## Xanomeline High Dose
    ## WHITE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## http://www.example.org/dc/demo/ds/obs079
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 8.0
    ## count
    ## Placebo
    ## BLACK OR AFRICAN AMERICAN
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## http://www.example.org/dc/demo/ds/obs080
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 6.0
    ## count
    ## Xanomeline Low Dose
    ## BLACK OR AFRICAN AMERICAN
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## http://www.example.org/dc/demo/ds/obs081
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 9.0
    ## count
    ## Xanomeline High Dose
    ## BLACK OR AFRICAN AMERICAN
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## http://www.example.org/dc/demo/ds/obs082
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 9.3023255814
    ## percent
    ## Placebo
    ## BLACK OR AFRICAN AMERICAN
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## http://www.example.org/dc/demo/ds/obs083
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 7.1428571429
    ## percent
    ## Xanomeline Low Dose
    ## BLACK OR AFRICAN AMERICAN
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## http://www.example.org/dc/demo/ds/obs084
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 10.714285714
    ## percent
    ## Xanomeline High Dose
    ## BLACK OR AFRICAN AMERICAN
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## http://www.example.org/dc/demo/ds/obs085
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 0.0
    ## count
    ## Placebo
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## http://www.example.org/dc/demo/ds/obs086
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 0.0
    ## count
    ## Xanomeline Low Dose
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## http://www.example.org/dc/demo/ds/obs087
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 1.0
    ## count
    ## Xanomeline High Dose
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## http://www.example.org/dc/demo/ds/obs088
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 0.0
    ## percent
    ## Placebo
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## http://www.example.org/dc/demo/ds/obs089
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 0.0
    ## percent
    ## Xanomeline Low Dose
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## http://www.example.org/dc/demo/ds/obs090
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 1.1904761905
    ## percent
    ## Xanomeline High Dose
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 26
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs091
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 12.771543533
    ## std
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 26
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs092
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 14.123598649
    ## std
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 26
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs093
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 14.653433372
    ## std
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 27
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs094
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.0f
    ## 86.0
    ## n
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 27
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs095
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.0f
    ## 83.0
    ## n
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 27
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs096
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.0f
    ## 84.0
    ## n
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 28
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs097
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 60.55
    ## median
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 28
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs098
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 64.9
    ## median
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 28
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs099
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 69.2
    ## median
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 29
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs100
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 62.759302326
    ## mean
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 29
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs101
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 67.279518072
    ## mean
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 29
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs102
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 70.004761905
    ## mean
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 30
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs103
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 74.4
    ## q3
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 30
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs104
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 77.8
    ## q3
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 30
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs105
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 80.3
    ## q3
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 31
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs106
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 53.5
    ## q1
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 31
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs107
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 55.8
    ## q1
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 31
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs108
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 56.75
    ## q1
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 32
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs109
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 86.2
    ## max
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 32
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs110
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 106.1
    ## max
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 32
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs111
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 108.0
    ## max
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 33
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs112
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 34.0
    ## min
    ## Placebo
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 33
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs113
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 45.4
    ## min
    ## Xanomeline Low Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 33
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs114
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## NA
    ## %6.1f
    ## 41.7
    ## min
    ## Xanomeline High Dose
    ## _ALL_
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs115
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 86.0
    ## count
    ## Placebo
    ## _ALL_
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs116
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs117
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 84.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-quantity
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs118
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Placebo
    ## _ALL_
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs119
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs120
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 100.0
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs121
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 83.0
    ## count
    ## Placebo
    ## _ALL_
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs122
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 78.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs123
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 81.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs124
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 96.511627907
    ## percent
    ## Placebo
    ## _ALL_
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs125
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 92.857142857
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs126
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 96.428571429
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs127
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 3.0
    ## count
    ## Placebo
    ## _ALL_
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs128
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 6.0
    ## count
    ## Xanomeline Low Dose
    ## _ALL_
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## 1
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs129
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## NA
    ## %6.0f
    ## 3.0
    ## count
    ## Xanomeline High Dose
    ## _ALL_
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs130
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 3.488372093
    ## percent
    ## Placebo
    ## _ALL_
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs131
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 7.1428571429
    ## percent
    ## Xanomeline Low Dose
    ## _ALL_
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## _ALL_
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## 2
    ## http://www.example.org/dc/code/race-_ALL_
    ## http://www.example.org/dc/demo/ds/obs132
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## NA
    ## %6.1f
    ## 3.5714285714
    ## percent
    ## Xanomeline High Dose
    ## _ALL_
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion

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
    ## http://www.example.org/dc/code/procedure-std| std| function (x)  {     sd(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-percent| percent| function (x)  {     -1 }
    ## http://www.example.org/dc/code/procedure-median| median| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-count| count| function (x)  {     length(x) }
    ## http://www.example.org/dc/code/procedure-n| n| function (x)  {     length(x[!is.na(x)]) }
    ## http://www.example.org/dc/code/procedure-q1| q1| function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-mean| mean| function (x)  {     mean(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-min| min| function (x)  {     min(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-max| max| function (x)  {     max(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-q3| q3| function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }

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
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.w3.org/2004/02/skos/core#Concept
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#inScheme| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/RdescStatDefFun| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionoperator| ==
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2000/01/rdf-schema#comment| Descriptive statistics median
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#topConceptOf| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.example.org/dc/code/Procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#prefLabel| median
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionvalue| median

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
    ## http://www.example.org/dc/demo/ds/obs056| trt01a| ==| Xanomeline Low Dose
    ## http://www.example.org/dc/demo/ds/obs027| trt01a| ==| Xanomeline High Dose
    ## http://www.example.org/dc/demo/ds/obs056| agegr1| ==| 65-80
