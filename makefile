PACKAGENAME=rrdfqbcrnd0

all: createRD qbIClist rbuildforce rcheck rbuild

cleantempemacs:
	rm -v -f .#* */.#* */*/.#* */#*#

rbuildforce: 
	cd ..; R CMD build --force ${PACKAGENAME}

# checking package
# see http://cran.r-project.org/doc/manuals/r-release/R-exts.html#Checking-packages
# see http://stackoverflow.com/questions/15324705/should-there-be-a-package-subfolder-in-a-github-package-repo?lq=1
rcheck: 
	cd ..; R CMD check --as-cran ${PACKAGENAME}_0.1.tar.gz

rbuild: 
	cd ..; R CMD build  ${PACKAGENAME}

createRD:
	# does not work MJA 2014-11-16 Rscript -e 'library(devtools); devtools::document()'

create-r-data-contents: qbIClist data/qbCDISCprefixes.rda AEtable

qbIClist: data/qbIClist.rda

data/qbIClist.rda: inst/data-raw/create-qb-IC-dataset.pdf

%.pdf: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','pdf_document')"
#	mv -f $*.pdf ../inst/doc

%.html: %.Rmd
	$(R_HOME)/bin/Rscript -e "rmarkdown::render('$*.Rmd','html_document')"
#	mv -f $*.html	 ../inst/doc


vignettedoc:
	(cd vignettes; make all)

AEtable: inst/data-raw/create-ae-table-as-csv.Rmd
	Rscript -e 'library(knitr);knit("inst/data-raw/create-ae-table-as-csv.Rmd")'

# To start fuseki endpoint - should be a script. 
# Problem that location is configuration dependent
# export CDISCRDF_HOME=~/projects/phrmwg-cdisc
# export FUSEKI_HOME=/opt/jena-fuseki-1.1.1;
# cd  ${CDISCRDF_HOME}
# ${FUSEKI_HOME}/fuseki-server --pages=${FUSEKI_HOME}/pages --update --loc=tdb /cdisc

