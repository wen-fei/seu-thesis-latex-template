
%%  This is file `seuthesix.cls',
%%  This file provides a LaTeX document class for typesetting thesis of Southeast University, Nanjing, China.
%%  Copyright (c) 2007--2012 Xu Yuan, email: xuyuan.cn@gmail.com
%%  Copyright (c) 2016 James Fan, email: zhimengfan1990@163.com
%%  License: GNU General Public License, version 3
%% This file is part of ``seuthesix'' package.
%% ``seuthesix'' is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%% ``seuthesix'' is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%% 
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <http://www.gnu.org/licenses/>.


\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{seuthesix}[2016/03/20 1.0.1 The LaTeX template for academic  degree thesis of Southeast University]
\typeout{Document Class `seuthesix' 1.0.1 by James Fan (2016/03/20)}

\newif\ifseut@opt@nocolorlinks\seut@opt@nocolorlinksfalse
\newif\ifseut@opt@engineering\seut@opt@engineeringfalse
\newif\ifseut@opt@master\seut@opt@mastertrue
\newif\ifseut@opt@phd\seut@opt@phdfalse
\newif\ifseut@opt@algorithmlist\seut@opt@algorithmlistfalse
\newif\ifseut@opt@figurelist\seut@opt@figurelistfalse
\newif\ifseut@opt@tablelist\seut@opt@tablelistfalse
\newif\ifseut@opt@nomlist\seut@opt@nomlistfalse
\newif\ifseut@opt@coadvisor\seut@opt@coadvisorfalse
\newif\ifseut@opt@thanks\seut@opt@thanksfalse
\DeclareOption{nocolorlinks}{\seut@opt@nocolorlinkstrue}
\DeclareOption{phd}{
  \seut@opt@phdtrue
  \seut@opt@masterfalse
}
\DeclareOption{masters}{
  \seut@opt@mastertrue
  \seut@opt@phdfalse
}
\DeclareOption{engineering}{\seut@opt@engineeringtrue}
\DeclareOption{algorithmlist}{\seut@opt@algorithmlisttrue}
\DeclareOption{figurelist}{\seut@opt@figurelisttrue}
\DeclareOption{tablelist}{\seut@opt@tablelisttrue}
\DeclareOption{nomlist}{\seut@opt@nomlisttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

%% 加载基类

\LoadClass[twoside,a4paper,zihao=-4,UTF8,openright]{ctexbook}

%% 加载宏包

% 必须使用XeTeX编译
\RequirePackage{ifxetex}
\RequireXeTeX
% 使用geometry 宏包定义页面布局，定义段间距。
\RequirePackage[top=1.2in,bottom=1in,left=2.5cm,right=2.5cm,a4paper]{geometry}
% 使用graphicx 宏包支持插入图片。
\RequirePackage{graphicx}
\graphicspath{{figures/}{./}}
% controlling the typographic design of the Table of Contents, ...
\RequirePackage[titles]{tocloft}
\renewcommand{\cftchapleader}{\bfseries\cftdotfill{\cftdotsep}}
% 处理浮动图形和表格的标题样式
\RequirePackage[font=small]{caption}
% amsmath 宏包提供数学公式支持
\RequirePackage{amsmath}
% amsthm 宏包支持自定义数学定理环境
\RequirePackage{amsthm}
\numberwithin{equation}{chapter}
% 提供数学符号和字体支持
\RequirePackage{amssymb}
% 提供数学符号和字体支持
\RequirePackage{amsfonts}
% 提供数学符号和字体支持
\RequirePackage{bm}
% Produces lists of symbols
\RequirePackage{nomencl}
\makenomenclature
\renewcommand{\nomname}{术语与数学符号约定}
% float wrapper for algorithms
\RequirePackage{algorithm}
% first algorithm typesetting environment
\RequirePackage{algorithmic}
\numberwithin{algorithm}{chapter}
\floatname{algorithm}{算法}
\renewcommand{\listalgorithmname}{算法目录}
% Flexible bibliography support
\RequirePackage[super,square]{natbib}
% 可根据交叉引用生成超链接
\RequirePackage{hyperref}
% 支持自定义页眉页脚
\RequirePackage{fancyhdr}
% Add picture commands (or backgrounds) to every page
\RequirePackage{eso-pic}

%% 基本配置

% 字体设置
\setCJKmainfont{SimSun}
\setmainfont[Mapping=tex-text]{Times New Roman}
\ctexset{%
  chapter/format=\centering,
  chapter/nameformat=\large\heiti,
  chapter/numberformat=\large\heiti,
  chapter/titleformat=\large\heiti,
  chapter/beforeskip=0pt,
  section/format=\raggedright,
  section/nameformat={\large\bfseries},
  section/numberformat={\large\bfseries},
  section/titleformat={\sihao\bfseries},
  subsection/format=\sihao\mdseries\raggedright,
  subsubsection/format=\sihao\mdseries\raggedright,
  listfigurename={插图目录},
  listtablename={表格目录}
}
% 设置超链接格式
\ifseut@opt@nocolorlinks
  \hypersetup{colorlinks=false}
\else
  \hypersetup{colorlinks=true}
\fi
\hypersetup{
  linkcolor=blue,
  anchorcolor=black,
  citecolor=red,
  filecolor=magenta,
  menucolor=red,
  urlcolor=magenta
}
% 设置页眉页脚格式
\fancypagestyle{seustyle}{%
  \fancyhf{}
  \fancyhead[CO]{\xiaowuhao\universityname{}\@thesistype}
  \fancyhead[CE]{ \xiaowuhao\leftmark}
  \fancyfoot[CO,CE]{\thepage}
}
\fancypagestyle{nom}{%
  \fancyhf{}
  \fancyhead[CO]{\xiaowuhao\universityname{}\@thesistype}
  \fancyhead[CE]{ \xiaowuhao\nomname}
  \fancyfoot[CO,CE]{\thepage}
}

%% 导入配置

\InputIfFileExists{seuthesix.cfg}
{\typeout{[seuthesix]: Load seuthesix.cfg successfully!}}%
{\typeout{[seuthesix]: Load seuthesix.cfg failed!}}%

%% 定义常量和变量

% 字号指令
\newcommand{\chuhao}{\fontsize{42bp}{46bp}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36bp}{40bp}\selectfont}
\newcommand{\yichu}{\fontsize{32bp}{36bp}\selectfont}
\newcommand{\yihao}{\fontsize{28bp}{32bp}\selectfont}
\newcommand{\erhao}{\fontsize{21bp}{24bp}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18bp}{20bp}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75bp}{18bp}\selectfont}
\newcommand{\sihao}{\fontsize{14bp}{16bp}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12bp}{14bp}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5bp}{13bp}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9bp}{11bp}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5bp}{9bp}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5bp}{7.5bp}\selectfont}
\newcommand{\qihao}{\fontsize{5.5bp}{6.5bp}\selectfont}
% 添加数学符号
\newcommand{\dif}{\mathrm{d}}
\newcommand{\me}{\mathrm{e}}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\sinc}{sinc}
\DeclareMathOperator{\unwrap}{unwrap}
% 参考文献引用指令
\newcommand\citen[1]{[\!\!\citenum{#1}]}
% 设置符号表Title
\newcommand{\setnomname}[1]{\renewcommand\nomname{#1}}

\ifseut@opt@master
  \newcommand{\seut@dagree@zh}{硕士}
  \newcommand{\seut@dagree@en}{Master}
  \ifseut@opt@engineering
    \renewcommand\@degreelevel{工程硕士}
  \else
    \renewcommand\@degreelevel{硕士}
  \fi
\else
  \ifseut@opt@phd
    \newcommand{\seut@dagree@zh}{博士}
    \newcommand{\seut@dagree@en}{Doctor}
    \renewcommand\@degreelevel{博士}
  \else
    \ClassError{seuthesix}{No degree was selected.}{}
  \fi
\fi

\renewcommand{\author}[2]{
  \def\@author{#1}
  \newcommand{\@authoreng}{#2}
}
\newcommand{\@titleeng}{}
\newcommand{\@subtitleeng}{}
\renewcommand{\title}[4]{
  \def\@title{#1}
  \newcommand{\@subtitle}{#2}
  \renewcommand{\@titleeng}{#3}
  \renewcommand{\@subtitleeng}{#4}
}
\newcommand{\@advisorname}{}
\newcommand{\@advisortitle}{}
\newcommand{\@advisornameeng}{}
\newcommand{\@advisortitleeng}{}
\newcommand{\advisor}[4]{
  \renewcommand{\@advisorname}{#1}
  \renewcommand{\@advisortitle}{#2}
  \renewcommand{\@advisornameeng}{#3}
  \renewcommand{\@advisortitleeng}{#4}
}
\newcommand{\@coadvisorname}{}
\newcommand{\@coadvisortitle}{}
\newcommand{\@coadvisornameeng}{}
\newcommand{\@coadvisortitleeng}{}
\newcommand{\coadvisor}[4]{
  \seut@opt@coadvisortrue
  \renewcommand{\@coadvisorname}{#1}
  \renewcommand{\@coadvisortitle}{#2}
  \renewcommand{\@coadvisornameeng}{#3}
  \renewcommand{\@coadvisortitleeng}{#4}
}
\newcommand{\@categorynumber}{}
\newcommand{\categorynumber}[1]{\renewcommand{\@categorynumber}{#1}}
\newcommand{\@secretlevel}{}
\newcommand{\secretlevel}[1]{\renewcommand{\@secretlevel}{#1}}
\newcommand{\@UDC}{}
\newcommand{\UDC}[1]{\renewcommand{\@UDC}{#1}}
\newcommand{\@studentid}{}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand\degreetype[2]{\renewcommand\@degreetype{#1}%
  \renewcommand\@degreetypeen{#2}}
\newcommand{\@majorlen}{8em}
\newcommand{\@major}{}
\newcommand{\major}[2][8em]{
  \renewcommand{\@majorlen}{#1}
  \renewcommand{\@major}{#2}
}
\newcommand{\@department}{}
\newcommand{\@departmenteng}{}
\newcommand{\department}[2]{
  \renewcommand{\@department}{#1}
  \renewcommand{\@departmenteng}{#2}
}
\newcommand{\@submajor}{}
\newcommand{\submajor}[1]{
  \renewcommand{\@submajor}{#1}
}
\newcommand{\@defenddate}{}
\newcommand{\defenddate}[1]{\renewcommand{\@defenddate}{#1}}
\newcommand{\authorizeorganization}[1]{
  \renewcommand{\@authorizeorganization}{#1}
}

\newcommand{\@authorizedate}{}
\newcommand{\authorizedate}[1]{\renewcommand{\@authorizedate}{#1}}
\newcommand{\@committeechair}{}
\newcommand{\committeechair}[1]{\renewcommand{\@committeechair}{#1}}
\newcommand{\@reviewerA}{}
\newcommand{\@reviewerB}{}
\newcommand{\reviewer}[2]{
  \renewcommand{\@reviewerA}{#1}
  \renewcommand{\@reviewerB}{#2}
}
\newcommand{\CoverTopOption}[3][s]{
\makebox[1.5cm][#1]{\xiaowuhao #2}:{
\underline{\makebox[1.5cm][c]{\xiaowuhao #3}}}
}
\newcommand{\CoverBottomOption}[3][4.5cm]{
  \makebox[7cm][s]{
    {\songti\xiaosihao#2}
    \underline{\makebox[#1][c]{\heiti\xiaosihao#3}}
  }
}
\newcommand\@seuthesisthanks{ }
\newcommand\seuthesisthanks[1]{
  \renewcommand\@seuthesisthanks{#1}
  \seut@opt@thankstrue
}
\newcommand\@thesisthanks{
  \ifseut@opt@thanks
    \thispagestyle{thanksstyle}
  \fi
}
\fancypagestyle{thanksstyle}{%
  \fancyhf{}
  \fancyfoot[L]{\setlength{\baselineskip}{0pt}%
    \rule[-2.5pt]{6cm}{.4pt}\\ \small\@seuthesisthanks}
  \renewcommand\headrulewidth{0pt}
}

%% 插入页面

\newcommand{\makechinesecover}{
  \hypersetup{
    pdfauthor={\@author},
    pdftitle={\universityname{}\@thesistype},
    pdfsubject={\@title \@subtitle},
    pdfcreator={xetex}
  }

  \thispagestyle{empty}
  \begin{center}
    \xiaochuhao

    \includegraphics[height=0.63in]{figures/seu-text-logo}

    \ifseut@opt@master
      \includegraphics{figures/master-hwzs}
    \else
      \includegraphics{figures/doctor-hwzs}
    \fi

    \vspace{31.5pt}
    \yihao\heiti\@title\@thesisthanks\\
    \yihao\heiti\@subtitle
    \vspace{42pt}

    {
      \setlength{\tabcolsep}{0pt}
      \begin{tabular}{cc}
        \makebox[3.5cm][s]{\xiaoerhao\heiti{}专~~业~~名~~称: } &
        \underline{\makebox[6cm][s]{
        \xiaoerhao\songti\textbf{\@major} }}                     \\
        \\
        \makebox[3.5cm][s]{ \xiaoerhao\heiti\authorpre:  }     &
        \underline{\makebox[6cm][s]{
        \xiaoerhao\songti\textbf{\@author} }}                    \\
        \\
        \makebox[3.5cm][s]{ \xiaoerhao\heiti\advisorpre:  }    &
        \underline{\makebox[6cm][s]{
            \xiaoerhao\songti\textbf{\@advisorname\quad\@advisortitle} }}
        \\
                                                               &
        \ifseut@opt@coadvisor
          \underline{\makebox[6cm][s]{
              \xiaoerhao\songti\textbf{\@coadvisorname\quad\@coadvisortitle} }}
        \else
        \fi
      \end{tabular}
    }
  \end{center}
}

\newcommand{\makeenglishcover}{%
  \clearpage\thispagestyle{empty}\cleardoublepage\thispagestyle{empty}
  \begin{center}
    ~\\
    {\fontsize{24pt}{28pt}\selectfont
    \MakeUppercase{\@titleeng}\\
    \MakeUppercase{\@subtitleeng}
    \par
    }

    \vspace{2cm}%
    {\fontsize{16pt}{24pt}\selectfont
    {A
      \ifseut@opt@master
        Thesis
      \else
        Dissertation
      \fi
      submitted to}\\
    {\universitynameeng}\\
    {For the Academic Degree of \seut@dagree@en\ of \@degreetypeen}\\
    {\vspace{0.5in}}%
    {BY}\\
    {\@authoreng}\\
    {\vspace{0.5in}}%
    {Supervised by:}\\
    {\@advisortitleeng\  \@advisornameeng}\\
    \ifseut@opt@coadvisor
    {and}\\
    {\@coadvisortitleeng\  \@coadvisornameeng}\\
    \else
    \fi
    {\vfill}
    {\@departmenteng}\\
    {\universitynameeng}\\
    {\todayeng}
    \par
    }%
  \end{center}%

}

\newcommand{\seudeclare}{
  \clearpage\thispagestyle{empty}\cleardoublepage\thispagestyle{empty}
  {\xiaosihao
    \begin{center}
      {\heiti\sanhao 东南大学学位论文独创性声明}
    \end{center}
    \vspace{0.5in}
    { \linespread{1.5}
      本人声明所呈交的学位论文是我个人在导师指导下进行的研究工作及取得的
      研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包
      含其他人已经发表或撰写过的研究成果，也不包含为获得东南大学或其它教
      育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的
      任何贡献均已在论文中作了明确的说明并表示了谢意。\par}
    \vspace{0.3in}
    \begin{flushright}
      研究生签名：\signline 日~期：\signline
    \end{flushright}
    \vspace{1.5in}
    \begin{center}
      {\heiti\sanhao 东南大学学位论文使用授权声明}
    \end{center}
    \vspace{0.5in}
    { \linespread{1.5}
      东南大学、中国科学技术信息研究所、国家图书馆有权保留本人所送交学位
      论文的复印件和电子文档，可以采用影印、缩印或其他复制手段保存论文。
      本人电子文档的内容和纸质论文的内容相一致。除在保密期内的保密论文
      外，允许论文被查阅和借阅，可以公布（包括刊登）论文的全部或部分内容。
      论文的公布（包括刊登）授权东南大学研究生院办理。\par}
    \vspace{0.3in}
    \begin{flushright}
      研究生签名：\signline 导师签名：\signline 日~期：\signline
    \end{flushright}
    \par
  }
}

\newcommand\makecover{%
  \makechinesecover
  \makeenglishcover
  \seudeclare
  % 设置后续格式
  \clearpage\thispagestyle{empty}\cleardoublepage
  \pagestyle{seustyle}
  \renewcommand{\headrulewidth}{0.4pt}
}

\newenvironment{abstract}[1]
{
  \pagenumbering{Roman}
  \thispagestyle{plain}
  \newcommand{\@keywords}{#1}
  \hypersetup{pdfkeywords={\@keywords}}
  \phantomsection
  \chapter{\@abstracttitle}
}
{
  \par
  \begin{description}
    \item[关键词：] \@keywords
  \end{description}
}

\newenvironment{englishabstract}[1]
{
  \cleardoublepage\thispagestyle{plain}
  \newcommand{\@keywords}{#1}
  \phantomsection
  \ctexset{%
    chapter/nameformat=\large\bfseries,
    chapter/titleformat=\large\bfseries
  }
  \chapter{Abstract}
  \ctexset{%
    chapter/nameformat=\large\heiti,
    chapter/titleformat=\large\heiti
  }
}
{
  \par
  \begin{description}
    \item[Keywords:] \@keywords
  \end{description}
}

\renewcommand*{\tableofcontents}{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter{\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}

\newcommand\listofothers{%
  \ifseut@opt@figurelist
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listfigurename}
    \listoffigures
  \fi

  \ifseut@opt@tablelist
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}
    \listoftables
  \fi

  \ifseut@opt@algorithmlist
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listalgorithmname}
    \listofalgorithms
  \fi

  \ifseut@opt@nomlist
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\nomname}
    \pagestyle{nom}
    \printnomenclature[1in]
    \pagestyle{seustyle}
  \fi

}

\newcommand{\acknowledgement}{%
  \cleardoublepage
  \phantomsection
  \chapter{致 谢}
}

\newcommand{\thesisbib}[1]{%
  \bibliographystyle{gbt7714-2005}
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\bibname}
  \bibliography{#1}
}

\newcommand{\resume}{%
  \cleardoublepage
  \phantomsection
  \chapter{作者简介}
}

\endinput
%% End of file `seuthesix.cls'.
