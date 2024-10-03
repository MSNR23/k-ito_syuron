#========
#TARGETに指定されたものがmakeされる．不要なものはコメントアウトしよう．
#========

# TARGET += soturon-chukan-template  #卒論中間前刷
TARGET += main			   #修論本体
# TARGET += soturon-maezuri-template #修論前刷
# TARGET += master-chukan-template   #修論中間前刷

# set below the directory in which your figs are placed
FIGDIR=./fig

DVI=$(addsuffix .dvi,$(TARGET))
PDF=$(addsuffix .pdf,$(TARGET))

all: pdf

dvi: $(DVI)
pdf: $(PDF)

show: $(addsuffix .show,$(TARGET))

OS=$(shell uname | cut -d_ -f1)

ifneq ($(OS),CYGWIN)
PLATEX=platex -kanji=utf8 -shell-escape
JBIBTEX=pbibtex -kanji=utf8
DVIPDFM=dvipdfmx
endif

ifeq ($(OS),CYGWIN)
PLATEX=platex -kanji=utf8
JBIBTEX=pbibtex -kanji=utf8
# JBIBTEX=jbibtex -kanji=euc
DVIPDFM=dvipdfmx
EXE=.exe
endif

%.dvi: %.tex
	(cd $(FIGDIR); ebb *.jpg *.JPG *.gif)
	$(PLATEX) $*
	$(JBIBTEX) $*
	$(PLATEX) $*
	$(PLATEX) $*
	grep War $*.log | cat

%.show: %.pdf
ifeq ($(OS),CYGWIN)
	cygstart $<
else
	gnome-open $<
endif

%.pdf: %.dvi
	$(PLATEX) $*
	$(DVIPDFM) $<
	grep War $*.log | cat

clean:
	rm -f $(DVI)
	rm -f *.aux *.log *.blg *.bbl *.toc *.out
	rm -f $(PDF)
	rm -f $(FIGDIR)/*.bb

#main.tex が include/input/usepackage/bibliography しているファイルは全部並べる。
main.dvi: main.tex \
	introduction.tex fig_tab_equ.tex thanks.tex \
	reference.bib \
	my_layout_grad.tex jsk-thesis.cls ikuo.sty

*.dvi: tuat-common.tex ikuo.sty
