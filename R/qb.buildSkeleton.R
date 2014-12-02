##' Create RDF data cube skeleton from 
##'
##' The skeletonSource is expected to contain compType corresponding to the compoents in
##' an RDF data cube: dimension, measure and attribute.
##' Consider: shorten code by introducing variables for properties etc. MJA 16-11-2014
##' @param store 
##' @param prefixlist 
##' @param obsData 
##' @param skeletonSource A data.frame with columns compType, compName, compLabel
##' @return always TRUE
##' @author Tim Williams, Marc Andersen
qb.buildSkeleton<- function(store, prefixlist,obsData, skeletonSource) {
# Loop through to create Property and Component specs

for (i in 1:nrow(skeletonSource)){
   component <- tolower(skeletonSource[i,"compType"])
   ##DEBUG message ("Component:", component)
  #------------------  Dimensions ---------------------------------------------
  if (component == "dimension"){
    # Class name is the compName with an uppercase first letter.
    compNameClass <- capitalize(toString(skeletonSource[i,"compName"]))
    ##DEBUG message ("Building: Dimension")
    #  Example: prop:trt01a a qb:DimensionProperty
    add.triple(store,
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixQB, "DimensionProperty"))

    add.triple(store,
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixRDF, "Property"))

    # Label for property. Example:   rdfs:label "Treatment Arm"@en .
    add.data.triple(store,
                    paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
                    "http://www.w3.org/2000/01/rdf-schema#label",
                    paste0(skeletonSource[i,"compLabel"]))

    # CODELIST triples for when codelist is present. Currently hardcoded for race,sex

    ##DEBUG message ("DEBUG: Skeleton compName:",skeletonSource[i,"compName"] )

    # qb:codeList and range to  dimensions. If some dimensions do not have codelists
    # then invoke IF logic as per earlier development code when only sex and race
    # had codelists.
    #if (skeletonSource[i,"compName"] %in% c("sex", "race"))
    #{

    # Add qb:codelist and rdfs:range
      add.triple(store,
                 paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
                 paste0(prefixlist$prefixQB, "codeList"),
                paste0(prefixlist$prefixCODE,skeletonSource[i,"compName"]))

      add.triple(store,
                      paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
                      "http://www.w3.org/2000/01/rdf-schema#range",
                      paste0(prefixlist$prefixCODE,compNameClass))
    #}
    # qb:ComponentSpecification
    #     Example: dccs:trt01a a qb:ComponentSpecification ;
    #                          qb:dimension prop:trt01a .
    add.triple(store,
               paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixQB, "ComponentSpecification"))
    add.triple(store,
               paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixQB, "dimension"),
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]))

    add.data.triple(store,
               paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
               "http://www.w3.org/2000/01/rdf-schema#label",
               paste0(skeletonSource[i,"compLabel"]))
  }
  #------------------  Measure ------------------------------------------------
  else if (component =="measure"){
    # Property
    #  Example: prop:trt01a a qb:DimensionProperty
    add.triple(store,
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixQB, "MeasureProperty"))

    add.triple(store,
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixRDF, "Property"))
    # Label for property
    # Example: prop:measure a qb:MeasureProperty ;
    #                      rdfs:label "Value of the statistical measure"@en .
    add.data.triple(store,
                    paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
                    "http://www.w3.org/2000/01/rdf-schema#label",
                    paste0(skeletonSource[i,"compLabel"]))
    # ComponentSpecification
    add.triple(store,
               paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixQB, "ComponentSpecification"))

    add.triple(store,
               paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixQB, "measure"),
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]))

    add.data.triple(store,
                    paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
                    "http://www.w3.org/2000/01/rdf-schema#label",
                    paste0(skeletonSource[i,"compLabel"]))
  }
  #------------------ Attributes ----------------------------------------------
  else if (component == "attribute"){
    ##DEBUG message ("Building: Attribute")
    # Property
    add.triple(store,
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixQB, "AttributeProperty") )
    add.triple(store,
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixRDF, "Property"))
    # Label for property
    add.data.triple(store,
                    paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]),
                    "http://www.w3.org/2000/01/rdf-schema#label",
                    paste0(skeletonSource[i,"compLabel"]))
    # ComponentSpecification
    add.triple(store,
               paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixRDF,"type" ),
               paste0(prefixlist$prefixQB, "ComponentSpecification"))
    add.triple(store,
               paste0(prefixlist$prefixDCCS, skeletonSource[i,"compName"]),
               paste0(prefixlist$prefixQB, "attribute"),
               paste0(prefixlist$prefixPROP, skeletonSource[i,"compName"]))
    }else{
      message ("***ERROR: Undefined Component Type in compType column. Check source file")
  }
}# End looping through each component

invisible(TRUE)
}