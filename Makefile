LATEXMK = latexmk
OUTPUTDIR := ~/
NAME = main
ARCHIVE_LIST = main.tex Makefile

.PHONY: all doc asy clean archive

all: doc archive clean

clean:
	$(LATEXMK) -c

asy: *.asy
	asy -f pdf *.asy

doc: asy
	$(LATEXMK) -xelatex main.tex

archive: doc
	tar -czvf $(NAME).tar.gz $(ARCHIVE_LIST)
	mv $(NAME).tar.gz $OUTPUTDIR)
	cp main.pdf $(OUTPUTDIR)$(NAME).pdf
