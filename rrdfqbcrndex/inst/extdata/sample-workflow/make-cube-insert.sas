libname this ".";
data observations; set this.observations; run;
data codes; set this.codes; run;

proc sort data=codes;
    by nameorder name ordernumber codedvalue;
run;

data codesx;
    set codes;
    IRIname= cats("crnd-dimension", ":", lowcase(name));
    IRIcodelist= cats("code", ":", lowcase(name));
    IRIcodedvalue=cast("code", ":", lowcase(name),"-", translate(codedvalue,"_", " "));
run;

data dimensions;
    set codesx;
    by nameorder name ordernumber codedvalue;
    if first.name;
    keep nameorder name namelabel datatype;
    keep IRIname IRIcodelist IRIcodedvalue;
run;
        
