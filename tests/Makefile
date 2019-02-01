all:
	cp ../fancyhdr.sty ../extramarks.sty .
	for f in *.tex; do echo '***** Testing '$$f' *****'; latexmk -pdf $$f; done

clean:
	rm -f *.aux *.log *.toc *~ *.rel *.synctex.gz *.idx *.ind *.ilg *.pdf
	rm -rf *.fls *.fdb_latexmk
	rm -f fancyhdr.sty extramarks.sty
