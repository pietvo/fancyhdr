files = README extramarks.sty fancyhdr.pdf fancyhdr.sty fancyhdr.tex fancyheadings.sty

fancyhdr.zip: $(files)
	cd .. ; zip -u fancyhdr/fancyhdr.zip $(addprefix fancyhdr/,$(files))

fancyhdr.pdf: fancyhdr.tex
	latexmk -pdf fancyhdr.tex

