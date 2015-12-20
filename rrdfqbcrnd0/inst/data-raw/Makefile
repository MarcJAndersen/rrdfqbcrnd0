
HTMLS= codelist-procedure.html

# reporting-process.html package-overview.html

# not possible directly from .Rmd PDFS=reporting-process.pdf

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )


FORDOC= ${HTMLS} ${MDS} ${PDFS}

TARGETS= ${FORDOC}

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

codelist-procedure.html: codelist-procedure.Rmd 
	${RKNIT2HTML}

reporting-process.html: reporting-process.Rmd
	${RKNIT2HTML}

reporting-process.md: reporting-process.Rmd
	${RKNIT2MD}

reporting-process.pdf: reporting-process.Rmd
	${RKNIT2PDF}

package-overview.html: package-overview.Rmd
	${RMD2HTML}

package-overview.md: package-overview.Rmd
	${RKNIT2MD}

package-overview.pdf: package-overview.Rmd
	${RKNIT2PDF}

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
