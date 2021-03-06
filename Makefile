MAIN = dissertation
TEX = \
	$(MAIN)    \
	defines    \
	abbrev     \
	acks       \
	intro      \
	background \
	rename     \
	clone      \
	eval       \
	related    \
	conclusion \


all: $(TEX:=.tex)
	rubber -d -Wref -Wmisc $(MAIN).tex

clean:
	rm -f *.out *.aux *.log *.bbl *.blg *.toc *.lof *.lot $(MAIN:=.pdf)

