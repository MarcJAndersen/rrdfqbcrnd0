## ------------------------------------------------------------------------
library(rrdfqbcrnd0)

## ------------------------------------------------------------------------
obsData<- data.frame(
  category=c("AA-group", "BB-group"),
  procedure=c("count", "count" ),
  factor=c("quantity", "quantity" ),
  unit=c("subject", "subject" ),
  denominator=c(" ", " "),
  measure=c( 123, 456 ),
  stringsAsFactors=FALSE  )
knitr::kable(obsData)

## ------------------------------------------------------------------------
cubeMetadata<- data.frame(
  compType=c("dimension", "dimension", "dimension", "unit", "denominator", "measure", "metadata"),
  compName=c("category", "procedure", "factor", "attribute", "attribute", "measure", "domainName"),
  codeType=c("DATA", "DATA", "DATA", " ", " ", "<NA>","<NA>"),
  nciDomainValue=c(" "," "," "," ", " ", " "," "),
  compLabel=c("Category", "Statistical procedure", "Type of procedure", "Result", "Unit", "Denominator", "EXAMPLE"),
  Comment=c(" "," "," "," "," "," "," "),
  stringsAsFactors=FALSE  )
knitr::kable(cubeMetadata)

## ------------------------------------------------------------------------
outcube<- BuildCubeFromDataFrames(cubeMetadata, obsData )

## ------------------------------------------------------------------------
cat(normalizePath(outcube),"\n")

## ------------------------------------------------------------------------
dataCubeFile<- outcube

## ------------------------------------------------------------------------
cube <- new.rdf()  # Initialize
load.rdf(dataCubeFile, format="TURTLE", appendTo= cube)
summarize.rdf(cube)

## ------------------------------------------------------------------------
## TODO: reconsider the use of domain specific prefixes
dsdName<- GetDsdNameFromCube( cube )
domainName<- GetDomainNameFromCube( cube )
cat("dsdName ", dsdName, ", domainName ", domainName, "\n" )
forsparqlprefix<- GetForSparqlPrefix( domainName )
cat(forsparqlprefix,"\n")

## ----, echo=FALSE--------------------------------------------------------

cube.observations1.rq<- paste( forsparqlprefix,
'
select *
where {?s ?p ?o .}
limit 10
',
"\n"
)

cube.observations1<- sparql.rdf(cube, cube.observations1.rq  )
knitr::kable(head(cube.observations1, 10))

## ------------------------------------------------------------------------

cube.observations2.rq<-  paste( forsparqlprefix,
'
select *
where { ?s a qb:Observation ; ?p ?o .}
limit 30
',
"\n"                               
)

cube.observations2<- sparql.rdf(cube, cube.observations2.rq)
knitr::kable(head(cube.observations2, 15))


## ----, echo=FALSE--------------------------------------------------------
codelists.rq<- GetCodeListSparqlQuery( forsparqlprefix, dsdName )
cat(codelists.rq)

## ----, echo=FALSE--------------------------------------------------------
cube.codelists<- as.data.frame(sparql.rdf(cube, codelists.rq), stringsAsFactors=FALSE)

## TODO instead of gsub make a more straightforward way
## TODO this involves a new version of the ph.recode function
## TODO(mja): change the GetCodeListSparqlQuery to plain text versions of the clc also
cube.codelists$clc<- gsub("code:","",cube.codelists$cl)
knitr::kable(print(cube.codelists[,c("vn", "clc", "prefLabel")]))


## ------------------------------------------------------------------------

cube.dimensions.rq<- paste(forsparqlprefix,
'
select * where
{ [] qb:dimension ?p .  }
',
"\n"
)
cube.dimensions<- as.data.frame(sparql.rdf(cube, cube.dimensions.rq), stringsAsFactors=FALSE)
knitr::kable(print(cube.dimensions))


## ----, echo=FALSE--------------------------------------------------------

cube.dimensionsattr<- sparql.rdf(cube,
  paste(forsparqlprefix,
"select * where { {[] qb:dimension ?p . } union {  ?p a qb:AttributeProperty . } }"
))

cube.observations.rq<-  paste( forsparqlprefix,
    "select * where {",
    "     ?s a qb:Observation  ;",
    paste("     qb:dataSet",  paste0( "ds:", "dataset", "-", domainName), " ;", sep=" ", collapse="\n"), 
    paste0( "     ", cube.dimensionsattr, " ", 
            sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "?", cube.dimensionsattr), ";", collapse="\n"),
    "     crnd-measure:measure      ?measure ;",
    paste0( "     optional{ ", sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "?", cube.dimensionsattr), " ",
           "skos:prefLabel",
           " ",
           sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "?", cube.dimensionsattr), "value" ,
           " . ", "}",
           collapse="\n"),
    "} ",
    sep="\n"
   )


## ------------------------------------------------------------------------
cat(cube.observations.rq)

## ------------------------------------------------------------------------
cube.observations<- as.data.frame(sparql.rdf(cube, cube.observations.rq ), stringsAsFactors=FALSE)
knitr::kable(cube.observations[,c(paste0(sub("crnd-dimension:|crnd-attribute:|crnd-measure:", "", cube.dimensionsattr), "value"),"measure")])

## ------------------------------------------------------------------------
cubeVocabularyFn<- system.file("extdata/CUBE-standards-rdf","cube.ttl", package="rrdfqbcrnd0")
cubeVocabulary<- load.rdf(cubeVocabularyFn,format="TURTLE")
cubeData<- combine.rdf( cubeVocabulary, cube)

## ------------------------------------------------------------------------
icres<- RunQbIC( cubeData, forsparqlprefix )
knitr::kable(icres)

## ------------------------------------------------------------------------
remove.triple(cubeData,
  subject="http://www.example.org/dc/example/ds/obs1",
  predicate="http://www.example.org/dc/dimension#category",
  object="http://www.example.org/dc/code/category-AA-group")
icres<- RunQbIC( cubeData, forsparqlprefix )
knitr::kable(icres)

## ------------------------------------------------------------------------
cat(qbIClist[["ic-12"]]$rq,"\n")

