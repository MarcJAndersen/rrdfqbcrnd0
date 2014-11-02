
##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param s 
##' @param strict 
##' @return 
##' @author ResultMetaData@Phuse

capitalize <- function(s, strict = FALSE) {
# suggested R online help /library/base/html/chartr.html
    cap <- function(s) paste(toupper(substring(s, 1, 1)),
                  {s <- substring(s, 2); if(strict) tolower(s) else s},
                             sep = "", collapse = " " )
    sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}


# TODO - make better way of doing this
encodetouri<- function( s ) {
  gsub(" |'|,|\\(|\\)","_", s )
}

ph.recode<- function( s, l ) {
  if (s %in% names(l)) {
    return(l[[as.character(s)]])  # as.character !!!
 } else {
    warning( paste0( s, " -- ", 'CODING ERROR- no decode value'))
    'CODING ERROR- no decode value'
  }
}
  


buildCodelist <- function(store,prefixlist,obsData,codeType,nciDomainValue,dimName)
{
  dimName <- tolower(dimName)        # dimName in all lower case is default
  capDimName <- capitalize(dimName)  # capDim used in Class name
  ################
  # Obtain codes #
  #############################################################################
  # codeNoBlank - used in URI formation
  # SDTM: cdiscSumbissionValue -> code  (the term to be coded)
  if (codeType=="DATA")
  {
    codeSource <- as.data.frame(unique(obsData[,dimName])) #Unique values as dataframe
    colnames(codeSource) <- ("code")  # Rename to match SDTM approach
  }
  if (codeType=="SDTM")
  {
    query = paste0(' prefix : <http://rdf.cdisc.org/sdtm-terminology#> 
      prefix cts:   <http://rdf.cdisc.org/ct/schema#> 
		  prefix xsd:   <http://www.w3.org/2001/XMLSchema#>
		  prefix mms:   <http://rdf.cdisc.org/mms#> 
		  select ?nciDomain ?cdiscDefinition ?code ?cdiscSynonyms ?nciCode
             ?nciPreferredTerm 
  		where
		  { 
         ?nciDomain mms:inValueDomain :', nciDomainValue, '  .
       	 ?nciDomain cts:cdiscDefinition      ?cdiscDefinition .
    		 ?nciDomain cts:cdiscSubmissionValue ?code .
         OPTIONAL 
         {
            ?nciDomain cts:cdiscSynonyms        ?cdiscSynonyms .
         }
         ?nciDomain cts:nciCode              ?nciCode .
         ?nciDomain cts:nciPreferredTerm     ?nciPreferredTerm
		  }'
      )
      
    codeSource = as.data.frame(sparql.remote(endpoint, query)) 
  }
#  codeSource[,"codeNoBlank"]<- toupper(gsub(" ","_",codeSource[,"code"]))
  for (i in 1:nrow(codeSource)) {   codeSource[i,"codeNoBlank"]<- encodetouri( as.character(codeSource[i,"code"])) }

  #############################################################################
  # SKELETON
  # --------- Class ---------
  add.triple(store, 
             paste0(prefixlist$prefixCODE, capDimName),
             paste0(prefixlist$prefixRDF,"type" ), 
             paste0(prefixlist$prefixOWL, "Class"))
  add.triple(store, 
             paste0(prefixlist$prefixCODE, capDimName),
             paste0(prefixlist$prefixRDF,"type" ), 
             paste0(prefixlist$prefixRDFS, "Class"))
  add.triple(store, 
             paste0(prefixlist$prefixCODE, capDimName),
             paste0(prefixlist$prefixRDFS, "subClassOf"), 
             paste0(prefixlist$prefixSKOS, "Concept"))
  # Cross reference between the Class (capDimName) and the codelist (dimName)
  add.triple(store, 
             paste0(prefixlist$prefixCODE, capDimName),
             paste0(prefixlist$prefixRDFS, "seeAlso"), 
             paste0(prefixlist$prefixCODE, dimName))
  add.data.triple(store, 
                  paste0(prefixlist$prefixCODE, capDimName),
                  paste0(prefixlist$prefixRDFS,"label"),
                  paste0("Class for code list: ", dimName),
                  lang="en")
  add.data.triple(store, 
                  paste0(prefixlist$prefixCODE, capDimName),
                  paste0(prefixlist$prefixRDFS,"comment"),
                  paste0("Specifies the ", dimName, " for each observation"),
                  lang="en")

   # --------- ConceptScheme ---------
   add.triple(store, 
              paste0(prefixlist$prefixCODE,dimName),
              paste0(prefixlist$prefixRDF,"type" ), 
              paste0(prefixlist$prefixSKOS, "ConceptScheme"))
   add.data.triple(store, 
                   paste0(prefixlist$prefixCODE,dimName),
                   paste0(prefixlist$prefixSKOS,"prefLabel"),
                   paste0("Codelist scheme: ", dimName),
                   lang="en")
   add.data.triple(store, 
                   paste0(prefixlist$prefixCODE,dimName),
                   paste0(prefixlist$prefixRDFS,"label"),
                   paste0("Codelist scheme: ", dimName),
                   lang="en")
   add.data.triple(store, 
                   paste0(prefixlist$prefixCODE,dimName),
                   paste0(prefixlist$prefixSKOS,"note"),
                   paste0("Specifies the ", dimName, " for each observation, group of obs. or all categories (_ALL_)label "),
                   lang="en")
   # skos:notation is uppercase by convention. Eg: CL_SEX, CL_RACE
   add.data.triple(store, 
                   paste0(prefixlist$prefixCODE,dimName),
                   paste0(prefixlist$prefixSKOS,"notation"),
                   paste0("CL_",toupper(dimName)))

  # --------- hasTopConcept ---------  
  # For each unique code
  for (i in 1:nrow(codeSource))
  {
    add.triple(store, 
               paste0(prefixlist$prefixCODE,dimName),
               paste0(prefixlist$prefixSKOS, "hasTopConcept"),
               paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]))
  }
  # _ALL_  - topConcept for SUM of non-missing values.
  #        Example: race-_ALL_,  sex-_ALL_ etc.   
  #        Cross reference: _ALL_ below for each code value
  # TODO: Create function that creates _ALL_ based on either presence in data 
  #       or function parameter. 
  #       It is merely concidental that the Terminology values in the current 
  #       example both have _ALL_ .  This logic MUST change.
  if (codeType=="SDTM")
  {
    add.triple(store, 
              paste0(prefixlist$prefixCODE,dimName),
              paste0(prefixlist$prefixSKOS, "hasTopConcept"),
              paste0(prefixlist$prefixCODE,dimName,"-_ALL_"))
  }
  #############################################################################
  # Code values
  for (i in 1:nrow(codeSource))
  {
    add.triple(store, 
               paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
               paste0(prefixlist$prefixRDF,"type" ), 
               paste0(prefixlist$prefixSKOS, "Concept"))
    add.triple(store, 
               paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
               paste0(prefixlist$prefixRDF,"type" ), 
               paste0(prefixlist$prefixCODE, capDimName))
    add.triple(store, 
               paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
               paste0(prefixlist$prefixSKOS,"topConceptOf"),
               paste0(prefixlist$prefixCODE, dimName))
    add.triple(store, 
               paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
               paste0(prefixlist$prefixSKOS,"inScheme"),
               paste0(prefixlist$prefixCODE, dimName))
    add.data.triple(store, 
                      paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
                      paste0(prefixlist$prefixSKOS,"prefLabel"),
                    paste0(codeSource[i,"code"]))

    # Document when the codes come from the source data without reconciliation
    #   against other sources.
    if (codeType=="DATA")
    {
       add.data.triple(store, 
                    paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
                    paste0(prefixlist$prefixRDFS, "comment"), 
                    "Coded values from data source. No reconciliation against another source",
                    lang="en")
    }
    # SDTM Terminology
    #  Additional triples availble from the SDTM Terminology file.
    if (codeType=="SDTM")
    {
      add.data.triple(store, 
                    paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
                    paste0(prefixlist$prefixCTS,"cdiscSynonyms"),
                    paste0(codeSource[i,"cdiscSynonyms"]))
   
      # Remove the prefix colon to specify the value directly (without prefix)
      nciDomain<-gsub(":","",codeSource[i,"nciDomain"])
            
      # ?  MMS may be incorrect here. How refer back to sdtm-terminology?
      add.data.triple(store, 
                    paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
                    paste0(prefixlist$prefixMMS,"nciDomain"),
                    paste(nciDomain))
     add.data.triple(store, 
                    paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
                    paste0(prefixlist$prefixSKOS,"prefLabel"),
                    paste0(codeSource[i,"code"]))
     add.data.triple(store, 
                    paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
                    paste0(prefixlist$prefixCTS,"cdiscDefinition"),
                    paste0(codeSource[i,"cdiscDefinition"]))
   
     add.data.triple(store, 
                    paste0(prefixlist$prefixCODE,dimName,"-",codeSource[i,"codeNoBlank"]),
                    paste0(prefixlist$prefixCTS,"cdiscSubmissionValue"),
                    paste0(codeSource[i,"code"]))
     # _ALL_  
     #   Cross reference:  _ALL_ creation for TopConcept. 
     # TODO: Create function that creates _ALL_ based on either presence in data 
     #       or function parameter. 
     #       It is merely concidental that the Terminology values in the current 
     #       example both have _ALL_ .  This logic MUST change.
      add.triple(store, 
                 paste0(prefixlist$prefixCODE, dimName,"-_ALL_"),
                 paste0(prefixlist$prefixRDF,"type" ), 
                 paste0(prefixlist$prefixSKOS,"Concept"))
      add.triple(store, 
                 paste0(prefixlist$prefixCODE, dimName,"-_ALL_"),
                 paste0(prefixlist$prefixRDF,"type" ), 
                 paste0(prefixlist$prefixCODE, capDimName))
     add.triple(store, 
                 paste0(prefixlist$prefixCODE, dimName,"-_ALL_"),
                 paste0(prefixlist$prefixSKOS,"topConceptOf"),
                 paste0(prefixlist$prefixCODE, dimName))
      add.data.triple(store, 
                      paste0(prefixlist$prefixCODE, dimName,"-_ALL_"),
                      paste0(prefixlist$prefixSKOS,"prefLabel"),
                      "_ALL_")
      add.triple(store, 
                 paste0(prefixlist$prefixCODE, dimName,"-_ALL_"),
                 paste0(prefixlist$prefixSKOS,"inScheme"),
                 paste0(prefixlist$prefixCODE, dimName))
      add.data.triple(store, 
                      paste0(prefixlist$prefixCODE, dimName,"-_ALL_"),
                      paste0(prefixlist$prefixRDFS, "comment"), 
                      "NON-CDISC: Represents the SUM of all non-missing codelist categories. Does not include category U (unknown) or missing values.",
                     lang="en")
    }
  }
} # end buildCodelist()

qb.addprefix<- function(prefixSource) {
for (i in 1:nrow(prefixSource))
{
  tempName <-paste0("prefix",toupper(prefixSource[i,"prefix"]))
  assign(tempName,as.character(prefixSource[i,"namespace"]), envir=globalenv()) # MJA 2014-10-13 
  # Use as.character to get the enquoting needed by the function 
  add.prefix(store,as.character(prefixSource[i,"prefix"]), 
             as.character(prefixSource[i,"namespace"]))
}
invisible(TRUE)
}

qb.def.prefixlist<- function(store, prefixSource) {
pl<- list();

for (i in 1:nrow(prefixSource))
{

  pl[[ paste0("prefix",toupper(prefixSource[i,"prefix"])) ]] <-
      as.character(prefixSource[i,"namespace"])

  # Use as.character to get the enquoting needed by the function 
  add.prefix(store, as.character(prefixSource[i,"prefix"]), 
                    as.character(prefixSource[i,"namespace"]))
}
return(pl)
}


qb.buildSkeleton<- function(store, prefixlist,obsData, skeletonSource) {
# Loop through to create Property and Component specs

# print(skeletonSource)

for (i in 1:nrow(skeletonSource))
{
   component <- tolower(skeletonSource[i,"compType"])
   ##DEBUG message ("Component:", component)
  #------------------  Dimensions ---------------------------------------------
  if (component == "dimension")
  {
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
  else if (component =="measure")
  {
    ##DEBUG message ("Building: Measure")
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
  else if (component == "attribute")
  {
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
  }
  else
  {
    message ("***ERROR: Undefined Component Type in compType column. Check source file")
  }
}# End looping through each component
invisible(TRUE)
}

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
}

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
 )
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
              dimName=skeletonSource[i,"compName"] )
}
  
}

}


qb.buildObservations<- function( store, prefixlist, obsData, skeletonSource, dsdURIwoprefix, recode.list, procedure2format ) {

colnames(obsData) <- tolower(colnames(obsData))  # Convert column names to lowercase for later matching

for (i in 1:nrow(obsData))
{
  obsNum <- paste0("obs",i) # consider this being the rownames
  
  add.triple(store, 
             paste0(prefixlist$prefixDS, obsNum), 
             paste0(prefixlist$prefixRDF,"type" ), 
             paste0(prefixlist$prefixQB, "Observation"))
  # Tie dimension to dataset
  add.triple(store, 
             paste0(prefixlist$prefixDS, obsNum), 
             paste0(prefixlist$prefixQB, "dataSet"), 
             paste0(prefixlist$prefixDS, dsdURIwoprefix))  #TODO : CHange to declared var
  # Label
  add.data.triple(store, 
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixRDFS, "label"), 
                   paste0(i))

for (qbdim in skeletonSource[ skeletonSource$compType=="dimension", "compName" ]) {
#   print(paste0("qbdim :   ", qbdim))
#   print(paste0("recode.list[[qbdim]]: ", names(recode.list[[qbdim]]), "=", recode.list[[qbdim]]))
  
  vCoded <-  ph.recode( obsData[i,qbdim], recode.list[[qbdim]] )
  # b. Create coded triple
  add.triple(store, 
                paste0(prefixlist$prefixDS, obsNum),
                paste0(prefixlist$prefixPROP, qbdim), 
                paste0(prefixlist$prefixCODE,vCoded))
}
    


  #--------------- Measure ----------------------------------------------------
  # Set the format of the Measure based on the Procedure value

  procedure <- paste0(obsData[i,"procedure"])
  xsdFormat= procedure2format[[ procedure ]]

   add.data.triple(store, 
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixPROP, "measure"), 
                   paste0(obsData[i,"measure"]),
                   xsdFormat)
   #--------------- Attributes -------------------------------------------------
   add.data.triple(store, 
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixPROP, "unit"), 
                   paste0(obsData[i,"unit"]),
                   "string")
   add.data.triple(store, 
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixPROP, "denominator"), 
                   paste0(obsData[i,"denominator"]))
}

}

