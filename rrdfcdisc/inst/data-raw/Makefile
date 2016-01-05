


HTMLS= store-cdisc-rdf-as-rrdf.html create-qb-CDISC-prefix.html

# not possible directly from .Rmd PDFS=reporting-process.pdf

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )

CDISCRDFZIP=../extdata/CDISC-standards-rdf/cdisc-rdf.zip
RDAQBCDISCPREFIXES=../../data/qbCDISCprefixes.rda

FORDOC= ${HTMLS} ${MDS} 

TARGETS=${CDISCRDFZIP} ${RDAQBCDISCPREFIXES} ${FORDOC}

RKNIT2HTML=$(R_HOME)/bin/Rscript -e "knitr::knit2html('$<')"
RKNIT2PDF=$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$<')"
RKNIT2MD=$(R_HOME)/bin/Rscript -e "knitr::knit('$<')"

RMD2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<')"



all: ${TARGETS}

clean: 
	rm -f ${TARGETS}
	(cd ../doc; rm -f ${FORDOC})

installDoc:
#	mkdir -p ../doc/figure
	cp ${FORDOC} ../doc
#	cp figure/* ../doc/figure

${CDISCRDFZIP} store-cdisc-rdf-as-rrdf.html: store-cdisc-rdf-as-rrdf.Rmd
	${RKNIT2HTML}


${RDAQBCDISCPREFIXES} create-qb-CDISC-prefix.html: create-qb-CDISC-prefix.Rmd
	echo Creating $@
	${RKNIT2HTML}

