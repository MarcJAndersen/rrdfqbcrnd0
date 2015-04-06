


HTMLS= create-qb-CDISC-prefix.html store-cdisc-rdf-as-rrdf.html create-qb-IC-dataset.html \
populate-sample-xpt.html  create-ADSL-ttl.html \
create-dm-table-as-csv.html create-ae-table-as-csv.html \
create-qb-examples-as-ttl.html \
use-demo-ttl.html  using-arq.html

MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )

ADSLTTL=../extdata/sample-rdf/adsl-map.ttl ../extdata/sample-rdf/adsl.ttl

QBTTLS=../extdata/sample-rdf/DC-AE-sample.ttl ../extdata/sample-rdf/DC-DM-sample.ttl ../extdata/sample-rdf/DC-DEMO-sample.ttl
TTLS= ${QBTTLS} ${ADSLTTL}

CSVAE=../extdata/sample-cfg/ae.AR.csv ../extdata/sample-cfg/ae.aesoc.AR.csv ../extdata/sample-cfg/ae.aedecod.AR.csv
CSVDM=../extdata/sample-cfg/dm.AR.csv

# CSVDEMO is not generated here, so do not delete it
CSVDEMO= ../extdata/sample-cfg/DEMO-Components.csv

ADAEXPT=../extdata/sample-xpt/adae.xpt
ADSLXPT=../extdata/sample-xpt/adsl.xpt


RDAQBICLIST=../data/qbIClist.rda
RDAQBCDISCPREFIXES=../data/qbCDISCprefixes.rda

CDISCRDFZIP=../extdata/CDISC-standards-rdf/cdisc-rdf.zip

XPTS= ${ADAEXPT} ${ADDMXPT}
CSVS= ${CSVAE} ${CSVDM} 

RDAS= ${RDAQBICLIST}

EXAMPLES=use-demo-ttl.html  using-arq.html

FORDOC= ${HTMLS} ${MDS}
TARGETS=${CDISCRDFZIP} ${RDAQBICLIST} ${RDAQBCDISCPREFIXES} ${RDAS} ${TTLS} ${XPTS} ${CSVS} ${FORDOC}

RKNIT2HTML=$(R_HOME)/bin/Rscript -e "knitr::knit2html('$<')"
RKNIT2PDF=$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$<')"


all: ${TARGETS}

clean: 
	rm -f ${TARGETS}

installDoc:
	cp ${FORDOC} ../doc

${ADAEXPT} ${ADDMXPT}: populate-sample-xpt.Rmd
	${RKNIT2HTML}

${CSVAE} create-ae-table-as-csv.html: create-ae-table-as-csv.Rmd ${ADAEXPT} 
	${RKNIT2HTML}

${CSVDM} create-dm-table-as-csv.html: create-dm-table-as-csv.Rmd
	${RKNIT2HTML}

${CDISCRDFZIP} store-cdisc-rdf-as-rrdf.html: store-cdisc-rdf-as-rrdf.Rmd
	${RKNIT2HTML}

${RDAQBCDISCPREFIXES} create-qb-IC-dataset.html: create-qb-IC-dataset.Rmd
	${RKNIT2HTML}

${RDAQBICLIST} create-qb-CDISC-prefix.html: create-qb-CDISC-prefix.Rmd
	${RKNIT2HTML}

${QBTTLS} create-qb-examples-as-ttl.html: create-qb-examples-as-ttl.Rmd ${CSVAE} ${CSVDM} ${CSVDEMO}
	${RKNIT2HTML}

${ADSLTTL} create-ADSL-ttl.html: create-ADSL-ttl.Rmd ${ADSLXPT}
	${RKNIT2HTML}

use-demo-ttl.html: use-demo-ttl.Rmd ../extdata/sample-rdf/DC-DEMO-sample.ttl
	${RKNIT2HTML}

using-arq.html: using-arq.Rmd ../extdata/sample-rdf/DC-DEMO-sample.ttl
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
