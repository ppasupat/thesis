default: main.pdf

texfiles := $(wildcard *.tex)
refdbfiles := $(wildcard refdb/data/*.rb)

main.pdf: $(texfiles) suthesis-2e.sty hello.sty all.bib
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

clean:
	rm -rf main.aux main.log main.out main.bbl main.blg main.pdf main.lof main.lot main.toc

all.bib: $(refdbfiles)
	./refdb/generate.rb bib out=all.bib
