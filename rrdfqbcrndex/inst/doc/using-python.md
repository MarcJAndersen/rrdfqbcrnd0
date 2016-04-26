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
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## http://www.example.org/dc/dimension#agegr1
    ## http://www.example.org/dc/dimension#trt01a
    ## http://www.example.org/dc/dimension#factor
    ## http://www.example.org/dc/dimension#ethnic
    ## http://www.example.org/dc/dimension#procedure
    ## http://www.example.org/dc/dimension#race
    ## http://www.example.org/dc/dimension#sex

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
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## http://www.example.org/dc/attribute#colno
    ## http://www.example.org/dc/attribute#denominator
    ## http://www.example.org/dc/attribute#cellpartno
    ## http://www.example.org/dc/attribute#measurefmt
    ## http://www.example.org/dc/attribute#unit
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
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs001
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 86.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs002
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs003
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs004
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs005
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs006
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs007
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 53.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs008
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 50.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs009
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 40.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs010
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 61.627906977
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs011
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 59.523809524
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs012
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 47.619047619
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs013
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 33.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs014
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 34.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs015
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 44.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs016
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 38.372093023
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs017
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 40.476190476
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs018
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## sex
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 52.380952381
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs019
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 4
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 8.5901671271
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs020
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 4
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 8.2860505995
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs021
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 4
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 7.8860938487
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs022
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 5
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 86.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs023
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 5
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs024
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 5
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs025
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 6
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 76.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs026
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 6
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 77.5
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs027
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 6
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 76.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs028
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 7
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 75.209302326
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs029
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 7
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 75.666666667
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs030
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 7
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 74.380952381
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs031
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 8
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 82.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs032
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 8
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 82.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs033
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 8
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 80.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs034
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 9
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 69.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs035
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 9
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 71.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs036
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 9
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 70.5
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs037
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 10
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 89.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs038
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 10
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 88.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs039
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 10
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 88.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs040
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 11
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 52.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs041
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 11
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 51.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs042
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 11
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 56.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs043
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 18
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 86.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs044
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 18
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs045
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 18
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs046
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 18
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs047
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 18
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs048
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 18
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs049
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 19
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 14.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs050
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 19
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 8.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs051
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 19
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 11.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs052
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 19
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 16.279069767
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs053
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 19
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 9.5238095238
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs054
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 19
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 13.095238095
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs055
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 20
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 42.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs056
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 20
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 47.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs057
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 20
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 55.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs058
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 20
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 48.837209302
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs059
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 20
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 55.952380952
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs060
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 20
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 65.476190476
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs061
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 21
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 30.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs062
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 21
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 29.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs063
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 21
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 18.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs064
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 21
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 34.88372093
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs065
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 21
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 34.523809524
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs066
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 21
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## agegr1
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 21.428571429
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs067
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 22
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 86.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs068
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 22
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs069
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 22
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs070
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 22
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs071
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 22
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs072
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 22
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs073
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 23
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 78.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs074
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 23
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 78.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs075
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 23
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 74.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs076
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 23
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 90.697674419
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs077
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 23
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 92.857142857
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs078
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 23
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 88.095238095
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs079
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 24
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 8.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs080
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 24
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 6.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs081
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 24
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 9.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs082
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 24
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 9.3023255814
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs083
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 24
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 7.1428571429
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs084
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 24
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 10.714285714
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs085
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 25
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 0.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs086
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 25
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 0.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs087
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 25
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs088
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 25
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 0.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs089
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 25
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 0.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs090
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 25
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## race
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1.1904761905
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs091
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 26
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 12.771543533
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs092
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 26
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 14.123598649
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs093
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 26
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 14.653433372
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs094
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 27
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 86.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs095
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 27
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 83.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs096
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 27
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs097
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 28
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 60.55
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs098
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 28
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 64.9
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs099
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 28
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 69.2
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs100
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 29
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 62.759302326
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs101
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 29
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 67.279518072
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs102
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 29
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 70.004761905
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs103
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 30
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 74.4
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs104
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 30
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 77.8
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs105
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 30
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 80.3
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs106
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 31
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 53.5
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs107
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 31
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 55.8
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs108
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 31
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 56.75
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs109
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 32
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 86.2
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs110
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 32
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 106.1
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs111
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 32
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 108.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs112
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 33
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 34.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs113
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 33
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 45.4
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs114
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 33
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 41.7
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs115
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 36
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 86.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs116
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 36
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs117
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 36
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 84.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs118
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 36
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs119
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 36
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs120
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 36
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 100.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs121
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 38
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 83.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs122
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 38
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 78.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs123
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 38
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 81.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs124
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 38
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 96.511627907
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs125
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 38
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 92.857142857
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs126
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 38
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 96.428571429
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs127
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 40
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 3.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs128
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 40
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 6.0
    ## NA
    ## None
    ## %6.0f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 1
    ## http://www.example.org/dc/demo/ds/obs129
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 40
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 3.0
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs130
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 40
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 1
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 3.488372093
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs131
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 40
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 2
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 7.1428571429
    ## NA
    ## None
    ## %6.1f
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 2
    ## http://www.example.org/dc/demo/ds/obs132
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## 40
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## ethnic
    ## 3
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## None
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## None
    ## http://www.example.org/dc/code/CODING ERROR- no decode value
    ## 3.5714285714
    ## NA
    ## None

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
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## http://www.example.org/dc/code/procedure-q1| q1| function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-min| min| function (x)  {     min(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-percent| percent| function (x)  {     -1 }
    ## http://www.example.org/dc/code/procedure-mean| mean| function (x)  {     mean(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-max| max| function (x)  {     max(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-n| n| function (x)  {     length(x[!is.na(x)]) }
    ## http://www.example.org/dc/code/procedure-median| median| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-std| std| function (x)  {     sd(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-q3| q3| function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-count| count| function (x)  {     length(x) }

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
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2000/01/rdf-schema#comment| Descriptive statistics median
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionoperator| ==
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#topConceptOf| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/R-selectionvalue| median
    ## http://www.example.org/dc/code/procedure-median| http://www.example.org/rrdfqbcrnd0/RdescStatDefFun| function (x)  {     median(x, na.rm = TRUE) }
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#prefLabel| median
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.example.org/dc/code/Procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/2004/02/skos/core#inScheme| http://www.example.org/dc/code/procedure
    ## http://www.example.org/dc/code/procedure-median| http://www.w3.org/1999/02/22-rdf-syntax-ns#type| http://www.w3.org/2004/02/skos/core#Concept

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
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
    ## WARNING:rdflib.term:http://www.example.org/dc/code/CODING ERROR- no decode value does not look like a valid URI, trying to serialize this will break.
