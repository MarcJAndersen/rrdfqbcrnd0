##' Add RDF data cube codelist to RDF store
##'
##' This function could be split into two function corresponding to the usage.
##' @param store The name for the rrdf store
##' @param prefixlist R list of the prefixes
##' @param obsData Data Frame with the data for which the code list is to be generated
##' @param codeType Character "DATA" or "SDTM".
##' "DATA" to derive code list from the data.
##' "SDTM" to derive the code list from the rdf.cdisc documentation using a SPARQL query
##' @param nciDomainValue When codetype="DATA" the nciDomain used for identifying the codelist
##' @param dimName the name of the dimension - for codeType="DATA" the name of the variable in the data frame ObsData
##' @param remote.endpoint Used when codetype="SDTM" to give the URL for the remote endpoint. If NULL then the local rdf.cdisc.store from the environment is used.
##' @return Alway TRUE - to be corrected
##' @author Tim Williams, Marc Andersen
buildCodelist <- function(store,prefixlist,obsData,codeType,nciDomainValue,dimName, remote.endpoint)
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

    if (! is.null(remote.endpoint) ) {
    codeSource = as.data.frame(sparql.remote(remote.endpoint, query))
  } else {
    Get.env.cdiscstandards.R() # this is only needed first time the local environment is used
    codeSource = as.data.frame(sparql.rdf(env$cdiscstandards, query))
    ## message("Result of sparql using local store")
    ## print(codeSource)
    ## print(str(codeSource))
    ## print(typeof(codeSource))
    ## print(is.data.frame(codeSource))
  }
  }
#  codeSource[,"codeNoBlank"]<- toupper(gsub(" ","_",codeSource[,"code"]))
##    print(codeSource)
##  print(names(codeSource))
  for (i in 1:nrow(codeSource)) {
##    message( i, ": ", codeSource[i,"code"] )
    codeSource[i,"codeNoBlank"]<- encodetouri( as.character(codeSource[i,"code"]))
  }

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

  invisible(TRUE)
} 

