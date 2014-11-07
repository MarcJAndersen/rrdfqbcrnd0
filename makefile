PACKAGENAME=rrdfqbcrnd0

all: rbuildforce rcheck rbuild

rbuildforce: 
	cd ..; R CMD build --force ${PACKAGENAME}

rcheck:
	cd ..; R CMD check --as-cran ${PACKAGENAME}

rbuild:
	cd ..; R CMD build  ${PACKAGENAME}


# To start fuseki endpoint - should be a script. 
# Problem that location is configuration dependent
# export CDISCRDF_HOME=~/projects/phrmwg-cdisc
# export FUSEKI_HOME=/opt/jena-fuseki-1.1.1;
# cd  ${CDISCRDF_HOME}
# ${FUSEKI_HOME}/fuseki-server --pages=${FUSEKI_HOME}/pages --update --loc=tdb /cdisc

