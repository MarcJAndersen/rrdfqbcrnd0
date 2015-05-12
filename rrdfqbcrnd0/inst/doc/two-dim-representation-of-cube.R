## ----, eval=TRUE---------------------------------------------------------
library(rrdfqbcrnd0)

## ----, echo=TRUE---------------------------------------------------------
MakeTable<- function( dataCubeFile, htmlfile, rowdim, coldim, idrow, idcol ) {

store <- new.rdf()  # Initialize
cat("Loading ", dataCubeFile, "\n")
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)

dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
forsparqlprefix<- GetForSparqlPrefix( domainName )

dimensions<- sparql.rdf(store, GetDimensionsSparqlQuery( forsparqlprefix ) )
attributesDf<- sparql.rdf(store, GetAttributesSparqlQuery( forsparqlprefix ))

outhtmlfile<- MakeHTMLfromQb( store, forsparqlprefix, dsdName, domainName, dimensions, rowdim, coldim, idrow, idcol, htmlfile )

outhtmlfile
}


## ----, echo=TRUE---------------------------------------------------------
dataCubeFile<- system.file("extdata/sample-rdf", "DC-AE-sample.ttl", package="rrdfqbcrnd0")
htmlfile<- file.path(system.file("extdata/sample-cfg", package="rrdfqbcrnd0"), "DC-AE-sample.html")
rowdim<- c("crnd-attribute:rowno", "crnd-dimension:aesoc", "crnd-dimension:aedecod" )
coldim<- c("crnd-attribute:colno", "crnd-attribute:cellpartno", "crnd-dimension:trta" )
# idrow is a function of rowdim; writing it directly is easier for now
idrow<-  c( "aesocvalue", "aedecodvalue" )
idcol<-  c( "crnd-dimension:trta" )
resHtmlFile<- MakeTable( dataCubeFile, htmlfile, rowdim, coldim, idrow, idcol )


## ----, echo=TRUE---------------------------------------------------------
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.ttl", package="rrdfqbcrnd0")
htmlfile<- file.path(system.file("extdata/sample-cfg", package="rrdfqbcrnd0"), "DC-DEMO-sample.html")

coldim<- c("crnd-attribute:colno", "crnd-attribute:cellpartno", "crnd-dimension:trt01a" )
rowdim<- c("crnd-attribute:rowno", "crnd-dimension:agegr1", "crnd-dimension:race", "crnd-dimension:ethnic", "crnd-dimension:sex" )
idrow<-  c( "agegr1value", "racevalue", "ethnicvalue", "sexvalue" )
idcol<-  c( "crnd-dimension:trt01a" )

## Does not work
## # rowdim<- c("crnd-attribute:rowno", "crnd-dimension:agegr1", "crnd-dimension:race", "crnd-dimension:ethnic", "crnd-dimension:sex", "crnd-dimension:procedure" )
## # idrow<-  c( "agegr1value", "racevalue", "ethnicvalue", "sexvalue", "procedurevalue" )
resHtmlFile<- MakeTable( dataCubeFile, htmlfile, rowdim, coldim, idrow, idcol )


## ----, eval=TRUE---------------------------------------------------------
cube.observations.rq<-  paste( forsparqlprefix,
'
select *
where { 
?s a qb:Observation ; 
?p ?o .
values (?s) {
(ds:obs029)
}
}
',
"\n"                               
)

cube.observations<- sparql.rdf(store, cube.observations.rq)
knitr::kable(cube.observations)


## ----, eval=TRUE---------------------------------------------------------
cube.measurefmt.rq<-  paste( forsparqlprefix,
'
select distinct ?procedure ?measurefmt
where { 
?s a qb:Observation ; 
crnd-dimension:procedure ?procedure ;
crnd-attribute:measurefmt ?measurefmt .
}
',
"\n"                               
)

cube.measurefmt<- sparql.rdf(store, cube.measurefmt.rq)
knitr::kable(cube.measurefmt)


## ----, echo=TRUE---------------------------------------------------------
cols.rq<- GetRownoColnoCellpartnoSparqlQuery( forsparqlprefix )
cols<- data.frame(sparql.rdf(store, cols.rq))
knitr::kable(cols)


## ----, echo=TRUE---------------------------------------------------------
sessionInfo()

