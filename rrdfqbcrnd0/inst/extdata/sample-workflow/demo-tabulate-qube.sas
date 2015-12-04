/*------------------------------------------------------------------------*\
** Program : demo-export-csv.sas

** Purpose : Show how to modify program from PhUSE scription group to
** generate .csv files for using with RRDFQBCRND0

** Note: Program code is from program by from Mike Carniello at
** https://code.google.com/p/phuse-scripts/source/browse/trunk/whitepapers/demographics/demo.sas

** Author: Marc Andersen (mja@statgroup.dk), 02-mar-2015
\*------------------------------------------------------------------------*/



options ls=150;
* filename source url "http://phuse-scripts.googlecode.com/svn/trunk/scriptathon2014/data/adsl.xpt" ;
filename source "../sample-xpt/adsl.xpt";
libname source xport ;

options mprint;

proc format;
   value $destats
     'NC'       = 'n[a]'
     'MEANC'    = 'Mean'
     'STDC'     = 'SD'
     'MEDIANC'  = 'Median'
     'Q1Q3C'    = 'Q1, Q3'
	 'MINMAXC'  = 'Min, Max'
	 'MISSINGC' = 'Missing';

   value $destatso
     'NC'       = 0
     'MEANC'    = 1
     'STDC'     = 2
     'MEDIANC'  = 3
     'Q1Q3C'    = 4
     'MINMAXC'  = 5
     'MISSINGC' = 6
     'MIN'      =-101
     'MAX'      =-102
     'Q1'      =-103
     'Q3'      =-104
     'MEAN'    =-105
     'MEDIAN'  =-106
     'N'=-107
       'STD'=-108
       ;

   value $sexfmt
	  'N' = 'n[a]'
	  'F' = 'F'
	  'M' = 'M';

	value $sexfmto
	  'N' = 1
	  'F' = 2
	  'M' = 3;
    
	value $agegrfmt
	  'N'     = 'n[a]'
      '<65'   = '<65'
	  '65-80' = '65-80'
	  '>80'   = '>80';

	value $agegrfmto
	  'N'     = 1
          '<65'   = 2
	  '65-80' = 3
	  '>80'   = 4;

	value $racefmt
	  'N' = 'n[a]'
	  'WHITE' = 'White'
	  'BLACK OR AFRICAN AMERICAN' = 'Black or African American'
	  'AMERICAN INDIAN OR ALASKA NATIVE' = 'American Indian or Alaska Native';

	value $racefmto
	  'N' = 1
	  'WHITE' = 2
	  'BLACK OR AFRICAN AMERICAN' = 3
	  'AMERICAN INDIAN OR ALASKA NATIVE' = 4;

	value $ethfmt
	  'N' = 'n[a]'
	  'NOT HISPANIC OR LATINO' = 'Not Hispanic or Latino'
	  'HISPANIC OR LATINO' = 'Hispanic or Latino';

	value $ethfmto
	  'N' = 1
	  'NOT HISPANIC OR LATINO' = 2
            'HISPANIC OR LATINO' = 3;

        value trt01an
            0="Placebo"
            54="Xanomeline Low Dose"
            81="Xanomeline High Dose"
            ;


   value $orderfmt
       "sex"="$sexfmto."
       "agegr1"="$agegrfmto."
       "race"="$racefmt."
       "ethnic"="$ethfmto."
       other=" "
       ;
        
run;

data work.adsl;
   set source.adsl;

   where ittfl = 'Y';
run;

options formchar="|----|+|---+=|-/\<>*";

/*

* testing SAS eXtended attributes - however, looks like they are not
  transferred to output data set in PROC tabulate
;
    
proc datasets lib=work nolist ;
   modify adsl;
      xattr add var sex ( presentorder="sexfmto");
run; 
quit;

proc contents data=adsl varnum;
run;
*/

ods output table=demo_tabulate;
/* if there are missing values create
   classvar_nonmiss= not missing(classvar);
   and then use
   classvar_nonmiss*classvar*pctn<classvar>
   then limit the results for pctn to only those there classvar_nonmiss=1
       
*/

proc tabulate data=adsl missing;
   where ittfl = 'Y';
   class ittfl;
   class sex;
    format sex $sexfmt.;
    class agegr1;
    format agegr1 $agegrfmt.;
    class race;
    format race $racefmt.;
    class ethnic;
    format ethnic $ethfmt.;
    var age;
    var weightbl;
    class trt01an;
    format trt01an trt01an.;
    table
        ittfl,
        sex*(n pctn<sex>)
        agegr1*(n pctn<agegr1>)
        ethnic*(n pctn<ethnic>)
        age*(n nmiss mean stddev median q1 q3 min max)
        weightbl*(n nmiss mean stddev median q1 q3 min max)
        ,
        trt01an;
run;

/*
proc contents data=demo_tabulate varnum;
run;
*/

proc print data=demo_tabulate;
    format _all_;
run;

data _null_;
    tableid=open('demo_tabulate','i');
    length classvarlist classvarlistc classvarlistn resultvarlist $32000;
    classvarlist=" ";
    classvarlistc=" ";
    classvarlistn=" ";
    array cltype(0:1) classvarlistn classvarlistc;
    resultvarlist=" ";
    classvarfromposm1= varnum(tableid, "_Run_");
    classvartoposp1= varnum(tableid, "_type_");
    do i=classvarfromposm1+1 to classvartoposp1-1;
        classvarlist=catx(" ", classvarlist, varname(tableid,i));
        cltype(vartype(tableid,i)="C")=catx(" ", cltype(vartype(tableid,i)="C"), varname(tableid,i));
        end;
    resultfromposm1= varnum(tableid, "_TABLE_");
    resulttopos= attrn(tableid,'nvars');
    do i=resultfromposm1+1 to resulttopos-1;
        resultvarlist=catx(" ", resultvarlist, varname(tableid,i));
        end;
    rc=close(tableid);
    array vput(*) classvarlist classvarlistc classvarlistn resultvarlist;
    do i=1 to dim(vput);
        call symputx( vname(vput(i)), vput(i));
        end;

run;

%put classvarlist=&classvarlist.;
%put classvarlistc=&classvarlistc.;
%put classvarlistn=&classvarlistn.;
%put resultvarlist=&resultvarlist.;

/*
R4CDISC

> ValMD <- getValMD(define)
> names(ValMD)
 [1] "IR_ItemOID"           "ValueListOID"         "IR_OrderNumber"       "IR_Mandatory"         "ID_Name"             
 [6] "ID_Length"            "ID_SignificantDigits" "ID_DataType"          "ID_Label"             "ID_SASFieldName"     
[11] "ID_SASFormatName"     "ID_CodeListOID"       "ID_OriginType"        "ID_OriginDescription"
> VarMD <- getVarMD(define)
> names(VarMD)
 [1] "IR_ItemOID"           "IGD_Name"             "IR_OrderNumber"       "IR_Mandatory"         "IR_KeySequence"      
 [6] "ID_Name"              "ID_Length"            "ID_SignificantDigits" "ID_DataType"          "ID_Label"            
[11] "ID_SASFieldName"      "ID_SASFormatName"     "ID_CodeListOID"       "ID_OriginType"        "ID_OriginDescription"
>

> CT <- getCT(define)
> View(CT)
> names(CT)
 [1] "OID"             "Name"            "DataType"        "SASFormatName"   "CodeListCode"    "CodeListContext"
 [7] "CodedValue"      "OrderNumber"     "Rank"            "ExtendedValue"   "ItemCode"        "ItemContext"    
[13] "Decode"

*/

data variablesdef;
attrib DataType length=$32;
attrib Label length=$32;
attrib SASFieldName length=$32;
attrib SASFormatName length=$32;
attrib CodeListOID length=$32;
attrib OriginDescription length=$32;

call missing( DataType, Label, SASFieldName , SASFormatName,
CodeListOID , OriginDescription );

delete;

run;

data codesdef;
attrib name length=$32;
attrib datatype length=$32;
attrib codedvalue length=$32;
attrib ordernumber length=$32;
attrib decode  length=$200;
call missing( name, datatype, codedvalue, ordernumber, decode);
delete;
run;

    
data observations;
    if 0 then do;
        set variablesdef;
        set codesdef;
        end;
    
    if _n_=1 then do;
    declare hash cval(dataset: "codesdef");
    rc= cval.definekey( "name", "codedvalue" );
    rc= cval.definedata(ALL:'YES' );
    rc= cval.definedone( );
    end;

    array results(*) &resultvarlist.;


    set demo_tabulate end=AllDone;
    /* add variable to dimension hash */
    /* add variable and code level to hash */

    keep &classvarlist.;
    keep _type_;
    length procedure factor denominator $64;
    keep procedure factor denominator;
    array resdimc(*) &classvarlistc. procedure factor denominator;
    array resdimn(*) &classvarlistn. ;
    keep measure;
    do i=1 to dim(results);
        mn= vname(results(i));
        procedure=" ";
        factor=" ";
        denominator=" ";
        select;
        when (mn="N") do;
            procedure="COUNT"; /* COUNT to be compliant with R package ? */
            factor=" "; /* could take the same as for PCTN */
            denominator=" ";
            measure=results(i);
            end;
        when (upcase(scan(mn,1,"_")) in ("PCTN")) do;
            procedure=scan(mn,1,"_");
            denominatorpattern=scan(mn,-1,"_");
            factor=" "; /* take the set difference of _type_ and denominatorpattern and select those classdim variables - here only one */
            denominator=" ";
            measure=results(i);
            end;
        otherwise do;
            procedure=scan(mn,-1,"_");
            factor= substr(mn, 1, length(mn)-length(procedure)-1);
            denominator=" ";
            measure=results(i);
            end;
            end;
        if not missing(measure) then do; /* not ideal - STD is undefined for n=2, and would like to have it in the results */
            output;
            do j=1 to dim(resdimc); /* do not need to do it again for &classvarlistc. variables */
            name=lowcase(vname(resdimc(j)));
            putlog name=;
            datatype= "text";
            if missing(resdimc(j)) then do;
                codedvalue="_ALL_";
                decode= "All";
                    ordernumber= " ";
                end;
            else do;
                codedvalue= resdimc(j);
                decode= vvalue(resdimc(j));
                if missing(put(name,$orderfmt.)) or missing(codedvalue) then do;
                    ordernumber= " ";
                    end;
                else do;
                    ordernumber= putc(strip(codedvalue),put(name,$orderfmt.)); /* use the informat above - make a format mapping from name to informat */
                    end;
                    end;
                rc=cval.ref();
                end;
            do j=1 to dim(resdimn);
                name=lowcase(vname(resdimc(j)));
                putlog name=;
                datatype= "integer";
                if missing(resdimn(j)) then do;
                    codedvalue="_ALL_";
                    decode= "All";
                    ordernumber= " ";
                    end;
                else do;
                    codedvalue= resdimc(j);
                    decode= vvalue(resdimn(j));
                    if missing(put(name,$orderfmt.)) then do;
                        ordernumber= " ";
                        end;
                    else do;
                        ordernumber= putc(strip(codedvalue),put(name,$orderfmt.)); /* use the informat above - make a format mapping from name to informat */
                        end;
                        end;
                    rc=cval.ref();
                    end;
                end;
            end;
        
        if alldone then do;
            cval.output(dataset: "codes");
            end;
run;

proc print data=observations;
run;

proc print data=codes;
run;


%MACRO OldCode;
    
data forexport;
    set observations;    
    keep colno rowno cellpartno;
    format colno rowno cellpartno z5.0;
    /* assign values based on layout */
    colno=0; rowno=0; cellpartno=0;
run;    



/*
proc export data=forexport file="../sample-cfg/demo.AR.csv" replace;
run;
*/
    
data skeletonSource1;
length compType compName codeType nciDomainValue compLabel Comment $512;
    Comment= " ";
    compType= "dimension"; compName="trt01a";    compLabel="Treatment Arm"; codeType="DATA"; nciDomainValue= " "; output;
    compType= "dimension"; compName="sex";       compLabel="Sex (Gender)"; codeType="SDTM"; nciDomainValue="C66731";output;
    compType= "dimension"; compName="saffl";     compLabel="Safety Population Flag"; codeType="DATA"; nciDomainValue= " ";output;
    compType= "dimension"; compName="procedure"; compLabel="Statistical Procedure"; codeType="DATA"; nciDomainValue= " ";output;
    compType= "dimension"; compName="factor";    compLabel="Type of procedure (quantity, proportion...)"; codeType="DATA"; nciDomainValue= " "; output;

    compType= "measure"; compName="measure";      compLabel="Value of the statistical measure"; codeType=" "; nciDomainValue=" "; output;
    compType= "attribute"; compName="unit";        compLabel="Unit of measure"; codeType=" "; nciDomainValue=" "; output;
    compType= "attribute"; compName="denominator"; compLabel="Denominator for a proportion (oskr) subset on which a statistic is based"; codeType=" "; nciDomainValue=" "; output;

/* presentation stuff */    
    compType= "attribute"; compName="colno"; compLabel="Column number for two dimensional represenation"; codeType=" "; nciDomainValue=" "; output;
    compType= "attribute"; compName="rowno"; compLabel="Row number for two dimensional represenation"; codeType=" "; nciDomainValue=" "; output;
    compType= "attribute"; compName="cellpartno"; compLabel="Position within cell given by row and column number for two dimensional represenation"; codeType=" "; nciDomainValue=" "; output;
    
run;


data skeletonSource2;
length compType compName codeType nciDomainValue compLabel Comment $512;
    
compType= "metadata";
compName= "obsURL";
codeType= " ";
nciDomainValue= " ";
compLabel= "https://phuse-scripts.googlecode.com/svn/trunk/scriptathon2014/data/adsl.xpt";
Comment= "obsFileName";
output; 

compType= "metadata";
compName= "obsFileName";
codeType= " ";
nciDomainValue= " ";
compLabel= "demo.AR.csv";
Comment= "obsFileName";
output; 

compType= "metadata";
compName= "dataCubeFileName";
codeType= " ";
nciDomainValue= " ";
compLabel= "DC-DEMO-R-V";
Comment= "Cube name prefix (will be appended with version number by script. --> No. Will be set in code based on domainName parameter";
output; 

compType= "metadata";
compName= "cubeVersion";
codeType= " ";
nciDomainValue= " ";
compLabel= "0.5.2";
Comment= "Version of cube with format n.n.n";
output; 

compType= "metadata";
compName= "createdBy";
codeType= " ";
nciDomainValue= " ";
compLabel= "Marc Andersen";
Comment= "Person who configures this spreadsheet and runs the creation script to create the cube";
output; 

compType= "metadata";
compName= "description";
codeType= " ";
nciDomainValue= " ";
compLabel= "Data from demo.sas program";
Comment= "Cube description";
output; 

compType= "metadata";
compName= "providedBy";
codeType= " ";
nciDomainValue= " ";
compLabel= "PhUSE Results Metadata Working Group";
Comment= " ";
output; 

compType= "metadata";
compName= "comment";
codeType= " ";
nciDomainValue= " ";
compLabel= "Example demographics table from demo.sas program";
Comment= " ";
output; 

compType= "metadata";
compName= "title";
codeType= " ";
nciDomainValue= " ";
compLabel= "Demographics Analysis Results";
Comment= " ";
output; 

compType= "metadata";
compName= "label";
codeType= " ";
nciDomainValue= " ";
compLabel= "Demographics results data set.";
Comment= " ";
output; 

compType= "metadata";
compName= "wasDerivedFrom";
codeType= " ";
nciDomainValue= " ";
compLabel= "demo.AR.csv";
Comment= "Data source (obsFileName). Set this programmtically based on name of input file!";
output; 

compType= "metadata";
compName= "domainName";
codeType= " ";
nciDomainValue= " ";
compLabel= "DEMO";
Comment= "The domain name, also part of the spreadsheet tab name";
output; 

compType= "metadata";
compName= "obsFileNameDirec";
codeType= " ";
nciDomainValue= " ";
compLabel= "!example";
Comment= "The directory containd the wasDerivedFrom file";
output; 

compType= "metadata";
compName= "dataCubeOutDirec";
codeType= " ";
nciDomainValue= " ";
compLabel= "!temporary";
Comment= " ";
output; 

run;

data skeletonSource;
    set skeletonSource1 skeletonSource2;
run;
    
/*
proc export data=skeletonSource file="../sample-cfg/DEMO-Components.csv" replace;
run;
*/

    %MEND;
