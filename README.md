## 东南大学毕业论文latex模板

感谢[seuthesix](https://github.com/zhimengfan1990/seuthesix)提供的模板，本仓库基于其进行二次加工和处理。

### 推荐编辑器

**windows**：[Texstudio](https://sourceforge.net/projects/texstudio/)

**mac**: [MacTeX](https://www.tug.org/mactex/)

### 文件说明

主要配置文件说明如下：

* seuthesix.cls: 核心配置文件
* seuthesix.cfg: seuthesix.cls运行时加载此配置文件
* seuthesix.bst：风格文件
* seuthesix.bib: 参考文献引用存放文件

其他文件大多为编译生成的，如果要新建自己的项目，拷贝这四个主要文件和图片目录即可。

目录说明如下：

* seu-bachelor: 本科 TODO
* seu-master: 研究生学硕
* seu-engineering: 研究生专硕
* seu-phd: 博士
* rules.pdf: 东南大学研究生学位论文的格式规定 

### 常见问题以及解决办法

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

* 多出空白页问题

  由于模板限制奇偶页，会生成多余的空白页。可以通过如下命令去掉空白页生成：

  ```latex
  \let\cleardoublepage\clearpage % 去除空白页
  ```

  放在章节命令之前，或\begin{abstract}等也可以。

* 其他问题

  基本问题都能搜索的到解决方案，善用搜索引擎。


### 参考

1. [seuthesix](https://github.com/zhimengfan1990/seuthesix)

2. [SEUThesis](https://github.com/JosanSun/SEUThesis)