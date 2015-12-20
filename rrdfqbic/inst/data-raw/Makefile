


HTMLS= create-qb-IC-dataset.html

# not possible directly from .Rmd PDFS=reporting-process.pdf

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )

FORDOC= ${HTMLS} ${MDS} 

TARGETS=  ${FORDOC}

RKNIT2HTML=$(R_HOME)/bin/Rscript -e "knitr::knit2html('$<')"
RKNIT2PDF=$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$<')"
RKNIT2MD=$(R_HOME)/bin/Rscript -e "knitr::knit('$<')"

RMD2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<')"

RDAQBICLIST=../../data/qbIClist.rda
RDAQBCDISCPREFIXES=../../data/qbCDISCprefixes.rda

all: ${TARGETS}

clean: 
	rm -f ${TARGETS}

installDoc:
#	mkdir -p ../doc/figure
	cp ${FORDOC} ../doc
#	cp figure/* ../doc/figure

${RDAQBICLIST} create-qb-IC-dataset.html: create-qb-IC-dataset.Rmd
	${RKNIT2HTML}



