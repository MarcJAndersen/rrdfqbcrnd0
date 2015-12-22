all: mk-rrdfcdisc mk-rrdfqbcrnd0 mk-rrdfcrndex mk-rrdfqbic 

mk-rrdfcdisc:
	cd rrdfcdisc; make

mk-rrdfqbcrnd0:
	cd rrdfqbcrnd0; make

mk-rrdfcrndex:
	cd rrdfcrndex; make

mk-rrdfqbic:
	cd rrdfqbic; make

mk-rrdfcrndcheck:
	cd rrdfcrndcheck; make
