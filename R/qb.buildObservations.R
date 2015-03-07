##' Add observation for RDF Data Cube in rrdf store using values from data frame
##'
##' 
##' @inheritParams BuildCubeFromDataFrames
##' @inheritParams qb.buildDSD
##' @param recode.list A list of lists specifying how to recode the value in the data frame. If NULL then the recode.list is generated from the store
##' @param procedure2format A list specifying the format for the descriptive statistics. If NULL then the default list is used
##' @return Always TRUE
qb.buildObservations<- function( store, prefixlist, obsData, skeletonSource, dsdURIwoprefix, dsdName, recode.list, procedure2format ) {

colnames(obsData) <- tolower(colnames(obsData))  ## Convert column names to lowercase for later matching

## XX this could go into a function
checkVars<- skeletonSource[ skeletonSource$compType %in% c("dimension","attribute"), "compName" ]
dupObs<-duplicated(obsData[, checkVars])
if (any(dupObs)) {
## idea from http://stackoverflow.com/questions/12495345/find-indices-of-duplicated-rows
  dupObsRev<-  duplicated(obsData[,checkVars], fromLast=TRUE)
  print(str(obsData))
  print( obsData[which(dupObs | dupObsRev ), ] )
  stop("Duplicated observations in obsData. Varibables that should be unique: ", paste0(checkVars,collapse=", "))
}
                        
if (is.null(procedure2format)) {
    procedure2format<- list("count"="int",
                         "countdistinct"="int",
                            'percent'='double', 
                            'mean'='double', 
                            'stdev'='double', 
                            'min'='double', 
                            'median'='double', 
                            'max'='double'                         
     );

  }

if (is.null(recode.list)) {
forsparqlprefix<- Get.rq.prefixlist.df( prefixlist )

## first find the qb:DataSet
## ds:dataset-dm  a          qb:DataSet ;
## Then find the qb:structure
##         qb:structure         ds:dsd-dm ;
## Then the qb:DataStructureDefinition
## ds:dsd-dm  a       qb:DataStructureDefinition ;
## Which gives the qb:component
##         qb:component  dccs:denominator , dccs:unit , dccs:measure , dccs:saffl , dccs:trt01a , dccs:sex , dccs:race , dccs:procedure , dccs:factor .
## Among these find the qb:ComponentSpecification ;
## dccs:saffl  a         qb:ComponentSpecification ;
##         qb:dimension  prop:saffl .
## which are dimensions and contains qb:DimensionProperty
## prop:saffl  a        rdf:Property , qb:DimensionProperty ;
##         rdfs:label   "Safety Population Flag" ;
##         rdfs:range   code:Saffl ;
##         qb:codeList  code:saffl .
## and have a qb:codeList

## identify codelists
codelists.rq<-   paste(forsparqlprefix,
'
select distinct ?p ?cl ?prefLabel
where {
?DataStructureDefinition a qb:DataStructureDefinition ;
   qb:component ?component .
?component a qb:ComponentSpecification .
?component qb:dimension ?p .
?p qb:codeList ?c .
?c skos:hasTopConcept ?cl .
?cl skos:prefLabel ?prefLabel .
values ( ?DataStructureDefinition ) {
',
paste0( "(", "ds:", dsdName, ")"),
'
}
}
order by ?p ?cl ?prefLabel
'
)

## cat(codelists.rq)
cube.codelists<- as.data.frame(sparql.rdf(store, codelists.rq), stringsAsFactors=FALSE)

## TODO instead of gsub make a more straightforward way
## TOTO this involves a new version of the ph.recode function
cube.codelists$vn<- gsub("prop:","",cube.codelists$p)
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

for (i in 1:nrow(obsData)){
  obsNum <- paste0("obs",i) ## consider this being the rownames

  add.triple(store,
             paste0(prefixlist$prefixDS, obsNum),
             paste0(prefixlist$prefixRDF,"type" ),
             paste0(prefixlist$prefixQB, "Observation"))
  ## Tie dimension to dataset
  add.triple(store,
             paste0(prefixlist$prefixDS, obsNum),
             paste0(prefixlist$prefixQB, "dataSet"),
             paste0(prefixlist$prefixDS, dsdURIwoprefix))  #TODO : CHange to declared var
  ## Label
  add.data.triple(store,
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixRDFS, "label"),
                   paste0(i))

  for (qbdim in skeletonSource[ skeletonSource$compType=="dimension", "compName" ]){
  ##   print(paste0("qbdim :   ", qbdim))
  ##   print(paste0("recode.list[[qbdim]]: ", names(recode.list[[qbdim]]), "=", recode.list[[qbdim]]))
  
    vCoded <-  ph.recode( obsData[i,qbdim], recode.list[[qbdim]] )
    ## b. Create coded triple
    add.triple(store,
                  paste0(prefixlist$prefixDS, obsNum),
                  paste0(prefixlist$prefixPROP, qbdim),
                  paste0(prefixlist$prefixCODE,vCoded))
  }

  #--------------- Measure ----------------------------------------------------
  ## Set the format of the Measure based on the Procedure value
  procedure <- paste0(obsData[i,"procedure"])
  xsdFormat= procedure2format[[ procedure ]]

   add.data.triple(store,
                   paste0(prefixlist$prefixDS, obsNum),
                   paste0(prefixlist$prefixPROP, "measure"),
                   paste0(obsData[i,"measure"]),
                   xsdFormat)

   #--------------- Attributes -------------------------------------------------

  ## make attributes generic

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
