.PHONY: all clean dist release

VERSION1:=$(shell grep '%<fancyhdr|extramarks> *\[20' fancyhdr.dtx | sed 's/.*\[//' \
			| awk '{print $$2 " " $$1}')
VERSION0:=$(shell grep '%<fancyheadings> *\[20' fancyhdr.dtx | sed 's/.*\[//' \
			| awk '{print $$2 " " $$1}')
VERSION4:=$(shell grep '%<extramarks-v4> *\[20' fancyhdr.dtx | sed 's/.*\[//' \
			| awk '{print $$2 " " $$1}')
VERSION:=$(shell echo "$(VERSION1)" | awk '{print $$1}' | sed 's/v//')

all: fancyhdr.sty extramarks.sty extramarks-v4.sty fancyheadings.sty fancyhdr.pdf

extramarks.sty fancyhdr.sty extramarks-v4.sty fancyheadings.sty: fancyhdr.dtx fancyhdr.ins
	tex fancyhdr.ins

fancyhdr.pdf: fancyhdr.dtx fancyhdr.sty extramarks.sty extramarks-v4.sty fancyheadings.sty
	rm -f fancyhdr.ind
	latexmk fancyhdr.dtx

clean:
	rm -f *.aux *.log *.idx *.ind *.ilg *.fdb_latexmk *.fls *.glo *.gls *~ *.rel *.toc
	rm -f *.synctex.gz *.bbl *.blg *.out fancyhdr.pdf
	rm -f fancyhdr.sty extramarks*.sty fancyheadings.sty

README: README.TPL fancyhdr.dtx
	sed -e "s@<V1>@$(VERSION1)@g" -e  "s@<V0>@$(VERSION0)@g" -e  "s@<V4>@$(VERSION4)@g" \
		-e  "s@<V>@$(VERSION)@g" README.TPL > README

install:
	cp fancyhdr.sty extramarks*.sty ~/Library/texmf/tex/latex

# Make dist to make fancyhdr.zip for submission to CTAN
dist: fancyhdr.zip
distfiles = README fancyhdr.dtx fancyhdr.pdf fancyhdr.ins
fancyhdr.zip: $(distfiles)
	cd .. ; zip -9 fancyhdr/fancyhdr.zip $(addprefix fancyhdr/,$(distfiles))

# Make release for release files (like a github release)
release: fancyhdr-$(VERSION).zip fancyhdr-dist-$(VERSION).zip

releasefiles = README fancyhdr.sty fancyheadings.sty extramarks.sty fancyhdr.pdf
fancyhdr-dist-$(VERSION).zip: $(releasefiles)
	cd .. ; zip -9 fancyhdr/fancyhdr-dist-$(VERSION).zip $(addprefix fancyhdr/,$(releasefiles))

sourcefiles = README README.TPL fancyhdr.dtx fancyhdr.ins Makefile latexmkrc
fancyhdr-$(VERSION).zip: $(sourcefiles)
	cd .. ; zip -9 fancyhdr/fancyhdr-$(VERSION).zip $(addprefix fancyhdr/,$(sourcefiles))
