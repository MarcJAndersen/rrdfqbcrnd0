## ----, eval=TRUE---------------------------------------------------------
library(rrdfqbcrnd0)

## ----, eval=TRUE---------------------------------------------------------
RDFCubeWorkbook<- system.file("extdata/sample-cfg", "RDFCubeWorkbook.xlsx", package="rrdfqbcrnd0")
cubeMetadata <- read.xlsx(RDFCubeWorkbook,
                          sheetName=paste0("DM-Components"),
                          stringsAsFactors=FALSE)

## ----, eval=TRUE---------------------------------------------------------

knitr::kable(
  cubeMetadata[ cubeMetadata$compType %in% c("dimension", "attribute", "measure"),
               c("codeType", "compName","nciDomainValue", "compLabel")]
  )
knitr::kable(cubeMetadata[ cubeMetadata$compType=="metadata",c("compName","compLabel")])

## ----, eval=TRUE---------------------------------------------------------
dm.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "DM" )
cat("DM cube stored as ", dm.cube.fn, "\n")

ae.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "AE" )
cat("AE cube stored as ", ae.cube.fn, "\n")

## ----, echo=FALSE, results='asis'----------------------------------------
dataCubeFile<- dm.cube.fn
# dataCubeFile<- ae.cube.fn

## ----, echo=FALSE--------------------------------------------------------
checkCube <- new.rdf(ontology=FALSE)  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= checkCube)
summarize.rdf(checkCube)

## ----, echo=FALSE--------------------------------------------------------
dsdName<- GetDsdNameFromCube( checkCube )
domainName<- GetDomainNameFromCube( checkCube )
forsparqlprefix<- GetForSparqlPrefix( domainName )

## ----, echo=FALSE--------------------------------------------------------
observations1Rq<- paste( forsparqlprefix,
'
select *
where {?s ?p ?o .}
limit 10
',
"\n"
)
observations1<- sparql.rdf(checkCube, observations1Rq  )
knitr::kable(head(observations1))

## ----, echo=FALSE--------------------------------------------------------
observations2Rq<-  paste( forsparqlprefix,
'
select *
where { ?s a qb:Observation ; ?p ?o .}
limit 10
',
"\n"                               
)
observations2<- sparql.rdf(checkCube, observations2Rq)
knitr::kable(head(observations2, 10))

## ----, echo=FALSE--------------------------------------------------------
componentsRq<- GetComponentSparqlQuery( forsparqlprefix, dsdName )
components<- as.data.frame(sparql.rdf(checkCube, componentsRq), stringsAsFactors=FALSE)
components$vn<- gsub("prop:","",components$p)
knitr::kable(components[,c("vn", "label")])

## ----, echo=FALSE--------------------------------------------------------
codelistsRq<- GetCodeListSparqlQuery( forsparqlprefix, dsdName )
codelists<- as.data.frame(sparql.rdf(checkCube, codelistsRq), stringsAsFactors=FALSE)
codelists$vn<- gsub("prop:","",codelists$p)
codelists$clc<- gsub("code:","",codelists$cl)
knitr::kable(codelists[,c("vn", "clc", "prefLabel")])

## ----, echo=FALSE--------------------------------------------------------
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
dimensions<- sparql.rdf(checkCube, dimensionsRq)
knitr::kable(dimensions)

## ----, echo=FALSE--------------------------------------------------------
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
attributes<- sparql.rdf(checkCube, attributesRq)
knitr::kable(attributes)

## ----, echo=FALSE--------------------------------------------------------
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
cat(observationsRq)
observations<- as.data.frame(sparql.rdf(checkCube, observationsRq ), stringsAsFactors=FALSE)
knitr::kable(observations[ 1:10 ,
   c(paste0(sub("prop:", "", dimensions), "value"),sub("prop:", "", attributes), "measure")])


## ----, echo=FALSE--------------------------------------------------------
workbookDimAttrMeasRq<- GetDimAttrMeasInWorkbookFormatSparqlQuery( forsparqlprefix ) 
dimensionsattr<- sparql.rdf(checkCube, workbookDimAttrMeasRq )
knitr::kable(dimensionsattr)

## ----, echo=FALSE--------------------------------------------------------
workbookMetadataRq<- GetMetaDataInWorkbookFormatSparqlQuery( forsparqlprefix )
metadata<- sparql.rdf(checkCube, workbookMetadataRq)
cubeVersion<- gsub("-",".", gsub("DC-.*-R-V-([^\\.]+).TTL", "\\1", metadata[ metadata[,2]=="distribution", "compLabel"], perl=TRUE))
metadataX<- rbind(metadata, cbind(compType="metadata", compName="cubeVersion", compLabel=cubeVersion))
knitr::kable(metadataX)

