
HTMLS= create-qb-examples-as-ttl.html \
use-demo-ttl.html  \
using-arq.html using-arq-graphical-display.html using-arq-qb.html using-python.html

# not possible directly from .Rmd PDFS=reporting-process.pdf

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )

QBTTLS=../extdata/sample-rdf/DC-AE-sample.ttl ../extdata/sample-rdf/DC-DM-sample.ttl ../extdata/sample-rdf/DC-DEMO-sample.ttl

TTLS= ${QBTTLS}

FORDOC= ${HTMLS} ${MDS} ${PDFS}

TARGETS=${FORDOC}

RKNIT2HTML=$(R_HOME)/bin/Rscript -e "knitr::knit2html('$<')"
RKNIT2PDF=$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$<')"
RKNIT2MD=$(R_HOME)/bin/Rscript -e "knitr::knit('$<')"

RMD2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<')"


all: ${TARGETS}

clean: 
	rm -f ${TARGETS}

installDoc:
	mkdir -p ../doc/figure
	cp ${FORDOC} ../doc
	cp figure/* ../doc/figure

${QBTTLS} create-qb-examples-as-ttl.html: create-qb-examples-as-ttl.Rmd ${CSVAE} ${CSVDM} ${CSVDEMO}
	${RKNIT2HTML}

use-demo-ttl.html: use-demo-ttl.Rmd 
	${RKNIT2HTML}

using-arq.html: using-arq.Rmd 
	${RKNIT2HTML}

using-arq-graphical-display.html: using-arq-graphical-display.Rmd
	${RKNIT2HTML}

using-arq-qb.html: using-arq-qb.Rmd
	${RKNIT2HTML}

using-python.html: using-python.Rmd
	${RKNIT2HTML}

# %.pdf: %.Rnw
# 	${RKNIT2PDF}
#
# %.html: %.Rmd
#	${RKNIT2HTML}

# # not clever rule - also creates HTML version
# %.pdf: %.Rmd
#	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','pdf_document')"
#	mv -f $*.pdf ../doc

# %.html: %.Rmd
# 	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','html_document')"
# 	mv -f $*.html ../doc
