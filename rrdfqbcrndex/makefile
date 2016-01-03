PACKAGENAME=rrdfqbcrndex

all: createRD data-raw rbuildforce rbuild vignettedoc

cleantempemacs:
	rm -v -f .#* */.#* */*/.#* */#*# */*/*/.#* */*/*/#*#

rbuildforce: 
	cd ..; R CMD build --force ${PACKAGENAME}

# checking package
# see http://cran.r-project.org/doc/manuals/r-release/R-exts.html#Checking-packages
# see http://stackoverflow.com/questions/15324705/should-there-be-a-package-subfolder-in-a-github-package-repo?lq=1
# removing --as-cran - ma 2015-11-25
rcheck: 
	cd ..; R CMD check  ${PACKAGENAME}*.tar.gz

rbuild: 
	cd ..; R CMD build  ${PACKAGENAME}

createRD:
	$(R_HOME)/bin/Rscript -e "library(devtools); devtools::document()"


data-raw:
	(cd inst/data-raw; make all; make installDoc)

# Only run this after the package is installed in the overall R library
# The vignettes uses the packages, and this should be the most recent version
# The vignettes document should be extracted from the package
vignettedoc:
	(cd vignettes; make all)


# To start fuseki endpoint - should be a script. 
# Problem that location is configuration dependent
# export CDISCRDF_HOME=~/projects/phrmwg-cdisc
# export FUSEKI_HOME=/opt/jena-fuseki-1.1.1;
# cd  ${CDISCRDF_HOME}
# ${FUSEKI_HOME}/fuseki-server --pages=${FUSEKI_HOME}/pages --update --loc=tdb /cdisc

