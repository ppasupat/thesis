default: main.pdf

texfiles := $(wildcard *.tex)

main.pdf: $(texfiles) suthesis-2e.sty hello.sty all.bib
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

clean:
	rm -rf main.aux main.log main.out main.bbl main.blg main.pdf main.lof main.lot main.toc
