$pdf_mode = 1;
$pdflatex = 'pdflatex %O -synctex=1 -file-line-error -interaction=nonstopmode %S';
$makeindex = 'makeindex -s gind -g %S';
# Custom dependency for glossary/glossaries package
# if you make custom glossaries you may have to add items to the @cus_dep_list and corresponding sub-routines
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
	system("makeindex -s gglo -o '$_[0]'.gls '$_[0]'.glo");
}
