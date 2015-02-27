/*------------------------------------------------------------------------*\
** Program : report_to_rrdf.sas
** Purpose : Transfer dataset report to RRDFQBCRND excel workbook format
\*------------------------------------------------------------------------*/

options linesize=200 nocenter;

proc contents data=temp.report varnum;
run;

proc print data=temp.report width=min;
*    where col0 in ( 'MIN', 'MAX', 'Q1', 'Q3', 'MEAN', 'MEDIAN', 'N', 'STD', 'NC' );
*    where ord<0 or col0 = "NC";
    var sex agegr1 race ethnic varn _name_ ord col0 coln1 colna1 coln2 colna2 coln3 colna3;
run;

data forexport;
    length sex agegr1 race ethnic trt01a $200;
    set temp.report;
    keep sex agegr1 race ethnic trt01a;
    length trt01a $50;
    keep procedure factor;
    length procedure factor $50;
    keep unit denominator;
    length unit denominator $50;
    unit=" ";
    keep measure;
    array adim(*) sex agegr1 race ethnic;
    array meascont(*) coln1 coln2 coln3;
    array measn(*) coln1 coln2 coln3;
    array measnpct(*) coln1 coln2 coln3;
    array atrt01a(3) $50 ("Placebo" "Xanomeline Low Dose"   "Xanomeline High Dose");
    do i=1 to dim(adim);
        if missing(adim(i)) or (adim(i)="N" and col0="n[a]") then do;
        adim(i)="_ALL_";
        end;
    end;

    select;
    when (ord<0) do;
        do i=1 to dim(atrt01a);
            factor=varn;
            procedure=_name_;
            denominator=" ";
            trt01a= atrt01a(i);
            measure=meascont(i);
            output;
            end;
        end;
    when (varn in ("sex", "agegr1", "race", "ethnic")) do;
        do i=1 to dim(atrt01a);
            factor="quantity";
            procedure="count";
            denominator=" ";
            trt01a= atrt01a(i);
            measure=measn(i);
            output;
            end;
        do i=1 to dim(atrt01a);
            factor="proportion";
            procedure="percent";
            denominator=varn;
            trt01a= atrt01a(i);
            measure=measnpct(i);
            output;
            end;
        end;
    otherwise do;
    end;
end;
run;

proc print data=forexport width=min;
run;

proc contents data=forexport varnum;
run;

proc export data=forexport file="../sample-cfg/demo.AR.csv" replace;
run;

data skeletonSource;
    length compType compName compLabel codeType nciDomainValue $100;
    compType= "dimension"; compName="trt01a";    compLabel="Treatment Arm"; codeType="DATA"; nciDomainValue= " "; output;
    compType= "dimension"; compName="sex";       compLabel="Sex (Gender)"; codeType="SDTM"; nciDomainValue="C66731";output;
    compType= "dimension"; compName="saffl";     compLabel="Safety Population Flag"; codeType="DATA"; nciDomainValue= " ";output;
    compType= "dimension"; compName="procedure"; compLabel="Statistical Procedure"; codeType="DATA"; nciDomainValue= " ";output;
    compType= "dimension"; compName="factor";    compLabel="Type of procedure (quantity, proportion...)"; codeType="DATA"; nciDomainValue= " "; output;

    compType= "measure"; compName="measure";      compLabel="Value of the statistical measure"; codeType=" "; nciDomainValue=" "; output;
    compType= "attribute"; compName="unit";        compLabel="Unit of measure"; codeType=" "; nciDomainValue=" "; output;
    compType= "attribute"; compName="denominator"; compLabel="Denominator for a proportion (oskr) subset on which a statistic is based"; codeType=" "; nciDomainValue=" "; output;
    
run;


proc export data=skeletonSource file="../sample-cfg/skeletonSource-DEMO.csv" replace;
run;
