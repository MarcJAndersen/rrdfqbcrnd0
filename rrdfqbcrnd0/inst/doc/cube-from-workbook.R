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

## ----, echo=TRUE, results='asis'-----------------------------------------
dataCubeFile<- dm.cube.fn
# dataCubeFile<- ae.cube.fn

## ----, echo=TRUE---------------------------------------------------------
checkCube <- new.rdf(ontology=FALSE)  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= checkCube)
summarize.rdf(checkCube)

## ----, echo=TRUE---------------------------------------------------------
dsdName<- GetDsdNameFromCube( checkCube )
domainName<- GetDomainNameFromCube( checkCube )
forsparqlprefix<- GetForSparqlPrefix( domainName )

## ----, echo=TRUE---------------------------------------------------------
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

## ----, echo=TRUE---------------------------------------------------------
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

## ----, echo=TRUE---------------------------------------------------------
componentsRq<- GetComponentSparqlQuery( forsparqlprefix, dsdName )
components<- as.data.frame(sparql.rdf(checkCube, componentsRq), stringsAsFactors=FALSE)
components$vn<- gsub("prop:","",components$p)
knitr::kable(components[,c("vn", "label")])

## ----, echo=TRUE---------------------------------------------------------
codelistsRq<- GetCodeListSparqlQuery( forsparqlprefix, dsdName )
codelists<- as.data.frame(sparql.rdf(checkCube, codelistsRq), stringsAsFactors=FALSE)
codelists$vn<- gsub("prop:","",codelists$p)
codelists$clc<- gsub("code:","",codelists$cl)
knitr::kable(codelists[,c("vn", "clc", "prefLabel")])

## ----, echo=TRUE---------------------------------------------------------
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
dimensions<- sparql.rdf(checkCube, dimensionsRq)
knitr::kable(dimensions)

## ----, echo=TRUE---------------------------------------------------------
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
attributes<- sparql.rdf(checkCube, attributesRq)
knitr::kable(attributes)

## ----, echo=TRUE---------------------------------------------------------
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
cat(observationsRq)
observations<- as.data.frame(sparql.rdf(checkCube, observationsRq ), stringsAsFactors=FALSE)
knitr::kable(observations[ 1:10 ,
   c(paste0(sub("prop:", "", dimensions), "value"),sub("prop:", "", attributes), "measure")])


## ----, echo=TRUE---------------------------------------------------------
observationsDescriptionRq<- GetObservationsWithDescriptionSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
cat(observationsDescriptionRq)
observationsDesc<- as.data.frame(sparql.rdf(checkCube, observationsDescriptionRq ), stringsAsFactors=FALSE)
knitr::kable(observationsDesc[ 1:10 ,
   c(paste0(rep(sub("prop:", "", dimensions),each=3), c("label", "value", "IRI")),
     sub("prop:", "", attributes), "measure", "measureIRI" )]
)

## ----, echo=TRUE---------------------------------------------------------
rowdim<- c(dimensions[c(6,5,2,3,4),],attributes)
coldim<- dimensions[c(1),]

## XX should also return desciptive labels for the dimensions
rowdimRq<- GetDimsubsetWithObsSparqlQuery( forsparqlprefix, domainName, rowdim )
observationsRowDim<- as.data.frame(sparql.rdf(checkCube, rowdimRq ), stringsAsFactors=FALSE)

## XX getting the column names (variable) names for the row dimensions
## this could be a return parameter from a function like GetDimsubsetWithObsSparqlQuery
## to ensure that the naming convention was systematic

## XX need a function to determine variable (column names) from
## properties for each language (R, SAS etc)

colnamesRowDim<- sub("prop:", "", rowdim)
uqr<-data.frame(unique(observationsRowDim[,colnamesRowDim]), stringsAsFactors=FALSE)
colnames(uqr)<- colnamesRowDim
## XX assuming rowno is a unused column name
rownoseq<- 1:nrow(uqr)
uqr[,"rowno"]<- rownoseq
observationsRowDimE<-merge(observationsRowDim, uqr, by=colnamesRowDim, all=TRUE)
## XX assuming s is the name of the IRI
head(observationsRowDimE[,c("s","rowno")])

coldimRq<- GetDimsubsetWithObsSparqlQuery( forsparqlprefix, domainName, coldim )
observationsColDim<- as.data.frame(sparql.rdf(checkCube, coldimRq ), stringsAsFactors=FALSE)
colnamesColDim<- sub("prop:", "", coldim)
## using data.frame to handle the case where the result is a vector
uqc<-data.frame(unique(observationsColDim[,colnamesColDim]), stringsAsFactors=FALSE)
colnames(uqc)<- colnamesColDim
colnoseq<- 1:nrow(uqc)
uqc[,"colno"]<- colnoseq
head(uqc)
observationsColDimE<-merge(observationsColDim,uqc, by=colnamesColDim, all=TRUE)
head(observationsColDimE[,c("s","colno")])

prm<- regexec("^prefix +([^:]+): +<(.*)>$", strsplit(forsparqlprefix,"\n")[[1]])
ll<-regmatches(strsplit(forsparqlprefix,"\n")[[1]],prm)
res<-data.frame(matrix(unlist(ll),ncol=3,byrow=TRUE),stringsAsFactors=FALSE)

nIRIs<-  c(paste0(sub("prop:", "", dimensions), "IRI"),"measureIRI" )


observationsDesc[, nIRIs]<- apply(observationsDesc[, nIRIs],c(1,2),function(x) {gsub("^prop:", as.character(res[res[,2]=="prop",3]), x)})
observationsDesc[, nIRIs]<- apply(observationsDesc[, nIRIs],c(1,2),function(x) {gsub("^ds:", as.character(res[res[,2]=="ds",3]), x)})

names(observationsDesc)
head(observationsColDimE)
names(observationsColDimE)

any(duplicated(observationsRowDimE$s))
any(duplicated(observationsColDimE$s))

obsRowColNo<- merge( observationsRowDimE[,c("s","rowno")], observationsColDimE[,c("s","colno")], by="s", all=TRUE)
any(duplicated(obsRowColNo$s))
duplicated(obsRowColNo[,c("rowno","colno")])
any(duplicated(obsRowColNo[,c("rowno","colno")]))
obsRowColNo[ which(duplicated(obsRowColNo[,c("rowno","colno")])), ]
obsRowColNo

observationsDescX<- merge( observationsDesc, obsRowColNo, by="s", all=TRUE)

tableFrame<- data.frame(rowno=rep(rownoseq, each=length(colnoseq) ), colno=rep(colnoseq, times=length(colnoseq) ), stringsAsFactors=FALSE )

observationsDescXX<- merge( tableFrame, observationsDescX, by=c("rowno","colno"), sort=TRUE, all=TRUE)

## display observationsDescXX as a table showing row variables when rowno changes
## or alternatively when colno==1
## when rowno is 1 and colno is 1 then write the row and column headers



## ----, echo=TRUE---------------------------------------------------------
presTable<- uqr
for (colno in colnoseq) {
  presTable[,paste0("col", colno)]<- rep( NA, length(rownoseq))
}
for (colno in colnoseq) {
  for (rowno in rownoseq) {
presTable[rowno,paste0("col", colno)]<- observationsDescXX[observationsDescXX$rowno==rowno & observationsDescXX$colno==colno, "measure"]
}
}

knitr::kable(presTable)


## ----, echo=TRUE---------------------------------------------------------
workbookDimAttrMeasRq<- GetDimAttrMeasInWorkbookFormatSparqlQuery( forsparqlprefix ) 
dimensionsattr<- sparql.rdf(checkCube, workbookDimAttrMeasRq )
knitr::kable(dimensionsattr)

## ----, echo=TRUE---------------------------------------------------------
workbookMetadataRq<- GetMetaDataInWorkbookFormatSparqlQuery( forsparqlprefix )
metadata<- sparql.rdf(checkCube, workbookMetadataRq)
cubeVersion<- gsub("-",".", gsub("DC-.*-R-V-([^\\.]+).TTL", "\\1", metadata[ metadata[,2]=="distribution", "compLabel"], perl=TRUE))
metadataX<- rbind(metadata, cbind(compType="metadata", compName="cubeVersion", compLabel=cubeVersion))
knitr::kable(metadataX)

## ----, echo=TRUE---------------------------------------------------------
sessionInfo()

