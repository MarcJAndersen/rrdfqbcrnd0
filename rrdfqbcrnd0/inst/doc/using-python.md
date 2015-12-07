---
title: "Using Python to make SPARQL queries"
author: "mja@statgroup.dk"
date: "2015-12-08"
output: rmarkdown::html_vignette
---

# Using Python with SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)

The examples below uses `rdflib` from (https://github.com/RDFLib/rdflib).

As of 28-jun-2015 the code is still in development.

## Requirement

The python package `rdflib` must be installed, see description at (https://github.com/RDFLib/rdflib).

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
## http://www.example.org/dc/dimension#sex
## http://www.example.org/dc/dimension#ethnic
## http://www.example.org/dc/dimension#trt01a
## http://www.example.org/dc/dimension#agegr1
## http://www.example.org/dc/dimension#procedure
## http://www.example.org/dc/dimension#race
## http://www.example.org/dc/dimension#factor
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
## http://www.example.org/dc/attribute#colno
## http://www.example.org/dc/attribute#measurefmt
## http://www.example.org/dc/attribute#cellpartno
## http://www.example.org/dc/attribute#rowno
## http://www.example.org/dc/attribute#unit
## http://www.example.org/dc/attribute#denominator
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
## Traceback (most recent call last):
##   File "<string>", line 6, in <module>
##   File "/usr/lib/python2.7/site-packages/rdflib/graph.py", line 1076, in query
##     query_object, initBindings, initNs, **kwargs))
##   File "/usr/lib/python2.7/site-packages/rdflib/plugins/sparql/processor.py", line 73, in query
##     query = translateQuery(parsetree, base, initNs)
##   File "/usr/lib/python2.7/site-packages/rdflib/plugins/sparql/algebra.py", line 743, in translateQuery
##     P, PV = translate(q[1])
##   File "/usr/lib/python2.7/site-packages/rdflib/plugins/sparql/algebra.py", line 532, in translate
##     M = translateGroupGraphPattern(q.where)
##   File "/usr/lib/python2.7/site-packages/rdflib/plugins/sparql/algebra.py", line 277, in translateGroupGraphPattern
##     g[-1]["triples"] += triples(p.triples)
##   File "/usr/lib/python2.7/site-packages/rdflib/plugins/sparql/algebra.py", line 128, in triples
##     raise Exception('these aint triples')
## Exception: these aint triples
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
## http://www.example.org/dc/code/procedure-mean| mean| function (x)  {     mean(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-median| median| function (x)  {     median(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-min| min| function (x)  {     min(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-q1| q1| function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-percent| percent| function (x)  {     -1 }
## http://www.example.org/dc/code/procedure-count| count| function (x)  {     length(x) }
## http://www.example.org/dc/code/procedure-q3| q3| function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-n| n| function (x)  {     length(x[!is.na(x)]) }
## http://www.example.org/dc/code/procedure-std| std| function (x)  {     sd(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-max| max| function (x)  {     max(x, na.rm = TRUE) }
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
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.example.org/dc/code/Procedure
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.w3.org/2004/02/skos/core#Concept
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2000/01/rdf-schema#comment| Descriptive statistics median
## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/RdescStatDefFun| function (x)  {     median(x, na.rm = TRUE) }
## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionoperator| ==
## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionvalue| median
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#prefLabel| median
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#inScheme| http://www.example.org/dc/code/procedure
## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#topConceptOf| http://www.example.org/dc/code/procedure
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
## http://www.example.org/dc/demo/ds/obs056| agegr1| ==| 65-80
## http://www.example.org/dc/demo/ds/obs056| trt01a| ==| Xanomeline Low Dose
## http://www.example.org/dc/demo/ds/obs027| trt01a| ==| Xanomeline High Dose
```


