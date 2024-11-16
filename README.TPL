fancyhdr   – Extensive control of page headers and footers in LaTeX
extramarks - Extra marks for LaTeX

The package provides extensive facilities, both for constructing headers
and footers, and for controlling their use (for example, at times when
LaTeX would automatically change the heading style in use).

The distribution package (fancyhdr.zip) consists of the following files:

README               This file
fancyhdr.dtx         The complete source of the package and documentation
fancyhdr.ins         The installation file; run through TeX to generate *.sty
fancyhdr.pdf         PDF of the documentation

After processing (by tex) of fancyhdr.ins, the following package files will be generated:

fancyhdr.sty      <V1> the LaTeX package
extramarks.sty    <V1> a package for additional marks
fancyheadings.sty <V0> this loads fancyhdr with a warning message

If you have a user distribution package (fancyhdr-dist-<V>.zip),
then you don't have to do this processing.

If you have a source distribution fancyhdr-<V>.zip, it will also contain
the .sty files, but not the .pdf file.
To recreate the .sty files run
tex fancyhdr.ins
To create fancyhdr.pdf, either just run the 'make' command, or
latexmk fancyhdr.dtx

Fancyhdr is a replacement for the old LaTeX2 package fancyheadings. That
one should not be used anymore. The package fancyheadings included here
just loads fancyhdr with a warning message.

The documentation (fancyhdr.dtx/fancyhdr.pdf) describes both
fancyhdr.sty and extramarks.sty.
In order to latex the documentation you need to have a copy of
boxedminipage.sty (CTAN:/macros/latex/contrib/boxedminipage) and
refcount.sty (CTAN:/macros/latex/contrib/oberdiek/) installed.

This is version <V> of fancyhdr.sty and extramarks.sty. They are
described in the third edition of The LaTeX Companion.

The older versions fancyhdr.sty version 3 and extramarks.sty version 2
are the packages as described in the second edition of The LaTeX
Companion. That documentation can still be used for the newer
versions, but some of the newer features will be missing.

LICENCE: All files in this package may be distributed under the terms of
the LaTeX Project Public License, as described in lppl.txt in the base
LaTeX distribution. Either version 1.3 or, at your option, any later
version.
-- 
Pieter van Oostrum.
<pieter@vanoostrum.org>
http://pieter.vanoostrum.org/
