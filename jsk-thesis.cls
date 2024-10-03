%
% jsk-thesis.cls by Ryosuke Tajima (rosk)
%        changed by Yasutaka Fukumoto (yasutaka)
%        changed by Takatoshi Hondo (hondo@mizuuchi.lab.tuat.ac.jp)
%        changed by Ikuo Mizuuchi (hondo@mizuuchi.lab.tuat.ac.jp)
% $Id$b
%

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jsk-thesis}
  [2011/02/08 v0.4 thesis class by Ikuo Mizuuchi, 2011/01/22 v0.3 thesis class by Takatoshi Hondo, 2003/12/08 v0.2 thesis class by Yasutaka Fukumoto, 2001/10/08 v0.1 thesis class by Ryosuke Tajima]
\LoadClassWithOptions{jbook}

%表題
% \
%% \gdef\@thesis{平成22年度卒業論文}
\long\def\thesis#1{\long\gdef\@thesis{#1}}
\renewcommand{\maketitle}{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote\thanks
  \vskip 6cm
  \begin{center}%
  {\huge \@date \par}\vfill%
%%   {\LARGE \bf \@thesis \par}
%%   \vskip 2cm
  {\huge \bf \@title \par}\vfill%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
%%   \vskip 9cm
  \vskip 2cm
 \begin{picture}(200,100)\put(0,0){\line(1,0){200}}\put(0,80){\line(1,0){200}}%
 \put(0,100){\line(1,0){200}}\put(0,0){\line(0,1){100}}\put(100,0){\line(0,1){100}}%
 \put(200,0){\line(0,1){100}}\put(20,85){指導教員印}\put(130,85){提出印}%
 \end{picture}\vfill%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
%  \vskip 5cm
%  {\LARGE \bf 1p 〜 \pageref{bktitle}p 完}\\
%  \vskip 5cm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
%%   {\LARGE \bf \@date \par}%       % Set date in \large size.
%%   \vskip 1.5cm
  {\LARGE \@author \par}
%%   {\LARGE \bf \@author \par}
  \end{center}\par
  \@thanks\vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@thesis\@empty
  \global\let\@title\@empty
  \global\let\thesis\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

%目次の見出し．改ページして中央ぞろえ．
\renewcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
%  {\centering
%  \chapter*{\contentsname
%    \@mkboth{\contentsname}{\contentsname}%
%  }
%  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
  {\centering
    \chapter*{\contentsname}
    \@mkboth{\contentsname}{\contentsname}
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
  \if@openright\cleardoublepage\else\clearpage\fi
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}

%章の見出し
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
%  \chaptermark{#1}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
  \chaptermark{#1} \@mkboth%
	{--- \space\@chapapp\thechapter\@chappos\space：\space #1 \space ---}%
	{--- \space\@chapapp\thechapter\@chappos\space：\space #1 \space ---}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading
  \if@openright\cleardoublepage\else\clearpage\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
%\def\@makechapterhead#1{\hbox{}\vskip 7cm%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
\def\@makechapterhead#1{\hbox{}\vskip 5.2cm%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \ifnum \c@secnumdepth >\m@ne
     \setlength\@tempdima{\linewidth}%
    {\centering
    \if@mainmatter
     \setbox\z@\hbox{\@chapapp\thechapter\@chappos}%
%     \addtolength\@tempdima{-\wd\z@}%
     \unhbox\z@\nobreak\vskip 1em
    \fi
     \vtop{\hsize\@tempdima#1}%
    }
   \else
    {\centering
    #1\relax
    }
   \fi}}

%chapter*{}のスタイル
\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading
  \if@openright\cleardoublepage\else\clearpage\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
%\def\@makeschapterhead#1{\hbox{}\vfil%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
\def\@makeschapterhead#1{\hbox{}\vskip 6cm%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%yasutaka
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \setlength\@tempdima{\linewidth}%
   {\centering
   \vtop{\hsize\@tempdima#1}}
}}

%ヘディングの設定
\def\ps@headings{\let\ps@jpl@in\ps@headnombre
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{%
	\underline{\hbox to \textwidth{\bf\thepage\hfil\leftmark}}}%
  \def\@oddhead{%
	\underline{\hbox to \textwidth{\bf\leftmark\hfil\thepage}}}
  \let\@mkboth\markboth}

\def\ps@myheadings{\let\ps@jpl@in\ps@plain%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{%
	\underline{\hbox to \textwidth{\bf\thepage\hfil\leftmark}}}%
  \def\@oddhead{%
	\underline{\hbox to \textwidth{\bf\leftmark\hfil\thepage}}}
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}

\renewcommand{\bibname}{参考文献}
\setlength{\textwidth}{15cm}
\setlength{\headsep}{15mm}
\setlength{\evensidemargin}{-3mm}
\setlength{\oddsidemargin}{10mm}
\setlength{\topmargin}{5mm}
\setlength{\textheight}{21cm}
\pagestyle{headings}


