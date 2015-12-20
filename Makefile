all: mk-rrdfcdisc mk-rrdfqbcrnd0 mk-rrdfcrndinex mk-rrdfcrndexqb mk-rrdfqbic 

mk-rrdfcdisc:
	cd rrdfcdisc; make

mk-rrdfcrndinex:
	cd rrdfcrndinex; make

mk-rrdfqbcrnd0:
	cd rrdfqbcrnd0; make

mk-rrdfcrndexqb:
	cd rrdfcrndexqb; make

mk-rrdfqbic:
	cd rrdfqbic; make

