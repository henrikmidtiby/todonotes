CLEAN := \
	todonotes.log \
	todonotes.aux \
	todonotes.tdo \
	todonotes.out \
	todonotes.idx \
	todonotes.glo \
	todonotes.gls \
	todonotes.ilg \
	todonotes.ind \
	todonotes.toc \
    todonotesexample.aux \
    todonotesexample.out \
    todonotesexample.pdf \
    todonotesexample.tdo \
    todonotesexample.log \

DISTCLEAN := \
	todonotes.sty \
	todonotes.pdf \

todonotes.pdf: \
	todonotes.sty \
	todonotes.dtx
	pdflatex todonotes.dtx
	makeindex -s gglo.ist -o todonotes.gls todonotes.glo
	makeindex -s gind.ist -o todonotes.ind todonotes.idx
	pdflatex todonotes.dtx
	pdflatex todonotesexample.tex
	pdflatex todonotesexample.tex
	rm -rf todonotes
	mkdir todonotes
	cp todonotes.ins todonotes/todonotes.ins
	cp todonotes.dtx todonotes/todonotes.dtx
	cp todonotes.sty todonotes/todonotes.sty
	cp todonotes.pdf todonotes/todonotes.pdf
	cp todonotesexample.tex todonotes/todonotesexample.tex
	cp todonotesexample.pdf todonotes/todonotesexample.pdf
	cp README todonotes/README
	zip -r todonotes.zip todonotes

todonotes.sty: \
	todonotes.ins \
	todonotes.dtx
	pdflatex todonotes.ins

todonotes.gls: \
	todonotes.glo

view: \
	todonotes.pdf
	okular todonotes.pdf

clean: 
	@rm -f $(CLEAN)

distclean: \
	clean
	@rm -f $(DISTCLEAN)

