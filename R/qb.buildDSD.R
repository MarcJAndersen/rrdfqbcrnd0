##' Add RDF Data Set Specification (DSD) to the rrdf store
##'
##' More text
##' @param store 
##' @param prefixlist 
##' @param obsData 
##' @param skeletonSource 
##' @param dsdURIwoprefix 
##' @param dsdName 
##' @param extra A list with member names: description, comment, label , distribution, obsfilename, title 
##' @param remote.endpoint 
##' @return Always TRUE
qb.buildDSD<- function(store,
prefixlist,
obsData,
skeletonSource,
dsdURIwoprefix="dataset-demog",
dsdName="dsd-demog",
extra=list(
  description="Cube with 6 Dimensions (factor, procedure, race, saffl, sex, trt01a), 2 Attributes (denominator, unit) and 1 measure (measure)",
comment="Example Demographics data supplied by Ian Fleming via R.. All dimensions have a Codelist and Range specified. Attributes applied from source data. Attributes as VALUES instead of URIs. Changes in current version:  codelists for factor, procedure, saffl, trt01a",
label="Demographics results data set.",
distribution=dataCubeFileName,
obsfilename="the name of the input file",
title="Demographics Analysis Results"
 ),
remote.endpoint="http://localhost:3030/cdisc/query"
) {
# -------------  DSD Component ------------------------------------------------
# Loop through to create the dsd component for each dimension, measure, attribute
# Written as a separate loop to keep the dsd more concise in the output file
# Example triple:  ds:dsd-demog qb:component dccs:race
add.triple(store,
           paste0(prefixlist$prefixDS, dsdName),
           paste0(prefixlist$prefixRDF,"type" ),
           paste0(prefixlist$prefixQB, "DataStructureDefinition"))

for (i in 1:nrow(skeletonSource))
{
  component <- skeletonSource[i,"compType"]
  add.triple(store,
             paste0(prefixlist$prefixDS, dsdName),
             paste0(prefixlist$prefixQB, "component"),
             paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]))
}
#########################
# qb:DataSet definition #
###############################################################################

add.triple(store,
           paste0(prefixlist$prefixDS, dsdURIwoprefix),
           paste0(prefixlist$prefixQB, "structure"),
           paste0(prefixlist$prefixDS, dsdName))
add.triple(store,
           paste0(prefixlist$prefixDS, dsdURIwoprefix),
           paste0(prefixlist$prefixRDF,"type" ),
           paste0(prefixlist$prefixQB, "DataSet"))


# turn this into a for looping over all values in the list extra -
# have to solve how the prefix is included - when generating the list or by
# resolving the prefixes in the list

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixDCT, "title"),
                extra$title,
                "string")
add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixDCT, "description"),
                extra$description,
                lang="en")

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixRDFS, "comment"),
                extra$comment,
                lang="en")
add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixRDFS, "label"),
                extra$label,
                lang="en")
add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixDCAT, "distribution"),
                extra$distribution)

add.data.triple(store,
                paste0(prefixlist$prefixDS, dsdURIwoprefix),
                paste0(prefixlist$prefixPROV, "wasDerivedFrom"),
                extra$obsfilename
                )  # The source .CSV data file


# print(str(obsData))

for (i in 1:nrow(skeletonSource))
{

if (skeletonSource[i,"compType"]=="dimension") {
buildCodelist(store,
              prefixlist,
              obsData,
              codeType=skeletonSource[i,"codeType"],
              nciDomainValue=skeletonSource[i,"nciDomainValue"],
              dimName=skeletonSource[i,"compName"],
              remote.endpoint=remote.endpoint)
}

}

invisible(TRUE)
}

