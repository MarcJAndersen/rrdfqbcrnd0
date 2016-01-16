all: mk-rrdfancillary  mk-rrdfcdisc mk-rrdfqb  mk-rrdfqbcrnd0 \
     mk-rrdfqbcrndcheck mk-rrdfqbpresent mk-rrdfqbcrndex 

install-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfancillary_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfcdisc_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqb_0.2.0.tar.gz")'       
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbcrnd0_0.2.0.tar.gz")'  
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbcrndex_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbcrndcheck_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbpresent_0.2.0.tar.gz")'

install-from-ReleasePackages:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfancillary_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfcdisc_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqb_0.2.0.tar.gz")'       
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbcrnd0_0.2.0.tar.gz")'  
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbcrndex_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbcrndcheck_0.2.0.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbpresent_0.2.0.tar.gz")'

mk-rrdfcdisc:
	cd rrdfcdisc; make

mk-rrdfancillary:
	cd rrdfancillary; make

mk-rrdfqbcrnd0:
	cd rrdfqbcrnd0; make

mk-rrdfqbcrndex:
	cd rrdfqbcrndex; make

mk-rrdfqb:
	cd rrdfqb; make

mk-rrdfqbpresent:
	cd rrdfqbpresent; make

mk-rrdfqbcrndcheck:
	cd rrdfqbcrndcheck; make


rbuild:
	cd rrdfcdisc; make rbuild
	cd rrdfancillary; make rbuild
	cd rrdfqbcrnd0; make rbuild
	cd rrdfqbcrndex; make rbuild
	cd rrdfqb; make rbuild
	cd rrdfqbpresent; make rbuild
	cd rrdfqbcrndcheck; make rbuild


clean:
	cd rrdfcdisc; make clean
	cd rrdfancillary; make clean
	cd rrdfqbcrnd0; make clean
	cd rrdfqbcrndex; make clean
	cd rrdfqb; make clean
	cd rrdfqbpresent; make clean
	cd rrdfqbcrndcheck; make clean
