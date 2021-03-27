.PHONY: all clean dist

all: fancyhdr.sty extramarks.sty extramarks-v3.sty extramarks-multicol.tex fancyheadings.sty fancyhdr.pdf


extramarks.sty fancyhdr.sty extramarks-v3.sty extramarks-multicol.tex fancyheadings.sty: fancyhdr.dtx fancyhdr.ins
	tex fancyhdr.ins

fancyhdr.pdf: fancyhdr.dtx fancyhdr.sty extramarks.sty extramarks-v3.sty extramarks-multicol.tex fancyheadings.sty
	rm -f fancyhdr.ind
	latexmk fancyhdr.dtx

clean:
	rm -f *.aux *.log *.idx *.ind *.ilg *.fdb_latexmk *.fls *.glo *.gls *~ *.rel *.toc
	rm -f *.synctex.gz *.bbl *.blg *.out fancyhdr.pdf

dist: fancyhdr.zip
distfiles = README fancyhdr.dtx fancyhdr.pdf fancyhdr.ins
fancyhdr.zip: $(distfiles)
	cd .. ; zip -u fancyhdr/fancyhdr.zip $(addprefix fancyhdr/,$(distfiles))

install:
	cp fancyhdr.sty extramarks*.{sty,tex} ~/Library/texmf/tex/latex

