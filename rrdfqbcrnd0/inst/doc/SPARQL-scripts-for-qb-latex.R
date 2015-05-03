## ----setup0, include=FALSE,echo=FALSE------------------------------------
library(rrdfqbcrnd0)

## ----setup00, include=FALSE,echo=FALSE,eval=FALSE------------------------
#  knitr::knit("vignettes/SPARQL-scripts-for-qb-latex.Rnw")

## ----setup01-------------------------------------------------------------
cat("Empty statment to make the script pass the R build of vignette")

## ----results='asis'------------------------------------------------------
forsparqlprefix<- GetForSparqlPrefix( "$myQbName" )
sparql.rq<- GetAttributesSparqlQuery( forsparqlprefix )
cat("\\begin{lstlisting}[language=SPARQL]",gsub("#", "\\\\#", sparql.rq),"\\end{lstlisting}",sep="\n")

