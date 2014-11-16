##' Add information on creation following the PAV ontology
##'
##' More text to be written ....
##' @param store 
##' @param prefixlist 
##' @param obsData 
##' @param skeletonSource 
##' @param dsdURIwoprefix 
##' @param dsdName 
##' @param PAVnodes A list with member names createdOn, createdBy, pavVersion, createdWith, providedBy
##' @return Always TRUE
##' @author Tim Williams, Marc Andersen
##' @examples 
qb.buildDSD.PAV<- function(
store, prefixlist,
obsData,
skeletonSource,
dsdURIwoprefix="dataset-demog",
dsdName="dsd-demog",
PAVnodes=list(
createdOn=strftime(Sys.time(),"%Y-%m-%dT%H:%M:%S%z"),
createdBy="Tim Williams",
pavVersion="0.0.0",
createdWith="R 3.1.1, Program BuildCube.R and dependencies",
providedBy="PhUSE Results Metadata Working Group"
)
) {
                                        # Timestamp
# Timestamp for cube creation (for use in dct:issued)
# now_ct <- Sys.time()
# Reformat for xsd:timestamp as 2014-09-04T16:34:27-0400
# ?%z needed MA issuedTime <-strftime(now_ct,"%Y-%m-%dT%H:%M:%S%z")
# For XSD format: add colon before minutes
# ?needed MA issuedTime<-gsub("(\\d\\d)$", ":\\1",issuedTime)

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPAV, "createdOn"),
                PAVnode$createdOn,
                "dateTime")

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPAV, "createdBy"),
                PAVnode$createdBy,
                "string")

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPAV, "version"),
                pavVersion)

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPAV, "createdWith"),
                PAVnodes$createdWith)

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPAV, "createdBy"),
                PAVnodes$createdBy,
                "string"  )

invisible(TRUE)
}

