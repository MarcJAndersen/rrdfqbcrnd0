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

   invalue destatso
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

	invalue sexfmto
	  'N' = 1
	  'F' = 2
	  'M' = 3;
    
	value $agegrfmt
	  'N'     = 'n[a]'
      '<65'   = '<65'
	  '65-80' = '65-80'
	  '>80'   = '>80';

	invalue agegrfmto
	  'N'     = 1
      '<65'   = 2
	  '65-80' = 3
	  '>80'   = 4;

	value $racefmt
	  'N' = 'n[a]'
	  'WHITE' = 'White'
	  'BLACK OR AFRICAN AMERICAN' = 'Black or African American'
	  'AMERICAN INDIAN OR ALASKA NATIVE' = 'American Indian or Alaska Native';

	invalue racefmto
	  'N' = 1
	  'WHITE' = 2
	  'BLACK OR AFRICAN AMERICAN' = 3
	  'AMERICAN INDIAN OR ALASKA NATIVE' = 4;

	value $ethfmt
	  'N' = 'n[a]'
	  'NOT HISPANIC OR LATINO' = 'Not Hispanic or Latino'
	  'HISPANIC OR LATINO' = 'Hispanic or Latino';

	invalue ethfmto
	  'N' = 1
	  'NOT HISPANIC OR LATINO' = 2
            'HISPANIC OR LATINO' = 3;

        value trt01an
            0="Placebo"
            54="Xanomeline Low Dose"
            81="Xanomeline High Dose"
            ;

            
run;

data work.adsl;
   set source.adsl;

   where ittfl = 'Y';
run;

options formchar="|----|+|---+=|-/\<>*";

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

proc print data=demo_tabulate;
    format _all_;
run;

data _null_;
    tableid=open('demo_tabulate','i');
    length dimvarlist measurevarlist $32000;
    dimvarlist=" ";
    measurevarlist=" ";
    dimvarfromposm1= varnum(tableid, "_Run_");
    dimvartoposp1= varnum(tableid, "_type_");
    do i=dimvarfromposm1+1 to dimvartoposp1-1;
        dimvarlist=catx(" ", dimvarlist, varname(tableid,i));
        end;
    measurefromposm1= varnum(tableid, "_TABLE_");
    measuretopos= attrn(tableid,'nvars');
    do i=measurefromposm1+1 to measuretopos-1;
        measurevarlist=catx(" ", measurevarlist, varname(tableid,i));
        end;
rc=close(tableid);
call symputx("dimvarlist", dimvarlist );
call symputx("measurevarlist", measurevarlist );

run;

%put dimvarlist=&dimvarlist.;
%put measurevarlist=&measurevarlist.;

data observations;
    if _n_=1 then do;
        /* make two hashes - dimensions and codelists */
    end;

    set demo_tabulate;
    /* add variable to dimension hash */
    /* add variable and code level to hash */

    keep &dimvarlist.;
    keep _type_;
    length procedure factor denominator $64;
    keep procedure factor denominator;
    array measures(*) &measurevarlist.;
    keep measure;
    do i=1 to dim(measures);
        mn= vname(measures(i));
        procedure=" ";
        factor=" ";
        denominator=" ";
        if upcase(scan(mn,1,"_")) in ("N", "PCTN") then do;
            procedure=scan(mn,1,"_");
            factor=" ";
            denominator=" ";
            measure=measures(i);
            output;
            end;
        else do;
            procedure=scan(mn,-1,"_");
            factor= substr(mn, 1, length(mn)-length(procedure)-1);
            denominator=" ";
            measure=measures(i);
            output;
            end;
        end;
run;

proc print data=observations;
run;

data forexport;
    set observations;    
    keep colno rowno cellpartno;
    format colno rowno cellpartno z5.0;
    /* assign values based on layout */
    colno=0; rowno=0; cellpartno=0;
run;    


/*
    do i=1 to dim(adim);
        select;
        when (adim(i)="N" and col0="n[a]") do;
        adim(i)="_NONMISS_";
        end;
        when (missing(adim(i))) do;
        adim(i)="_ALL_";
        end;
        end;
    end;


*/

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

