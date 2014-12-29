##' Build a RDF data cube based on specification 
##'
##' 
##' @param cubeMetadata data.frame with metadata
##' @param obsData data.frame with observations
##' @param common.prefixes data.frame commom prefixes, if NULL a built in default value is used
##' @param endpoint Used for determined codelist for dimensions. When
##' codetype="SDTM" to give the URL for the remote endpoint. If NULL
##' then the local rdf.cdisc.store from the environment is used.
##' @return The filename for the generated turtle file

BuildCubeFromDataFrames<- function(cubeMetadata, obsData, common.prefixes=NULL, endpoint=NULL) {
  

# Cube metadata. 
cubeDescription<- GetValueFromMetadata(cubeMetadata,compType="metadata",compName="description",defaultValue="** no description given **" )
cubeComment<- GetValueFromMetadata(cubeMetadata,compType="metadata",compName="comment",defaultValue="** no comment given **" )
cubeLabel<- GetValueFromMetadata(cubeMetadata,compType="metadata",compName="label",defaultValue="** no label given **" )
cubeTitle<- GetValueFromMetadata(cubeMetadata,compType="metadata",compName="title",defaultValue="** no title given **" )
domainName<- GetValueFromMetadata(cubeMetadata,compType="metadata",compName="domainName",defaultValue="notgiven" )
obsFile<- GetValueFromMetadata(cubeMetadata,compType="metadata",compName="obsFileName",defaultValue="notgiven" )

# Output file format: DC-<domain>-R-Vn-n-(n).TTL . Also used in dcat:distribution
# NOTE: For pav:Version (dot, notdash) and output file name
cubeVersion <- gsub("\\.","-",GetValueFromMetadata(cubeMetadata,compType="metadata",compName="cubeVersion",defaultValue="0.0.0" ))

dataCubeOutDirectory<- GetValueFromMetadata(cubeMetadata,compType="metadata",compName="dataCubeOutDirectory",defaultValue=tempdir() )

if (dataCubeOutDirectory=="!temporary" ) {
dataCubeOutDirectory<- tempdir()
}
  
dataCubeFileName  <- paste0("DC-", domainName,"-R-V-",cubeVersion,".TTL")   
dataCubeFile      <- file.path(dataCubeOutDirectory,dataCubeFileName) # Full path to cube

# Get the analysis results - which will be the Cube Observation data       

# Forcing variable names to lower case
# TODO: consider if this should be handled else where
names(obsData)<- tolower(names(obsData))

# Subset to the dimensions, attributes, and measure used to construct the skeleton
skeletonSource <-cubeMetadata[grep("dimension|attribute|measure", cubeMetadata$compType),]

# If common.prefixes is not set, then use built-in defaults
if (is.null(common.prefixes)) {
  data(qbCDISCprefixes)
  common.prefixes <-data.frame(
  prefix=names(qbCDISCprefixes),
  namespace=as.character(qbCDISCprefixes)
  )
}  

# Domain-specific prefixes for prop/, dccs/ and dataset/
# Domain-independent for code/
# TODO: ensure that is meaningfill to use tolower(domainName)
custom.prefixes <-Get.qb.crnd.prefixes(tolower(domainName))
prefixes<- rbind(common.prefixes, custom.prefixes)                                                

store <- new.rdf(ontology=FALSE)  # Initialize

# Register prefixes and return prefixlist
# Examples: prefixQB   holds value http://purl.org/linked-data/cube#
#             prefixRDFS holds value http://www.w3.org/2000/01/rdf-schema#

prefixlist<- qb.def.prefixlist(store, prefixes)


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
outcube
}
