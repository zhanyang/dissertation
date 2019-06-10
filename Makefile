MAIN = dissertation
TEX = \
	$(MAIN)    \
	defines    \
	intro      \
	background \
	renaming   \
	cloning    \
	eval       \
	related    \


all: $(TEX:=.tex)
	rubber -d -Wref -Wmisc $(MAIN).tex

clean:
	rm -f *.out *.aux *.log *.bbl *.blg *.toc *.lof *.lot $(MAIN:=.pdf)

