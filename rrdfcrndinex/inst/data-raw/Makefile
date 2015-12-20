
HTMLS= populate-sample-xpt.html  create-ADSL-ttl.html create-ADAE-ttl.html \
create-ae-table-as-csv.html  create-dm-table-as-csv.html


# not possible directly from .Rmd PDFS=reporting-process.pdf

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )

ADSLTTL=../extdata/sample-rdf/adsl-map.ttl ../extdata/sample-rdf/adsl.ttl
ADAETTL=../extdata/sample-rdf/adae-map.ttl ../extdata/sample-rdf/adae.ttl

TTLS=${ADSLTTL} ${ADAETTL}

ADAEXPT=../extdata/sample-xpt/adae.xpt
ADSLXPT=../extdata/sample-xpt/adsl.xpt


XPTS= ${ADAEXPT} ${ADDMXPT}

CSVS= ${CSVAE} ${CSVDM} 

FORDOC= ${HTMLS} ${MDS} ${PDFS}

TARGETS=${TTLS} ${XPTS} ${FORDOC}

RKNIT2HTML=$(R_HOME)/bin/Rscript -e "knitr::knit2html('$<')"
RKNIT2PDF=$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$<')"
RKNIT2MD=$(R_HOME)/bin/Rscript -e "knitr::knit('$<')"

RMD2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<')"


all: ${TARGETS}

clean: 
	rm -f ${TARGETS}

installDoc:
	cp ${FORDOC} ../doc

${ADAEXPT} ${ADSLXPT} populate-sample-xpt.html: populate-sample-xpt.Rmd
	${RKNIT2HTML}

${ADSLTTL} create-ADSL-ttl.html: create-ADSL-ttl.Rmd ${ADSLXPT}
	${RKNIT2HTML}

${ADAETTL} create-ADAE-ttl.html: create-ADAE-ttl.Rmd ${ADAEXPT}
	${RKNIT2HTML}

${CSVAE} create-ae-table-as-csv.html: create-ae-table-as-csv.Rmd ${ADAEXPT} 
	${RKNIT2HTML}

${CSVDM} create-dm-table-as-csv.html: create-dm-table-as-csv.Rmd
	${RKNIT2HTML}

