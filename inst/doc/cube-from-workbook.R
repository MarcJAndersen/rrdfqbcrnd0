## ----, eval=TRUE---------------------------------------------------------

library (rrdf)
library (xlsx)
library(rrdfqbcrnd0)



# NOTE: if all cells in a column is missing, then the input fails
RDFCubeWorkbook<- system.file("extdata/sample-cfg", "RDFCubeWorkbook.xlsx", package="rrdfqbcrnd0")

dm.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "DM" )
cat("DM cube stored as ", dm.cube.fn, "\n")

ae.cube.fn<- BuildCubeFromWorkbook(RDFCubeWorkbook, "AE" )
cat("AE cube stored as ", ae.cube.fn, "\n")



## ----, echo=FALSE, results='asis'----------------------------------------

dataCubeFile<- dm.cube.fn
# dataCubeFile<- ae.cube.fn

## ----, echo=FALSE--------------------------------------------------------
# the rest of the code only depends on the value of dataCubeFile 
checkCube <- new.rdf(ontology=FALSE)  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= checkCube)
summarize.rdf(checkCube)
# determine the domain name; used for defining prefixes
# TODO: reconsider the use of domain specific prefixes

# TODO: make this simpler - the only purpose is find the dsdName
# TODO: a qb:DataStructureDefinition, and for domainname, say, the DM in ds:dsd-DM
tempstr<- as.character(sparql.rdf(checkCube, "select ?s where { ?s a <http://purl.org/linked-data/cube#DataStructureDefinition> } limit 1"))
tempstrvec<- unlist(strsplit( tempstr, "/"))
dsdName<- tempstrvec[length(tempstrvec)]
domainName<- strsplit(dsdName,"-")[[1]][[2]]

data(qbCDISCprefixes)
common.prefixes <- data.frame(
    prefix=gsub("^prefix","",names(qbCDISCprefixes)),
    namespace=as.character(qbCDISCprefixes )
    )
custom.prefixes <-Get.qb.crnd.prefixes(tolower(domainName))

forsparqlprefix<- Get.rq.prefix.df(rbind(common.prefixes, custom.prefixes))

## ----, echo=FALSE--------------------------------------------------------

cube.observations1.rq<- paste( forsparqlprefix,
'
select *
where {?s ?p ?o .}
limit 10
',
"\n"
)

cube.observations1<- sparql.rdf(checkCube, cube.observations1.rq  )
knitr::kable(head(cube.observations1, 10))

## ----, echo=FALSE--------------------------------------------------------

cube.observations2.rq<-  paste( forsparqlprefix,
'
select *
where { ?s a qb:Observation ; ?p ?o .}
limit 30
',
"\n"                               
)

cube.observations2<- sparql.rdf(checkCube, cube.observations2.rq)
knitr::kable(head(cube.observations2, 10))


## ----, echo=FALSE--------------------------------------------------------

codelists.rq<-   paste(forsparqlprefix,
'
select distinct ?p ?cl ?prefLabel
where {
?DataStructureDefinition a qb:DataStructureDefinition ;
   qb:component ?component .
?component a qb:ComponentSpecification .
?component qb:dimension ?p .
?p qb:codeList ?c .
?c skos:hasTopConcept ?cl .
?cl skos:prefLabel ?prefLabel .
values ( ?DataStructureDefinition ) {
',
paste0( "(", "ds:", dsdName, ")"),
'
}
}
order by ?p ?cl ?prefLabel
'
)

cube.codelists<- as.data.frame(sparql.rdf(checkCube, codelists.rq), stringsAsFactors=FALSE)
# TODO instead of gsub make a more straightforward way
# TOTO this involves a new version of the ph.recode function
cube.codelists$vn<- gsub("prop:","",cube.codelists$p)
cube.codelists$clc<- gsub("code:","",cube.codelists$cl)
knitr::kable(print(cube.codelists[,c("vn", "clc", "prefLabel")]))


## ----, echo=FALSE--------------------------------------------------------

cube.dimensions.rq<- paste(forsparqlprefix,
'
select * where
{ [] qb:dimension ?p .  }
',
"\n"
)
cube.dimensions<- as.data.frame(sparql.rdf(checkCube, cube.dimensions.rq), stringsAsFactors=FALSE)
knitr::kable(print(cube.dimensions))


## ----, echo=FALSE--------------------------------------------------------

cube.dimensionsattr<- sparql.rdf(checkCube,
  paste(forsparqlprefix,
"select * where { {[] qb:dimension ?p . } union {  ?p a qb:AttributeProperty . } }"
))

cube.observations.rq<-  paste( forsparqlprefix,
    "select * where {",
    "?s a qb:Observation  ;", "\n",
    paste("       qb:dataSet",  paste0( "ds:", "dataset", "-", domainName), " ;", sep=" ", collapse="\n"), "\n",
    paste0( cube.dimensionsattr, " ", sub("prop:", "?", cube.dimensionsattr), ";", collapse="\n"),
    "\n",
    "prop:measure      ?measure ;      \n",
    paste0( "optional{ ", sub("prop:", "?", cube.dimensionsattr), " ",
           "skos:prefLabel",
           " ",
           sub("prop:", "?", cube.dimensionsattr), "value" ,
           " . ", "}",
           collapse="\n"),
    "\n",
    "} ",
    "\n"
   )


## ----, echo=FALSE--------------------------------------------------------

cat(cube.observations.rq)

## ----, echo=FALSE--------------------------------------------------------


cube.observations<- as.data.frame(sparql.rdf(checkCube, cube.observations.rq ), stringsAsFactors=FALSE)
knitr::kable(cube.observations[,c(paste0(sub("prop:", "", cube.dimensionsattr), "value"),"measure")])



