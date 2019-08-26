.PHONY: clean
default: main.pdf

texfiles := $(wildcard *.tex)
figures := $(wildcard figures/*)
refdb_files := $(wildcard refdb/data/*.rb)

main.pdf: $(texfiles) suthesis-2e.sty hello.sty all.bib $(figures)
	@pdflatex main < /dev/null > /dev/null || true
	@bibtex main < /dev/null > /dev/null || true
	@pdflatex main < /dev/null > /dev/null || true
	@pdflatex main < /dev/null > /dev/null || true
	@grep -A 4 "Emergency stop" main.log || grep Warning main.log || true

all.bib: refdb/all.bib $(refdb_files)
	cd refdb && make && cd ..
	cp refdb/all.bib all.bib

refdb/all.bib:
	git clone https://github.com/percyliang/refdb
	cd refdb && make && cd ..

clean:
	rm -rf main.aux main.log main.out main.bbl main.blg main.pdf main.lof main.lot main.toc
