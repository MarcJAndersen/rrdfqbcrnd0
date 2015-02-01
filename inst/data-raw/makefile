qbIClist: ../data/qbIClist.rda

../data/qbIClist.rda: create-qb-IC-dataset.pdf

%.pdf: %.Rnw
	$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$*.Rnw')"
	mv -f $*.pdf ../inst/doc

%.pdf: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','pdf_document')"
	mv -f $*.pdf ../inst/doc

%.html: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','html_document')"
	mv -f $*.html	 ../inst/doc
