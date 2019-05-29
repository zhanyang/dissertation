MAIN = dissertation
TEX = \
	$(MAIN)    \
	intro      \
	background \
	renaming   \
	cloning    \
	eval       \
	related    \


all: $(TEX:=.tex)
	rubber -d -Wref -Wmisc $(MAIN).tex

clean:
	rm -f *.out *.aux *.log *.bbl *.blg *.toc $(MAIN:=.pdf)

