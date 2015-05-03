## ----, eval=TRUE---------------------------------------------------------
library(rrdfqbcrnd0)

## ----helperfunction------------------------------------------------------
mdwrite<- function( sparqlStatements, refname ) {
# fn<- file.path(tempdir(), paste0( refname, ".rq" ) )
fn<- file.path(system.file("extdata/sample-rdf", package="rrdfqbcrnd0"), paste0( refname, ".rq" ) )
cat( paste0("## @knitr ", refname), gsub("\\n", "  \n", sparqlStatements), sep="  \n", file=fn)
knitr::read_chunk( fn, from=c(1))
invisible(fn)
}

## ----, eval=FALSE, echo=FALSE--------------------------------------------
#  knitr::knit("vignettes/SPARQL-scripts-for-qb.Rmd")
#  markdown::markdownToHTML("SPARQL-scripts-for-qb.md",output="SPARQL-scripts-for-qb.html")
#  
#  # makes very large file, and does not show # at end of < >.
#  rmarkdown::render("vignettes/SPARQL-scripts-for-qb.Rmd", rmarkdown::html_document())
#  # the > at end of lines are shown as latex commands
#  rmarkdown::render("vignettes/SPARQL-scripts-for-qb.Rmd", rmarkdown::pdf_document())
#  

## ------------------------------------------------------------------------
system.file("extdata/sample-xpt", package="rrdfqbcrnd0")

## ------------------------------------------------------------------------
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.ttl", package="rrdfqbcrnd0")
store <- new.rdf()  # Initialize
cat("Loading ", dataCubeFile, "\n")
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)

## ------------------------------------------------------------------------
dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
forsparqlprefix<- GetForSparqlPrefix( domainName )

## ------------------------------------------------------------------------
dimensionsRq <- GetDimensionsSparqlQuery( forsparqlprefix )
mdwrite( dimensionsRq, "DEMOdimensions" )

## ------------------------------------------------------------------------
dimensions<- sparql.rdf(store, dimensionsRq)
knitr::kable(dimensions)

## ------------------------------------------------------------------------
attributesRq<- GetAttributesSparqlQuery( forsparqlprefix )
mdwrite( attributesRq, "DEMOattributes" )

## ------------------------------------------------------------------------
attributes<- sparql.rdf(store, attributesRq)
knitr::kable(attributes)

## ------------------------------------------------------------------------
observationsRq<- GetObservationsSparqlQuery( forsparqlprefix, domainName, dimensions, attributes )
mdwrite( observationsRq, "DEMOobservations" )

## ------------------------------------------------------------------------
observations<- sparql.rdf(store, observationsRq)
knitr::kable(head(observations,2))

## ----, eval=FALSE, echo=FALSE--------------------------------------------
#  db <- Rd_db("rrdfqbcrnd0")
#  keywords <- lapply(db, tools:::.Rd_get_metadata, "keyword")
#  db$qbIClist.Rd
#  tools:::RdTags(db$qbIClist.Rd)
#  titles <- lapply(db, tools:::.Rd_get_metadata, "title")
#  arguments <- lapply(db, tools:::.Rd_get_metadata, "arguments")
#  names <- lapply(db, tools:::.Rd_get_metadata, "name")
#  dofor<-grep("sparql",titles,ignore.case=TRUE)
#  cbind(titles[dofor],arguments[dofor])

