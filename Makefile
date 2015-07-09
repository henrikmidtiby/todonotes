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

default: \
	todonotes.pdf

todonotes.pdf: \
	todonotes.sty \
	todonotes.dtx \
	examples/*.tex
	pdflatex todonotes.dtx
	makeindex -s gglo.ist -o todonotes.gls todonotes.glo
	makeindex -s gind.ist -o todonotes.ind todonotes.idx
	pdflatex todonotes.dtx
	cd examples && pdflatex externalize.tex
	cd examples && pdflatex externalize.tex
	cd examples && pdflatex saveColorByUsingLayers.tex
	cd examples && pdflatex saveColorByUsingLayers.tex
	cd examples && pdflatex saveColorByUsingLayers.tex
	cd examples && pdflatex alterAppearenceOfListOfTodos.tex
	cd examples && pdflatex alterAppearenceOfListOfTodos.tex
	rm -rf todonotes
	mkdir -p todonotes/examples
	cp todonotes.ins todonotes/todonotes.ins
	cp todonotes.dtx todonotes/todonotes.dtx
	cp todonotes.pdf todonotes/todonotes.pdf
	cp examples/externalize.tex todonotes/examples/
	cp examples/externalize.pdf todonotes/examples/
	cp examples/saveColorByUsingLayers.tex todonotes/examples/
	cp examples/saveColorByUsingLayers.pdf todonotes/examples/
	cp examples/alterAppearenceOfListOfTodos.tex todonotes/examples/
	cp examples/alterAppearenceOfListOfTodos.pdf todonotes/examples/
	cp README todonotes/README
	rm -f todonotes.zip
	zip -r todonotes.zip todonotes

todonotes.sty: \
	todonotes.ins \
	todonotes.dtx
	rm -f todonotes.sty
	pdflatex todonotes.ins

todonotes.gls: \
	todonotes.glo

view: \
	todonotes.pdf
	okular todonotes.pdf

testexample: \
	todonotes.sty
	pdflatex todonotesexample.tex
	okular todonotesexample.pdf 



clean: 
	@rm -f $(CLEAN)

distclean: \
	clean
	@rm -f $(DISTCLEAN)

