
HTMLS= populate-sample-xpt.html  create-ADSL-ttl.html create-ADAE-ttl.html \
create-ae-table-as-csv.html  create-dm-table-as-csv.html \
create-qb-examples-as-ttl.html \
use-demo-ttl.html  \
using-arq.html using-arq-graphical-display.html using-arq-qb.html using-python.html \
reporting-process.html \
rdf-gotchas.html

# does not work package-overview.html

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )
PDFS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.pdf/g" )

ADSLTTL=../extdata/sample-rdf/adsl-map.ttl ../extdata/sample-rdf/adsl.ttl
ADAETTL=../extdata/sample-rdf/adae-map.ttl ../extdata/sample-rdf/adae.ttl

QBTTLS=../extdata/sample-rdf/DC-AE-sample.ttl ../extdata/sample-rdf/DC-DM-sample.ttl ../extdata/sample-rdf/DC-DEMO-sample.ttl


TTLS=${ADSLTTL} ${ADAETTL} ${QBTTLS}

ADAEXPT=../extdata/sample-xpt/adae.xpt
ADSLXPT=../extdata/sample-xpt/adsl.xpt

XPTS= ${ADAEXPT} ${ADDMXPT}

CSVS= ${CSVAE} ${CSVDM} 


FORDOC= ${HTMLS} ${MDS} ${PDFS}

TARGETS=${XPTS} ${TTLS}  ${FORDOC}

RMD2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<','all')"

all: ${TARGETS} cleantemp

clean: 
	rm -f ${TARGETS}

cleantemp:
	rm -f ../extdata/sample-rdf/fordot.ttl ../extdata/sample-rdf/fordot.dot
	rm -f ../extdata/sample-rdf/graph.png  ../extdata/sample-rdf/graph.pdf

ds-ttl: ${ADSLTTL} ${ADAETTL}

qb-ttl: ${QBTTLS}

installDoc:
	mkdir -p ../doc/figure
	cp ${FORDOC} ../doc
	cp figure/* ../doc/figure

${ADAEXPT} ${ADSLXPT} populate-sample-xpt.html populate-sample-xpt.pdf populate-sample-xpt.md: populate-sample-xpt.Rmd
	${RMD2HTML}

${ADSLTTL} create-ADSL-ttl.html create-ADSL-ttl.pdf create-ADSL-ttl.md: create-ADSL-ttl.Rmd ${ADSLXPT}
	${RMD2HTML}

${ADAETTL} create-ADAE-ttl.html create-ADAE-ttl.pdf create-ADAE-ttl.md: create-ADAE-ttl.Rmd ${ADAEXPT}
	${RMD2HTML}

${CSVAE} create-ae-table-as-csv.html create-ae-table-as-csv.pdf create-ae-table-as-csv.md: create-ae-table-as-csv.Rmd ${ADAEXPT} 
	${RMD2HTML}

${CSVDM} create-dm-table-as-csv.html create-dm-table-as-csv.pdf create-dm-table-as-csv.md: create-dm-table-as-csv.Rmd
	${RMD2HTML}

${QBTTLS} create-qb-examples-as-ttl.html create-qb-examples-as-ttl.pdf create-qb-examples-as-ttl.md: create-qb-examples-as-ttl.Rmd ${CSVAE} ${CSVDM} ${CSVDEMO}
	${RMD2HTML}

use-demo-ttl.html use-demo-ttl.pdf use-demo-ttl.md: use-demo-ttl.Rmd 
	${RMD2HTML}

using-arq.html using-arq.pdf using-arq.md: using-arq.Rmd 
	${RMD2HTML}

using-arq-graphical-display.html using-arq-graphical-display.pdf using-arq-graphical-display.md: using-arq-graphical-display.Rmd
	${RMD2HTML}
	rm -r -f using-arq-graphical-display_cache using-arq-graphical-display_files fordot.ttl fordot.dot

using-arq-qb.html using-arq-qb.pdf using-arq-qb.md: using-arq-qb.Rmd
	${RMD2HTML}

using-python.html using-python.pdf using-python.md: using-python.Rmd
	${RMD2HTML}

reporting-process.html reporting-process.pdf reporting-process.md: reporting-process.Rmd
	${RMD2HTML}

package-overview.html package-overview.pdf package-overview.md: package-overview.Rmd
	${RMD2HTML}

rdf-gotchas.html rdf-gotchas.pdf rdf-gotchas.md: rdf-gotchas.Rmd
	${RMD2HTML}

