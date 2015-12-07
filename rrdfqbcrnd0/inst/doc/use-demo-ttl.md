---
title: "Usage of cube DEMO"
author: "mja@statgroup.dk"
date: "2015-12-08"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Usage of cube DEMO}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Introduction

This is not a good example yet.
TODO(mja): fix it.

# Create DEMO sample table from CSV file

This script creates the result and codelist for a simple DEMO table.


```r
library(rrdfqbcrnd0)
```

```
## Loading required package: xlsx
## Loading required package: rJava
## Loading required package: methods
## Loading required package: xlsxjars
## Loading required package: RCurl
## Loading required package: bitops
## 
## Attaching package: 'RCurl'
## 
## The following object is masked from 'package:rJava':
## 
##     clone
## 
## Loading required package: rrdf
## Loading required package: rrdflibs
```

```r
dataCubeSpec<- system.file("extdata/CUBE-standards-rdf", "cube.ttl", package="rrdfqbcrnd0")

dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.ttl", package="rrdfqbcrnd0")

store <- new.rdf()  # Initialize

cat("Loading cube specfication from ", dataCubeSpec, "\n")
```

```
## Loading cube specfication from  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/CUBE-standards-rdf/cube.ttl
```

```r
tmp<- load.rdf(dataCubeSpec, format="TURTLE", appendTo= store)

cat("Loading cube from ", dataCubeFile, "\n")
```

```
## Loading cube from  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/sample-rdf/DC-DEMO-sample.ttl
```

```r
tmp<- load.rdf(dataCubeFile, format="TURTLE", appendTo= store)

summarize.rdf(store)
```

```
## [1] "Number of triples: 3368"
```

## Execute the DEMO* SPARQL queries


```r
rqFiles<- system.file("extdata/sample-rdf", list.files(system.file("extdata/sample-rdf",  package="rrdfqbcrnd0"), pattern="DEMO.+rq$"),  package="rrdfqbcrnd0")

for (rqFile in rqFiles) {
    cat("File ", rqFile, "\n")
    rq<- paste0(readLines(rqFile),collapse="\n")
    res<- data.frame(sparql.rdf(store, rq),stringsAsFactors=FALSE)
    print(nrow(res))
    if (nrow(res)>0) {
        print(knitr::kable(res))
        }
}
```

```
## File  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqbcrnd0/extdata/sample-rdf/DEMOattributes.rq
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : com.hp.hpl.jena.query.QueryParseException: Encountered "<EOF>" at line 1, column 0.
## Was expecting one of:
##     "base" ...
##     "prefix" ...
##     "select" ...
##     "describe" ...
##     "construct" ...
##     "ask" ...
## 
```

## This works do not change


```r
dsdName<- GetDsdNameFromCube( store )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDsdNameFromCube"
```

```r
domainName<- GetDomainNameFromCube( store )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetDomainNameFromCube"
```

```r
cat("dsdName ", dsdName, ", domainName ", domainName, "\n" )
```

```
## Error in cat("dsdName ", dsdName, ", domainName ", domainName, "\n"): object 'dsdName' not found
```

```r
forsparqlprefix<- GetForSparqlPrefix( domainName )
```

```
## Error in eval(expr, envir, enclos): could not find function "GetForSparqlPrefix"
```

```r
cat(forsparqlprefix,"\n")
```

```
## Error in cat(forsparqlprefix, "\n"): object 'forsparqlprefix' not found
```

```r
rq<-  paste( forsparqlprefix,
'
select *
where { 
?s a qb:Observation ; 
?p ?o ;
.
[] qb:dimension ?p .
values (?s) {
(ds:obs114)
}
}
# limit 30
',
"\n"                               
)
```

```
## Error in paste(forsparqlprefix, "\nselect *\nwhere { \n?s a qb:Observation ; \n?p ?o ;\n.\n[] qb:dimension ?p .\nvalues (?s) {\n(ds:obs114)\n}\n}\n# limit 30\n", : object 'forsparqlprefix' not found
```

```r
cube.observations<- sparql.rdf(store, rq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : com.hp.hpl.jena.query.QueryParseException: Encountered "<EOF>" at line 1, column 0.
## Was expecting one of:
##     "base" ...
##     "prefix" ...
##     "select" ...
##     "describe" ...
##     "construct" ...
##     "ask" ...
## 
```

```r
knitr::kable(cube.observations)
```

```
## Error in is.data.frame(x): object 'cube.observations' not found
```

## Getting triples with information of object if literal



```r
cons.rq<-  paste( forsparqlprefix,
'
construct { ?s ?p ?o }
where { 
?s ?p ?o .
BIND( datatype(?o) as ?datatype )
BIND( isLiteral(?o) as ?isLiteral )
BIND( lang(?o) as ?lang )
values (?s) {
(ds:obs114)
}
}
',
"\n"                               
)
```

```
## Error in paste(forsparqlprefix, "\nconstruct { ?s ?p ?o }\nwhere { \n?s ?p ?o .\nBIND( datatype(?o) as ?datatype )\nBIND( isLiteral(?o) as ?isLiteral )\nBIND( lang(?o) as ?lang )\nvalues (?s) {\n(ds:obs114)\n}\n}\n", : object 'forsparqlprefix' not found
```

```r
save.rdf(construct.rdf( store, cons.rq) , file.path(tempdir(), "rapperin.ttl"), "TURTLE")
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/hp/hpl/jena/rdf/model/Model;", : object 'cons.rq' not found
```

To see dot code generated by rapper:
```
rapper -i turtle -o dot /tmp/Rtmpcccgdg/rapperin.ttl
```

To display the dot code
```
rapper -i turtle -o dot /tmp/Rtmpcccgdg/rapperin.ttl | dot -x -Tpdf -ograph.pdf
```

See also (http://www.bioconductor.org/packages/release/bioc/vignettes/Rgraphviz/inst/doc/Rgraphviz.pdf) for Rgraphviz package - may be used to display graphs.



```r
rq<-  paste( forsparqlprefix,
'
select *
where { 
?s ?p ?o .
BIND( datatype(?o) as ?datatype )
BIND( isLiteral(?o) as ?isLiteral )
BIND( lang(?o) as ?lang )
values (?s) {
(ds:obs114)
}
}
',
"\n"                               
)
```

```
## Error in paste(forsparqlprefix, "\nselect *\nwhere { \n?s ?p ?o .\nBIND( datatype(?o) as ?datatype )\nBIND( isLiteral(?o) as ?isLiteral )\nBIND( lang(?o) as ?lang )\nvalues (?s) {\n(ds:obs114)\n}\n}\n", : object 'forsparqlprefix' not found
```

```r
res<- sparql.rdf(store, rq)
```

```
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "Lcom/github/egonw/rrdf/StringMatrix;", : com.hp.hpl.jena.query.QueryParseException: Encountered "<EOF>" at line 1, column 0.
## Was expecting one of:
##     "base" ...
##     "prefix" ...
##     "select" ...
##     "describe" ...
##     "construct" ...
##     "ask" ...
## 
```

```r
knitr::kable(res)
```

```
## Error in is.data.frame(x): object 'res' not found
```

```r
dimnames(res)
```

```
## Error in eval(expr, envir, enclos): object 'res' not found
```

```r
allIRI<- c( res[,1],res[,2])
```

```
## Error in eval(expr, envir, enclos): object 'res' not found
```

```r
uallIRI<- unique(allIRI)
```

```
## Error in unique(allIRI): error in evaluating the argument 'x' in selecting a method for function 'unique': Error: object 'allIRI' not found
```

```r
L<- list()
for (i in 1:length(uallIRI) ) {
L[[ uallIRI[i] ]] <- paste( "L", i, sep="" )
}
```

```
## Error in eval(expr, envir, enclos): object 'uallIRI' not found
```

```r
paste( L[[ res[,1] ]], L[[ res[,2] ]], res[,3] )
```

```
## Error in paste(L[[res[, 1]]], L[[res[, 2]]], res[, 3]): object 'res' not found
```

### Check the statistics


```r
stmtSQL<- GetSQLFromCube(store) 
```

```
## Error in eval(expr, envir, enclos): could not find function "GetSQLFromCube"
```

```r
cat(stmtSQL$summStatSQL) 
```

```
## Error in cat(stmtSQL$summStatSQL): object 'stmtSQL' not found
```
