PACKAGENAME=rrdfqbic

all: createRD data-raw rbuildforce rbuild 

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
# Not the vignette documents are in the package
# The vignettes document should be extracted from the package

vignettedoc:
	(cd vignettes; make all)


