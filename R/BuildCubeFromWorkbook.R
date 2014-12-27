##' Build a RDF data cube based on specification given in a spreadsheet 
##'
##' 
##' @param RDFCubeWorkbook Filename and path to an workbook specifying the datacube
##' @param domainName The domainName create the data cube using the corresponding tab in the workbook
##' @param endpoint Used for determined codelist for dimensions. When codetype="SDTM" to give the URL for the remote endpoint. If NULL then the local rdf.cdisc.store from the environment is used.
##' @return The filename for the generated turtle file
##' @examples 
BuildCubeFromWorkbook<- function(RDFCubeWorkbook,domainName,endpoint=NULL) {
  
# Prefixe sources: 1. Workbook sheet CubePrefixes 2. custom built on domain name

# Prefixes common to all cubes (regardless of domain) 
common.prefixes <- read.xlsx(RDFCubeWorkbook,sheetName=paste0("CubePrefixes"))

# Domain-specific prefixes for prop/, dccs/ and dataset/
# Domain-independent for code/
custom.prefixes <-Get.qb.crnd.prefixes(tolower(domainName))
prefixes<- rbind(common.prefixes, custom.prefixes)                                                


store <- new.rdf(ontology=FALSE)  # Initialize

# Register prefixes and return prefixlist
# Examples: prefixQB   holds value http://purl.org/linked-data/cube#
#             prefixRDFS holds value http://www.w3.org/2000/01/rdf-schema#

prefixlist<- qb.def.prefixlist(store, prefixes)

###############################################################################
# Read the skeleton  specifications to dataframe
# Source workbook: compType, compName, compLabel
# TODO: Replace some use of compLabel with a var : compNameClass, formed by
#       Upcase of first letter of the compName value.
cubeMetadata <- read.xlsx(RDFCubeWorkbook,sheetName=paste0(domainName,"-Components"))

metadataSource <-cubeMetadata[grep("metadata", cubeMetadata$compType),]


# Cube metadata. 
cubeDescription <- as.character(cubeMetadata[grep("description", cubeMetadata$compName), "compLabel" ])
cubeComment<- as.character(cubeMetadata[grep("comment", cubeMetadata$compName), "compLabel" ])
cubeLabel<-as.character(cubeMetadata[grep("label", cubeMetadata$compName), "compLabel" ])
cubeTitle<-as.character(cubeMetadata[grep("title", cubeMetadata$compName),"compLabel" ])
# Output file format: DC-<domain>-R-Vn-n-(n).TTL . Also used in dcat:distribution
# NOTE: For pav:Version (dot, notdash) and output file name
cubeVersion <- gsub("\\.","-",metadataSource[ metadataSource$compName=="cubeVersion", "compLabel" ])


if (any(metadataSource$compName=="dataCubeOutDirectory")) {
dataCubeOutDirectory<- as.character(metadataSource[ metadataSource$compName=="dataCubeOutDirectory", "compLabel" ])
} else  {dataCubeOutDirectory<-""}

if (nchar(dataCubeOutDirectory)==0 | dataCubeOutDirectory=="!temporary" ) {
dataCubeOutDirectory<- tempdir()
}
  
dataCubeFileName  <- paste0("DC-", domainName,"-R-V-",cubeVersion,".TTL")   
dataCubeFile      <- file.path(dataCubeOutDirectory,dataCubeFileName) # Full path to cube

# Get the analysis results - which will be the Cube Observation data       

if (any(metadataSource$compName=="obsFileNameDirectory")) {
obsFileDir<- as.character(metadataSource[ metadataSource$compName=="obsFileNameDirectory", "compLabel" ])
} else  {obsFileDir<-""}

if (nchar(obsFileDir)==0 | obsFileDir=="!example" ) {
obsFileDir<- system.file("extdata/sample-cfg", package="rrdfqbcrnd0")
}

obsFile<- as.character(metadataSource[ metadataSource$compName=="obsFileName", "compLabel" ])
obsFileName<- file.path(obsFileDir,obsFile)
if (! file.exists(obsFileName) ) {
  # consider using try instead
  stop( paste0("Expected file ", obsFileName, " does not exist" ))
  }

obsData <- read.csv(obsFileName)
# Making variable names to lower case
names(obsData)<- tolower(names(obsData))

# Subset to the dimensions, attributes, and measure used to construct the skeleton
skeletonSource <-cubeMetadata[grep("dimension|attribute|measure", cubeMetadata$compType),]

qb.buildSkeleton(store, prefixlist, obsData, skeletonSource)

# Issue How to handle multiple terminlogy files for code list generation?
qb.buildDSD(store, prefixlist, obsData, skeletonSource,
            dsdURIwoprefix=paste0("dataset-",domainName),
            dsdName=paste0("dsd-",domainName),
            extra=list(description=cubeDescription,
              comment=cubeComment,
              label=cubeLabel,
              distribution=dataCubeFileName,
              obsfilename=obsFile,
              title=cubeTitle
               ),
remote.endpoint=endpoint
#            codelist.source=sdtm.terminology
          )

qb.buildObservations(
  store=store,
  prefixlist=prefixlist,
  obsData=obsData,
  skeletonSource=skeletonSource,
  dsdURIwoprefix=paste0("dataset-", domainName),
  dsdName=paste0("dsd-",domainName),
  recode.list=NULL,
  procedure2format=NULL
  )

# Output 
outcube <- save.rdf(store, filename=dataCubeFile, format="TURTLE")
cat("The data cube is stored as ", outcube, "\n")
outcube
}
