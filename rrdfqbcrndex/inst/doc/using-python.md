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
    ## http://www.example.org/dc/dimension#sex
    ## http://www.example.org/dc/dimension#procedure
    ## http://www.example.org/dc/dimension#race
    ## http://www.example.org/dc/dimension#ethnic
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
    ## http://www.example.org/dc/attribute#colno
    ## http://www.example.org/dc/attribute#unit
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
    ## sex
    ## M
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs017
    ## 2
    ## http://www.example.org/dc/code/sex-M
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 40.476190476
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs078
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-WHITE
    ## NA
    ## 88.095238095
    ## percent
    ## WHITE
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs132
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 3.5714285714
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 32
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs111
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 108.0
    ## max
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 30
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs105
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 80.3
    ## q3
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## 65-80
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs058
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 48.837209302
    ## percent
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 8
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs031
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 82.0
    ## q3
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs130
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 3.488372093
    ## percent
    ## _ALL_
    ## Placebo
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 31
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs107
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 55.8
    ## q1
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 27
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs095
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 83.0
    ## n
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## F
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs007
    ## 1
    ## http://www.example.org/dc/code/sex-F
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 53.0
    ## count
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs116
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-quantity
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## <65
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs052
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 16.279069767
    ## percent
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs083
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## NA
    ## 7.1428571429
    ## percent
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs085
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## NA
    ## 0.0
    ## count
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs051
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 11.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## F
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs009
    ## 1
    ## http://www.example.org/dc/code/sex-F
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 40.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs080
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## NA
    ## 6.0
    ## count
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 10
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs037
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 89.0
    ## max
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs065
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 34.523809524
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs056
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 47.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## sex
    ## F
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs012
    ## 2
    ## http://www.example.org/dc/code/sex-F
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 47.619047619
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs054
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 13.095238095
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs121
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 83.0
    ## count
    ## _ALL_
    ## Placebo
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs077
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-WHITE
    ## NA
    ## 92.857142857
    ## percent
    ## WHITE
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _NONMISS_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs001
    ## 1
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 86.0
    ## count
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 7
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs030
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 74.380952381
    ## mean
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## M
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs014
    ## 1
    ## http://www.example.org/dc/code/sex-M
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 34.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## >80
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs064
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 34.88372093
    ## percent
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs059
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 55.952380952
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs120
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs050
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 8.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 30
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs103
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 74.4
    ## q3
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 29
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs100
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 62.759302326
    ## mean
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 8
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs033
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 80.0
    ## q3
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## sex
    ## _NONMISS_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs005
    ## 2
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## F
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs010
    ## 2
    ## http://www.example.org/dc/code/sex-F
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 61.627906977
    ## percent
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs076
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-WHITE
    ## NA
    ## 90.697674419
    ## percent
    ## WHITE
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs070
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## NA
    ## 100.0
    ## percent
    ## _NONMISS_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs062
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 29.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 9
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs036
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 70.5
    ## q1
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 26
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs093
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 14.653433372
    ## std
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 11
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs040
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 52.0
    ## min
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs127
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 3.0
    ## count
    ## _ALL_
    ## Placebo
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## 65-80
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs055
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 42.0
    ## count
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs074
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-WHITE
    ## NA
    ## 78.0
    ## count
    ## WHITE
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 10
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs039
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 88.0
    ## max
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs073
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-WHITE
    ## NA
    ## 78.0
    ## count
    ## WHITE
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 30
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs104
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 77.8
    ## q3
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 5
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs022
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 86.0
    ## n
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 9
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs035
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 71.0
    ## q1
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs122
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 78.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 23
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs075
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-WHITE
    ## NA
    ## 74.0
    ## count
    ## WHITE
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs068
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## NA
    ## 84.0
    ## count
    ## _NONMISS_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 11
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs042
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 56.0
    ## min
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 31
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs108
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 56.75
    ## q1
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs115
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 86.0
    ## count
    ## _ALL_
    ## Placebo
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 4
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs019
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 8.5901671271
    ## std
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs117
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 27
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs096
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## n
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs079
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## NA
    ## 8.0
    ## count
    ## BLACK OR AFRICAN AMERICAN
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs071
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## NA
    ## 100.0
    ## percent
    ## _NONMISS_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs128
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 6.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 6
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs025
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 76.0
    ## median
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs045
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs044
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs090
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## NA
    ## 1.1904761905
    ## percent
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs126
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 96.428571429
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs046
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs063
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 18.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 33
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs112
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 34.0
    ## min
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs048
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs088
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## NA
    ## 0.0
    ## percent
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs084
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## NA
    ## 10.714285714
    ## percent
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 33
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs114
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 41.7
    ## min
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## <65
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs053
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 9.5238095238
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 32
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs110
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 106.1
    ## max
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 10
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs038
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 88.0
    ## max
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 33
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs113
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 45.4
    ## min
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 31
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs106
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 53.5
    ## q1
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 26
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs091
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 12.771543533
    ## std
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 26
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs092
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 14.123598649
    ## std
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## >80
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs061
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 30.0
    ## count
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs047
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## M
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs018
    ## 2
    ## http://www.example.org/dc/code/sex-M
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 52.380952381
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_80
    ## 21
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## >80
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs066
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 21.428571429
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 29
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs101
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 67.279518072
    ## mean
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 28
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs099
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 69.2
    ## median
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs123
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 81.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _NONMISS_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs003
    ## 1
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs072
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## NA
    ## 100.0
    ## percent
    ## _NONMISS_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 32
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-max
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs109
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 86.2
    ## max
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## agegr1
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs060
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 65.476190476
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs069
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## NA
    ## 84.0
    ## count
    ## _NONMISS_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs081
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## NA
    ## 9.0
    ## count
    ## BLACK OR AFRICAN AMERICAN
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs131
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 7.1428571429
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 22
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs067
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_NONMISS_
    ## NA
    ## 86.0
    ## count
    ## _NONMISS_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 29
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs102
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 70.004761905
    ## mean
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 11
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-min
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs041
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 51.0
    ## min
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_NONMISS_
    ## 18
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _NONMISS_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs043
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 86.0
    ## count
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 4
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs020
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 8.2860505995
    ## std
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 9
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q1
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs034
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 69.0
    ## q1
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## F
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs008
    ## 1
    ## http://www.example.org/dc/code/sex-F
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 50.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs087
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## NA
    ## 1.0
    ## count
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_65
    ## 19
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## <65
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs049
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 14.0
    ## count
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 27
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs094
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 86.0
    ## n
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 24
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs082
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
    ## NA
    ## 9.3023255814
    ## percent
    ## BLACK OR AFRICAN AMERICAN
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## M
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs016
    ## 2
    ## http://www.example.org/dc/code/sex-M
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 38.372093023
    ## percent
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs118
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Placebo
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 7
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs028
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 75.209302326
    ## mean
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs086
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## NA
    ## 0.0
    ## count
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs124
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 96.511627907
    ## percent
    ## _ALL_
    ## Placebo
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## _NONMISS_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs006
    ## 2
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## M
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs013
    ## 1
    ## http://www.example.org/dc/code/sex-M
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 33.0
    ## count
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 7
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-mean
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs029
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 75.666666667
    ## mean
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## sex
    ## F
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 2
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs011
    ## 2
    ## http://www.example.org/dc/code/sex-F
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 59.523809524
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 28
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs097
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 60.55
    ## median
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## race
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 25
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs089
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
    ## NA
    ## 0.0
    ## percent
    ## AMERICAN INDIAN OR ALASKA NATIVE
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## sex
    ## _NONMISS_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 1
    ## http://www.example.org/dc/code/trt01a-Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs004
    ## 2
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Placebo
    ## _ALL_
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 4
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-std
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs021
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 7.8860938487
    ## std
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## M
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 3
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs015
    ## 1
    ## http://www.example.org/dc/code/sex-M
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 44.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 28
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs098
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## weightbl
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 64.9
    ## median
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-weightbl
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 36
    ## http://www.example.org/dc/code/ethnic-_NONMISS_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs119
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 100.0
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## _NONMISS_
    ## http://www.example.org/dc/code/factor-proportion
    ## ethnic
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 38
    ## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-percent
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs125
    ## 2
    ## http://www.example.org/dc/code/sex-_ALL_
    ## proportion
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 92.857142857
    ## percent
    ## _ALL_
    ## Xanomeline Low Dose
    ## NOT HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-proportion
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 8
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-q3
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs032
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 82.0
    ## q3
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 6
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs026
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 77.5
    ## median
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _NONMISS_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 1
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs002
    ## 1
    ## http://www.example.org/dc/code/sex-_NONMISS_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## count
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 5
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs024
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## n
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 5
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 2
    ## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-n
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs023
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 84.0
    ## n
    ## _ALL_
    ## Xanomeline Low Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-65-80
    ## 20
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## 65-80
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs057
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 55.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 40
    ## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-count
    ## %6.0f
    ## http://www.example.org/dc/demo/ds/obs129
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## quantity
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 3.0
    ## count
    ## _ALL_
    ## Xanomeline High Dose
    ## HISPANIC OR LATINO
    ## http://www.example.org/dc/code/factor-quantity
    ## 
    ## _ALL_
    ## http://www.example.org/dc/code/agegr1-_ALL_
    ## 6
    ## http://www.example.org/dc/code/ethnic-_ALL_
    ## 3
    ## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
    ## _ALL_
    ## http://www.example.org/dc/code/procedure-median
    ## %6.1f
    ## http://www.example.org/dc/demo/ds/obs027
    ## 1
    ## http://www.example.org/dc/code/sex-_ALL_
    ## age
    ## http://www.example.org/dc/code/race-_ALL_
    ## NA
    ## 76.0
    ## median
    ## _ALL_
    ## Xanomeline High Dose
    ## _ALL_
    ## http://www.example.org/dc/code/factor-age

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
    ## http://www.example.org/dc/code/procedure-max| max| function (x)  {     max(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-mean| mean| function (x)  {     mean(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-n| n| function (x)  {     length(x[!is.na(x)]) }
    ## http://www.example.org/dc/code/procedure-count| count| function (x)  {     length(x) }
    ## http://www.example.org/dc/code/procedure-q3| q3| function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-q1| q1| function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-percent| percent| function (x)  {     -1 }
    ## http://www.example.org/dc/code/procedure-std| std| function (x)  {     sd(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-median| median| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-min| min| function (x)  {     min(x, na.rm = TRUE) }

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
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2000/01/rdf-schema#comment| Descriptive statistics median
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.example.org/dc/code/Procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#topConceptOf| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#prefLabel| median
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/RdescStatDefFun| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#inScheme| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionoperator| ==
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.w3.org/2004/02/skos/core#Concept
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
    ## http://www.example.org/dc/demo/ds/obs027| trt01a| ==| Xanomeline High Dose
    ## http://www.example.org/dc/demo/ds/obs056| trt01a| ==| Xanomeline Low Dose
    ## http://www.example.org/dc/demo/ds/obs056| agegr1| ==| 65-80
