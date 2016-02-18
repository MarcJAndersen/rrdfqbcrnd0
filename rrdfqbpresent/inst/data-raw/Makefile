
HTMLS=two-dim-representation-of-cube.html

# does not work package-overview.html

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )
PDFS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.pdf/g" )


FORDOC= ${HTMLS} ${MDS} ${PDFS}

TARGETS=${FORDOC}

RKNIT2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<')"
RKNIT2PDF=$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$<')"
RKNIT2MD=$(R_HOME)/bin/Rscript -e "knitr::knit('$<')"

RMD2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<','all')"


all: ${TARGETS} cleantemp

clean: 
	rm -f ${TARGETS}

cleantemp:
	rm -f ../extdata/sample-rdf/fordot.ttl ../extdata/sample-rdf/fordot.dot
	rm -f ../extdata/sample-rdf/graph.png  ../extdata/sample-rdf/graph.pdf

installDoc:
	# mkdir -p ../doc/figure
	cp ${FORDOC} ../doc
	# cp figure/* ../doc/figure

two-dim-representation-of-cube.html two-dim-representation-of-cube.pdf two-dim-representation-of-cube.md: two-dim-representation-of-cube.Rmd
	${RMD2HTML}

# %.pdf: %.Rnw
# 	${RKNIT2PDF}
#
# %.html: %.Rmd
#	${RMD2HTML}

# # not clever rule - also creates HTML version
# %.pdf: %.Rmd
#	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','pdf_document')"
#	mv -f $*.pdf ../doc

# %.html: %.Rmd
# 	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','html_document')"
# 	mv -f $*.html ../doc
