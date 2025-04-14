 \def\RCSfile{cas-sc}%
 \def\RCSversion{2.3}%
 \def\RCSdate{2021/05/11}%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cas}

\LoadClass[a4paper,10pt]{article}

\RequirePackage[a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\usepackage{helvet}
% \usepackage[hidelinks]{hyperref}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{authblk}
\renewcommand{\Authands}{}
\renewcommand{\Authfont}{\bfseries}

\RequirePackage[usenames,dvipsnames,table]{xcolor}
\definecolor{epicolor}{RGB}{0,0,200}

\RequirePackage[
    bookmarksnumbered=true,bookmarksopen=true, hidelinks=true, 
	unicode=true,colorlinks=false,linktoc=all,%linktoc=page
	linkcolor=epicolor,citecolor=epicolor,filecolor=epicolor,urlcolor=epicolor,
	pdfstartview=FitH
]{hyperref}

\RequirePackage{parskip}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{fancyhdr}
% number lines
\RequirePackage{lineno}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\rfoot{\renewcommand{\UrlFont}{\normalfont\bfseries\scriptsize} 
    {\scriptsize  }}
\rhead{}
\chead{\thepage}
\lhead{}
\cfoot{}
\renewcommand{\headrulewidth}{1pt}
\pagestyle{fancy}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% draft stuff
\DeclareOption{IAHRdraft}{%
    \linenumbers
}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[largestsep]{titlesec}
\titleformat{\section}{\normalfont\normalsize\bfseries}{\thesection}{1em}{\MakeUppercase}
\titleformat{\subsection}{\normalfont\normalsize\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\normalsize\itshape}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}[. \mbox{}]
\titleformat{\subparagraph}[runin]{\normalfont\normalsize\itshape}{\thesubparagraph}{1em}{}[. \mbox{}]

\titlespacing*{\section}{0pt}{12pt plus 1ex minus .2ex}{1.3ex plus .2ex}


\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}

\RequirePackage[numbers]{natbib}
\renewcommand\bibsection{\subsection*{\refname}}
\renewcommand{\bibfont}{\footnotesize}
\setlength{\bibsep}{8pt}


\RequirePackage{listings}	% must be loaded after babel
\lstset{numbers=left,numberstyle=\scriptsize,basicstyle=\small,xleftmargin=3ex,flexiblecolumns=true}

\RequirePackage{float} % must be loaded before caption package
\floatstyle{ruled}
\newfloat{listing}{tbph}{lol}[section]
\floatname{listing}{Algorithme}
\renewcommand{\floatpagefraction}{0.8}
\renewcommand{\bottomfraction}{0.5}
\renewcommand{\topfraction}{0.5}
\renewcommand{\textfraction}{0.1}

\RequirePackage{rotating,subfigure} % must be loaded before caption package
\RequirePackage[small]{caption}
\setlength{\abovecaptionskip}{1ex plus 0.5ex minus 0.2ex}

% ------------------------------------------------------------- %

% corresponding author
\newcommand{\@corrauthor}{,}
\newcommand{\corrauthor}[2]{\renewcommand{\@corrauthor}{*Correspondance: \href{mailto:}{#1} \if\relax#2\relax\else (\texttt{#2}) \fi}}


% maketitle identical to standard article title, except for pagestyle
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    %\thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\renewcommand{\@maketitle}{%
  \newpage
  \null
  \vspace{-2cm}
  \includegraphics[width=\textwidth]{ewgt.png}
  % \textit{27th EURO Working Group on Transportation Meeting, Edinburg Napier University, $1-3^{rd}$ Sep., 2025}
  % \vskip 1em%
  % \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\large\bfseries \@title \par}%
    \vskip 1.5em%
    {\small
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\[\affilsep]
        \@corrauthor \\ \\
      \end{tabular}\par}%
  \end{center}%
  \par
}

\renewcommand{\abstract}[1]{%
  \vspace{6pt}%
  \begingroup
  \leftskip0.5cm
  \rightskip\leftskip
  {\small
  {\bfseries\MakeUppercase \abstractname \vspace{-.2em}\vspace{\z@}}\par%
  #1}%
  \par
  \endgroup}

\newcommand{\keywords}[1]{%
  \begingroup
  \leftskip0.5cm
  \rightskip\leftskip
  \par\vspace{1ex}{\small
  {\bfseries Keywords:\space}%\par%
  #1}%
  \vspace{1pt}%
  \vspace{1pt}%
  \par
  \endgroup}
  
