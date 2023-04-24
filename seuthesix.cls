
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

\newif\ifseut@opt@fontwin\seut@opt@fontwinfalse
\newif\ifseut@opt@fontmac\seut@opt@fontmacfalse
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
\DeclareOption{fontwin}{\seut@opt@fontwintrue}
\DeclareOption{fontmac}{\seut@opt@fontmactrue}
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
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

%% 加载基类
\LoadClass[a4paper]{book}

%% 加载宏包

% 必须使用XeTeX编译
\RequirePackage{ifxetex}
\RequireXeTeX
% 使用geometry 宏包定义页面布局，定义段间距。
\RequirePackage{geometry}
% 使用graphicx 宏包支持插入图片。
\RequirePackage{graphicx}
\graphicspath{{figures/}{./}}
% 使用setspace 设置局部行距
\RequirePackage{setspace}
% 使用tocloft 设置目录字体
\RequirePackage[titles]{tocloft}
% 处理浮动图形和表格的标题样式
\RequirePackage{caption}
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
% 使用ctex 宏包支持中文 以下选项必须在引入时设置
% 正文：小四号宋体，首行缩进。 
% 使用中文章节标题
% 1.25倍行距 需要修正latex与word中baselineskip的不同系数(1.2 vs 1.3)
% word只空余在文字下方 latex空余在文字上下两侧
% 目前没有对于行距的要求 选择合适的即可
\RequirePackage[zihao=-4,heading=true,linespread=1.35417]{ctex}

%% 基本配置

% A4纸张，双面印刷，四周页边距2cm，左、右两侧的页边距也可以选2.5cm
\geometry{top=2cm,bottom=2cm,left=2.5cm,right=2.5cm}
% 修改默认的字体配置
\ifseut@opt@fontmac
  % ctex在macnew下的mainfont斜体为楷体
  \setCJKmainfont{Songti SC Light}[BoldFont=Songti SC Bold,AutoFakeSlant]
  % ctex在macnew下的黑体默认为华文细黑
  % 设置粗体的粗细程度 该宏命令仅对随后定义的 CJK 字体有效
  \xeCJKsetemboldenfactor{1}
  \setCJKfamilyfont{zhhei}{Heiti SC Medium}[AutoFakeBold,AutoFakeSlant]
  % 封面字体
  \setCJKfamilyfont{zhongsong}{STSong}[
    BoldFont={STSong},
    BoldFeatures={FakeBold=4},
    AutoFakeSlant]
  \newcommand*{\zhongsong}{\CJKfamily{zhongsong}}
\else
  % ctex在win下的mainfont加粗为黑体且斜体为楷体
  \setCJKmainfont{SimSun}[AutoFakeBold,AutoFakeSlant]
  \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold,AutoFakeSlant]
  \xeCJKsetemboldenfactor{1}
  \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold,AutoFakeSlant]
  % 封面字体
  \setCJKfamilyfont{zhongsong}{STZhongsong}[
    BoldFont={STZhongsong},
    BoldFeatures={FakeBold=1},
    AutoFakeSlant]
  \newcommand*{\zhongsong}{\CJKfamily{zhongsong}}
\fi
\setmainfont[Mapping=tex-text]{Times New Roman}
% 中文格式
\ctexset{%
  % plain方案标点
  punct=plain,
  % 目录名称
  listfigurename={插图目录},
  listtablename={表格目录},
  % 一级标题（题目）：二号宋体居中
  % 二级标题（章）：三号黑体居中
  chapter/format=\centering\zihao{3}\heiti,
  chapter/beforeskip=8bp,
  chapter/afterskip=16bp,
  % 三级标题（节）：四号宋体（加粗）居左
  section/format=\raggedright\zihao{4}\songti\bfseries,
  section/beforeskip=7bp,
  section/afterskip=7bp,
  % 四级标题（节内小节）小四号黑体居左
  subsection/format=\raggedright\zihao{-4}\heiti,
  subsection/beforeskip=6bp,
  subsection/afterskip=6bp%
}
\setlength{\parskip}{0pt}
% 表格文字可用小五宋体或正文字体，居中（或居左）并整齐划一，表格名及图名用五号宋体
\captionsetup{font=small}
% 每一表应有简短确切的题名，连同表号置于表上。
\captionsetup[table]{position=above}
% 每一图应有简短确切的题名，连同图号置于图下。
\captionsetup[figure]{position=below}
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
  urlcolor=magenta,
  pdfborder=0 0 0
}
% 设置页眉页脚格式
% 页码1从正文开始，前面摘要和目录等内容的页码用大写罗马数字表示。
% 页眉
% 偶数页：东南大学硕士学位论文（小五号宋体居中）
% 奇数页：第 * 章章题目（小五号宋体居中）
% 页脚
% 正文及其以后部分，其页脚为居中、连续的阿拉伯数字页码。
% 摘要和目录等内容的页脚为居中、连续的大写罗马数字页码。
\fancypagestyle{seustyle}{%
  \fancyhf{}
  \fancyhead[CE]{\zihao{-5}\@seut@string@univzh{}\@seut@string@thesistype}
  \fancyhead[CO]{\zihao{-5}\leftmark}
  \fancyfoot[CO,CE]{\thepage}
}
\fancypagestyle{nom}{%
  \fancyhf{}
  \fancyhead[CE]{\zihao{-5}\@seut@string@univzh{}\@seut@string@thesistype}
  \fancyhead[CO]{\zihao{-5}\nomname}
  \fancyfoot[CO,CE]{\thepage}
}
% Redefine the plain page style
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[CE]{\zihao{-5}\@seut@string@univzh{}\@seut@string@thesistype}%
  \fancyhead[CO]{\zihao{-5}\leftmark}%
  \fancyfoot[CO,CE]{\thepage}%
}
% 设置目录
\setlength{\cftbeforechapskip}{0pt}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\songti}

%% 定义常量和变量

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

\newcommand{\@degreelevel}{}
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
\newcommand{\@seut@string@cateno}{}
\newcommand{\categorynumber}[1]{\renewcommand{\@seut@string@cateno}{#1}}
\newcommand{\@seut@string@secretlevel}{}
\newcommand{\secretlevel}[1]{\renewcommand{\@seut@string@secretlevel}{#1}}
\newcommand{\@UDC}{}
\newcommand{\UDC}[1]{\renewcommand{\@UDC}{#1}}
\newcommand{\@studentid}{}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\@degreetype}{工学硕士}
\newcommand{\@degreetypeen}{Master of Engineering}
\newcommand\degreetype[2]{\renewcommand\@degreetype{#1}%
  \renewcommand\@degreetypeen{#2}}
\newcommand{\@seut@string@major}{}
\newcommand{\major}[1]{
  \renewcommand{\@seut@string@major}{#1}
}
\newcommand{\@seut@string@submajor}{}
\newcommand{\submajor}[1]{
  \renewcommand{\@seut@string@submajor}{#1}
}
\newcommand{\@seut@string@deptzh}{}
\newcommand{\@seut@string@depten}{}
\newcommand{\department}[2]{
  \renewcommand{\@seut@string@deptzh}{#1}
  \renewcommand{\@seut@string@depten}{#2}
}
\newcommand{\@defenddate}{}
\newcommand{\defenddate}[1]{\renewcommand{\@defenddate}{#1}}
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
\newcommand\@seut@string@thank{ }
\newcommand\seuthesisthanks[1]{
  \renewcommand\@seut@string@thank{#1}
  \seut@opt@thankstrue
}
\newcommand{\@seut@string@univzh}{东南大学}
\newcommand{\@seut@string@univen}{Southeast University}
\newcommand{\@seut@string@thesistype}{\@degreelevel{}学位论文}

%% 插入页面

% 文档信息
\newcommand*{\seut@setpdfinfo}{\hypersetup{%
    pdfauthor={\@author},
    pdftitle={\@seut@string@univzh{}\@seut@string@thesistype},
    pdfsubject={\@title \@subtitle},
    pdfcreator={\@author},
    pdfproducer={XeLaTeX}}
}

% 封面
\newcommand{\CoverTopOption}[3][s]{
\setlength\parindent{-1.71\ccwd}
\makebox[1.5cm][#1]{\zihao{-5} #2}:{
\underline{\makebox[1.5cm][c]{\zihao{-5} #3}}}
\par
}
\newcommand{\CoverBottomOption}[3][4.5cm]{
  \makebox[197bp][s]{
    {\songti\zihao{-4}#2}
    \underline{\makebox[#1][c]{\heiti\zihao{-4}#3}
      \hspace*{-9bp}}
  }
}
\newcommand{\@seut@string@pyr}{评\hspace{1.5em}阅\hspace{1.5em}人}
\newcommand{\makecolorcover}{

  \thispagestyle{empty}

  \setstretch{1.08333}

  \AddToShipoutPictureBG*{\setlength{\unitlength}{1pt}\put(0,651){%
      \parbox{\paperwidth}{\centering\includegraphics[width=523pt, height=300pt]{figures/front-cover.jpg}}}}%
  \AddToShipoutPictureBG*{\setlength{\unitlength}{1pt}\put(202,760.5){%
      \parbox{\paperwidth}{\centering\includegraphics[width=57pt, height=57pt]{figures/seu-color-logo.png}}}}%

  ~\par
  {
    \CoverTopOption{学校代码}{10286}
    \CoverTopOption{分类号}{\@seut@string@cateno}
    \CoverTopOption{密级}{\@seut@string@secretlevel}
    \CoverTopOption{U D C}{\@UDC}
    \CoverTopOption{学号}{\@studentid}
  }

  \begin{center}
    \ifseut@opt@engineering
      \vspace{141bp}
      \zhongsong\zihao{-0}\textbf{工程\seut@dagree@zh 学位论文}
      \vspace{24bp}
    \else
      \vspace{157.5bp}
      \ifseut@opt@master
        \includegraphics[width=269pt, height=34.5pt]{figures/master.png}
      \else
        \includegraphics[width=269pt, height=34.5pt]{figures/doctor.png}
      \fi
      \vspace{18bp}
    \fi
    \par
    \zihao{1}\heiti\@title\\
    \zihao{1}\heiti\@subtitle
  \end{center}

  \vspace{20bp}

  \begin{center}
    \setlength{\tabcolsep}{0pt}
    \renewcommand{\arraystretch}{2.0}
    \begin{tabular}{cr}
      \makebox[109bp][s]{
      \zihao{-2}\songti 研究生姓名：}      &
      \underline{
      \makebox[109bp][c]{\zihao{-2}\heiti\@author}}      \\
      \makebox[109bp][s]{
      \zihao{-2}\songti 导~~师~~姓~~名：} &
      \underline{
      \makebox[109bp][c]{\zihao{-2}\heiti\@advisorname}} \\
      \makebox[109bp][s]{~}          &
      \ifseut@opt@coadvisor
        \underline{\makebox[109bp][c]{\zihao{-2}\heiti\@coadvisorname}}
      \else
      \fi
    \end{tabular}
  \end{center}

  \begin{center}
    \setlength{\tabcolsep}{0pt}
    \renewcommand{\arraystretch}{2.0}
    \begin{tabular}{ll}
      \CoverBottomOption{申请学位类别}{\@degreetype\seut@dagree@zh} &
      \CoverBottomOption{学位授予单位}{~~东~南~大~学~~}                   \\
      \CoverBottomOption{一级学科名称}{\@seut@string@major}         &
      \CoverBottomOption{论文答辩日期}{\@defenddate}                  \\
      \CoverBottomOption{二级学科名称}{\@seut@string@submajor}      &
      \CoverBottomOption{学位授予日期}{\@authorizedate}               \\
      \CoverBottomOption[4.05cm]{答辩委员会主席}{\@committeechair}   &
      \CoverBottomOption{\@seut@string@pyr}{\@reviewerA}        \\
      ~                                                       &
      \CoverBottomOption{\makebox[2.55cm]{}}{\@reviewerB}       \\
      ~                                                       &
      ~
    \end{tabular}
  \end{center}

  \vfill
  \setcounter{page}{1}
  {\songti\zihao{4}\centerline{\today} \par}

  \clearpage\thispagestyle{empty}\cleardoublepage%
}

% 中文页面
\newenvironment{seutthanks}{\fontfamily{Times New Roman}\fontsize{16bp}{20bp}\selectfont}{\par}
\newcommand{\makechinesecover}{
  \thispagestyle{empty}
  \quad\par
  \vspace{23.25bp}
  \begin{center}
    \includegraphics[height=0.63in,width=1.92in]{figures/seu-text-logo.jpg}
    \par
    \vspace{15.75bp}
    \ifseut@opt@master
      \includegraphics{figures/master-hwzs}
    \else
      \includegraphics{figures/doctor-hwzs}
    \fi
    \par
    \vspace{51.75bp}
    {
      \setstretch{1.19312}
      \zihao{2}\heiti\textbf{\@title}\\
      \zihao{2}\heiti\textbf{\@subtitle}\par
    }
    \vspace{36bp}
    {
      \setlength{\tabcolsep}{0pt}
      \renewcommand{\arraystretch}{1.5962}
      \begin{tabular}{rl}
        \zihao{3}\heiti\textbf{专~~业~~名~~称：} &
        \zihao{3}\songti\underline{\textbf{\@seut@string@major}}             \\
        \\
        \zihao{3}\heiti\textbf{研究生姓名：}      &
        \zihao{3}\songti\underline{\textbf{\@author}}                        \\
        \\
        \zihao{3}\heiti\textbf{导~~师~~姓~~名：} &
        \zihao{3}\songti\underline{\textbf{\@advisorname\,\,\@advisortitle}} \\
                                            &
        \ifseut@opt@coadvisor
          \zihao{3}\songti\underline{\textbf{\@coadvisorname\,\,\@coadvisortitle}}
        \fi
      \end{tabular}
    }
  \end{center}
  \ifseut@opt@thanks
    \vspace{74.25bp}
    \begin{seutthanks}
      \noindent\underline{\qquad\qquad\qquad\qquad\,\,\,}
    \end{seutthanks}
    \vspace{6bp}
    {
      \setstretch{1.25}
      \noindent\zihao{5}\songti\@seut@string@thank\par
    }
  \fi
}

% 英文页面
\newcommand{\todayeng}{\the\year/\the\month/\the\day}
\newcommand{\makeenglishcover}{%
  \thispagestyle{empty}
  \begin{center}
    \setstretch{1}
    ~\\
    \vspace{30.375bp}%
    {
      \fontsize{24bp}{31.25bp}\selectfont
      \MakeUppercase{\@titleeng}\\
      \MakeUppercase{\@subtitleeng}
      \par
    }
    \vspace{-3bp}%
    {
    \fontsize{15bp}{31.1875bp}\selectfont
    \quad\\
    {
    A
    \ifseut@opt@master
      Thesis
    \else
      Dissertation
    \fi
    submitted to}\\
    {\@seut@string@univen}\\
    {For the
    \ifseut@opt@engineering
      Professional
    \else
      Academic
    \fi
    Degree of \seut@dagree@en\ of}\\
    {\@degreetypeen}\\
    \quad\\
    \quad\\
    \par
    }%
    {
    \fontsize{16bp}{31.3bp}\selectfont
    {BY}\\
    {\@authoreng}\\
    \quad\\
    {Supervised by:}\\
    {\@advisortitleeng\  \@advisornameeng}\\
    \ifseut@opt@coadvisor
    {and}\\
    {\@coadvisortitleeng\  \@coadvisornameeng}\\
    \else
    \quad\\
    \quad\\
    \fi
    \quad\\
    {\@seut@string@depten}\\
    {\@seut@string@univen}\\
    {\todayeng}
    \par
    }%
  \end{center}%
}

% 独创性声明
\newcommand{\signline}{\underline{\makebox[2.5cm][s]{}}}
\newcommand{\seudeclare}{
  \thispagestyle{empty}

  \begingroup
  \setstretch{1.86621}

  \begin{center}
    \zihao{-3}
    \quad\\
    \heiti\textbf{东南大学学位论文独创性声明}\par
  \end{center}
  \vspace{30bp}

  \begingroup
  \songti\zihao{5}
  本人声明所呈交的学位论文是我个人在导师指导下进行的研究工作及取得的
  研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包
  含其他人已经发表或撰写过的研究成果，也不包含为获得东南大学或其它教
  育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的
  任何贡献均已在论文中作了明确的说明并表示了谢意。\par
  \vspace{39bp}

  \begingroup
  \setlength\parindent{10.28em}
  研究生签名：\signline 日~期：\signline\par
  \endgroup

  \endgroup
  \vspace{57bp}

  \begin{center}
    \zihao{-3}
    \heiti\textbf{东南大学学位论文使用授权声明}\par
  \end{center}
  \vspace{30bp}

  \begingroup
  \songti\zihao{5}
  东南大学、中国科学技术信息研究所、国家图书馆、《中国学术期刊（光盘版）》电
  子杂志社有限公司、万方数据电子出版社、北京万方数据股份有限公司有权保留本人所
  送交学位论文的复印件和电子文档，可以采用影印、缩印或其他复制手段保存论文。本人
  电子文档的内容和纸质论文的内容相一致。除在保密期内的保密论文外，允许论文被查阅
  和借阅，可以公布（包括以电子信息形式刊登）论文的全部内容或中、英文摘要等部分内
  容。论文的公布（包括以电子信息形式刊登）授权东南大学研究生院办理。\par
  \vspace{39bp}

  \begingroup
  \raggedleft
  研究生签名：\signline 导师签名：\signline 日~期：\signline\par
  \endgroup

  \endgroup

  \endgroup
  \restoregeometry
}

\newcommand\makecover{%
  % 设置文档信息
  \seut@setpdfinfo
  % 封面
  \makecolorcover
  % 中文页面
  \makechinesecover
  \clearpage\thispagestyle{empty}\cleardoublepage
  % 英文页面
  \makeenglishcover
  \clearpage\thispagestyle{empty}\cleardoublepage
  % 独创性声明
  \seudeclare
  \clearpage\thispagestyle{empty}\cleardoublepage
  % 设置后续格式
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
  \chapter{摘要}
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
  \chapter{Abstract}
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
