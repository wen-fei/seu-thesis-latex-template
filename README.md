# 东南大学毕业论文latex模板

感谢[seuthesix](https://github.com/zhimengfan1990/seuthesix)提供的模板，本仓库基于其进行二次加工和处理。

## 推荐编辑器

**windows**：[Texstudio](https://sourceforge.net/projects/texstudio/)

**mac**: [MacTeX](https://www.tug.org/mactex/)

## 文件说明

主要配置文件说明如下：

* figures: 图片目录
* seuthesix.cls: 核心配置文件

其他文件大多为编译生成的，如果要新建自己的项目，拷贝这2个主要文件和图片目录即可。

样例文件说明如下：

* format: 东南大学研究生学位论文的格式规定 
* sample.tex: 模板`seuthesix`
* sample.bib: 参考文献引用存放文件

模板`seuthesix`选项说明如下: 

* 学位（必选，单选）: phd / masters
* 工程学位（可选，默认非）: engineering
* 系统字体（可选，默认fontwin）: fontwin / fontmac
* 超链接无颜色（可选，默认非）: nocolorlinks
* 其它章节（可选，多选，默认不选）: 
  * algorithmlist: 算法目录
  * figurelist: 插图目录
  * tablelist: 表格目录
  * nomlist: 术语与数学符号约定

文章基本结构（见`sample.tex`）：

```latex

% 源加载参考文献数据
\addbibresource[location=local]{sample.bib}

\begin{document}

% 中英文页面和独创性声明
\makecover

%% 正文前的内容
\frontmatter

% 中文摘要
\begin{abstract}{xxx}
\end{abstract}
% 英文摘要
\begin{englishabstract}{xxx}
\end{englishabstract}
% 目录
\tableofcontents
% 目录后内容
\listofothers

%% 正文
\mainmatter


%% 正文后的内容
\backmatter

% 致谢
\acknowledgement
% 打印参考文献
\thesisbib
% 附录
\appendix
% 作者简介
\resume

\end{document}
```

宏包说明：

* [ctex](https://ctan.org/tex-archive/language/chinese/ctex): 中文环境
* [setspace](https://ctan.org/pkg/setspace) 设置局部行距
* [tocloft](https://ctan.org/pkg/tocloft) 设置目录

## 编译

```shell
xelatex --synctex=1 sample.tex 
biber sample
xelatex --synctex=1 sample.tex
xelatex --synctex=1 sample.tex
```

## 常见问题以及解决办法

* 中文加粗问题

  解决办法目前知道两种：

  （1） 修改*.tex文件头部\documentclass[algorithmlist,  figurelist,tablelist, nomlist, masters]{seuthesix}加入AutoFakeBold，即\documentclass[algorithmlist, AutoFakeBold, figurelist,tablelist, nomlist, masters]{seuthesix}

  （2） 修改TeXstudio编译器，lualatex编译一次，再用pdflatex编译。修改编译器方法如下：选项->设置TeXstudio，如下图所示：

  ![](https://github.com/wen-fei/seu-thesis-latex-template/blob/master/img/TeXstudio_bold.png?raw=true)


* 写表格麻烦问题

  推荐工具：Latex 表格代码在线生成器，[链接](https://www.tablesgenerator.com/)

* 图片放大后不清晰问题

  建议图片用PPT、Excel或Visio画图，然后转pdf，裁剪，再转eps。推荐工具：Adobe Acrobat，非常方便。步骤如下：

  1. 使用ppt或visio画好图
  2. 新建一个ppt文件，只有一页，复制画好的图到当前ppt(尽量保持图在正中心)，然后导出为pdf
  3. 使用Adobe Acrobat打开pdf，编辑pdf->裁剪页面(尽量保持间距相同，空白别留太多)，然后按回车，确认
  4. 文件->到处到->内嵌式postscript

  图片生成完成。当然使用其他专业工具matlab等也可以直接生成eps。

* 公式书写

  常用符号Latex表示方法：[链接](https://www.mohu.org/info/symbols/symbols.htm)

  Latex数学公式在线编辑器：[链接](https://www.codecogs.com/latex/eqneditor.php?lang=zh-cn)

* 其他问题

  基本问题都能搜索的到解决方案，善用搜索引擎。


## 参考

1. [seuthesix](https://github.com/zhimengfan1990/seuthesix)

2. [SEUThesis](https://github.com/JosanSun/SEUThesis)

3. [biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)

