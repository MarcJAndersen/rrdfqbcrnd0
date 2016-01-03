all: mk-rrdfancillary  mk-rrdfcdisc mk-rrdfqb  mk-rrdfqbcrnd0 \
     mk-rrdfqbcrndcheck mk-rrdfqbpresent mk-rrdfqbcrndex 

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
