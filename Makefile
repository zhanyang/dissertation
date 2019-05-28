MAIN = dissertation
TEX = \
	$(MAIN) \
	intro \


all: $(TEX:=.tex)
	rubber -d -Wref -Wmisc $(MAIN).tex

clean:
	rm -f *.out *.aux *.log *.bbl *.blg $(MAIN:=.pdf)

