## ----, eval=TRUE---------------------------------------------------------
library(rrdfqbcrnd0)

## ----, eval=TRUE---------------------------------------------------------

dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.ttl", package="rrdfqbcrnd0")
store <- new.rdf()  # Initialize
cat("Loading ", dataCubeFile, "\n")
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)

dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
forsparqlprefix<- GetForSparqlPrefix( domainName )

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


## ----, echo=TRUE---------------------------------------------------------
cols.rq<-  paste( forsparqlprefix,
'
select distinct ?colno ?cellpartno
where { 
?s a qb:Observation ; 
crnd-attribute:colno ?colno ;
crnd-attribute:cellpartno ?cellpartno .
}
order by ?colno ?cellpartno
',
"\n"                               
)

cols<- sparql.rdf(store, cols.rq)
knitr::kable(cols)

dimensions<- sparql.rdf(store, GetDimensionsSparqlQuery( forsparqlprefix ) )
attributesDf<- sparql.rdf(store, GetAttributesSparqlQuery( forsparqlprefix ))

rowdim<- c("crnd-attribute:rowno", "crnd-dimension:agegr1", "crnd-dimension:race", "crnd-dimension:ethnic", "crnd-dimension:sex" )
coldim<- c("crnd-attribute:colno", "crnd-attribute:cellpartno", "crnd-dimension:trt01a" )

qbtest<- GetTwoDimTableFromQb( store, forsparqlprefix, domainName, rowdim, coldim )

## names(attributes(qbtest))
## options(width=200)
## knitr::kable(qbtest[order(strtoi(qbtest$rowno)),])

oDx<-attr(qbtest,"observationsDesc")
oDxx<- oDx[! is.na(oDx$s),]
oD<- oDxx[order(strtoi(oDxx$rowno)),]
presrowvarindex<- unique(oD$rowno)
colvarindex<- unique(oD$colno)
cellpartnoindex<- unique(oD$cellpartno)
presrowvarindex
colvarindex
cellpartnoindex
oD[,c("s","rowno","colno","cellpartno")]

presrowvarvalue<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:(.*)","\\1value",rowdim)
presrowvarIRI<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:(.*)","\\1IRI",rowdim)
presrowvarlabel<- gsub("crnd-dimension:|crnd-attribute:|crnd-measure:(.*)","\\1label",rowdim)

## add code for embedding the cube as turtle
## determine cube compontents except observations,
## as the observations are stored as RDFa
file<- file.path(system.file("extdata/sample-cfg", package="rrdfqbcrnd0"), "test.html")
# file<- file.path(tempdir(),"test.html")
append<- TRUE
print(file)
cat("<!DOCTYPE HTML>\n", file=file, append=FALSE)
cat('
<html>
  <head>
<meta charset="UTF-8">
<title>DEMO table as html</title>
   <script src="jquery-2.1.3.min.js"></script>
   <link rel="stylesheet" href="jquery-ui-1.11.3.custom/jquery-ui.css"/>
   <script src="jquery-ui-1.11.3.custom/jquery-ui.min.js"></script>
   <script src="RDFa.min.1.4.0.js"></script>

<style>
#table {
    line-height:30px;
    background-color:#eeeeee;
    height:1000px;
    width:750px;
    float:left;
    padding:5px;
}
#drop{
    width:300px;
    background-color:green;
    float:left;
    padding:10px;
}
</style>

</head>
<script>
"use strict";

function allowDrop(ev)
{
ev.preventDefault();
}

function drag(ev)
{
ev.dataTransfer.setData("Text",ev.target.id);
console.log("Dragging: ", ev.target.id);
}

function drop(ev)
{
ev.preventDefault();
var data=ev.dataTransfer.getData("Text");
console.log("Dropping: ", data);
// from http://stackoverflow.com/questions/13007582/html5-drag-and-copy
var nodeCopy = document.getElementById(data).cloneNode(true);
nodeCopy.id = "copy"+nodeCopy.id;
// end from http://stackoverflow.com/questions/13007582/html5-drag-and-copy
var newelem = document.createElement("P");
newelem.appendChild(nodeCopy);
ev.target.appendChild(newelem);
}

$(document).ready(function(){

GreenTurtle.attach(document)

})
                  
</script>
<body>
<h1>DEMO table as RDFa</h1>
'
, file=file, append=TRUE)

cat('<div id="container">', file=file, append=TRUE)

cat("<div id='table'>\n", file=file, append=TRUE)
cat("<table border>\n", file=file, append=TRUE)
or<-1

## make the header row(s) for the columns

for (rr in presrowvarindex) {
  cat("<tr>", file=file, append=TRUE)
print(rr)
  ## make the row identification
  for (cc in colvarindex) {
print(cc)
    cat("<td>", file=file, append=TRUE)
cpindex<-0
    for (cp in cellpartnoindex) {
print(cp)
cpindex<- cpindex+1
if (cpindex>1) {
## separator between cells should be taken from data
      cat(" ", file=file, append=TRUE)
}
    if (oD$rowno[or]==rr & oD$colno[or]==cc & oD$cellpartno[or]==cp ) {
## The observation
      ## next line is for simple fly-over
      cat(paste0("<a title=\"", oD$measureIRI[or], "\">"), file=file, append=TRUE)

      cat(paste0('<span ', 'id="', gsub("ds:","",oD$s[or]), '"',
                 'resource="', oD$s[or],'"',
                 ' typeof="qb:Observation" draggable="true" ondragstart="drag(event)" >'),
          file=file, append=TRUE)
cat(paste0('<span property="qb:dataSet" resource="', 'ds:', dsdName,'">'), file=file, append=TRUE)
      
for (prop in dimensions) {
cat( paste0('<span property="', prop, '"', ' resource="', oD[or, gsub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", prop)], '">'), file=file, append=TRUE)
}

## formatting to applied to measure
      cat(paste0(oD$measure[or]), file=file, append=TRUE)

for (prop in dimensions) {
cat( '</span>', file=file, append=TRUE)
}
cat( '</span>', file=file, append=TRUE)
cat( '</span>', file=file, append=TRUE)

      cat(paste0("</a>"), file=file, append=TRUE)
      or<- or+1
    }
    }
    cat("</td>", file=file, append=TRUE)
  }
cat("</tr>", file=file, append=TRUE)
  }
cat("</table>\n", file=file, append=TRUE)
cat("</div>\n", file=file, append=TRUE)

cat('
<div id="droparea">
Drag and drop over the green text below.
<table>
<tr><td>
<span  style="width:100px" id="drop" ondrop="drop(event)" ondragover="allowDrop(event)">Drop here...</span>
</td></tr>
</table>
</div> 
',  file=file, append=TRUE)                 
cat('
</div>
</body>
</html>
', file=file, append=TRUE)
print(file)


## ----, echo=TRUE---------------------------------------------------------
sessionInfo()

