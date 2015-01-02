##' Add information on creation following the PAV ontology
##'
##' @param store RRDF store
##' @param prefixlist list of prefixes
##' @param obsData the data as a dataframe
##' @param skeletonSource skeleton source as data frame
##' @param dsdURIwoprefix DSD URI
##' @param dsdName DSD name
##' @param PAVnodes A list with member names createdOn, createdBy, pavVersion, createdWith, providedBy
##' @return Always TRUE
##' @author Tim Williams, Marc Andersen
qb.buildDSD.PAV<- function(
store,
prefixlist,
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
                PAVnodes$createdOn,
                "dateTime")

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPAV, "createdBy"),
                PAVnodes$createdBy,
                "string")

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPAV, "version"),
                PAVnodes$pavVersion)

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

