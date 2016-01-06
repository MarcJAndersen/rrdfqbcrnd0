
HTMLS= get-cube-vocabulary.html get-qb-ex-ttlfile.html create-qb-IC-dataset.html

# List of files with .md extension
MDS= $(shell echo "${HTMLS}" | sed -e "s/\.html/\.md/g" )

FORDOC= ${HTMLS} ${MDS}

# ToDo(MJA): ${SPARQLUPDATE} is made manually - should be extracted from cube specs 
SPARQLUPDATE=inst/extdata/cube-vocabulary-rdf/normalize-algorithm-phase-1.ru \
inst/extdata/cube-vocabulary-rdf/normalize-algorithm-phase-2.ru
# ToDo(MJA): ${QBEXFAILIC14TTL} is made manually - should be generated
QBEXFAILIC14TTL=inst/extdata/sample-rdf/example-fails-IC14.ttl

RDAQBICLIST=./data/qbIClist.rda
QBVOCABULARY=inst/extdata/cube-vocabulary-rdf/cube.ttl
QBEXAMPLETTL=inst/extdata/sample-rdf/example.ttl inst/extdata/sample-rdf/example-normalized.ttl
TARGETS= ${FORDOC} ${QBEXAMPLETTL} ${QBVOCABULARY} 

RKNIT2HTML=$(R_HOME)/bin/Rscript -e "knitr::knit2html('$<')"
RKNIT2PDF=$(R_HOME)/bin/Rscript -e "knitr::knit2pdf('$<')"
RKNIT2MD=$(R_HOME)/bin/Rscript -e "knitr::knit('$<')"

RMD2HTML=$(R_HOME)/bin/Rscript -e "rmarkdown::render('$<')"


all: ${TARGETS}

clean: 
	rm -f ${TARGETS}

installDoc:
#	mkdir -p ../doc/figure
	cp ${FORDOC} ../doc
#	cp figure/* ../doc/figure

${QBVOCABULARY} get-cube-vocabulary.html: get-cube-vocabulary.Rmd
	${RKNIT2HTML}

${QBEXAMPLETTL} get-qb-ex-ttlfile.html: get-qb-ex-ttlfile.Rmd
	${RKNIT2HTML}

${RDAQBICLIST} create-qb-IC-dataset.html: create-qb-IC-dataset.Rmd
	${RKNIT2HTML}

