Introduction
============

This is not a good example yet - there is not real message nor flow in the document. TODO(mja): fix it.

Create DEMO sample table from CSV file
======================================

This script creates the result and codelist for a simple DEMO table.

``` r
library(rrdfancillary)
devtools::load_all(pkg="../..")
```

    ## Loading rrdfqbcrndex

``` r
library(rrdfqbcrnd0)
library(rrdfqb)

cubeVocabularyFn<- system.file("extdata/cube-vocabulary-rdf","cube.ttl", package="rrdfqb")

dataCubeFile<- system.file("extdata/sample-rdf", "DC-DEMO-sample.ttl", package="rrdfqbcrndex")

store <- new.rdf()  # Initialize

cat("Loading cube specfication from ", cubeVocabularyFn, "\n")
```

    ## Loading cube specfication from  /home/ma/R/x86_64-redhat-linux-gnu-library/3.2/rrdfqb/extdata/cube-vocabulary-rdf/cube.ttl

``` r
tmp<- load.rdf(cubeVocabularyFn, format="TURTLE", appendTo= store)

cat("Loading cube from ", dataCubeFile, "\n")
```

    ## Loading cube from  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DC-DEMO-sample.ttl

``` r
tmp<- load.rdf(dataCubeFile, format="TURTLE", appendTo= store)

summarize.rdf(store)
```

    ## [1] "Number of triples: 3375"

Execute the DEMO\* SPARQL queries
---------------------------------

``` r
rqFiles<- system.file("extdata/sample-rdf", list.files(system.file("extdata/sample-rdf",  package="rrdfqbcrndex"), pattern="DEMO.+rq$"),  package="rrdfqbcrndex")

for (rqFile in rqFiles) {
    cat("File ", rqFile, "\n")
    rq<- paste0(readLines(rqFile),collapse="\n")
    res<- data.frame(sparql.rdf(store, rq),stringsAsFactors=FALSE)
    print(nrow(res))
    if (nrow(res)>0) {
        print(knitr::kable(res))
        }
}
```

    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOattributes.rq 
    ## [1] 6
    ## 
    ## 
    ## p                          
    ## ---------------------------
    ## crnd-attribute:cellpartno  
    ## crnd-attribute:measurefmt  
    ## crnd-attribute:colno       
    ## crnd-attribute:denominator 
    ## crnd-attribute:unit        
    ## crnd-attribute:rowno       
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOcodelist.rq 
    ## [1] 43
    ## 
    ## 
    ## DataStructureDefinition   dimension                  cprefLabel                   cl                                                    clprefLabel                                 vn          vct    vnop                      vnval                                     
    ## ------------------------  -------------------------  ---------------------------  ----------------------------------------------------  ------------------------------------------  ----------  -----  ------------------------  ------------------------------------------
    ## ds:dsd-DEMO               crnd-dimension:agegr1      Codelist scheme: agegr1      code:agegr1-65-80                                     65-80                                       agegr1      DATA   rrdfqbcrnd0:ADSL_AGEGR1   65-80                                     
    ## ds:dsd-DEMO               crnd-dimension:agegr1      Codelist scheme: agegr1      code:agegr1-_65                                       <65                                         agegr1      DATA   rrdfqbcrnd0:ADSL_AGEGR1   <65                                       
    ## ds:dsd-DEMO               crnd-dimension:agegr1      Codelist scheme: agegr1      code:agegr1-_80                                       >80                                         agegr1      DATA   rrdfqbcrnd0:ADSL_AGEGR1   >80                                       
    ## ds:dsd-DEMO               crnd-dimension:agegr1      Codelist scheme: agegr1      code:agegr1-_ALL_                                     _ALL_                                       agegr1      DATA   rrdfqbcrnd0:ADSL_AGEGR1   NA                                        
    ## ds:dsd-DEMO               crnd-dimension:agegr1      Codelist scheme: agegr1      code:agegr1-_NONMISS_                                 _NONMISS_                                   agegr1      DATA   rrdfqbcrnd0:ADSL_AGEGR1   NA                                        
    ## ds:dsd-DEMO               crnd-dimension:ethnic      Codelist scheme: ethnic      code:ethnic-HISPANIC_OR_LATINO                        HISPANIC OR LATINO                          ethnic      DATA   rrdfqbcrnd0:ADSL_ETHNIC   HISPANIC OR LATINO                        
    ## ds:dsd-DEMO               crnd-dimension:ethnic      Codelist scheme: ethnic      code:ethnic-NOT_HISPANIC_OR_LATINO                    NOT HISPANIC OR LATINO                      ethnic      DATA   rrdfqbcrnd0:ADSL_ETHNIC   NOT HISPANIC OR LATINO                    
    ## ds:dsd-DEMO               crnd-dimension:ethnic      Codelist scheme: ethnic      code:ethnic-_ALL_                                     _ALL_                                       ethnic      DATA   rrdfqbcrnd0:ADSL_ETHNIC   NA                                        
    ## ds:dsd-DEMO               crnd-dimension:ethnic      Codelist scheme: ethnic      code:ethnic-_NONMISS_                                 _NONMISS_                                   ethnic      DATA   rrdfqbcrnd0:ADSL_ETHNIC   NA                                        
    ## ds:dsd-DEMO               crnd-dimension:factor      Codelist scheme: factor      code:factor-_ALL_                                     _ALL_                                       factor      DATA   NA                        NA                                        
    ## ds:dsd-DEMO               crnd-dimension:factor      Codelist scheme: factor      code:factor-_NONMISS_                                 _NONMISS_                                   factor      DATA   NA                        NA                                        
    ## ds:dsd-DEMO               crnd-dimension:factor      Codelist scheme: factor      code:factor-age                                       age                                         factor      DATA   ==                        age                                       
    ## ds:dsd-DEMO               crnd-dimension:factor      Codelist scheme: factor      code:factor-proportion                                proportion                                  factor      DATA   ==                        proportion                                
    ## ds:dsd-DEMO               crnd-dimension:factor      Codelist scheme: factor      code:factor-quantity                                  quantity                                    factor      DATA   ==                        quantity                                  
    ## ds:dsd-DEMO               crnd-dimension:factor      Codelist scheme: factor      code:factor-weightbl                                  weightbl                                    factor      DATA   ==                        weightbl                                  
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-count                                  count                                       procedure   DATA   ==                        count                                     
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-max                                    max                                         procedure   DATA   ==                        max                                       
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-mean                                   mean                                        procedure   DATA   ==                        mean                                      
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-median                                 median                                      procedure   DATA   ==                        median                                    
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-min                                    min                                         procedure   DATA   ==                        min                                       
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-n                                      n                                           procedure   DATA   ==                        n                                         
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-percent                                percent                                     procedure   DATA   ==                        percent                                   
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-q1                                     q1                                          procedure   DATA   ==                        q1                                        
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-q3                                     q3                                          procedure   DATA   ==                        q3                                        
    ## ds:dsd-DEMO               crnd-dimension:procedure   Codelist scheme: procedure   code:procedure-std                                    std                                         procedure   DATA   ==                        std                                       
    ## ds:dsd-DEMO               crnd-dimension:race        Codelist scheme: race        code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE            AMERICAN INDIAN OR ALASKA NATIVE            race        SDTM   rrdfqbcrnd0:ADSL_RACE     AMERICAN INDIAN OR ALASKA NATIVE          
    ## ds:dsd-DEMO               crnd-dimension:race        Codelist scheme: race        code:race-ASIAN                                       ASIAN                                       race        SDTM   rrdfqbcrnd0:ADSL_RACE     ASIAN                                     
    ## ds:dsd-DEMO               crnd-dimension:race        Codelist scheme: race        code:race-BLACK_OR_AFRICAN_AMERICAN                   BLACK OR AFRICAN AMERICAN                   race        SDTM   rrdfqbcrnd0:ADSL_RACE     BLACK OR AFRICAN AMERICAN                 
    ## ds:dsd-DEMO               crnd-dimension:race        Codelist scheme: race        code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER   NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER   race        SDTM   rrdfqbcrnd0:ADSL_RACE     NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER 
    ## ds:dsd-DEMO               crnd-dimension:race        Codelist scheme: race        code:race-WHITE                                       WHITE                                       race        SDTM   rrdfqbcrnd0:ADSL_RACE     WHITE                                     
    ## ds:dsd-DEMO               crnd-dimension:race        Codelist scheme: race        code:race-_ALL_                                       _ALL_                                       race        SDTM   rrdfqbcrnd0:ADSL_RACE     NA                                        
    ## ds:dsd-DEMO               crnd-dimension:race        Codelist scheme: race        code:race-_NONMISS_                                   _NONMISS_                                   race        SDTM   rrdfqbcrnd0:ADSL_RACE     NA                                        
    ## ds:dsd-DEMO               crnd-dimension:sex         Codelist scheme: sex         code:sex-F                                            F                                           sex         SDTM   rrdfqbcrnd0:ADSL_SEX      F                                         
    ## ds:dsd-DEMO               crnd-dimension:sex         Codelist scheme: sex         code:sex-M                                            M                                           sex         SDTM   rrdfqbcrnd0:ADSL_SEX      M                                         
    ## ds:dsd-DEMO               crnd-dimension:sex         Codelist scheme: sex         code:sex-U                                            U                                           sex         SDTM   rrdfqbcrnd0:ADSL_SEX      U                                         
    ## ds:dsd-DEMO               crnd-dimension:sex         Codelist scheme: sex         code:sex-UN                                           UN                                          sex         SDTM   rrdfqbcrnd0:ADSL_SEX      UN                                        
    ## ds:dsd-DEMO               crnd-dimension:sex         Codelist scheme: sex         code:sex-_ALL_                                        _ALL_                                       sex         SDTM   rrdfqbcrnd0:ADSL_SEX      NA                                        
    ## ds:dsd-DEMO               crnd-dimension:sex         Codelist scheme: sex         code:sex-_NONMISS_                                    _NONMISS_                                   sex         SDTM   rrdfqbcrnd0:ADSL_SEX      NA                                        
    ## ds:dsd-DEMO               crnd-dimension:trt01a      Codelist scheme: trt01a      code:trt01a-Placebo                                   Placebo                                     trt01a      DATA   rrdfqbcrnd0:ADSL_TRT01A   Placebo                                   
    ## ds:dsd-DEMO               crnd-dimension:trt01a      Codelist scheme: trt01a      code:trt01a-Xanomeline_High_Dose                      Xanomeline High Dose                        trt01a      DATA   rrdfqbcrnd0:ADSL_TRT01A   Xanomeline High Dose                      
    ## ds:dsd-DEMO               crnd-dimension:trt01a      Codelist scheme: trt01a      code:trt01a-Xanomeline_Low_Dose                       Xanomeline Low Dose                         trt01a      DATA   rrdfqbcrnd0:ADSL_TRT01A   Xanomeline Low Dose                       
    ## ds:dsd-DEMO               crnd-dimension:trt01a      Codelist scheme: trt01a      code:trt01a-_ALL_                                     _ALL_                                       trt01a      DATA   rrdfqbcrnd0:ADSL_TRT01A   NA                                        
    ## ds:dsd-DEMO               crnd-dimension:trt01a      Codelist scheme: trt01a      code:trt01a-_NONMISS_                                 _NONMISS_                                   trt01a      DATA   rrdfqbcrnd0:ADSL_TRT01A   NA                                        
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOcodelistfull.rq 
    ## [1] 43
    ## 
    ## 
    ## DataStructureDefinition   component        dimension                  c                cprefLabel                   cl                                                    clprefLabel                                 vn          vnd2rq                    vct    vnop   vnval                                     
    ## ------------------------  ---------------  -------------------------  ---------------  ---------------------------  ----------------------------------------------------  ------------------------------------------  ----------  ------------------------  -----  -----  ------------------------------------------
    ## ds:dsd-DEMO               dccs:agegr1      crnd-dimension:agegr1      code:agegr1      Codelist scheme: agegr1      code:agegr1-65-80                                     65-80                                       agegr1      rrdfqbcrnd0:ADSL_AGEGR1   DATA   ==     65-80                                     
    ## ds:dsd-DEMO               dccs:agegr1      crnd-dimension:agegr1      code:agegr1      Codelist scheme: agegr1      code:agegr1-_65                                       <65                                         agegr1      rrdfqbcrnd0:ADSL_AGEGR1   DATA   ==     <65                                       
    ## ds:dsd-DEMO               dccs:agegr1      crnd-dimension:agegr1      code:agegr1      Codelist scheme: agegr1      code:agegr1-_80                                       >80                                         agegr1      rrdfqbcrnd0:ADSL_AGEGR1   DATA   ==     >80                                       
    ## ds:dsd-DEMO               dccs:agegr1      crnd-dimension:agegr1      code:agegr1      Codelist scheme: agegr1      code:agegr1-_ALL_                                     _ALL_                                       agegr1      rrdfqbcrnd0:ADSL_AGEGR1   DATA   NA     NA                                        
    ## ds:dsd-DEMO               dccs:agegr1      crnd-dimension:agegr1      code:agegr1      Codelist scheme: agegr1      code:agegr1-_NONMISS_                                 _NONMISS_                                   agegr1      rrdfqbcrnd0:ADSL_AGEGR1   DATA   NA     NA                                        
    ## ds:dsd-DEMO               dccs:ethnic      crnd-dimension:ethnic      code:ethnic      Codelist scheme: ethnic      code:ethnic-HISPANIC_OR_LATINO                        HISPANIC OR LATINO                          ethnic      rrdfqbcrnd0:ADSL_ETHNIC   DATA   ==     HISPANIC OR LATINO                        
    ## ds:dsd-DEMO               dccs:ethnic      crnd-dimension:ethnic      code:ethnic      Codelist scheme: ethnic      code:ethnic-NOT_HISPANIC_OR_LATINO                    NOT HISPANIC OR LATINO                      ethnic      rrdfqbcrnd0:ADSL_ETHNIC   DATA   ==     NOT HISPANIC OR LATINO                    
    ## ds:dsd-DEMO               dccs:ethnic      crnd-dimension:ethnic      code:ethnic      Codelist scheme: ethnic      code:ethnic-_ALL_                                     _ALL_                                       ethnic      rrdfqbcrnd0:ADSL_ETHNIC   DATA   NA     NA                                        
    ## ds:dsd-DEMO               dccs:ethnic      crnd-dimension:ethnic      code:ethnic      Codelist scheme: ethnic      code:ethnic-_NONMISS_                                 _NONMISS_                                   ethnic      rrdfqbcrnd0:ADSL_ETHNIC   DATA   NA     NA                                        
    ## ds:dsd-DEMO               dccs:factor      crnd-dimension:factor      code:factor      Codelist scheme: factor      code:factor-_ALL_                                     _ALL_                                       factor      NA                        DATA   NA     NA                                        
    ## ds:dsd-DEMO               dccs:factor      crnd-dimension:factor      code:factor      Codelist scheme: factor      code:factor-_NONMISS_                                 _NONMISS_                                   factor      NA                        DATA   NA     NA                                        
    ## ds:dsd-DEMO               dccs:factor      crnd-dimension:factor      code:factor      Codelist scheme: factor      code:factor-age                                       age                                         factor      NA                        DATA   ==     age                                       
    ## ds:dsd-DEMO               dccs:factor      crnd-dimension:factor      code:factor      Codelist scheme: factor      code:factor-proportion                                proportion                                  factor      NA                        DATA   ==     proportion                                
    ## ds:dsd-DEMO               dccs:factor      crnd-dimension:factor      code:factor      Codelist scheme: factor      code:factor-quantity                                  quantity                                    factor      NA                        DATA   ==     quantity                                  
    ## ds:dsd-DEMO               dccs:factor      crnd-dimension:factor      code:factor      Codelist scheme: factor      code:factor-weightbl                                  weightbl                                    factor      NA                        DATA   ==     weightbl                                  
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-count                                  count                                       procedure   NA                        DATA   ==     count                                     
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-max                                    max                                         procedure   NA                        DATA   ==     max                                       
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-mean                                   mean                                        procedure   NA                        DATA   ==     mean                                      
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-median                                 median                                      procedure   NA                        DATA   ==     median                                    
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-min                                    min                                         procedure   NA                        DATA   ==     min                                       
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-n                                      n                                           procedure   NA                        DATA   ==     n                                         
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-percent                                percent                                     procedure   NA                        DATA   ==     percent                                   
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-q1                                     q1                                          procedure   NA                        DATA   ==     q1                                        
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-q3                                     q3                                          procedure   NA                        DATA   ==     q3                                        
    ## ds:dsd-DEMO               dccs:procedure   crnd-dimension:procedure   code:procedure   Codelist scheme: procedure   code:procedure-std                                    std                                         procedure   NA                        DATA   ==     std                                       
    ## ds:dsd-DEMO               dccs:race        crnd-dimension:race        code:race        Codelist scheme: race        code:race-AMERICAN_INDIAN_OR_ALASKA_NATIVE            AMERICAN INDIAN OR ALASKA NATIVE            race        rrdfqbcrnd0:ADSL_RACE     SDTM   ==     AMERICAN INDIAN OR ALASKA NATIVE          
    ## ds:dsd-DEMO               dccs:race        crnd-dimension:race        code:race        Codelist scheme: race        code:race-ASIAN                                       ASIAN                                       race        rrdfqbcrnd0:ADSL_RACE     SDTM   ==     ASIAN                                     
    ## ds:dsd-DEMO               dccs:race        crnd-dimension:race        code:race        Codelist scheme: race        code:race-BLACK_OR_AFRICAN_AMERICAN                   BLACK OR AFRICAN AMERICAN                   race        rrdfqbcrnd0:ADSL_RACE     SDTM   ==     BLACK OR AFRICAN AMERICAN                 
    ## ds:dsd-DEMO               dccs:race        crnd-dimension:race        code:race        Codelist scheme: race        code:race-NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER   NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER   race        rrdfqbcrnd0:ADSL_RACE     SDTM   ==     NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER 
    ## ds:dsd-DEMO               dccs:race        crnd-dimension:race        code:race        Codelist scheme: race        code:race-WHITE                                       WHITE                                       race        rrdfqbcrnd0:ADSL_RACE     SDTM   ==     WHITE                                     
    ## ds:dsd-DEMO               dccs:race        crnd-dimension:race        code:race        Codelist scheme: race        code:race-_ALL_                                       _ALL_                                       race        rrdfqbcrnd0:ADSL_RACE     SDTM   NA     NA                                        
    ## ds:dsd-DEMO               dccs:race        crnd-dimension:race        code:race        Codelist scheme: race        code:race-_NONMISS_                                   _NONMISS_                                   race        rrdfqbcrnd0:ADSL_RACE     SDTM   NA     NA                                        
    ## ds:dsd-DEMO               dccs:sex         crnd-dimension:sex         code:sex         Codelist scheme: sex         code:sex-F                                            F                                           sex         rrdfqbcrnd0:ADSL_SEX      SDTM   ==     F                                         
    ## ds:dsd-DEMO               dccs:sex         crnd-dimension:sex         code:sex         Codelist scheme: sex         code:sex-M                                            M                                           sex         rrdfqbcrnd0:ADSL_SEX      SDTM   ==     M                                         
    ## ds:dsd-DEMO               dccs:sex         crnd-dimension:sex         code:sex         Codelist scheme: sex         code:sex-U                                            U                                           sex         rrdfqbcrnd0:ADSL_SEX      SDTM   ==     U                                         
    ## ds:dsd-DEMO               dccs:sex         crnd-dimension:sex         code:sex         Codelist scheme: sex         code:sex-UN                                           UN                                          sex         rrdfqbcrnd0:ADSL_SEX      SDTM   ==     UN                                        
    ## ds:dsd-DEMO               dccs:sex         crnd-dimension:sex         code:sex         Codelist scheme: sex         code:sex-_ALL_                                        _ALL_                                       sex         rrdfqbcrnd0:ADSL_SEX      SDTM   NA     NA                                        
    ## ds:dsd-DEMO               dccs:sex         crnd-dimension:sex         code:sex         Codelist scheme: sex         code:sex-_NONMISS_                                    _NONMISS_                                   sex         rrdfqbcrnd0:ADSL_SEX      SDTM   NA     NA                                        
    ## ds:dsd-DEMO               dccs:trt01a      crnd-dimension:trt01a      code:trt01a      Codelist scheme: trt01a      code:trt01a-Placebo                                   Placebo                                     trt01a      rrdfqbcrnd0:ADSL_TRT01A   DATA   ==     Placebo                                   
    ## ds:dsd-DEMO               dccs:trt01a      crnd-dimension:trt01a      code:trt01a      Codelist scheme: trt01a      code:trt01a-Xanomeline_High_Dose                      Xanomeline High Dose                        trt01a      rrdfqbcrnd0:ADSL_TRT01A   DATA   ==     Xanomeline High Dose                      
    ## ds:dsd-DEMO               dccs:trt01a      crnd-dimension:trt01a      code:trt01a      Codelist scheme: trt01a      code:trt01a-Xanomeline_Low_Dose                       Xanomeline Low Dose                         trt01a      rrdfqbcrnd0:ADSL_TRT01A   DATA   ==     Xanomeline Low Dose                       
    ## ds:dsd-DEMO               dccs:trt01a      crnd-dimension:trt01a      code:trt01a      Codelist scheme: trt01a      code:trt01a-_ALL_                                     _ALL_                                       trt01a      rrdfqbcrnd0:ADSL_TRT01A   DATA   NA     NA                                        
    ## ds:dsd-DEMO               dccs:trt01a      crnd-dimension:trt01a      code:trt01a      Codelist scheme: trt01a      code:trt01a-_NONMISS_                                 _NONMISS_                                   trt01a      rrdfqbcrnd0:ADSL_TRT01A   DATA   NA     NA                                        
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOdimensions.rq 
    ## [1] 7
    ## 
    ## 
    ## p                        
    ## -------------------------
    ## crnd-dimension:ethnic    
    ## crnd-dimension:race      
    ## crnd-dimension:procedure 
    ## crnd-dimension:agegr1    
    ## crnd-dimension:factor    
    ## crnd-dimension:trt01a    
    ## crnd-dimension:sex       
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOfactor-codelist.rq 
    ## [1] 62
    ## 
    ## 
    ## s                                    p                                 o                                                                                           
    ## -----------------------------------  --------------------------------  --------------------------------------------------------------------------------------------
    ## code:factor-weightbl                 skos:topConceptOf                 code:factor                                                                                 
    ## code:factor-weightbl                 skos:prefLabel                    weightbl                                                                                    
    ## code:factor-weightbl                 skos:inScheme                     code:factor                                                                                 
    ## code:factor-weightbl                 rrdfqbcrnd0:R-selectionvalue      weightbl                                                                                    
    ## code:factor-weightbl                 rrdfqbcrnd0:R-selectionoperator   ==                                                                                          
    ## code:factor-weightbl                 rrdfqbcrnd0:DataSetRefD2RQ        rrdfqbcrnd0:ADSL_WEIGHTBL                                                                   
    ## code:factor-weightbl                 rdfs:comment                      Coded values from data source. No reconciliation against another source                     
    ## code:factor-weightbl                 rdf:type                          skos:Concept                                                                                
    ## code:factor-weightbl                 rdf:type                          code:Factor                                                                                 
    ## code:factor-age                      skos:topConceptOf                 code:factor                                                                                 
    ## code:factor-age                      skos:prefLabel                    age                                                                                         
    ## code:factor-age                      skos:inScheme                     code:factor                                                                                 
    ## code:factor-age                      rrdfqbcrnd0:R-selectionvalue      age                                                                                         
    ## code:factor-age                      rrdfqbcrnd0:R-selectionoperator   ==                                                                                          
    ## code:factor-age                      rrdfqbcrnd0:DataSetRefD2RQ        rrdfqbcrnd0:ADSL_AGE                                                                        
    ## code:factor-age                      rdfs:comment                      Coded values from data source. No reconciliation against another source                     
    ## code:factor-age                      rdf:type                          skos:Concept                                                                                
    ## code:factor-age                      rdf:type                          code:Factor                                                                                 
    ## code:factor-_ALL_                    skos:topConceptOf                 code:factor                                                                                 
    ## code:factor-_ALL_                    skos:prefLabel                    _ALL_                                                                                       
    ## code:factor-_ALL_                    skos:inScheme                     code:factor                                                                                 
    ## code:factor-_ALL_                    rdfs:comment                      NON-CDISC: Represents all codelist categories.                                              
    ## code:factor-_ALL_                    rdf:type                          skos:Concept                                                                                
    ## code:factor-_ALL_                    rdf:type                          code:Factor                                                                                 
    ## code:factor-quantity                 skos:topConceptOf                 code:factor                                                                                 
    ## code:factor-quantity                 skos:prefLabel                    quantity                                                                                    
    ## code:factor-quantity                 skos:inScheme                     code:factor                                                                                 
    ## code:factor-quantity                 rrdfqbcrnd0:R-selectionvalue      quantity                                                                                    
    ## code:factor-quantity                 rrdfqbcrnd0:R-selectionoperator   ==                                                                                          
    ## code:factor-quantity                 rdfs:comment                      Coded values from data source. No reconciliation against another source                     
    ## code:factor-quantity                 rdf:type                          skos:Concept                                                                                
    ## code:factor-quantity                 rdf:type                          code:Factor                                                                                 
    ## code:factor-_NONMISS_                skos:topConceptOf                 code:factor                                                                                 
    ## code:factor-_NONMISS_                skos:prefLabel                    _NONMISS_                                                                                   
    ## code:factor-_NONMISS_                skos:inScheme                     code:factor                                                                                 
    ## code:factor-_NONMISS_                rrdfqbcrnd0:R-selectionfunction   is.na                                                                                       
    ## code:factor-_NONMISS_                rdfs:comment                      NON-CDISC: Represents the non-missing codelist categories. Does not include missing values. 
    ## code:factor-_NONMISS_                rdf:type                          skos:Concept                                                                                
    ## code:factor-_NONMISS_                rdf:type                          code:Factor                                                                                 
    ## code:factor-proportion               skos:topConceptOf                 code:factor                                                                                 
    ## code:factor-proportion               skos:prefLabel                    proportion                                                                                  
    ## code:factor-proportion               skos:inScheme                     code:factor                                                                                 
    ## code:factor-proportion               rrdfqbcrnd0:R-selectionvalue      proportion                                                                                  
    ## code:factor-proportion               rrdfqbcrnd0:R-selectionoperator   ==                                                                                          
    ## code:factor-proportion               rdfs:comment                      Coded values from data source. No reconciliation against another source                     
    ## code:factor-proportion               rdf:type                          skos:Concept                                                                                
    ## code:factor-proportion               rdf:type                          code:Factor                                                                                 
    ## code:CODING ERROR- no decode value   rdf:type                          code:Race                                                                                   
    ## code:CODING ERROR- no decode value   rdf:type                          code:Ethnic                                                                                 
    ## code:CODING ERROR- no decode value   rdf:type                          code:Procedure                                                                              
    ## code:CODING ERROR- no decode value   rdf:type                          code:Trt01a                                                                                 
    ## code:CODING ERROR- no decode value   rdf:type                          code:Sex                                                                                    
    ## code:CODING ERROR- no decode value   rdf:type                          code:Factor                                                                                 
    ## code:CODING ERROR- no decode value   rdf:type                          code:Agegr1                                                                                 
    ## code:CODING ERROR- no decode value   rdf:type                          skos:Concept                                                                                
    ## code:CODING ERROR- no decode value   rdf:type                          rdfs:Resource                                                                               
    ## code:factor-proportion               rdf:type                          rdfs:Resource                                                                               
    ## code:factor-_NONMISS_                rdf:type                          rdfs:Resource                                                                               
    ## code:factor-quantity                 rdf:type                          rdfs:Resource                                                                               
    ## code:factor-_ALL_                    rdf:type                          rdfs:Resource                                                                               
    ## code:factor-age                      rdf:type                          rdfs:Resource                                                                               
    ## code:factor-weightbl                 rdf:type                          rdfs:Resource                                                                               
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOfactor.rq 
    ## [1] 6
    ## 
    ## 
    ## factor                   prefLabel    DataSetRefD2RQ              Rselectionvalue 
    ## -----------------------  -----------  --------------------------  ----------------
    ## code:factor-_ALL_        _ALL_        NA                          NA              
    ## code:factor-proportion   proportion   NA                          proportion      
    ## code:factor-weightbl     weightbl     rrdfqbcrnd0:ADSL_WEIGHTBL   weightbl        
    ## code:factor-_NONMISS_    _NONMISS_    NA                          NA              
    ## code:factor-quantity     quantity     NA                          quantity        
    ## code:factor-age          age          rrdfqbcrnd0:ADSL_AGE        age             
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations-R-data-part-1.rq 
    ## [1] 0
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations-R-data.rq 
    ## [1] 0
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations-R-selection.rq 
    ## [1] 0
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOobservations.rq 
    ## [1] 132
    ## 
    ## 
    ## s           ethnic                               race                                 procedure                            agegr1                               factor                               trt01a                               sex                                  cellpartno   measurefmt   colno   denominator   unit   rowno   measure        ethnicvalue   racevalue   procedurevalue   agegr1value   factorvalue   trt01avalue   sexvalue 
    ## ----------  -----------------------------------  -----------------------------------  -----------------------------------  -----------------------------------  -----------------------------------  -----------------------------------  -----------------------------------  -----------  -----------  ------  ------------  -----  ------  -------------  ------------  ----------  ---------------  ------------  ------------  ------------  ---------
    ## ds:obs001   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     1       86             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs002   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     1       84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs003   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     1       84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs004   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       sex           NA     1       100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs005   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       sex           NA     1       100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs006   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       sex           NA     1       100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs007   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     2       53             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs008   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     2       50             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs009   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     2       40             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs010   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       sex           NA     2       61.627906977   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs011   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       sex           NA     2       59.523809524   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs012   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       sex           NA     2       47.619047619   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs013   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     3       33             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs014   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     3       34             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs015   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     3       44             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs016   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       sex           NA     3       38.372093023   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs017   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       sex           NA     3       40.476190476   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs018   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       sex           NA     3       52.380952381   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs019   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     4       8.5901671271   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs020   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     4       8.2860505995   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs021   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     4       7.8860938487   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs022   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     5       86             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs023   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     5       84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs024   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     5       84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs025   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     6       76             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs026   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     6       77.5           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs027   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     6       76             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs028   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     7       75.209302326   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs029   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     7       75.666666667   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs030   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     7       74.380952381   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs031   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     8       82             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs032   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     8       82             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs033   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     8       80             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs034   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     9       69             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs035   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     9       71             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs036   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     9       70.5           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs037   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     10      89             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs038   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     10      88             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs039   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     10      88             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs040   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     11      52             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs041   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     11      51             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs042   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     11      56             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs043   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     18      86             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs044   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     18      84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs045   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     18      84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs046   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       agegr1        NA     18      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs047   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       agegr1        NA     18      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs048   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       agegr1        NA     18      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs049   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     19      14             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs050   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     19      8              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs051   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     19      11             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs052   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       agegr1        NA     19      16.279069767   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs053   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       agegr1        NA     19      9.5238095238   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs054   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       agegr1        NA     19      13.095238095   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs055   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     20      42             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs056   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     20      47             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs057   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     20      55             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs058   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       agegr1        NA     20      48.837209302   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs059   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       agegr1        NA     20      55.952380952   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs060   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       agegr1        NA     20      65.476190476   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs061   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     21      30             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs062   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     21      29             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs063   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     21      18             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs064   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       agegr1        NA     21      34.88372093    NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs065   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       agegr1        NA     21      34.523809524   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs066   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       agegr1        NA     21      21.428571429   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs067   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     22      86             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs068   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     22      84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs069   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     22      84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs070   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       race          NA     22      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs071   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       race          NA     22      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs072   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       race          NA     22      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs073   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     23      78             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs074   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     23      78             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs075   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     23      74             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs076   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       race          NA     23      90.697674419   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs077   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       race          NA     23      92.857142857   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs078   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       race          NA     23      88.095238095   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs079   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     24      8              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs080   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     24      6              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs081   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     24      9              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs082   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       race          NA     24      9.3023255814   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs083   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       race          NA     24      7.1428571429   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs084   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       race          NA     24      10.714285714   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs085   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     25      0              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs086   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     25      0              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs087   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     25      1              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs088   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       race          NA     25      0              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs089   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       race          NA     25      0              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs090   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       race          NA     25      1.1904761905   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs091   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     26      12.771543533   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs092   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     26      14.123598649   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs093   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     26      14.653433372   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs094   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     27      86             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs095   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     27      83             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs096   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     27      84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs097   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     28      60.55          NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs098   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     28      64.9           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs099   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     28      69.2           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs100   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     29      62.759302326   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs101   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     29      67.279518072   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs102   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     29      70.004761905   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs103   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     30      74.4           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs104   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     30      77.8           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs105   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     30      80.3           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs106   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     31      53.5           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs107   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     31      55.8           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs108   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     31      56.75          NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs109   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     32      86.2           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs110   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     32      106.1          NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs111   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     32      108            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs112   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        1                     NA     33      34             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs113   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        2                     NA     33      45.4           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs114   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.1f        3                     NA     33      41.7           NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs115   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     36      86             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs116   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     36      84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs117   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     36      84             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs118   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       ethnic        NA     36      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs119   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       ethnic        NA     36      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs120   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       ethnic        NA     36      100            NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs121   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     38      83             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs122   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     38      78             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs123   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     38      81             NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs124   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       ethnic        NA     38      96.511627907   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs125   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       ethnic        NA     38      92.857142857   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs126   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       ethnic        NA     38      96.428571429   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs127   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        1                     NA     40      3              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs128   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        2                     NA     40      6              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs129   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   1            %6.0f        3                     NA     40      3              NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs130   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        1       ethnic        NA     40      3.488372093    NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs131   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        2       ethnic        NA     40      7.1428571429   NA            NA          NA               NA            NA            NA            NA       
    ## ds:obs132   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   code:CODING ERROR- no decode value   2            %6.1f        3       ethnic        NA     40      3.5714285714   NA            NA          NA               NA            NA            NA            NA       
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOprocedure-codelist.rq 
    ## [1] 109
    ## 
    ## 
    ## s                                    p                                 o                                                                
    ## -----------------------------------  --------------------------------  -----------------------------------------------------------------
    ## code:procedure-min                   skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-min                   skos:prefLabel                    min                                                              
    ## code:procedure-min                   skos:inScheme                     code:procedure                                                   
    ## code:procedure-min                   rrdfqbcrnd0:RdescStatDefFun       function (x)  {     min(x, na.rm = TRUE) }                       
    ## code:procedure-min                   rrdfqbcrnd0:R-selectionvalue      min                                                              
    ## code:procedure-min                   rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-min                   rdfs:comment                      Descriptive statistics min                                       
    ## code:procedure-min                   rdf:type                          skos:Concept                                                     
    ## code:procedure-min                   rdf:type                          code:Procedure                                                   
    ## code:procedure-std                   skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-std                   skos:prefLabel                    std                                                              
    ## code:procedure-std                   skos:inScheme                     code:procedure                                                   
    ## code:procedure-std                   rrdfqbcrnd0:RdescStatDefFun       function (x)  {     sd(x, na.rm = TRUE) }                        
    ## code:procedure-std                   rrdfqbcrnd0:R-selectionvalue      std                                                              
    ## code:procedure-std                   rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-std                   rdfs:comment                      Descriptive statistics std                                       
    ## code:procedure-std                   rdf:type                          skos:Concept                                                     
    ## code:procedure-std                   rdf:type                          code:Procedure                                                   
    ## code:procedure-q3                    skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-q3                    skos:prefLabel                    q3                                                               
    ## code:procedure-q3                    skos:inScheme                     code:procedure                                                   
    ## code:procedure-q3                    rrdfqbcrnd0:RdescStatDefFun       function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) } 
    ## code:procedure-q3                    rrdfqbcrnd0:R-selectionvalue      q3                                                               
    ## code:procedure-q3                    rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-q3                    rdfs:comment                      Descriptive statistics q3                                        
    ## code:procedure-q3                    rdf:type                          skos:Concept                                                     
    ## code:procedure-q3                    rdf:type                          code:Procedure                                                   
    ## code:procedure-median                skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-median                skos:prefLabel                    median                                                           
    ## code:procedure-median                skos:inScheme                     code:procedure                                                   
    ## code:procedure-median                rrdfqbcrnd0:RdescStatDefFun       function (x)  {     median(x, na.rm = TRUE) }                    
    ## code:procedure-median                rrdfqbcrnd0:R-selectionvalue      median                                                           
    ## code:procedure-median                rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-median                rdfs:comment                      Descriptive statistics median                                    
    ## code:procedure-median                rdf:type                          skos:Concept                                                     
    ## code:procedure-median                rdf:type                          code:Procedure                                                   
    ## code:procedure-count                 skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-count                 skos:prefLabel                    count                                                            
    ## code:procedure-count                 skos:inScheme                     code:procedure                                                   
    ## code:procedure-count                 rrdfqbcrnd0:RdescStatDefFun       function (x)  {     length(x) }                                  
    ## code:procedure-count                 rrdfqbcrnd0:R-selectionvalue      count                                                            
    ## code:procedure-count                 rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-count                 rdfs:comment                      Descriptive statistics count                                     
    ## code:procedure-count                 rdf:type                          skos:Concept                                                     
    ## code:procedure-count                 rdf:type                          code:Procedure                                                   
    ## code:procedure-max                   skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-max                   skos:prefLabel                    max                                                              
    ## code:procedure-max                   skos:inScheme                     code:procedure                                                   
    ## code:procedure-max                   rrdfqbcrnd0:RdescStatDefFun       function (x)  {     max(x, na.rm = TRUE) }                       
    ## code:procedure-max                   rrdfqbcrnd0:R-selectionvalue      max                                                              
    ## code:procedure-max                   rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-max                   rdfs:comment                      Descriptive statistics max                                       
    ## code:procedure-max                   rdf:type                          skos:Concept                                                     
    ## code:procedure-max                   rdf:type                          code:Procedure                                                   
    ## code:procedure-mean                  skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-mean                  skos:prefLabel                    mean                                                             
    ## code:procedure-mean                  skos:inScheme                     code:procedure                                                   
    ## code:procedure-mean                  rrdfqbcrnd0:RdescStatDefFun       function (x)  {     mean(x, na.rm = TRUE) }                      
    ## code:procedure-mean                  rrdfqbcrnd0:R-selectionvalue      mean                                                             
    ## code:procedure-mean                  rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-mean                  rdfs:comment                      Descriptive statistics mean                                      
    ## code:procedure-mean                  rdf:type                          skos:Concept                                                     
    ## code:procedure-mean                  rdf:type                          code:Procedure                                                   
    ## code:procedure-q1                    skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-q1                    skos:prefLabel                    q1                                                               
    ## code:procedure-q1                    skos:inScheme                     code:procedure                                                   
    ## code:procedure-q1                    rrdfqbcrnd0:RdescStatDefFun       function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) } 
    ## code:procedure-q1                    rrdfqbcrnd0:R-selectionvalue      q1                                                               
    ## code:procedure-q1                    rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-q1                    rdfs:comment                      Descriptive statistics q1                                        
    ## code:procedure-q1                    rdf:type                          skos:Concept                                                     
    ## code:procedure-q1                    rdf:type                          code:Procedure                                                   
    ## code:procedure-n                     skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-n                     skos:prefLabel                    n                                                                
    ## code:procedure-n                     skos:inScheme                     code:procedure                                                   
    ## code:procedure-n                     rrdfqbcrnd0:RdescStatDefFun       function (x)  {     length(x[!is.na(x)]) }                       
    ## code:procedure-n                     rrdfqbcrnd0:R-selectionvalue      n                                                                
    ## code:procedure-n                     rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-n                     rdfs:comment                      Descriptive statistics n                                         
    ## code:procedure-n                     rdf:type                          skos:Concept                                                     
    ## code:procedure-n                     rdf:type                          code:Procedure                                                   
    ## code:procedure-percent               skos:topConceptOf                 code:procedure                                                   
    ## code:procedure-percent               skos:prefLabel                    percent                                                          
    ## code:procedure-percent               skos:inScheme                     code:procedure                                                   
    ## code:procedure-percent               rrdfqbcrnd0:RdescStatDefFun       function (x)  {     -1 }                                         
    ## code:procedure-percent               rrdfqbcrnd0:R-selectionvalue      percent                                                          
    ## code:procedure-percent               rrdfqbcrnd0:R-selectionoperator   ==                                                               
    ## code:procedure-percent               rdfs:comment                      Descriptive statistics percent                                   
    ## code:procedure-percent               rdf:type                          skos:Concept                                                     
    ## code:procedure-percent               rdf:type                          code:Procedure                                                   
    ## code:CODING ERROR- no decode value   rdf:type                          code:Race                                                        
    ## code:CODING ERROR- no decode value   rdf:type                          code:Ethnic                                                      
    ## code:CODING ERROR- no decode value   rdf:type                          code:Procedure                                                   
    ## code:CODING ERROR- no decode value   rdf:type                          code:Trt01a                                                      
    ## code:CODING ERROR- no decode value   rdf:type                          code:Sex                                                         
    ## code:CODING ERROR- no decode value   rdf:type                          code:Factor                                                      
    ## code:CODING ERROR- no decode value   rdf:type                          code:Agegr1                                                      
    ## code:CODING ERROR- no decode value   rdf:type                          skos:Concept                                                     
    ## code:CODING ERROR- no decode value   rdf:type                          rdfs:Resource                                                    
    ## code:procedure-q3                    rdf:type                          rdfs:Resource                                                    
    ## code:procedure-mean                  rdf:type                          rdfs:Resource                                                    
    ## code:procedure-q1                    rdf:type                          rdfs:Resource                                                    
    ## code:procedure-std                   rdf:type                          rdfs:Resource                                                    
    ## code:procedure-count                 rdf:type                          rdfs:Resource                                                    
    ## code:procedure-median                rdf:type                          rdfs:Resource                                                    
    ## code:procedure-percent               rdf:type                          rdfs:Resource                                                    
    ## code:procedure-min                   rdf:type                          rdfs:Resource                                                    
    ## code:procedure-max                   rdf:type                          rdfs:Resource                                                    
    ## code:procedure-n                     rdf:type                          rdfs:Resource                                                    
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOprocedure-median.rq 
    ## [1] 10
    ## 
    ## 
    ## s                       p                                 o                                             
    ## ----------------------  --------------------------------  ----------------------------------------------
    ## code:procedure-median   skos:topConceptOf                 code:procedure                                
    ## code:procedure-median   skos:prefLabel                    median                                        
    ## code:procedure-median   skos:inScheme                     code:procedure                                
    ## code:procedure-median   rrdfqbcrnd0:RdescStatDefFun       function (x)  {     median(x, na.rm = TRUE) } 
    ## code:procedure-median   rrdfqbcrnd0:R-selectionvalue      median                                        
    ## code:procedure-median   rrdfqbcrnd0:R-selectionoperator   ==                                            
    ## code:procedure-median   rdfs:comment                      Descriptive statistics median                 
    ## code:procedure-median   rdf:type                          skos:Concept                                  
    ## code:procedure-median   rdf:type                          code:Procedure                                
    ## code:procedure-median   rdf:type                          rdfs:Resource                                 
    ## File  /home/ma/projects/rrdfqbcrnd0/rrdfqbcrndex/inst/extdata/sample-rdf/DEMOprocedure.rq 
    ## [1] 10
    ## 
    ## 
    ## procedure                prefLabel   functiondef                                                      
    ## -----------------------  ----------  -----------------------------------------------------------------
    ## code:procedure-max       max         function (x)  {     max(x, na.rm = TRUE) }                       
    ## code:procedure-std       std         function (x)  {     sd(x, na.rm = TRUE) }                        
    ## code:procedure-mean      mean        function (x)  {     mean(x, na.rm = TRUE) }                      
    ## code:procedure-min       min         function (x)  {     min(x, na.rm = TRUE) }                       
    ## code:procedure-percent   percent     function (x)  {     -1 }                                         
    ## code:procedure-count     count       function (x)  {     length(x) }                                  
    ## code:procedure-q3        q3          function (x)  {     quantile(x, probs = c(0.75), na.rm = TRUE) } 
    ## code:procedure-n         n           function (x)  {     length(x[!is.na(x)]) }                       
    ## code:procedure-median    median      function (x)  {     median(x, na.rm = TRUE) }                    
    ## code:procedure-q1        q1          function (x)  {     quantile(x, probs = c(0.25), na.rm = TRUE) }

This works do not change
------------------------

``` r
dsdName<- GetDsdNameFromCube( store )
domainName<- GetDomainNameFromCube( store )
cat("dsdName ", dsdName, ", domainName ", domainName, "\n" )
```

    ## dsdName  dsd-DEMO , domainName  DEMO

``` r
forsparqlprefix<- GetForSparqlPrefix( domainName )
cat(forsparqlprefix,"\n")
```

    ## prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    ## prefix skos: <http://www.w3.org/2004/02/skos/core#>
    ## prefix prov: <http://www.w3.org/ns/prov#>
    ## prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    ## prefix dcat: <http://www.w3.org/ns/dcat#>
    ## prefix owl: <http://www.w3.org/2002/07/owl#>
    ## prefix xsd: <http://www.w3.org/2001/XMLSchema#>
    ## prefix pav: <http://purl.org/pav>
    ## prefix dc: <http://purl.org/dc/elements/1.1/>
    ## prefix dct: <http://purl.org/dc/terms/>
    ## prefix mms: <http://rdf.cdisc.org/mms#>
    ## prefix cts: <http://rdf.cdisc.org/ct/schema#>
    ## prefix cdiscs: <http://rdf.cdisc.org/std/schema#>
    ## prefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#>
    ## prefix cdashct: <http://rdf.cdisc.org/cdash-terminology#>
    ## prefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#>
    ## prefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#>
    ## prefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#>
    ## prefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#>
    ## prefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#>
    ## prefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#>
    ## prefix sendct: <http://rdf.cdisc.org/send-terminology#>
    ## prefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#>
    ## prefix adamct: <http://rdf.cdisc.org/adam-terminology#>
    ## prefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#>
    ## prefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#>
    ## prefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#>
    ## prefix qb: <http://purl.org/linked-data/cube#>
    ## prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/>
    ## prefix code: <http://www.example.org/dc/code/>
    ## prefix dccs: <http://www.example.org/dc/demo/dccs/>
    ## prefix ds: <http://www.example.org/dc/demo/ds/>
    ## prefix crnd-dimension: <http://www.example.org/dc/dimension#>
    ## prefix crnd-attribute: <http://www.example.org/dc/attribute#>
    ## prefix crnd-measure: <http://www.example.org/dc/measure#>
    ## 

``` r
rq<-  paste( forsparqlprefix,
'
select *
where { 
?s a qb:Observation ; 
?p ?o .
[] qb:dimension ?p .
values (?s) {
(ds:obs114)
}
}
# limit 30
',
"\n"                               
)

cube.observations<- sparql.rdf(store, rq)
knitr::kable(cube.observations)
```

| s         | p                        | o                                  |
|:----------|:-------------------------|:-----------------------------------|
| ds:obs114 | crnd-dimension:sex       | code:CODING ERROR- no decode value |
| ds:obs114 | crnd-dimension:race      | code:CODING ERROR- no decode value |
| ds:obs114 | crnd-dimension:trt01a    | code:CODING ERROR- no decode value |
| ds:obs114 | crnd-dimension:agegr1    | code:CODING ERROR- no decode value |
| ds:obs114 | crnd-dimension:procedure | code:CODING ERROR- no decode value |
| ds:obs114 | crnd-dimension:ethnic    | code:CODING ERROR- no decode value |
| ds:obs114 | crnd-dimension:factor    | code:CODING ERROR- no decode value |

Getting triples with information of object if literal
-----------------------------------------------------

``` r
cons.rq<-  paste( forsparqlprefix,
'
construct { ?s ?p ?o }
where { 
?s ?p ?o .
BIND( datatype(?o) as ?datatype )
BIND( isLiteral(?o) as ?isLiteral )
BIND( lang(?o) as ?lang )
values (?s) {
(ds:obs114)
}
}
',
"\n"                               
)


save.rdf(construct.rdf( store, cons.rq) , file.path(tempdir(), "rapperin.ttl"), "TURTLE")
```

    ## [1] "/tmp/RtmpckyKtl/rapperin.ttl"

To see dot code generated by rapper:

    rapper -i turtle -o dot /tmp/Rtmpcccgdg/rapperin.ttl

To display the dot code

    rapper -i turtle -o dot /tmp/Rtmpcccgdg/rapperin.ttl | dot -x -Tpdf -ograph.pdf

See also (<http://www.bioconductor.org/packages/release/bioc/vignettes/Rgraphviz/inst/doc/Rgraphviz.pdf>) for Rgraphviz package - may be used to display graphs.

ToDo(MJA): move this to another package - is more an example of R code for making Rgraphvis statement

``` r
rq<-  paste( forsparqlprefix,
'
select *
where { 
?s ?p ?o .
BIND( datatype(?o) as ?datatype )
BIND( isLiteral(?o) as ?isLiteral )
BIND( lang(?o) as ?lang )
values (?s) {
(ds:obs114)
}
}
',
"\n"                               
)


res<- sparql.rdf(store, rq)
knitr::kable(res)

dimnames(res)

allIRI<- c( res[,1],res[,2])
uallIRI<- unique(allIRI)
L<- list()
for (i in 1:length(uallIRI) ) {
L[[ uallIRI[i] ]] <- paste( "L", i, sep="" )
}


rowcols<- cbind( as.matrix(apply(res[,1:2],c(1,2),function(x) as.character(L[[x]] ))),as.matrix(res[,3]))
cat(paste(rowcols, sep=", "),"\n")
```

### Check the statistics

ToDo(MJA): move this to another package - maybe the check package

``` r
stmtSQL<- GetSQLFromCube(store) 
cat(stmtSQL$summStatSQL) 
```
