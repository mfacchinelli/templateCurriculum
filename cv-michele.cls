%*************************************************************%
%************************* START CLASS ***********************%
%*************************************************************%

\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{michele-cv}[17/06/2018 Michele's Curriculum Vitae]

%-------------------------------------------------------------%
%--------------------------- PACKAGES ------------------------%
%-------------------------------------------------------------%

% Fonts
\RequirePackage[default,
				osfigures,
				scale=0.9]{opensans}
\RequirePackage[T1]{fontenc}

% Page style
\RequirePackage[dvips,
				textwidth=525pt,
				textheight=730pt]
				{geometry} % Sets margins and page size
\RequirePackage[pdftex,
				colorlinks=true,
     			citecolor=black,
     			linkcolor=black,
     			urlcolor=black,
            		pagebackref=false,
            		linktocpage=false,
            		plainpages=true,
            		bookmarksopen=true,
            		bookmarksnumbered=true,
            		pdfauthor={Michele Facchinelli},
            		pdfcreationdate={}]
            		{hyperref} % Allows for interaction
\RequirePackage{fancyhdr}
\RequirePackage{pdfcomment}
\RequirePackage[noindentafter,explicit]{titlesec}

% Figures
\RequirePackage[pdftex]{graphicx} % Allows for images

% Symbols
\usepackage{datetime}\usdate
\RequirePackage{fontawesome}
\RequirePackage{relsize} % Increase or decrease symbol size

% Special
\RequirePackage{color}
\RequirePackage{lastpage}

\renewcommand{\headrulewidth}{0pt}

%-------------------------------------------------------------%
%------------------- USER-SPECIFIC VARIABLES -----------------%
%-------------------------------------------------------------%

% Header details
\newcommand*\name[1]
{
    \def\@name{#1}
    \hypersetup{pdftitle={#1}}
}
\newcommand*\gender[1]
{
    \def\@gender{#1}
}
\newcommand*\dob[3]
{
    \def\@dobDay{#1}
    \def\@dobMonth{#2}
    \def\@dobYear{#3}
}
\newcommand*\nationality[1]
{
	\def\@nationality{#1}
}

% Footer details
\newcommand*\address[3]
{
	\def\@street{#1}
	\def\@city{#2}
	\def\@country{#3}
}
\newcommand*\email[1]
{
	\def\@email{#1}
}
\newcommand*\phone[1]
{
	\def\@phone{#1}
}
\newcommand*\linkedin[1]
{
	\def\@linkedin{linkedin.com/in/#1}
}
\newcommand*\github[1]
{
	\def\@github{#1.github.io}
}

% PDF hypertext variables
\newcommand*\subject[1]
{
	\def\@subject{#1}
    \hypersetup{pdfsubject={#1}}
}
\newcommand*\keywords[1]
{
	\def\@keywords{#1}
    \hypersetup{pdfkeywords={#1}}
}

% Images
\newcommand*\selfimage[1]
{
	\def\@selfimage{#1}
}

%-------------------------------------------------------------%
%---------------------------- HEADER -------------------------%
%-------------------------------------------------------------%

\newcommand*{\Header}
{
\begingroup

\centerline{ \scshape{ \Huge{ \textcolor{colored}{ \@name } } } }
\vspace{10pt}
\centerline{ {\large\faTransgenderAlt} \@gender {\hspace{5pt}\ob\hspace{5pt}} {\large\faBirthdayCake} \formatdate{\@dobDay}{\@dobMonth}{\@dobYear} {\hspace{5pt}\ob\hspace{5pt}} {\large\faFlag} \@nationality } %\faTransgenderAlt

\endgroup
}

%-------------------------------------------------------------%
%---------------------------- FOOTER -------------------------%
%-------------------------------------------------------------%

\newcommand*{\Footer}
{
\begingroup

\centerline{ {\large\faHome} \@street {\hspace{5pt}\ob\hspace{5pt}} \@city {\hspace{5pt}\ob\hspace{5pt}} \@country }
\vspace{10pt}
\centerline{ {\large\faEnvelopeO} \@email {\hspace{5pt}\ob\hspace{5pt}} {\large\faMobile} \@phone {\hspace{5pt}\ob\hspace{5pt}} {\large\faLinkedinSquare} \@linkedin {\hspace{5pt}\ob\hspace{5pt}} {\large\faGithub} \@github }

\endgroup
}

%-------------------------------------------------------------%
%------------------------- NEW PARAMETER ---------------------%
%-------------------------------------------------------------%

\definecolor{colored}{RGB}{120, 120, 120}
% blue{40, 140, 240}; gray{120, 120, 120}; uva{186, 8, 53}; esa{26, 47, 102}; tudelft{27, 167, 212}; airbus{16, 73, 124}; leiden{14, 38, 111};
\hypersetup
{
     citecolor=colored,
     linkcolor=colored,
     urlcolor=colored
} 

\newcommand{\ob}{\textcolor{colored}{\relsize{-3}\faCircleThin}}
\renewcommand\labelitemi{\ob}

%-------------------------------------------------------------%
%-------------------------- NEW FORMATS ----------------------%
%-------------------------------------------------------------%

\titlespacing\subsection{0pt}{7pt plus 2pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{7pt plus 2pt minus 2pt}{2pt plus 2pt minus 2pt}

% Section formatting
%
%\titleformat{\section}
%	{\Large\scshape\raggedright}
%	{}{0em}
%	{}
%%	[\titlerule]
%\titleformat{\subsection}
%	{\large\scshape\raggedright}
%	{}{0em}
%	{}
%\titleformat{\subsubsection}
%	{\large\bf\raggedright}
%    {}{0em}
%   	{}

% Section redefinition

\newcommand{\coloredsection}[1]
{
	\section*{\colorbox{colored}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{white} #1}}}
}
\newcommand{\datedsubsection}[2]
{
	\subsection*{#1 \hfill {\upshape #2}}
}
\newcommand{\locatedsubsubsection}[3]
{
	\subsubsection*{#1 \hspace {5pt} {\mdseries\itshape #2} \hfill {\mdseries\slshape #3}}
}
\newcommand{\websubsubsection}[2]
{
	\subsubsection*{#1 \hfill {\normalsize\url{#2}}}
}
   	
%-------------------------------------------------------------%
%-------------------------- PAGE STYLE -----------------------%
%-------------------------------------------------------------%

% Set page style
\pagestyle{fancy}

% Modify page count
\cfoot{Page \textcolor{colored}{\thepage} of \textcolor{colored}{\pageref{LastPage}}}

%-------------------------------------------------------------%
%--------------------- CURRICULUM ELEMENTS -------------------%
%-------------------------------------------------------------%

% Skills and similar

\newcommand{\skill}[2]{
{\bf #1} \hspace{5pt} {\slshape #2}
}
\newcommand{\activity}[3]{
{\bf #1} {#2} \\ {{\slshape Website:} \url{#3}}
}
\newcommand{\conference}[5]{
{\bf #1} {#2} \hfill {\slshape #3} \\ {#4} \\ {\slshape{Website:} \url{#5}}
}
	
% Thesis and specialization

\newcommand{\thesis}[1]
{
\noindent\parbox[t]{0.1\textwidth}{\textit{Thesis:}}
\parbox[t]{0.895\textwidth}{#1}
}

\newcommand{\specialization}[1]
{
\noindent\parbox[t]{0.1\textwidth}{\textit{Track:}}
\parbox[t]{0.895\textwidth}{#1}
}
%\newcommand{\specialization}[1]
%{
%\noindent\parbox[t]{0.165\textwidth}{\textit{Specialization:}}
%\parbox[t]{0.83\textwidth}{#1}
%}

% Courses and relevant courses

\newcommand{\courses}[1]
{
\noindent\parbox[t]{0.1\textwidth}{\textit{Courses:}}
\parbox[t]{0.895\textwidth}{#1}
}