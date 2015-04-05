all: \
create-qb-CDISC-prefix.Rmd store-cdisc-rdf-as-rrdf.Rmd create-qb-IC-dataset.Rmd \
populate-sample-xpt.Rmd  qbIClist AEtable DMtable create-ADSL-ttl.Rmd \
create-qb-examples-as-ttl.Rmd \
use-demo-ttl.Rmd  using-arq.html


clean:
	rm -f ../data/qbIClist.rda create-ae-table-as-csv.pdf create-dm-table-as-csv.pdf create-qb-IC-dataset.pdf 

DMtable: create-dm-table-as-csv.pdf

AEtable: create-ae-table-as-csv.pdf
# creates
# ../extdata/sample-cfg/ae.AR.csv ../extdata/sample-cfg/ae.aesoc.AR.csv ../extdata/sample-cfg/ae.aedecod.AR.csv
# not good use of makefile

qbIClist: ../data/qbIClist.rda

../data/qbIClist.rda: create-qb-IC-dataset.pdf 

using-arq.html: using-arq.Rmd
	$(R_HOME)/bin/Rscript -e "knitr::knit2html('using-arq.Rmd')"
	mv -f using-arq.html ../doc

%.pdf: %.Rnw
	$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$*.Rnw')"
	mv -f $*.pdf ../doc

# not clever rule - also creates HTML version
%.pdf: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','pdf_document')"
	mv -f $*.pdf ../doc

# %.html: %.Rmd
# 	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','html_document')"
# 	mv -f $*.html ../doc
