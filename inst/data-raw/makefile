all: qbIClist AEtable DMtable

clean:
	rm -f ../data/qbIClist.rda create-ae-table-as-csv.pdf create-dm-table-as-csv.pdf create-qb-IC-dataset.pdf 

DMtable: create-dm-table-as-csv.pdf
AEtable: create-ae-table-as-csv.pdf
# creates
# ../extdata/sample-cfg/ae.AR.csv ../extdata/sample-cfg/ae.aesoc.AR.csv ../extdata/sample-cfg/ae.aedecod.AR.csv
# not good use of makefile

qbIClist: ../data/qbIClist.rda

../data/qbIClist.rda: create-qb-IC-dataset.pdf 


%.pdf: %.Rnw
	$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$*.Rnw')"
	mv -f $*.pdf ../doc

# not clever rule - also creates HTML version
%.pdf: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','all')"
	mv -f $*.pdf ../doc
	mv -f $*.html ../doc

%.html: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','html_document')"
	mv -f $*.html ../doc
