%%
%% This is file `uncthesis.cls',
%%
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This document class file is developed on top of many
%% peoples' efforts: Rickard Faith, Ruigang Yang, Joseph Tighe,
%% Björn B. Brandenburg, Jared Heinly, and many others.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{uncthesis}[2017/09/18 v1.1 UNC-Chapel Hill Dissertation Class]

\DeclareRobustCommand{\uncthesistitle}[1]{%
    \renewcommand{\uncthesistitle}{#1}}
\DeclareRobustCommand{\uncthesistype}[1]{%
    \renewcommand{\uncthesistype}{#1}}
\DeclareRobustCommand{\uncdegreename}[1]{%
    \renewcommand{\uncdegreename}{#1}}
\DeclareRobustCommand{\uncthesisauthor}[1]{%
    \renewcommand{\uncthesisauthor}{#1}}
\DeclareRobustCommand{\uncthesisdepartment}[1]{%
    \renewcommand{\uncthesisdepartment}{#1}}
\DeclareRobustCommand{\uncthesisyear}[1]{%
    \renewcommand{\uncthesisyear}{#1}}
\DeclareRobustCommand{\uncthesisadvisor}[1]{%
    \renewcommand{\uncthesisadvisor}{#1}}
\DeclareRobustCommand{\uncthesiscommittee}[1]{%
    \renewcommand{\uncthesiscommittee}{#1}}
\DeclareRobustCommand{\uncthesisuniversity}[1]{%
    \renewcommand{\uncthesisuniversity}{#1}}

\gdef\uncthesisleftmargin{1}
\gdef\uncthesisrightmargin{1}


\DeclareOption{draft}{%
    \PassOptionsToClass{draft}{report}
}
\DeclareOption{timestamp}{}
\ProcessOptions\relax

\LoadClass[letterpaper,12pt,twoside]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Required Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Layout
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{calc}
%\RequirePackage[subfigure]{tocloft}
\RequirePackage{tocloft}
\RequirePackage{etoolbox}
\RequirePackage{changepage}
\RequirePackage{indentfirst}
\RequirePackage{pdflscape}
\RequirePackage[hang]{footmisc}
\RequirePackage{endnotes}
\RequirePackage{ragged2e}

% Citation style
\RequirePackage[numbers, sort]{natbib}
%\RequirePackage{apalike}

% include citations inline
\RequirePackage{bibentry}
\nobibliography*

% Figures and Tables
\RequirePackage[noend]{algpseudocode}
\RequirePackage{algorithm}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{epsfig}
\RequirePackage{graphicx}
\RequirePackage{listings}
\RequirePackage{multicol}
\RequirePackage{multirow}
%\RequirePackage{subfigure}
\RequirePackage{subcaption}
\RequirePackage{tabu}
\captionsetup[table]{font={stretch=0.95}}
\captionsetup[figure]{font={stretch=0.95}}

% Math
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% Typography
\RequirePackage{microtype}
\RequirePackage{textcomp}

% Macro support
\RequirePackage{xspace}

% Symbols
\RequirePackage{pifont}

% Color
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage[table]{xcolor}

% PDF links
\RequirePackage[hidelinks]{hyperref} % backref=page

% others
\RequirePackage{lipsum}
\@ifclasswith{uncthesis}{timestamp}{%
    % add watermark
    \RequirePackage{draftwatermark}
    \RequirePackage[yyyymmdd,hhmmss]{datetime}
    \SetWatermarkText{\currenttime--\today}
    \SetWatermarkScale{0.65}
    \SetWatermarkLightness{0.85}
}{%
    % do not add watermark
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% paper size and margin
\geometry{letterpaper,left=\uncthesisleftmargin in,top=1in,right=\uncthesisrightmargin in,bottom=1in,nohead}

% double-space text
\doublespacing{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of Contents, List of Figures/Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remove the extra space between figures/tables from different chapters in the list of figures/tables.
\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{}% List of figures
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{}% List of tables

% adds leader dots from chapter titles to page numbers
% chapter and chapter number rather than just number
\renewcommand\cftchapdotsep{\cftdotsep}
\setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~99~}}}
\renewcommand{\cftchappresnum}{\MakeUppercase\chaptername\space}
\renewcommand{\cftchapaftersnum}{:}

\setlength{\cftfignumwidth}{\widthof{\textbf{Figure~1.1~}}}
\renewcommand{\cftfigpresnum}{\figurename\space}
\renewcommand{\cftfigaftersnum}{~--~}
\setlength{\cfttabnumwidth}{\widthof{\textbf{Table~1.1~}}}
\renewcommand{\cfttabpresnum}{\tablename\space}
\renewcommand{\cfttabaftersnum}{~--~}

\g@addto@macro\appendix{%
    \addtocontents{toc}{%
        \protect\renewcommand{\protect\cftchappresnum}{\MakeUppercase\appendixname\space}%
    }%
}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}\texorpdfstring{\uppercase{#1}}{#1}}%
                    \else
                      \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{#1}}{#1}}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Content Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Center chapter titles, omit page numbers.
% Single space for long titles that spans over one line.
\titleformat{\chapter}[block]{\filcenter\bfseries\singlespacing}{\MakeUppercase{\chaptertitlename}~\thechapter:}{0.5em}{\uppercase}
\titleformat{\section}{\normalfont\fontsize{12}{15}\bfseries\singlespacing}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\fontsize{12}{15}\bfseries\singlespacing}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\fontsize{12}{15}\bfseries\singlespacing}{\thesubsubsection}{1em}{}

% Extend to 2in top margins
% Leave 22pts = 2x font size after heading
\titlespacing{\chapter}{0in}{0.5in}{22pt}

% Tweak spacing of paragraph labels.
\titlespacing{\paragraph}{0in}{0.08in}{0.07in}

% Indent paragraphs four spaces throughout the thesis/dissertation.
% Make sure paragraph indentation works with left justification.
%\setlength{\parindent}{4em}
\setlength{\RaggedRightParindent}{\parindent}

% Text are left justified.
\raggedbottom{}
\RaggedRight{}

% We want numbered subsubsections
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% We need to double-space between footnotes.
\setlength{\footnotesep}{13pt}
\setlength{\footnotemargin}{0.5em}
\setlength{\footskip}{0.48in}

% We don't want abandoned words.
\clubpenalty=10000
\widowpenalty=10000

% Single space in quoted environment.
\expandafter\def\expandafter\quote\expandafter{\quote\singlespacing}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Useful macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% common abbreviations
\newcommand{\eg}{{\it e.g.}\xspace}
\newcommand{\ie}{{\it i.e.}\xspace}
\newcommand{\etc}{{\it etc.}\xspace}
\newcommand{\etal}{\emph{et~al}\mbox{.}\xspace}
\newcommand{\vs}{{vs\mbox{.}}\xspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Useful environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{abstract}
{%
    \begin{center}
    \vspace*{46pt}
    \currentpdfbookmark{ABSTRACT}{bk:abstract}
    \textbf{ABSTRACT}
    \vspace{4pt}

    \begin{singlespace}
    \uncthesisauthor: \uncthesistitle \\
    (Under the direction of \uncthesisadvisor{})
    \vspace{10pt}
    \end{singlespace}
    \end{center}}
{\clearpage}

\newenvironment{dedication}
{%
    \begin{center}
    \vspace*{52pt}%
}
{\end{center}\clearpage}

\newenvironment{acknowledgement}
{%
    \begin{center}
    \vspace*{46pt}
    \currentpdfbookmark{ACKNOWLEDGEMENTS}{bk:acknowledgements}
    \textbf{ACKNOWLEDGEMENTS}
    \vspace{10pt}
    \end{center}%
}
{\clearpage}

\newenvironment{preface}
{%
    \begin{center}
    \vspace*{46pt}
    \currentpdfbookmark{PREFACE}{bk:preface}
    \textbf{PREFACE}
    \vspace{10pt}
    \end{center}%
}
{\clearpage}

% TODO: new tabular column type to ensure single-spacing for multi-line text

\endinput
