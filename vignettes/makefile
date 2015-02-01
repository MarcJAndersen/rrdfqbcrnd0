

all: check-cube.pdf check-ic.pdf cube-from-workbook.pdf first-cube.pdf howto-create-vignette.pdf SPARQL-query.pdf

clean: 

%.pdf: %.Rnw
	$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$*.Rnw')"

# not clever rule - also creates HTML version
%.pdf: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','all')"


%.html: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','html_document')"

