---
title: "Using Python to make SPARQL queries"
author: "mja@statgroup.dk"
date: "2015-06-28"
output: rmarkdown::html_vignette
---

# Using Python with SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)

The examples below uses `rdflib` from (https://github.com/RDFLib/rdflib).

As of 28-jun-2015 the code is still in development.

## Get dimensions

```python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOdimensions.rq", "r") as myfile:
    dimensionsQuery=myfile.read()
qres = g.query(dimensionsQuery)
for row in qres:
    print("%s" %row)
```

```
## INFO:rdflib:RDFLib Version: 4.2.0
## http://www.example.org/dc/dimension#factor
## http://www.example.org/dc/dimension#ethnic
## http://www.example.org/dc/dimension#agegr1
## http://www.example.org/dc/dimension#race
## http://www.example.org/dc/dimension#sex
## http://www.example.org/dc/dimension#procedure
## http://www.example.org/dc/dimension#trt01a
```

## Get attributes


```python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOattributes.rq", "r") as myfile:
    attributesQuery=myfile.read()
qres = g.query(attributesQuery)
for row in qres:
    print("%s" %row)
```

```
## INFO:rdflib:RDFLib Version: 4.2.0
## http://www.example.org/dc/attribute#measurefmt
## http://www.example.org/dc/attribute#denominator
## http://www.example.org/dc/attribute#rowno
## http://www.example.org/dc/attribute#colno
## http://www.example.org/dc/attribute#cellpartno
## http://www.example.org/dc/attribute#unit
```

## Get observations

The SPARQL script shows for each observation the dimension, attributes and measures in a row.
The python code shows each variable on a line - that is not the right way to do it.

```python
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

```
## INFO:rdflib:RDFLib Version: 4.2.0
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 55.952380952
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## 65-80
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs059
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## agegr1
## http://www.example.org/dc/code/agegr1-65-80
## 20
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 18
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## >80
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs063
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_80
## 21
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## mean
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 75.666666667
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-mean
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs029
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 7
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## q3
## Placebo
## _ALL_
## age
## NA
## 82
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q3
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs031
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 8
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 30
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## >80
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs061
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_80
## 21
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 40.476190476
## http://www.example.org/dc/code/sex-M
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs017
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 3
## M
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## n
## Placebo
## _ALL_
## weightbl
## NA
## 86
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-n
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs094
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 27
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## q1
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 71
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q1
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs035
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 9
## _ALL_
## NOT HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 78
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs122
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 38
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## AMERICAN INDIAN OR ALASKA NATIVE
## quantity
## NA
## 0
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
## http://www.example.org/dc/demo/ds/obs086
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 25
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 47.619047619
## http://www.example.org/dc/code/sex-F
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs012
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 2
## F
## _ALL_
## http://www.example.org/dc/code/factor-age
## max
## Xanomeline High Dose
## _ALL_
## age
## NA
## 88.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-max
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs039
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 10
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _NONMISS_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_NONMISS_
## http://www.example.org/dc/demo/ds/obs069
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 22
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## q1
## Placebo
## _ALL_
## age
## NA
## 69
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q1
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs034
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 9
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_NONMISS_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs002
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 1
## _NONMISS_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 34.523809524
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## >80
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs065
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## agegr1
## http://www.example.org/dc/code/agegr1-_80
## 21
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _NONMISS_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_NONMISS_
## http://www.example.org/dc/demo/ds/obs070
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 22
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 33
## http://www.example.org/dc/code/sex-M
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs013
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 3
## M
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## WHITE
## proportion
## NA
## 90.697674419
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-WHITE
## http://www.example.org/dc/demo/ds/obs076
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 23
## _ALL_
## _NONMISS_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs116
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_NONMISS_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 36
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 44
## http://www.example.org/dc/code/sex-M
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs015
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 3
## M
## NOT HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 96.511627907
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs124
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
## 1
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 38
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## mean
## Placebo
## _ALL_
## weightbl
## NA
## 62.759302326
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-mean
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs100
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 29
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 38.372093023
## http://www.example.org/dc/code/sex-M
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs016
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 3
## M
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _NONMISS_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_NONMISS_
## http://www.example.org/dc/demo/ds/obs071
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 22
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## BLACK OR AFRICAN AMERICAN
## proportion
## NA
## 7.1428571429
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
## http://www.example.org/dc/demo/ds/obs083
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 24
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## BLACK OR AFRICAN AMERICAN
## proportion
## NA
## 10.714285714
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
## http://www.example.org/dc/demo/ds/obs084
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 24
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## AMERICAN INDIAN OR ALASKA NATIVE
## proportion
## NA
## 0.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
## http://www.example.org/dc/demo/ds/obs089
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 25
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## median
## Placebo
## _ALL_
## weightbl
## NA
## 60.55
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-median
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs097
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 28
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## max
## Placebo
## _ALL_
## weightbl
## NA
## 86.2
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-max
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs109
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 32
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## q3
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 80.3
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q3
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs105
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 30
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 42
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## 65-80
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs055
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-65-80
## 20
## _ALL_
## _NONMISS_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs118
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_NONMISS_
## 1
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 36
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _NONMISS_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs048
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## agegr1
## http://www.example.org/dc/code/agegr1-_NONMISS_
## 18
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## AMERICAN INDIAN OR ALASKA NATIVE
## quantity
## NA
## 1
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
## http://www.example.org/dc/demo/ds/obs087
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 25
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## BLACK OR AFRICAN AMERICAN
## proportion
## NA
## 9.3023255814
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
## http://www.example.org/dc/demo/ds/obs082
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 24
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## std
## Placebo
## _ALL_
## age
## NA
## 8.5901671271
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-std
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs019
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 4
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## median
## Xanomeline High Dose
## _ALL_
## age
## NA
## 76.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-median
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs027
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 6
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 21.428571429
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## >80
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs066
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## agegr1
## http://www.example.org/dc/code/agegr1-_80
## 21
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## min
## Placebo
## _ALL_
## weightbl
## NA
## 34.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-min
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs112
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 33
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## median
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 77.5
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-median
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs026
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 6
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 34.88372093
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## >80
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs064
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## agegr1
## http://www.example.org/dc/code/agegr1-_80
## 21
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## q3
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 77.8
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q3
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs104
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 30
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 86
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _NONMISS_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs043
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_NONMISS_
## 18
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 61.627906977
## http://www.example.org/dc/code/sex-F
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs010
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 2
## F
## _NONMISS_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs120
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_NONMISS_
## 3
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 36
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## median
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 69.2
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-median
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs099
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 28
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 47
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## 65-80
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs056
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-65-80
## 20
## _ALL_
## HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 3.5714285714
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs132
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
## 3
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 40
## _ALL_
## NOT HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 81
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs123
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 38
## _ALL_
## _NONMISS_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 86
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs115
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_NONMISS_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 36
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## min
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 45.4
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-min
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs113
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 33
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## mean
## Xanomeline High Dose
## _ALL_
## age
## NA
## 74.380952381
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-mean
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs030
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 7
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 86
## http://www.example.org/dc/code/sex-_NONMISS_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs001
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 1
## _NONMISS_
## _ALL_
## http://www.example.org/dc/code/factor-age
## min
## Placebo
## _ALL_
## age
## NA
## 52.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-min
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs040
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 11
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## std
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 14.123598649
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-std
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs092
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 26
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _NONMISS_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs046
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## agegr1
## http://www.example.org/dc/code/agegr1-_NONMISS_
## 18
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## q1
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 55.8
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q1
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs107
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 31
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 50
## http://www.example.org/dc/code/sex-F
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs008
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 2
## F
## _ALL_
## http://www.example.org/dc/code/factor-age
## q1
## Xanomeline High Dose
## _ALL_
## age
## NA
## 70.5
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q1
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs036
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 9
## _ALL_
## _NONMISS_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs117
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_NONMISS_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 36
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## median
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 64.9
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-median
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs098
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 28
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 40
## http://www.example.org/dc/code/sex-F
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs009
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 2
## F
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## std
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 14.653433372
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-std
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs093
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 26
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## max
## Placebo
## _ALL_
## age
## NA
## 89.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-max
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs037
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 10
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## min
## Xanomeline High Dose
## _ALL_
## age
## NA
## 56.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-min
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs042
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 11
## _ALL_
## HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 3
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs127
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 40
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_NONMISS_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs005
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 1
## _NONMISS_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _NONMISS_
## quantity
## NA
## 86
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_NONMISS_
## http://www.example.org/dc/demo/ds/obs067
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 22
## _ALL_
## NOT HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 83
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs121
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 38
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_NONMISS_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs006
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 1
## _NONMISS_
## HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 3.488372093
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs130
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
## 1
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 40
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## AMERICAN INDIAN OR ALASKA NATIVE
## quantity
## NA
## 0
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
## http://www.example.org/dc/demo/ds/obs085
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 25
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## q3
## Xanomeline High Dose
## _ALL_
## age
## NA
## 80
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q3
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs033
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 8
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## n
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-n
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs096
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 27
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## q3
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 82
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q3
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs032
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 8
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 14
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## <65
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs049
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_65
## 19
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_NONMISS_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs004
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 1
## _NONMISS_
## _ALL_
## http://www.example.org/dc/code/factor-age
## max
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 88.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-max
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs038
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 10
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## q1
## Placebo
## _ALL_
## weightbl
## NA
## 53.5
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q1
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs106
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 31
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## WHITE
## quantity
## NA
## 78
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-WHITE
## http://www.example.org/dc/demo/ds/obs074
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 23
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## AMERICAN INDIAN OR ALASKA NATIVE
## proportion
## NA
## 1.1904761905
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
## http://www.example.org/dc/demo/ds/obs090
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 25
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## std
## Xanomeline High Dose
## _ALL_
## age
## NA
## 7.8860938487
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-std
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs021
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 4
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## BLACK OR AFRICAN AMERICAN
## quantity
## NA
## 8
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
## http://www.example.org/dc/demo/ds/obs079
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 24
## _ALL_
## _NONMISS_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs119
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_NONMISS_
## 2
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 36
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## n
## Xanomeline High Dose
## _ALL_
## age
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-n
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs024
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 5
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## std
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 8.2860505995
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-std
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs020
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 4
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _NONMISS_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_NONMISS_
## http://www.example.org/dc/demo/ds/obs072
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 22
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## mean
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 70.004761905
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-mean
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs102
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 29
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## n
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-n
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs023
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 5
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## mean
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 67.279518072
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-mean
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs101
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 29
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## max
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 108.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-max
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs111
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 32
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _NONMISS_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs044
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_NONMISS_
## 18
## _ALL_
## NOT HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 92.857142857
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs125
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
## 2
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 38
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 9.5238095238
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## <65
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs053
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## agegr1
## http://www.example.org/dc/code/agegr1-_65
## 19
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## min
## Xanomeline Low Dose
## _ALL_
## age
## NA
## 51.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-min
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs041
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 11
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 34
## http://www.example.org/dc/code/sex-M
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs014
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 3
## M
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 100.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _NONMISS_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs047
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## agegr1
## http://www.example.org/dc/code/agegr1-_NONMISS_
## 18
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## WHITE
## quantity
## NA
## 74
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-WHITE
## http://www.example.org/dc/demo/ds/obs075
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 23
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## q1
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 56.75
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q1
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs108
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 31
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## q3
## Placebo
## _ALL_
## weightbl
## NA
## 74.4
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-q3
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs103
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 30
## _ALL_
## HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 7.1428571429
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs131
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
## 2
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 40
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## WHITE
## proportion
## NA
## 92.857142857
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-WHITE
## http://www.example.org/dc/demo/ds/obs077
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 23
## _ALL_
## HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 6
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs128
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 40
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## n
## Placebo
## _ALL_
## age
## NA
## 86
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-n
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs022
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 5
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 65.476190476
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## 65-80
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs060
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## agegr1
## http://www.example.org/dc/code/agegr1-65-80
## 20
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 29
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## >80
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs062
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_80
## 21
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## max
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 106.1
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-max
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs110
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 32
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## BLACK OR AFRICAN AMERICAN
## quantity
## NA
## 6
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
## http://www.example.org/dc/demo/ds/obs080
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 24
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 16.279069767
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## <65
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs052
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## agegr1
## http://www.example.org/dc/code/agegr1-_65
## 19
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _NONMISS_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_NONMISS_
## http://www.example.org/dc/demo/ds/obs068
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 22
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## n
## Xanomeline Low Dose
## _ALL_
## weightbl
## NA
## 83
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-n
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs095
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 27
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## WHITE
## quantity
## NA
## 78
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-WHITE
## http://www.example.org/dc/demo/ds/obs073
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 23
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 52.380952381
## http://www.example.org/dc/code/sex-M
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs018
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 3
## M
## _ALL_
## http://www.example.org/dc/code/factor-age
## median
## Placebo
## _ALL_
## age
## NA
## 76.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-median
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs025
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 6
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## BLACK OR AFRICAN AMERICAN
## quantity
## NA
## 9
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-BLACK_OR_AFRICAN_AMERICAN
## http://www.example.org/dc/demo/ds/obs081
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 24
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 13.095238095
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## <65
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs054
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## agegr1
## http://www.example.org/dc/code/agegr1-_65
## 19
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_NONMISS_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs003
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 1
## _NONMISS_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 55
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## 65-80
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs057
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-65-80
## 20
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Placebo
## _ALL_
## quantity
## NA
## 53
## http://www.example.org/dc/code/sex-F
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs007
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 2
## F
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 11
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## <65
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs051
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_65
## 19
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## WHITE
## proportion
## NA
## 88.095238095
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-WHITE
## http://www.example.org/dc/demo/ds/obs078
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 23
## _ALL_
## HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 3
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _ALL_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs129
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-HISPANIC_OR_LATINO
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 40
## _ALL_
## NOT HISPANIC OR LATINO
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline High Dose
## _ALL_
## proportion
## NA
## 96.428571429
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs126
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-NOT_HISPANIC_OR_LATINO
## 3
## ethnic
## http://www.example.org/dc/code/agegr1-_ALL_
## 38
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline High Dose
## _ALL_
## quantity
## NA
## 84
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## _NONMISS_
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs045
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_NONMISS_
## 18
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-age
## mean
## Placebo
## _ALL_
## age
## NA
## 75.209302326
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-mean
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs028
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 7
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Xanomeline Low Dose
## _ALL_
## proportion
## NA
## 59.523809524
## http://www.example.org/dc/code/sex-F
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs011
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## sex
## http://www.example.org/dc/code/agegr1-_ALL_
## 2
## F
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## min
## Xanomeline High Dose
## _ALL_
## weightbl
## NA
## 41.7
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-min
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs114
## http://www.example.org/dc/code/trt01a-Xanomeline_High_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 3
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 33
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-weightbl
## std
## Placebo
## _ALL_
## weightbl
## NA
## 12.771543533
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-std
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs091
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## 
## http://www.example.org/dc/code/agegr1-_ALL_
## 26
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## AMERICAN INDIAN OR ALASKA NATIVE
## proportion
## NA
## 0.0
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## _ALL_
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-AMERICAN_INDIAN_OR_ALASKA_NATIVE
## http://www.example.org/dc/demo/ds/obs088
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## race
## http://www.example.org/dc/code/agegr1-_ALL_
## 25
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-quantity
## count
## Xanomeline Low Dose
## _ALL_
## quantity
## NA
## 8
## http://www.example.org/dc/code/sex-_ALL_
## %6.0f
## <65
## http://www.example.org/dc/code/procedure-count
## 1
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs050
## http://www.example.org/dc/code/trt01a-Xanomeline_Low_Dose
## http://www.example.org/dc/code/ethnic-_ALL_
## 2
## 
## http://www.example.org/dc/code/agegr1-_65
## 19
## _ALL_
## _ALL_
## http://www.example.org/dc/code/factor-proportion
## percent
## Placebo
## _ALL_
## proportion
## NA
## 48.837209302
## http://www.example.org/dc/code/sex-_ALL_
## %6.1f
## 65-80
## http://www.example.org/dc/code/procedure-percent
## 2
## http://www.example.org/dc/code/race-_ALL_
## http://www.example.org/dc/demo/ds/obs058
## http://www.example.org/dc/code/trt01a-Placebo
## http://www.example.org/dc/code/ethnic-_ALL_
## 1
## agegr1
## http://www.example.org/dc/code/agegr1-65-80
## 20
## _ALL_
```

## Get definition for all descriptive statistics

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

```python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOprocedure.rq", "r") as myfile:
    procedureQuery=myfile.read()
qres = g.query(procedureQuery)
for row in qres:
     print("%s| %s| %s" %row)

```

```
## INFO:rdflib:RDFLib Version: 4.2.0
## http://www.example.org/dc/code/procedure-min| min| function (x)  {     min(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-percent| percent| function (x)  {     -1 }
## http://www.example.org/dc/code/procedure-std| std| function (x)  {     sd(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-n| n| function (x)  {     length(x[!is.na(x)]) }
## http://www.example.org/dc/code/procedure-count| count| function (x)  {     length(x) }
## http://www.example.org/dc/code/procedure-mean| mean| function (x)  {     mean(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-max| max| function (x)  {     max(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-q3| q3| function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-q1| q1| function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-median| median| function (x)  {     median(x, na.rm = TRUE) }
```

## Get definition for descriptive statistics median

The SPARQL script shows how the function definition for the descriptive statistics is stored in the cube.

```python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOprocedure-median.rq", "r") as myfile:
    proceduremedianQuery=myfile.read()
qres = g.query(proceduremedianQuery)
for row in qres:
     print("%s| %s| %s" %row)

```

```
## INFO:rdflib:RDFLib Version: 4.2.0
## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/RdescStatDefFun| function (x)  {     median(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2000/01/rdf-schema#comment| Descriptive statistics median
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.example.org/dc/code/Procedure
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.w3.org/2004/02/skos/core#Concept
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#prefLabel| median
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#topConceptOf| http://www.example.org/dc/code/procedure
## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionvalue| median
## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionoperator| ==
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#inScheme| http://www.example.org/dc/code/procedure
```

## Get information for selection of data

The SPARQL script shows how the information for selecting data for derivation of univariate statistics is present in the cube.

```python
from rdflib import Graph
g = Graph()
g.parse("../extdata/sample-rdf/DC-DEMO-sample.ttl", format="turtle")
with open ("../extdata/sample-rdf/DEMOobservations-R-selection.rq", "r") as myfile:
    observationsRselection=myfile.read()
qres = g.query(observationsRselection)
for row in qres:
     print("%s| %s| %s| %s" %row)

```

```
## INFO:rdflib:RDFLib Version: 4.2.0
## http://www.example.org/dc/demo/ds/obs056| trt01a| ==| Xanomeline Low Dose
## http://www.example.org/dc/demo/ds/obs027| trt01a| ==| Xanomeline High Dose
## http://www.example.org/dc/demo/ds/obs056| agegr1| ==| 65-80
```


