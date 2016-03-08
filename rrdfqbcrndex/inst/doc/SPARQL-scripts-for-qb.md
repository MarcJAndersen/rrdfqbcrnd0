SPARQL scripts for the demographics cube (DC-DEMO-sample.ttl)
=============================================================

Setup
-----

First load the package.

``` r
library(knitr)
library(rrdfancillary)
devtools::load_all(pkg="../..")
```

    ## Loading rrdfqbcrndex

Internals
---------

The display of SPARQL script in markdown is done by first creating a chunk, and then using the chunk with the highlight engine in knitr. The advantage of this approach is that all formatting is handled by external packages. To make the highlight output work in markdown two blanks has to be added at the end of line according to markdown syntax.

``` r
mdwrite<- function( sparqlStatements, refname ) {
# fn<- file.path(tempdir(), paste0( refname, ".rq" ) )
fn<- file.path(system.file("extdata/sample-rdf", package="rrdfqbcrndex"), paste0( refname, ".rq" ) )
cat( paste0("## @knitr ", refname), gsub("\\n", "  \n", sparqlStatements), sep="  \n", file=fn)
knitr::read_chunk( fn, from=c(1))
invisible(fn)
}
```

SPARQL scripts
--------------

SPARQL scripts can be used to access the RDF triple store. In the package the scripts are made by a function generating the SPARQL script. The generated SPARQL scripts are shown here for the demographics cube in DC-DEMO-sample.ttl.

The turtle file and the scrips are stored in

``` r
system.file("extdata/sample-xpt", package="rrdfqbcrndex")
```

    ## [1] "/home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-xpt"

Setup for generating SPARQL scripts for the demographics cube (DC-DEMO-sample.TTL)
----------------------------------------------------------------------------------

The DEMO data exists as a turtle file in the sample-rdf directory.

``` r
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.ttl", package="rrdfqbcrndex")
store <- new.rdf()  # Initialize
cat("Loading ", dataCubeFile, "\n")
```

    ## Loading  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DC-DEMO-sample.ttl

``` r
temp<-load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)
```

    ## [1] "Number of triples: 3081"

For the functions in the package the datasets definition in the cube is needed.

``` r
dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

SPARQL query for dimensions in RDF data cube
--------------------------------------------

The SPARQL query for the dimensions is made by the function GetDimensionsSparqlQuery.

``` r
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
mdwrite( dimensionsRq, "DEMOdimensions" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/1999/02/22-rdf-syntax-ns>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2004/02/skos/core>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/ns/prov>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2000/01/rdf-schema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/ns/dcat>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2002/07/owl>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2001/XMLSchema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/pav\>](http://purl.org/pav>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dc</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/dc/elements/1.1/\>](http://purl.org/dc/elements/1.1/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/dc/terms/\>](http://purl.org/dc/terms/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/mms>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/ct/schema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cdiscs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/schema>\#\></span>
<span style="color:#010181">prefix cdash</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">1</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/cdash-1-1>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cdashct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/cdash-terminology>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">sdtmct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/sdtm-terminology>\#\></span>
<span style="color:#010181">prefix sdtm</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtm-1-2>\#\></span>
<span style="color:#010181">prefix sdtm</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtm-1-3>\#\></span>
<span style="color:#010181">prefix sdtms</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/sdtm-1-3/schema>\#\></span>
<span style="color:#010181">prefix sdtmig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtmig-3-1-2>\#\></span>
<span style="color:#010181">prefix sdtmig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtmig-3-1-3>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">sendct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/send-terminology>\#\></span>
<span style="color:#010181">prefix sendig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#0057ae">0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sendig-3-0>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">adamct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/adam-terminology>\#\></span>
<span style="color:#010181">prefix adam</span><span style="color:#000000">-</span><span style="color:#010181">2</span><span style="color:#000000">-</span><span style="color:#0057ae">1</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adam-2-1>\#\></span>
<span style="color:#010181">prefix adamig</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adamig-1-0>\#\></span>
<span style="color:#010181">prefix adamvr</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adamvr-1-2>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://purl.org/linked-data/cube>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/rrdfqbcrnd0/\>](http://www.example.org/rrdfqbcrnd0/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/code/\>](http://www.example.org/dc/code/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/demo/dccs/\>](http://www.example.org/dc/demo/dccs/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/demo/ds/\>](http://www.example.org/dc/demo/ds/>)</span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/dimension>\#\></span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/attribute>\#\></span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/measure>\#\></span>

<span style="color:#010181">select</span> <span style="color:#000000">\*</span> <span style="color:#010181">where</span>
<span style="color:#000000">{ []</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dimension</span> ?p <span style="color:#000000">. }</span>

Executing the SPARQL query gives:

``` r
dimensions<- sparql.rdf(store, dimensionsRq)
knitr::kable(dimensions,col.names=c("dimension"),caption="Dimensions")
```

| dimension                |
|:-------------------------|
| crnd-dimension:ethnic    |
| crnd-dimension:race      |
| crnd-dimension:procedure |
| crnd-dimension:agegr1    |
| crnd-dimension:factor    |
| crnd-dimension:trt01a    |
| crnd-dimension:sex       |

SPARQL query for attributes in RDF data cube
--------------------------------------------

The SPARQL query for the attributes is made by the function GetAttributesSparqlQuery.

``` r
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
mdwrite( attributesRq, "DEMOattributes" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/1999/02/22-rdf-syntax-ns>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2004/02/skos/core>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/ns/prov>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2000/01/rdf-schema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/ns/dcat>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2002/07/owl>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2001/XMLSchema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/pav\>](http://purl.org/pav>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dc</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/dc/elements/1.1/\>](http://purl.org/dc/elements/1.1/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/dc/terms/\>](http://purl.org/dc/terms/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/mms>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/ct/schema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cdiscs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/schema>\#\></span>
<span style="color:#010181">prefix cdash</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">1</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/cdash-1-1>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cdashct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/cdash-terminology>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">sdtmct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/sdtm-terminology>\#\></span>
<span style="color:#010181">prefix sdtm</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtm-1-2>\#\></span>
<span style="color:#010181">prefix sdtm</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtm-1-3>\#\></span>
<span style="color:#010181">prefix sdtms</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/sdtm-1-3/schema>\#\></span>
<span style="color:#010181">prefix sdtmig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtmig-3-1-2>\#\></span>
<span style="color:#010181">prefix sdtmig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtmig-3-1-3>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">sendct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/send-terminology>\#\></span>
<span style="color:#010181">prefix sendig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#0057ae">0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sendig-3-0>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">adamct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/adam-terminology>\#\></span>
<span style="color:#010181">prefix adam</span><span style="color:#000000">-</span><span style="color:#010181">2</span><span style="color:#000000">-</span><span style="color:#0057ae">1</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adam-2-1>\#\></span>
<span style="color:#010181">prefix adamig</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adamig-1-0>\#\></span>
<span style="color:#010181">prefix adamvr</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adamvr-1-2>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://purl.org/linked-data/cube>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/rrdfqbcrnd0/\>](http://www.example.org/rrdfqbcrnd0/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/code/\>](http://www.example.org/dc/code/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/demo/dccs/\>](http://www.example.org/dc/demo/dccs/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/demo/ds/\>](http://www.example.org/dc/demo/ds/>)</span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/dimension>\#\></span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/attribute>\#\></span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/measure>\#\></span>

<span style="color:#010181">select</span> <span style="color:#000000">\*</span> <span style="color:#010181">where</span>
<span style="color:#000000">{</span> ?p <span style="color:#010181">a</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">AttributeProperty</span> <span style="color:#000000">. }</span>

Executing the SPARQL query gives:

``` r
attributes<- sparql.rdf(store, attributesRq)
knitr::kable(attributes,col.names=c("attribute"),caption="Attributes")
```

| attribute                  |
|:---------------------------|
| crnd-attribute:cellpartno  |
| crnd-attribute:measurefmt  |
| crnd-attribute:colno       |
| crnd-attribute:denominator |
| crnd-attribute:unit        |
| crnd-attribute:rowno       |

SPARQL query for observations from RDF data cube in workbook format
-------------------------------------------------------------------

The SPARQL query for the attributes is made by the function GetAttributesSparqlQuery, where the domainName, dimensions and attributes for the cube is passed as parameters.

``` r
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
mdwrite( observationsRq, "DEMOobservations" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/1999/02/22-rdf-syntax-ns>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2004/02/skos/core>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/ns/prov>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2000/01/rdf-schema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/ns/dcat>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2002/07/owl>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.w3.org/2001/XMLSchema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/pav\>](http://purl.org/pav>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dc</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/dc/elements/1.1/\>](http://purl.org/dc/elements/1.1/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://purl.org/dc/terms/\>](http://purl.org/dc/terms/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/mms>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/ct/schema>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cdiscs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/schema>\#\></span>
<span style="color:#010181">prefix cdash</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">1</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/cdash-1-1>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cdashct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/cdash-terminology>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">sdtmct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/sdtm-terminology>\#\></span>
<span style="color:#010181">prefix sdtm</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtm-1-2>\#\></span>
<span style="color:#010181">prefix sdtm</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtm-1-3>\#\></span>
<span style="color:#010181">prefix sdtms</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/sdtm-1-3/schema>\#\></span>
<span style="color:#010181">prefix sdtmig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtmig-3-1-2>\#\></span>
<span style="color:#010181">prefix sdtmig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">3</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sdtmig-3-1-3>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">sendct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/send-terminology>\#\></span>
<span style="color:#010181">prefix sendig</span><span style="color:#000000">-</span><span style="color:#010181">3</span><span style="color:#000000">-</span><span style="color:#0057ae">0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/sendig-3-0>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">adamct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/adam-terminology>\#\></span>
<span style="color:#010181">prefix adam</span><span style="color:#000000">-</span><span style="color:#010181">2</span><span style="color:#000000">-</span><span style="color:#0057ae">1</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adam-2-1>\#\></span>
<span style="color:#010181">prefix adamig</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adamig-1-0>\#\></span>
<span style="color:#010181">prefix adamvr</span><span style="color:#000000">-</span><span style="color:#010181">1</span><span style="color:#000000">-</span><span style="color:#0057ae">2</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://rdf.cdisc.org/std/adamvr-1-2>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://purl.org/linked-data/cube>\#\></span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/rrdfqbcrnd0/\>](http://www.example.org/rrdfqbcrnd0/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/code/\>](http://www.example.org/dc/code/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/demo/dccs/\>](http://www.example.org/dc/demo/dccs/>)</span>
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<[http://www.example.org/dc/demo/ds/\>](http://www.example.org/dc/demo/ds/>)</span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/dimension>\#\></span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/attribute>\#\></span>
<span style="color:#010181">prefix crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">\<<http://www.example.org/dc/measure>\#\></span>

<span style="color:#010181">select</span> <span style="color:#000000">\*</span> <span style="color:#010181">where</span> <span style="color:#000000">{</span>
?s <span style="color:#010181">a</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">Observation</span> <span style="color:#000000">;</span>
 <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dataSet</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dataset</span><span style="color:#000000">-</span><span style="color:#010181">DEMO</span> <span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">ethnic</span> ?ethnic<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">race</span> ?race<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">procedure</span> ?procedure<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">agegr1</span> ?agegr1<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">factor</span> ?factor<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">trt01a</span> ?trt01a<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">dimension</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">sex</span> ?sex<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">cellpartno</span> ?cellpartno<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">measurefmt</span> ?measurefmt<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">colno</span> ?colno<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">denominator</span> ?denominator<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">unit</span> ?unit<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">attribute</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">rowno</span> ?rowno<span style="color:#000000">;</span>
 <span style="color:#010181">crnd</span><span style="color:#000000">-</span><span style="color:#0057ae">measure</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">measure</span> ?measure <span style="color:#000000">.</span>
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?ethnic <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?ethnicvalue <span style="color:#000000">. }</span>
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?race <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?racevalue <span style="color:#000000">. }</span>
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?procedure <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?procedurevalue <span style="color:#000000">. }</span>
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?agegr1 <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?agegr1value <span style="color:#000000">. }</span>
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?factor <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?factorvalue <span style="color:#000000">. }</span>
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?trt01a <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?trt01avalue <span style="color:#000000">. }</span>
<span style="color:#010181">optional</span><span style="color:#000000">{</span> ?sex <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> ?sexvalue <span style="color:#000000">. }</span>
<span style="color:#000000">}</span>
<span style="color:#010181">order by</span> ?s

The first 2 rows of result of the query is:

``` r
observations<- data.frame(sparql.rdf(store, observationsRq),stringsAsFactors=FALSE)
knitr::kable(head(observations,2),caption="Observations (only 2)")
```

| s         | ethnic            | race            | procedure            | agegr1            | factor               | trt01a                            | sex                | cellpartno | measurefmt | colno | denominator | unit | rowno | measure | ethnicvalue | racevalue | procedurevalue | agegr1value | factorvalue | trt01avalue         | sexvalue  |
|:----------|:------------------|:----------------|:---------------------|:------------------|:---------------------|:----------------------------------|:-------------------|:-----------|:-----------|:------|:------------|:-----|:------|:--------|:------------|:----------|:---------------|:------------|:------------|:--------------------|:----------|
| ds:obs001 | code:ethnic-*ALL* | code:race-*ALL* | code:procedure-count | code:agegr1-*ALL* | code:factor-quantity | code:trt01a-Placebo               | code:sex-*NONMISS* | 1          | %6.0f      | 1     |             | NA   | 1     | 86      | *ALL*       | *ALL*     | count          | *ALL*       | quantity    | Placebo             | *NONMISS* |
| ds:obs002 | code:ethnic-*ALL* | code:race-*ALL* | code:procedure-count | code:agegr1-*ALL* | code:factor-quantity | code:trt01a-Xanomeline\_Low\_Dose | code:sex-*NONMISS* | 1          | %6.0f      | 2     |             | NA   | 1     | 84      | *ALL*       | *ALL*     | count          | *ALL*       | quantity    | Xanomeline Low Dose | *NONMISS* |

TODO(mja): SPARQL scripts parametrised
======================================

This vignettes shows the contents of the scripts. Some of the scripts are parametrised by one or more parameters. The parameter are shown with as $p, $q etc, following the same convention as in the (<http://www.w3.org/TR/vocab-data-cube/#ic-20>)[RDF Data Cube Vocabulary]. This does not really work here, as some of the parameters in the R functions are intended for vectors with more than one parameter.

TODO(mja): Generating this output using the information in the documentation
============================================================================

TODO(mja): enter the commands here as example in each of the .Rd files. Then the output here can be generated from the .Rd files.
