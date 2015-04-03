library(rrdf)
library(rrdfqbcrnd0)
store<- new.rdf()
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.TTL", package="rrdfqbcrnd0")
print(dataCubeFile)
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)
summarize.rdf(store)

format<-"RDF/JSON"
filename<-"DC-demo.json"
.jcall("com/github/egonw/rrdf/RJenaHelper", "V", "saveRdf", store, filename, format)

## This does not work - maybe due mising jar in rrdf
## Error in .jcall("com/github/egonw/rrdf/RJenaHelper", "V", "saveRdf", store,  :
##  java.lang.NoClassDefFoundError: com/github/jsonldjava/core/JsonLdError
## ttps://jena.apache.org/documentation/io/rdf-output.html
format<-"JSON-LD"
filename<-"DC-demo.json-ld"
.jcall("com/github/egonw/rrdf/RJenaHelper", "V", "saveRdf", store, filename, format)
