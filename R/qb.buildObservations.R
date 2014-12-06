##' Add observation for RDF Data Cube in rrdf store using values from data frame
##'
##' 
##' @param store 
##' @param prefixlist 
##' @param obsData 
##' @param skeletonSource 
##' @param dsdURIwoprefix 
##' @param recode.list A list of lists specifying how to recode the value in the data frame
##' @param procedure2format A list specifying the format for the descriptive statistics
##' @return Always TRUE
qb.buildObservations<- function( store, prefixlist, obsData, skeletonSource, dsdURIwoprefix, recode.list, procedure2format ) {

colnames(obsData) <- tolower(colnames(obsData))  # Convert column names to lowercase for later matching

for (i in 1:nrow(obsData)){
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

  for (qbdim in skeletonSource[ skeletonSource$compType=="dimension", "compName" ]){
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

invisible(TRUE)
}