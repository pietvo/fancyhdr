.PHONY: all clean dist

all: fancyhdr.sty extramarks.sty fancyheadings.sty fancyhdr.pdf


extramarks.sty fancyhdr.sty fancyheadings.sty: fancyhdr.dtx fancyhdr.ins
	tex fancyhdr.ins

fancyhdr.pdf: fancyhdr.dtx fancyhdr.sty extramarks.sty fancyheadings.sty
	rm -f fancyhdr.ind
	latexmk fancyhdr.dtx

clean:
	rm -f *.aux *.log *.idx *.ind *.ilg *.fdb_latexmk *.fls *.glo *.gls *~ *.rel *.toc
	rm -f *.synctex.gz *.bbl *.blg *.out fancyhdr.pdf
	rm -f fancyhdr.sty extramarks*.sty fancyheadings.sty

dist: fancyhdr.zip
distfiles = README fancyhdr.dtx fancyhdr.pdf fancyhdr.ins
fancyhdr.zip: $(distfiles)
	cd .. ; zip -u fancyhdr/fancyhdr.zip $(addprefix fancyhdr/,$(distfiles))

install:
	cp fancyhdr.sty extramarks*.sty ~/Library/texmf/tex/latex

