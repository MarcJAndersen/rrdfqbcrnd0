libname this ".";
proc format library=work cntlin=this.formats; run;
data tablesdef; set this.tablesdef; run;
data observations; set this.observations; run;
data codes; set this.codes; run;

data tablesdefx;
    set tablesdef;
    IRIdsd= cats("ds", ":", cat("dsd", "-", upcase(tablename)));
run;    

proc sort data=codes;
    by nameorder name ordernumber codedvalue;
run;

data codesx;
    set codes(rename=(datatype=datatype_codedvalue));
    IRIname= cats("crnd-dimension", ":", lowcase(name));
    IRIcodelist= cats("code", ":", lowcase(name));
    IRIcodeClasslist= cats("code", ":", propcase(name));
    select;
    when (datatype_codedvalue="character") do;
    IRIcodedvalue=cats("code", ":", lowcase(name),"-", translate(strip(codedvalue),"_", " ","_","<","_",">"));
    end;
    when (datatype_codedvalue="numeric") do;
    IRIcodedvalue=cats("code", ":", lowcase(name),"-", strip(codedvaluen) );
    end;
    end;
run;

proc print data=codesx;
run;

/* Instead of splitting codesx into pieces include_tabulate_to_qb.sas could do that */
data dimensions;
    if _n_=1 then do;
        set tablesdefx;
    end;
    set codesx;
    by nameorder name ordernumber codedvalue;
    if first.name;
    keep nameorder name namelabel;
    keep IRIname IRIcodelist IRIcodedvalue;
    keep IRIdsd;
    keep dccsname;
    dccsname=cats("dccs", ":", lowcase(name));
    
run;

/* Could also store triples in a hash - would be more flexible */
data ttltemplate;
    length subject property object $200 language $3 datatype $100;
    keep subject property object language datatype;
    call missing(subject, property, object, language, datatype);
    delete;
ruN;

data dimensions_ttl;
    if 0 then do; set ttltemplate; end;
    set dimensions;
    subject= dccsname;
    property= "a";
    object="qb:ComponentSpecification";
    language=" ";
    datatype=" ";
    output;
    property="rdf:label";
    object=namelabel;
    language=" ";
    datatype="xsd:string";
    output;
    property="qb:dimension";
    object= IRIcodelist;
    language=" ";
    datatype=" ";
    output;
    subject=IRIdsd;
    property="qb:component";
    object= dccsname;
    language=" ";
    datatype=" ";
    output;
run;

data codelists_ttl;
    if 0 then do; set ttltemplate; end;
    set dimensions; /* assuming all dimensions have codelists */
    subject= IRIcodelist;
    property= "a";
    object="skos:ConceptScheme";
    language=" ";
    datatype=" ";
    output;
    property="rdf:label";
    object=catx(" ", "Codelist scheme:", lowcase(name));
    language="en";
    datatype=" ";
    output;
    property="skos:note";
    object=catx(" ", "Specifies the", lowcase(name), "for each observation, group of obs. or all categories (_ALL_)" );
    language="en";
    datatype=" ";
    output;
    property="skos:prefLabel"; object=catx(" ", "Codelist scheme:", lowcase(name) );
    language="en";
    datatype=" ";
    output;
    /* ToDo(mja): add qb:codelist */
run;

data codelistvalues_ttl;
    if 0 then do; set ttltemplate; end;
    set codesx;
    subject= IRIcodedvalue;
    property= "a";
    object= IRIcodeCLasslist;
    language=" ";
    datatype=" ";
    output;
    object= "skos:Concept" ;
    language=" ";
    datatype=" ";
    output;
    poperty="rdfs:comment";
    object="Coded values from data source. No reconciliation against another source" ;
    language="en";
    datatype=" ";
    output;
    property="skos:prefLabel";
    object=decode;
    datatype="xsd:string";
    output;
    property="skos:topConceptOf";
    object=IRIcodelist;
    datatype=" ";
    output;
run;

data dsd_ttl;
    if 0 then do; set ttltemplate; end;
    set tablesdefx;
    subject=IRIdsd;
    property= "a";
    object= "qb:DataStructureDefinition";
    language=" ";
    datatype=" ";
    output;
run;

/*
prefix dccs:  <http://www.example.org/dc/demo/dccs/> 
prefix sdtms-1-3: <http://rdf.cdisc.org/sdtm-1-3/schema#> 
prefix code:  <http://www.example.org/dc/code/> 
prefix adam-2-1: <http://rdf.cdisc.org/std/adam-2-1#> 
prefix owl:   <http://www.w3.org/2002/07/owl#> 
prefix xsd:   <http://www.w3.org/2001/XMLSchema#> 
prefix skos:  <http://www.w3.org/2004/02/skos/core#> 
prefix cdash-1-1: <http://rdf.cdisc.org/std/cdash-1-1#> 
prefix sdtm-1-3: <http://rdf.cdisc.org/std/sdtm-1-3#> 
prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
prefix adamvr-1-2: <http://rdf.cdisc.org/std/adamvr-1-2#> 
prefix crnd-attribute: <http://www.example.org/dc/attribute#> 
prefix sdtm-1-2: <http://rdf.cdisc.org/std/sdtm-1-2#> 
prefix sdtmct: <http://rdf.cdisc.org/sdtm-terminology#> 
prefix ds:    <http://www.example.org/dc/demo/ds/> 
prefix qb:    <http://purl.org/linked-data/cube#> 
prefix mms:   <http://rdf.cdisc.org/mms#> 
prefix crnd-dimension: <http://www.example.org/dc/dimension#> 
prefix dct:   <http://purl.org/dc/terms/> 
prefix cdiscs: <http://rdf.cdisc.org/std/schema#> 
prefix dcat:  <http://www.w3.org/ns/dcat#> 
prefix cdashct: <http://rdf.cdisc.org/cdash-terminology#> 
prefix prov:  <http://www.w3.org/ns/prov#> 
prefix sdtmig-3-1-3: <http://rdf.cdisc.org/std/sdtmig-3-1-3#> 
prefix adamig-1-0: <http://rdf.cdisc.org/std/adamig-1-0#> 
prefix crnd-measure: <http://www.example.org/dc/measure#> 
prefix cts:   <http://rdf.cdisc.org/ct/schema#> 
prefix pav:   <http://purl.org/pav> 
prefix sdtmig-3-1-2: <http://rdf.cdisc.org/std/sdtmig-3-1-2#> 
prefix sendig-3-0: <http://rdf.cdisc.org/std/sendig-3-0#> 
prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix adamct: <http://rdf.cdisc.org/adam-terminology#> 
prefix sendct: <http://rdf.cdisc.org/send-terminology#> 
prefix rrdfqbcrnd0: <http://www.example.org/rrdfqbcrnd0/> 
prefix dc:    <http://purl.org/dc/elements/1.1/> 
*/
data ttl;
    set dimensions_ttl codelists_ttl codelistvalues_ttl dsd_ttl
        end=AllDone;
    file "insert-stmts.ru";
    if _n_=1 then do;
        put "INSERT DATA";
        put "{";
        end;
    select;
    when(not missing(language)) do;
    objectrepr=cats(quote(strip(object)),"@",language);
    end;
    when(not missing(datatype)) do;
    objectrepr=cats(quote(strip(object)),"^^",datatype);
    end;
    otherwise do;
    objectrepr= object;
    end;
    end;
    put subject : property : objectrepr ".";
    if alldone then do;
        put "}";
        end;
run;

