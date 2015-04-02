---
title: "SPARQL scripts for RDF data cubes"
author: "PhuseSubTeamAnalysisResults@example.org"
date: "2015-04-02"
output: 
  html_document
  pdf_document
vignette: >
  %\VignetteIndexEntry{SPARQL scripts for RDF data cubes}
  %\VignetteEngine{knitr::knitr}
  %\usepackage[utf8]{inputenc}
  %\SweaveUTF8
---

# Setup

First load the package.

```r
library(rrdfqbcrnd0)
```

The display of SPARQL script in markdown is done by first creating a chunk, and then using the chunk with the highlight engine in knitr. The advantage of this approach is that all formatting is handled by external packages. To make the highlight output work in markdown two blanks has to be added at the end of line according to markdown syntax.

```r
mdwrite<- function( sparqlStatements, refname ) {
fn<- file.path(tempdir(), paste0( refname, ".txt" ) )
cat( paste0("## @knitr ", refname), gsub("\\n", "  \n", sparql.rq), sep="  \n", file=fn)
knitr::read_chunk( fn, from=c(1))
invisible(fn)
}
```



# SPARQL scripts

The rrdfqbcrnd0 package uses SPARQL scripts to access the RRDF triple store.  This
is implemented by having a function generating the SPARQL script.
This vignettes shows the contents of the scripts. Some of the scripts
are parametrised by one or more paramteres. The parameter are shown
with as $p, $q etc, following the same convention as in the (http://www.w3.org/TR/vocab-data-cube/#ic-20)[RDF Data Cube Vocabulary]-

## SPARQL query for attributes in RDF data cube


```r
forsparqlprefix<- GetForSparqlPrefix( "$myQbName" )
sparql.rq<- GetAttributesSparqlQuery( forsparqlprefix )
mdwrite( sparql.rq, "sp1" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2004/02/skos/core#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/prov#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2000/01/rdf-schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/dcat#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2002/07/owl#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2001/XMLSchema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/linked-data/cube#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/pav&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/dc/terms/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/mms#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/ct/schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/rrdfqbcrnd0/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/code/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prop</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/$myqbname/prop/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/$myqbname/dccs/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/$myqbname/ds/&gt;</span>  
   
<span style="color:#010181">select</span> <span style="color:#000000">*</span> <span style="color:#010181">where</span>  
<span style="color:#000000">{</span> ?p <span style="color:#010181">a</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">AttributeProperty</span> <span style="color:#000000">.  }</span>  

## SPARQL query for observations from RDF data cube in workbook format


```r
forsparqlprefix<- GetForSparqlPrefix( "$myQbName" )
sparql.rq<- GetObservationsSparqlQuery( forsparqlprefix, "$myQbName", c("$dimA", "$dimB", "$dimC"), c("$attr1"))
mdwrite( sparql.rq, "sp2" )
```

<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdf</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2004/02/skos/core#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prov</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/prov#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rdfs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2000/01/rdf-schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dcat</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/ns/dcat#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">owl</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2002/07/owl#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">xsd</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.w3.org/2001/XMLSchema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/linked-data/cube#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">pav</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/pav&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dct</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://purl.org/dc/terms/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">mms</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/mms#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">cts</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://rdf.cdisc.org/ct/schema#&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">rrdfqbcrnd0</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/rrdfqbcrnd0/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">code</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/code/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">prop</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/$myqbname/prop/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">dccs</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/$myqbname/dccs/&gt;</span>  
<span style="color:#010181">prefix</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span> <span style="color:#000000; font-weight:bold">&lt;http://www.example.org/dc/$myqbname/ds/&gt;</span>  
 <span style="color:#010181">select</span> <span style="color:#000000">*</span> <span style="color:#010181">where</span> <span style="color:#000000">{</span> ?s <span style="color:#010181">a</span> <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">Observation</span>  <span style="color:#000000">;</span>   
        <span style="color:#0057ae">qb</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dataSet</span> <span style="color:#0057ae">ds</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">dataset</span><span style="color:#000000">-</span>$<span style="color:#010181">myQbName</span>  <span style="color:#000000">;</span>   
 $<span style="color:#010181">dimA</span> $<span style="color:#010181">dimA</span><span style="color:#000000">;</span>  
$<span style="color:#010181">dimB</span> $<span style="color:#010181">dimB</span><span style="color:#000000">;</span>  
$<span style="color:#010181">dimC</span> $<span style="color:#010181">dimC</span><span style="color:#000000">;</span> $<span style="color:#010181">attr1</span> $<span style="color:#010181">attr1</span><span style="color:#000000">;</span> <span style="color:#0057ae">prop</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">measure</span>      ?measure <span style="color:#000000">;</span>        
 <span style="color:#010181">optional</span><span style="color:#000000">{</span> $<span style="color:#010181">dimA</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> $<span style="color:#010181">dimAvalue</span> <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> $<span style="color:#010181">dimB</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> $<span style="color:#010181">dimBvalue</span> <span style="color:#000000">. }</span>  
<span style="color:#010181">optional</span><span style="color:#000000">{</span> $<span style="color:#010181">dimC</span> <span style="color:#0057ae">skos</span><span style="color:#000000">:</span><span style="color:#000000; font-weight:bold">prefLabel</span> $<span style="color:#010181">dimCvalue</span> <span style="color:#000000">. }</span>   
 <span style="color:#000000">}</span>    

# Generating this output
TODO(mja): enter the commands here as example in each of the .Rd files.
Then the output here can be generated from the .Rd files.


