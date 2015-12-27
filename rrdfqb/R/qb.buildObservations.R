##' Add observation for RDF Data Cube in rrdf store using values from data frame
##'
##' @inheritParams BuildCubeFromDataFrames
##' @inheritParams qb.buildDSD
##' @param recode.list A list of lists specifying how to recode the
##' value in the data frame. If NULL then the recode.list is generated
##' from the store
##' @param procedure2format A list specifying the format for the
##' descriptive statistics. If NULL then the default list is used
##' @return Always TRUE
##'
##' @export
qb.buildObservations<- function( store, prefixlist, obsData, skeletonSource, dsdURIwoprefix,
                                dsdName, recode.list, procedure2format ) {

    colnames(obsData) <- tolower(colnames(obsData))  ## TODO: not sure if needed - Convert column names to lowercase for later matching

    ## XX this could go into a function
    checkVars<- skeletonSource[ skeletonSource$compType %in% c("dimension","attribute"), "compName" ]
    if (length(setdiff(checkVars,names(obsData)))>0) {
        stop("Expected variables ", setdiff(checkVars,names(obsData)), " not found in data")
    } else {
        dupObs<-duplicated(obsData[, checkVars])
        if (any(dupObs)) {
            ## idea from http://stackoverflow.com/questions/12495345/find-indices-of-duplicated-rows
            dupObsRev<-  duplicated(obsData[,checkVars], fromLast=TRUE)
            print(str(obsData))
            print( obsData[which(dupObs | dupObsRev ), ] )
            stop("Duplicated observations in obsData. Variables that should be unique: ", paste0(checkVars,collapse=", "))
        }
    }
    if (is.null(procedure2format)) {
        procedure2format<- list(
            "mean"="double",
            "stddev"="double",
            "stdev"="double",
            "std"="double",
            "median"="double",
            "min"="double",
            "max"="double",
            "n"="double",
            "q1"="double",
            "q3"="double",
            "count"="double",
            "countdistinct"="double",
            "percent"="double"
            )
    }

    if (is.null(recode.list)) {
        forsparqlprefix<- Get.rq.prefixlist.df( prefixlist )

        ## identify codelists
        codelists.rq<-   GetCodeListSparqlQuery(forsparqlprefix, dsdName )
        ## cat(codelists.rq)
        cube.codelists<- as.data.frame(sparql.rdf(store, codelists.rq), stringsAsFactors=FALSE)

        ## TODO instead of gsub make a more straightforward way
        ## TOTO this involves a new version of the ph.recode function
        ## Next three lines classical error - starting from
        ## cube.codelists$vn<- gsub("prop:","",cube.codelists$p)
        ## to
        ## cube.codelists$vn<- gsub("crnd-dimension:","",cube.codelists$p)
        ## cube.codelists$vn<- gsub("crnd-attribute:","",cube.codelists$p)
        ## cube.codelists$vn<- gsub("crnd-measure:","",cube.codelists$p)
        cube.codelists$vn1<- gsub("crnd-dimension:","",cube.codelists$p)
        cube.codelists$vn2<- gsub("crnd-attribute:","",cube.codelists$vn1)
        cube.codelists$vn<- gsub("crnd-measure:","",cube.codelists$vn2)
        cube.codelists$clc<- gsub("code:","",cube.codelists$cl)
        ## print(cube.codelists)

        recode.list<-by(cube.codelists, cube.codelists$vn, function(x){
            ##  print(x)
            pl<-list();
            for (i in 1:nrow(x)) { pl[[ as.character(x[i,"prefLabel"]) ]] <-  as.character(x[i,"clc"])}
            ##  print(pl)
            pl
        }
        )
    }

    obs.width<- floor(log10(nrow(obsData)))+1
    for (i in 1:nrow(obsData)){
        ## TODO(mja): consider this being the rownames
        obsNum <- paste0("obs",formatC(i,flag="0",width=obs.width))

        add.triple(store,
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixRDF,"type" ),
                   paste0(prefixlist$prefixQB, "Observation"))

        ## Tie dimension to dataset
        add.triple(store,
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixQB, "dataSet"),
                   paste0(prefixlist$prefixDS, dsdURIwoprefix)
                   )  #TODO : change to declared var

        ## Label
        add.data.triple(store,
                        paste0(prefixlist$prefixDS, obsNum),
                        paste0(prefixlist$prefixRDFS, "label"),
                        paste0(i),
                        type="string")

        ## Comment
        add.data.triple(store,
                        paste0(prefixlist$prefixDS, obsNum),
                        paste0(prefixlist$prefixRDFS,"comment"),
                        "Statistic for number of records/Statistics for factor with the dimensions XX",
                        lang="en")

        for (qbdim in skeletonSource[ skeletonSource$compType=="dimension", "compName" ]){
            ##   print(paste0("qbdim :   ", qbdim))
            ##   print(paste0("recode.list[[qbdim]]: ", names(recode.list[[qbdim]]), "=", recode.list[[qbdim]]))

            vCoded <-  ph.recode( obsData[i,qbdim], recode.list[[qbdim]] )
            ## b. Create coded triple
            add.triple(store,
                       paste0(prefixlist$prefixDS, obsNum),
                       paste0(prefixlist$`prefixCRND-DIMENSION`, qbdim),
                       paste0(prefixlist$prefixCODE,vCoded))
        }

        ##--------------- Measure ----------------------------------------------------
        ## Set the format of the Measure based on the Procedure value
        procedure <- paste0(obsData[i,"procedure"])
        xsdFormat<- procedure2format[[ procedure ]]
        if (is.null(xsdFormat)) { stop("Unexpected null value: ", procedure)}

        add.data.triple(store,
                        paste0(prefixlist$prefixDS, obsNum),
                        paste0(prefixlist$`prefixCRND-MEASURE`, "measure"),
                        paste0(obsData[i,"measure"]),
                        xsdFormat)

        ##--------------- Attributes -------------------------------------------------
        for (qbattr in skeletonSource[ skeletonSource$compType=="attribute", "compName" ]){
            if (qbattr %in% c("denominator")) {
                add.data.triple(store,
                                paste0(prefixlist$prefixDS, obsNum),
                                paste0(prefixlist$`prefixCRND-ATTRIBUTE`, "denominator"),
                                paste0(obsData[i,"denominator"]))
            } else {
                add.data.triple(store,
                                paste0(prefixlist$prefixDS, obsNum),
                                paste0(prefixlist$`prefixCRND-ATTRIBUTE`, qbattr),
                                paste0(obsData[i,qbattr]),
                                "string")
            }
        }
    }

    invisible(TRUE)
}