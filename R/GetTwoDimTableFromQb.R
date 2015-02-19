##' Get two dimensional table as data.frame from RDF data cube
##'
##' @inheritParams GetDsdNameFromCube
##' @param rowdim vector of dimension and attribute names for row identification
##' @param coldim vector of dimension and attribute names for column identification
##' @param rowlabeldim vector of dimension names to define the row label data.frame
##' @param collabeldim vector of dimension names to define the column label data.frame
# XX ##' @param rownamefunc function for derivin
# XX ##' @param colnamefunc function for columnnames
##' @return data.frame with result of query, the observations, with
##' attributes for rowLabelDf, colLabelDF, rowlabelURI, collabelURI,
##' obsURI
##'
##'


GetTwoDimTableFromQb<- function( store, forsparqlprefix, domainName, rowdim, coldim, rowlabeldim=NULL, collabeldim=NULL) {
  
  if (is.null(rowlabeldim)) {
    rowlabeldim<- rowdim
  }
  if (is.null(collabeldim)) {
    collabeldim<- coldim
  }

  dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
  dimensions<- sparql.rdf(store, dimensionsRq)

  attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
  attributes<- sparql.rdf(store, attributesRq)

  if (! setequal(union(rowdim,coldim),union(dimensions,attributes)) ) {
    stop("union of rowdim and coldim is not the union of dimensions and attributes in the cube")
  }
  if ( length(intersect(rowdim,coldim)) ) {
    stop("rowdim and coldim are not disjoint")
  }
  observationsDescriptionRq<- GetObservationsWithDescriptionSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
  ## cat(observationsDescriptionRq)
  observationsDesc<- as.data.frame(sparql.rdf(store, observationsDescriptionRq ), stringsAsFactors=FALSE)
 
  ## XX should also return desciptive labels for the dimensions
  rowdimRq<- GetDimsubsetWithObsSparqlQuery( forsparqlprefix, domainName, rowdim )
  observationsRowDim<- as.data.frame(sparql.rdf(store, rowdimRq ), stringsAsFactors=FALSE)

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

  ## head(observationsRowDimE[,c("s","rowno")])


  coldimRq<- GetDimsubsetWithObsSparqlQuery( forsparqlprefix, domainName, coldim )
  observationsColDim<- as.data.frame(sparql.rdf(store, coldimRq ), stringsAsFactors=FALSE)
  colnamesColDim<- sub("prop:", "", coldim)
  ## using data.frame to handle the case where the result is a vector
  uqc<-data.frame(unique(observationsColDim[,colnamesColDim]), stringsAsFactors=FALSE)
  colnames(uqc)<- colnamesColDim
  colnoseq<- 1:nrow(uqc)
  uqc[,"colno"]<- colnoseq
  ## head(uqc)
  observationsColDimE<-merge(observationsColDim,uqc, by=colnamesColDim, all=TRUE)
  ## head(observationsColDimE[,c("s","colno")])

  nIRIs<-  c(sub("prop:", "", dimensions), paste0(sub("prop:", "", dimensions), "IRI"),"measureIRI" )


  prm<- regexec("^prefix +([^:]+): +<(.*)>$", strsplit(forsparqlprefix,"\n")[[1]])
  ll<-regmatches(strsplit(forsparqlprefix,"\n")[[1]],prm)
  res<-data.frame(matrix(unlist(ll),ncol=3,byrow=TRUE),stringsAsFactors=FALSE)

## XX should have a function for this
  observationsDesc[, nIRIs]<- apply(observationsDesc[, nIRIs],c(1,2),function(x) {gsub("^prop:", as.character(res[res[,2]=="prop",3]), x)})
  observationsDesc[, nIRIs]<- apply(observationsDesc[, nIRIs],c(1,2),function(x) {gsub("^ds:", as.character(res[res[,2]=="ds",3]), x)})
  observationsDesc[, nIRIs]<- apply(observationsDesc[, nIRIs],c(1,2),function(x) {gsub("^code:", as.character(res[res[,2]=="code",3]), x)})
  
  ## names(observationsDesc)
  ## head(observationsColDimE)
  ## names(observationsColDimE)
  
  ## any(duplicated(observationsRowDimE$s))
  ## any(duplicated(observationsColDimE$s))

  obsRowColNo<- merge( observationsRowDimE[,c("s","rowno")], observationsColDimE[,c("s","colno")], by="s", all=TRUE)
  ## any(duplicated(obsRowColNo$s))
  ## duplicated(obsRowColNo[,c("rowno","colno")])
  ## any(duplicated(obsRowColNo[,c("rowno","colno")]))
  if (any(duplicated(obsRowColNo[,c("rowno","colno")]))) {
    stop("Unexpected an observation is not uniquely identified by row and column number")
  }

  if (any(duplicated(obsRowColNo[,c("rowno","colno")]))) {
##  obsRowColNo[ which(duplicated(obsRowColNo[,c("rowno","colno")])), ]
    ##  obsRowColNo
    stop("unexpected dublicates - see program code")
  }

  observationsDescX<- merge( observationsDesc, obsRowColNo, by="s", all=TRUE)

  tableFrame<- data.frame(rowno=rep(rownoseq, each=length(colnoseq) ), colno=rep(colnoseq, times=length(rownoseq) ), stringsAsFactors=FALSE )

  observationsDescXX<- merge( tableFrame, observationsDescX, by=c("rowno","colno"), sort=TRUE, all=TRUE)

  ## display observationsDescXX as a table showing row variables when rowno changes
  ## or alternatively when colno==1
  ## when rowno is 1 and colno is 1 then write the row and column headers

presTable<- uqr
for (colno in colnoseq) {
  presTable[,paste0("col", colno)]<- rep( NA, length(rownoseq))
}
for (colno in colnoseq) {
  for (rowno in rownoseq) {
    presTable[rowno,paste0("col", colno)]<- observationsDescXX[observationsDescXX$rowno==rowno & observationsDescXX$colno==colno, "measure"]
}
}

  attr(presTable, "rowLabelDf")<- data.frame(sparql.rdf(store,
  GetDimsubsetDescSparqlQuery(forsparqlprefix, domainName, rowdim)),
  stringsAsFactors=FALSE )
  
  attr(presTable, "colLabelDf")<- data.frame(sparql.rdf(store, GetDimsubsetDescSparqlQuery(forsparqlprefix, domainName, coldim)), stringsAsFactors=FALSE )

  obsURI<- observationsDescXX[ , nIRIs ]
  names(obsURI)[1:length(dimensions)]<- paste0(sub("prop:", "", dimensions),"valueIRI")

attr(presTable, "rowlabelURI")<- "to be defined"
attr(presTable, "collabelURI")<- "to be defined"
attr(presTable, "obsURI" )<- obsURI
attr(presTable, "observationsDesc")<- observationsDescXX 
attr(presTable, "colnoseq")<- colnoseq
attr(presTable, "rownoseq")<- rownoseq
presTable
}
