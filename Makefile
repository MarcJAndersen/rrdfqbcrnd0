all: mk-rrdfancillary  mk-rrdfcdisc mk-rrdfqb  mk-rrdfqbcrnd0 \
      mk-rrdfqbcrndex mk-rrdfqbcrndcheck mk-rrdfqbpresent

PACKAGEVERSION=0.2.1

install-from-dir: install-rrdfancillary-from-dir install-rrdfcdisc-from-dir install-rrdfqb-from-dir \
    install-rrdfqbcrnd0-from-dir install-rrdfqbcrndex-from-dir install-rrdfqbcrndcheck-from-dir \
    install-rrdfqbpresent-from-dir

install-from-ReleasePackages:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfancillary_${PACKAGEVERSION}.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfcdisc_${PACKAGEVERSION}.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqb_${PACKAGEVERSION}.tar.gz")'       
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbcrnd0_${PACKAGEVERSION}.tar.gz")'  
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbcrndex_${PACKAGEVERSION}.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbcrndcheck_${PACKAGEVERSION}.tar.gz")'
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfqbpresent_${PACKAGEVERSION}.tar.gz")'

mk-rrdfcdisc:
	cd rrdfcdisc; make

install-rrdfancillary-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfancillary_${PACKAGEVERSION}.tar.gz")'

install-rrdfcdisc-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfcdisc_${PACKAGEVERSION}.tar.gz")'

install-rrdfqb-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqb_${PACKAGEVERSION}.tar.gz")'       

install-rrdfqbcrnd0-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbcrnd0_${PACKAGEVERSION}.tar.gz")'  

install-rrdfqbcrndex-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbcrndex_${PACKAGEVERSION}.tar.gz")'

install-rrdfqbcrndcheck-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbcrndcheck_${PACKAGEVERSION}.tar.gz")'

install-rrdfqbpresent-from-dir:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("rrdfqbpresent_${PACKAGEVERSION}.tar.gz")'

################################################################

install-rrdfancillary-from-ReleasePackages:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfancillary_${PACKAGEVERSION}.tar.gz")'

install-rrdfcdisc-from-ReleasePackages:
	$(R_HOME)/bin/Rscript -e 'library(devtools); install_local("ReleasePackages/rrdfcdisc_${PACKAGEVERSION}.tar.gz")'


mk-rrdfcdisc:
	cd rrdfcdisc; make

mk-rrdfancillary:
	cd rrdfancillary; make

mk-rrdfqb:
	cd rrdfqb; make

mk-rrdfqbcrnd0:
	cd rrdfqbcrnd0; make

mk-rrdfqbcrndex:
	cd rrdfqbcrndex; make

mk-rrdfqbpresent:
	cd rrdfqbpresent; make

mk-rrdfqbcrndcheck:
	cd rrdfqbcrndcheck; make

doc-which-packages:
	@echo "|Package            |Description|"
	@echo "|-------------------|------------|"
	@(find -name "DESCRIPTION" -exec grep "Title:" {} /dev/null \; | gawk '{ a=gensub(/^(.+)\/.+:.+: *(.+)/, "|\\1|\\2|", "g",$$0 ); print a }')
	@echo " "

doc-which-version-pakages:
	@echo "|Package            |Version|"
	@echo "|-------------------|------------|"
	@(find -name "DESCRIPTION" -exec grep "Version:" {} /dev/null \; | gawk '{ a=gensub(/^(.+)\/.+:.+: *(.+)/, "|\\1|\\2|", "g",$$0 ); print a }')
	@echo " "

doc-which-md-files:
	@echo "|Package            |File        |Description|"
	@echo "|-------------------|------------|-----------|"
	@find -path "*/inst/doc/*" -name "*.md" -and -not -name "README.md"| gawk '{ getline line < $$0; a=gensub( /^(.+)\/inst\/doc\/(.+).md/, "|\\1|[\\2](\\1/inst/doc/\\2.html)|", "g",$$0 ); print a, line, "|";  }'

# make doc-which-md-files  > overview-md.md
# pandoc --from markdown_github --to html --standalone README.md > README.html
# firefox README.html 
# make doc-which-md-files | pandoc --from markdown_github --to html --standalone > mdrendered.html


rbuild:
	cd rrdfcdisc; make rbuild
	cd rrdfancillary; make rbuild
	cd rrdfqb; make rbuild
	cd rrdfqbcrnd0; make rbuild
	cd rrdfqbcrndex; make rbuild
	cd rrdfqbpresent; make rbuild
	cd rrdfqbcrndcheck; make rbuild


clean:
	cd rrdfcdisc; make clean
	cd rrdfancillary; make clean
	cd rrdfqb; make clean
	cd rrdfqbcrnd0; make clean
	cd rrdfqbcrndex; make clean
	cd rrdfqbpresent; make clean
	cd rrdfqbcrndcheck; make clean
