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
    set codes;
    IRIname= cats("crnd-dimension", ":", lowcase(name));
    IRIcodelist= cats("code", ":", lowcase(name));
    IRIcodeClasslist= cats("code", ":", propcase(name));
    IRIcodedvalue=cats("code", ":", lowcase(name),"-", translate(strip(codedvalue),"_", " "));
run;

/* Instead of splitting codesx into pieces include_tabulate_to_qb.sas could do that */
data dimensions;
    if _n_=1 then do;
        set tablesdefx;
    end;
    set codesx;
    by nameorder name ordernumber codedvalue;
    if first.name;
    keep nameorder name namelabel datatype;
    keep IRIname IRIcodelist IRIcodedvalue;
    keep IRIdsd;
    keep dccsname;
    dccsname=cats("dccs", ":", lowcase(name));
    
run;

/* Could also store triples in a hash - would be more flexible */
data ttltemplate;
    length subject property object $200 language $3 datatype $100;
    keep subject property object language datatype;
    delete;
ruN;

data dimensions_ttl;
    if 0 then do; set ttltemplate; end;
    set dimensions;
    subject= dccsname; property= "a"; object="qb:ComponentSpecification";
    output;
    property="rdf:label"; object=namelabel;
    output;
    property="qb:dimension"; object= IRIcodelist;
    output;
    subject=IRIdsd;
    property="qb:component";
    object= dccsname;
    output;
run;

data codelists_ttl;
    if 0 then do; set ttltemplate; end;
    set dimensions; /* assuming all dimensions have codelists */
    subject= IRIcodelist;
    property= "a";
    object="skos:ConceptScheme";
    language=" ";
    output;
    property="rdf:label";
    object=catx(" ", "Codelist scheme:", lowcase(name));
    language="en";
    output;
    property="skos:note";
    object=catx(" ", "Specifies the", lowcase(name), "for each observation, group of obs. or all categories (_ALL_)label" );
    language="en";
    output;
    property="skos:prefLabel"; object=catx(" ", "Codelist scheme:", lowcase(name) );
    language="en";
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
    object="IRIcodelist";
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

