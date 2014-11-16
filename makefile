PACKAGENAME=rrdfqbcrnd0

all: createRD qbIClist rbuildforce rcheck rbuild

cleantempemacs:
	rm -f .#* */.#*

rbuildforce: 
	cd ..; R CMD build --force ${PACKAGENAME}

rcheck: 
	cd ..; R CMD check --as-cran ${PACKAGENAME}

rbuild: 
	cd ..; R CMD build  ${PACKAGENAME}

createRD:
	# does not work MJA 2014-11-16 Rscript -e 'library(devtools); devtools::document()'

create-r-data-contents: qbIClist

qbIClist: data/qbIClist.rda

data/qbIClist.rda: inst/data-raw/create-qb-IC-dataset.Rmd
	Rscript -e 'library(knitr);knit("inst/data-raw/create-qb-IC-dataset.Rmd")'


# To start fuseki endpoint - should be a script. 
# Problem that location is configuration dependent
# export CDISCRDF_HOME=~/projects/phrmwg-cdisc
# export FUSEKI_HOME=/opt/jena-fuseki-1.1.1;
# cd  ${CDISCRDF_HOME}
# ${FUSEKI_HOME}/fuseki-server --pages=${FUSEKI_HOME}/pages --update --loc=tdb /cdisc

