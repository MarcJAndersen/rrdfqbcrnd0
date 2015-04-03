library(rrdf)
library(rrdfqbcrnd0)
store<- new.rdf()
dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.TTL", package="rrdfqbcrnd0")
print(dataCubeFile)
load.rdf(dataCubeFile, format="TURTLE", appendTo= store)

format<-"RDF/JSON"
filename<-"DC-demo.json"
.jcall("com/github/egonw/rrdf/RJenaHelper", "V", "saveRdf", store, filename, format)

# https://jena.apache.org/documentation/io/rdf-output.html
format<-"JSON-LD"
filename<-"DC-demo.json-ld"
.jcall("com/github/egonw/rrdf/RJenaHelper", "V", "saveRdf", store, filename, format)
