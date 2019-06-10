MAIN = dissertation
TEX = \
	$(MAIN)    \
	defines    \
	acks       \
	intro      \
	background \
	rename     \
	clone      \
	eval       \
	related    \


all: $(TEX:=.tex)
	rubber -d -Wref -Wmisc $(MAIN).tex

clean:
	rm -f *.out *.aux *.log *.bbl *.blg *.toc *.lof *.lot $(MAIN:=.pdf)

