all: mk-rrdfcdisc mk-rrdfancillary mk-rrdfqb  mk-rrdfqbcrnd0 mk-rrdfcrndex 

mk-rrdfcdisc:
	cd rrdfcdisc; make

mk-rrdfancillary:
	cd rrdfancillary; make

mk-rrdfqbcrnd0:
	cd rrdfqbcrnd0; make

mk-rrdfcrndex:
	cd rrdfcrndex; make

mk-rrdfqb:
	cd rrdfqb; make

mk-rrdfcrndcheck:
	cd rrdfcrndcheck; make
