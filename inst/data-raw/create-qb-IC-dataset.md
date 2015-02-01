---
title: "Create Integrity Contraints SPARQL Queries from RDF data qubce definition"
author: "mja@statgroup.dk"
date: "2015-01-11"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Create Integrity Contraints SPARQL Queries from RDF data qubce definition}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---


```r
library(RCurl)
```

```
## Loading required package: methods
## Loading required package: bitops
```

```r
library(XML)
library(devtools)

qbURL<-"http://www.w3.org/TR/2014/REC-vocab-data-cube-20140116/"
if (! url.exists(qbURL) ) {
  stop(paste0("Can not access URL ",qbURL))
}


# Acknowledgement: I got the approach from
# http://stackoverflow.com/questions/1395528/scraping-html-tables-into-r-data-frames-using-the-xml-package?lq=1

webpage <- getURL(qbURL)
# The following two lines is suggested in the stackoverflow post
# Apparantly not needed here
## Process escape characters
## webpage <- readLines(tc <- textConnection(webpage)); close(tc)

# Parse the html tree, ignoring errors on the page
pagetree <- htmlTreeParse(webpage, error=function(...){}, useInternalNodes = TRUE)

# appears that integrity checks starte with h3 and then a table with class bordered-table
# so that's what we look for
both<- getNodeSet(pagetree,"//*/h3[@id]|//*/table[@class='bordered-table']/tbody/tr/td/pre")

qbIClist<- list()

for (i in 1:(length(both)-1)) {
  icname<- xmlGetAttr(both[[i]],"id",default="none")
  if (grepl('ic-[1-9]([0-9])*', icname ) ) {
   ictitle<- xmlValue(xmlChildren(both[[i]])$text )
   print(paste0( "Node ", i, ", IC name ", icname, " - ", ictitle ))
   qbIClist[[icname]]<- paste0(
     paste0("# ", ictitle, "\n" ),
     xmlValue(xmlChildren(both[[i+1]])$text),
     sep="\n"
     )
  }
  }
```

[1] "Node 27, IC name ic-1 - IC-1.  Unique DataSet"
[1] "Node 29, IC name ic-2 - IC-2. Unique DSD"
[1] "Node 31, IC name ic-3 - IC-3. DSD includes measure"
[1] "Node 33, IC name ic-4 - IC-4. Dimensions have range"
[1] "Node 35, IC name ic-5 - IC-5. Concept dimensions have code lists"
[1] "Node 37, IC name ic-6 - IC-6. Only attributes may be optional"
[1] "Node 39, IC name ic-7 - IC-7. Slice Keys must be declared"
[1] "Node 41, IC name ic-8 - IC-8. Slice Keys consistent with DSD"
[1] "Node 43, IC name ic-9 - IC-9. Unique slice structure"
[1] "Node 45, IC name ic-10 - IC-10. Slice dimensions complete"
[1] "Node 47, IC name ic-11 - IC-11. All dimensions required"
[1] "Node 49, IC name ic-12 - IC-12. No duplicate observations"
[1] "Node 51, IC name ic-13 - IC-13. Required attributes"
[1] "Node 53, IC name ic-14 - IC-14. All measures present"
[1] "Node 55, IC name ic-15 - IC-15. Measure dimension consistent"
[1] "Node 57, IC name ic-16 - IC-16. Single measure on measure dimension observation"
[1] "Node 59, IC name ic-17 - IC-17. All measures present in measures dimension cube "
[1] "Node 61, IC name ic-18 - IC-18. Consistent data set links"
[1] "Node 63, IC name ic-19 - IC-19. Codes from code list"
[1] "Node 65, IC name ic-20 - IC-20. Codes from hierarchy"
[1] "Node 67, IC name ic-21 - IC-21. Codes from hierarchy (inverse)"

```r
print(qbIClist)
```

$`ic-1`
[1] "# IC-1.  Unique DataSet\nASK {\n  {\n    # Check observation has a data set\n    ?obs a qb:Observation .\n    FILTER NOT EXISTS { ?obs qb:dataSet ?dataset1 . }\n  } UNION {\n    # Check has just one data set\n    ?obs a qb:Observation ;\n       qb:dataSet ?dataset1, ?dataset2 .\n    FILTER (?dataset1 != ?dataset2)\n  }\n}\n    \n"

$`ic-2`
[1] "# IC-2. Unique DSD\nASK {\n  {\n    # Check dataset has a dsd\n    ?dataset a qb:DataSet .\n    FILTER NOT EXISTS { ?dataset qb:structure ?dsd . }\n  } UNION { \n    # Check has just one dsd\n    ?dataset a qb:DataSet ;\n       qb:structure ?dsd1, ?dsd2 .\n    FILTER (?dsd1 != ?dsd2)\n  }\n}\n    \n"

$`ic-3`
[1] "# IC-3. DSD includes measure\nASK {\n  ?dsd a qb:DataStructureDefinition .\n  FILTER NOT EXISTS { ?dsd qb:component [qb:componentProperty [a qb:MeasureProperty]] }\n}\n    \n"

$`ic-4`
[1] "# IC-4. Dimensions have range\nASK {\n  ?dim a qb:DimensionProperty .\n  FILTER NOT EXISTS { ?dim rdfs:range [] }\n}\n    \n"

$`ic-5`
[1] "# IC-5. Concept dimensions have code lists\nASK {\n  ?dim a qb:DimensionProperty ;\n       rdfs:range skos:Concept .\n  FILTER NOT EXISTS { ?dim qb:codeList [] }\n}\n    \n"

$`ic-6`
[1] "# IC-6. Only attributes may be optional\nASK {\n  ?dsd qb:component ?componentSpec .\n  ?componentSpec qb:componentRequired \"false\"^^xsd:boolean ;\n                 qb:componentProperty ?component .\n  FILTER NOT EXISTS { ?component a qb:AttributeProperty }\n}\n    \n"

$`ic-7`
[1] "# IC-7. Slice Keys must be declared\nASK {\n    ?sliceKey a qb:SliceKey .\n    FILTER NOT EXISTS { [a qb:DataStructureDefinition] qb:sliceKey ?sliceKey }\n}\n    \n"

$`ic-8`
[1] "# IC-8. Slice Keys consistent with DSD\nASK {\n  ?slicekey a qb:SliceKey;\n      qb:componentProperty ?prop .\n  ?dsd qb:sliceKey ?slicekey .\n  FILTER NOT EXISTS { ?dsd qb:component [qb:componentProperty ?prop] }\n}\n    \n"

$`ic-9`
[1] "# IC-9. Unique slice structure\nASK {\n  {\n    # Slice has a key\n    ?slice a qb:Slice .\n    FILTER NOT EXISTS { ?slice qb:sliceStructure ?key }\n  } UNION {\n    # Slice has just one key\n    ?slice a qb:Slice ;\n           qb:sliceStructure ?key1, ?key2;\n    FILTER (?key1 != ?key2)\n  }\n}\n    \n"

$`ic-10`
[1] "# IC-10. Slice dimensions complete\nASK {\n  ?slice qb:sliceStructure [qb:componentProperty ?dim] .\n  FILTER NOT EXISTS { ?slice ?dim [] }\n}\n    \n"

$`ic-11`
[1] "# IC-11. All dimensions required\nASK {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty;\n    FILTER NOT EXISTS { ?obs ?dim [] }\n}\n    \n"

$`ic-12`
[1] "# IC-12. No duplicate observations\nASK {\n  FILTER( ?allEqual )\n  {\n    # For each pair of observations test if all the dimension values are the same\n    SELECT (MIN(?equal) AS ?allEqual) WHERE {\n        ?obs1 qb:dataSet ?dataset .\n        ?obs2 qb:dataSet ?dataset .\n        FILTER (?obs1 != ?obs2)\n        ?dataset qb:structure/qb:component/qb:componentProperty ?dim .\n        ?dim a qb:DimensionProperty .\n        ?obs1 ?dim ?value1 .\n        ?obs2 ?dim ?value2 .\n        BIND( ?value1 = ?value2 AS ?equal)\n    } GROUP BY ?obs1 ?obs2\n  }\n}\n    \n"

$`ic-13`
[1] "# IC-13. Required attributes\nASK {\n    ?obs qb:dataSet/qb:structure/qb:component ?component .\n    ?component qb:componentRequired \"true\"^^xsd:boolean ;\n               qb:componentProperty ?attr .\n    FILTER NOT EXISTS { ?obs ?attr [] }\n}\n    \n"

$`ic-14`
[1] "# IC-14. All measures present\nASK {\n    # Observation in a non-measureType cube\n    ?obs qb:dataSet/qb:structure ?dsd .\n    FILTER NOT EXISTS { ?dsd qb:component/qb:componentProperty qb:measureType }\n\n    # verify every measure is present\n    ?dsd qb:component/qb:componentProperty ?measure .\n    ?measure a qb:MeasureProperty;\n    FILTER NOT EXISTS { ?obs ?measure [] }\n}\n    \n"

$`ic-15`
[1] "# IC-15. Measure dimension consistent\nASK {\n    # Observation in a measureType-cube\n    ?obs qb:dataSet/qb:structure ?dsd ;\n         qb:measureType ?measure .\n    ?dsd qb:component/qb:componentProperty qb:measureType .\n    # Must have value for its measureType\n    FILTER NOT EXISTS { ?obs ?measure [] }\n}\n    \n"

$`ic-16`
[1] "# IC-16. Single measure on measure dimension observation\nASK {\n    # Observation with measureType\n    ?obs qb:dataSet/qb:structure ?dsd ;\n         qb:measureType ?measure ;\n         ?omeasure [] .\n    # Any measure on the observation\n    ?dsd qb:component/qb:componentProperty qb:measureType ;\n         qb:component/qb:componentProperty ?omeasure .\n    ?omeasure a qb:MeasureProperty .\n    # Must be the same as the measureType\n    FILTER (?omeasure != ?measure)\n}\n    \n"

$`ic-17`
[1] "# IC-17. All measures present in measures dimension cube \nASK {\n  {\n      # Count number of other measures found at each point \n      SELECT ?numMeasures (COUNT(?obs2) AS ?count) WHERE {\n          {\n              # Find the DSDs and check how many measures they have\n              SELECT ?dsd (COUNT(?m) AS ?numMeasures) WHERE {\n                  ?dsd qb:component/qb:componentProperty ?m.\n                  ?m a qb:MeasureProperty .\n              } GROUP BY ?dsd\n          }\n        \n          # Observation in measureType cube\n          ?obs1 qb:dataSet/qb:structure ?dsd;\n                qb:dataSet ?dataset ;\n                qb:measureType ?m1 .\n    \n          # Other observation at same dimension value\n          ?obs2 qb:dataSet ?dataset ;\n                qb:measureType ?m2 .\n          FILTER NOT EXISTS { \n              ?dsd qb:component/qb:componentProperty ?dim .\n              FILTER (?dim != qb:measureType)\n              ?dim a qb:DimensionProperty .\n              ?obs1 ?dim ?v1 . \n              ?obs2 ?dim ?v2. \n              FILTER (?v1 != ?v2)\n          }\n          \n      } GROUP BY ?obs1 ?numMeasures\n        HAVING (?count != ?numMeasures)\n  }\n}\n    \n"

$`ic-18`
[1] "# IC-18. Consistent data set links\nASK {\n    ?dataset qb:slice       ?slice .\n    ?slice   qb:observation ?obs .\n    FILTER NOT EXISTS { ?obs qb:dataSet ?dataset . }\n}\n    \n"

$`ic-19`
[1] "# IC-19. Codes from code list\nASK {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty ;\n        qb:codeList ?list .\n    ?list a skos:ConceptScheme .\n    ?obs ?dim ?v .\n    FILTER NOT EXISTS { ?v a skos:Concept ; skos:inScheme ?list }\n}\n\nASK {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty ;\n        qb:codeList ?list .\n    ?list a skos:Collection .\n    ?obs ?dim ?v .\n    FILTER NOT EXISTS { ?v a skos:Concept . ?list skos:member+ ?v }\n}\n    \n"

$`ic-20`
[1] "# IC-20. Codes from hierarchy\nASK {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty ;\n        qb:codeList ?list .\n    ?list a qb:HierarchicalCodeList .\n    ?obs ?dim ?v .\n    FILTER NOT EXISTS { ?list qb:hierarchyRoot/<$p>* ?v }\n}\n    \n"

$`ic-21`
[1] "# IC-21. Codes from hierarchy (inverse)\nASK {\n    ?obs qb:dataSet/qb:structure/qb:component/qb:componentProperty ?dim .\n    ?dim a qb:DimensionProperty ;\n         qb:codeList ?list .\n    ?list a qb:HierarchicalCodeList .\n    ?obs ?dim ?v .\n    FILTER NOT EXISTS { ?list qb:hierarchyRoot/(^<$p>)* ?v }\n}\n    \n"

```r
## for (icname in names(qbIClist)) {
##    fileConn<-file(paste0(icname, ".rq"))
##    writeLines( qbIClist[[icname]], fileConn )
##    close(fileConn)
##  }
```

The script is intented to run from the package root as
```
knit("data-raw/create-qb-IC-dataset.Rmd")
```

knit runs the script in the data-raw directory, so it would be
expected to use pkg=".." to store the qbIClist in the data directory
However, it did not work - hence the setwd below-

Data are stored in the data directory, following [R packages by Hadley Wickham](http://r-pkgs.had.co.nz/data.html) and [Writing R Extensions](http://cran.r-project.org/doc/manuals/R-exts.pdf).

```
devtools::use_data(qbIClist,pgk="..",overwrite=TRUE)
```


```r
# This stores the qbIClist in the data directory
# Consider making it internal

setwd("..")
devtools::use_data(qbIClist,overwrite=TRUE)
```

```
## Error: No description at /home/ma/projects/R-packages/rrdfqbcrnd0/inst/DESCRIPTION
```

```r
print("Done")
```

[1] "Done"
