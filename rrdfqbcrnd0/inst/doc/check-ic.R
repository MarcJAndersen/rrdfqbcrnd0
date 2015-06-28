## ---- results='asis', eval=TRUE------------------------------------------
library(rrdfqbcrnd0)

qbfile<- system.file("extdata/sample-rdf", "DC-DM-sample.ttl", package="rrdfqbcrnd0")
cube<- load.rdf( qbfile, format="TURTLE")

dsdName<- GetDsdNameFromCube( cube )
domainName<- GetDomainNameFromCube( cube )
forsparqlprefix<- GetForSparqlPrefix( domainName )

cdisc.rdf<- Load.cdisc.standards()

cubeData<- combine.rdf( cube, cdisc.rdf)



## ---- results='asis', eval=TRUE------------------------------------------
str(cubeData)
for (icall in qbIClist) {
#  print(names(icall))
  if (! icall$HasInstantiation ) {
    icSelectRq<- gsub("ASK \\{", "SELECT \\* WHERE \\{", icall$rq)
    print( icall$ittitle)
    print( icSelectRq)
    cube.ic<- sparql.rdf(cubeData, paste( forsparqlprefix, icSelectRq  )  )
    cat(paste0(icall$ictitle, ": ", nrow(cube.ic), "\n"))
   }
}


## ---- results='asis', eval=TRUE------------------------------------------
icres<- RunQbIC( cubeData, forsparqlprefix )
knitr::kable(icres)

## ---- results='asis', eval=TRUE------------------------------------------
qbfile1<- system.file("extdata/sample-rdf", "example.ttl", package="rrdfqbcrnd0")
cube1<- load.rdf( qbfile1, format="TURTLE")

cubeData1<- combine.rdf( cube1, cdisc.rdf)

icres1<- RunQbIC( cubeData1, forsparqlprefix )
knitr::kable(icres1)

## ---- results='asis', eval=TRUE------------------------------------------
qbfile2<- system.file("extdata/sample-rdf", "example-fails-IC14.ttl", package="rrdfqbcrnd0")
cube2<- load.rdf( qbfile2, format="TURTLE")

cubeData2<- combine.rdf( cube2, cdisc.rdf)

icres2<- RunQbIC( cubeData2, forsparqlprefix,doForIC=c("ic-14") )
knitr::kable(icres2)

