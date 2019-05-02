MAIN = proposal
TEX = \
	$(MAIN) \
	defines \
	abstract \
	intro \
	background \
	rename \
	clone \
	related \
	plan \


all: $(TEX:=.tex)
	rubber -d -Wref -Wmisc $(MAIN).tex

clean:
	rm -f *.out *.aux *.log *.bbl *.blg $(MAIN:=.pdf)

