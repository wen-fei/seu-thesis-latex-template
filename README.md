## 东南大学毕业论文latex模板

### 推荐编辑器

**windows**：[Texstudio](https://sourceforge.net/projects/texstudio/)

**mac**: [MacTeX](https://www.tug.org/mactex/)



### 文件说明

目录说明如下：

* seu-undergraduate: 本科

* seu-master: 研究生学硕

* seu-engineering: 研究生专硕

### 常见问题以及解决办法

* 中文加粗问题

  解决办法目前知道两种：

  （1） 修改*.tex文件头部\documentclass[algorithmlist,  figurelist,tablelist, nomlist, masters]{seuthesix}加入AutoFakeBold，即\documentclass[algorithmlist, AutoFakeBold, figurelist,tablelist, nomlist, masters]{seuthesix}

  （2） 修改TeXstudio编译器，lualatex编译一次，再用pdflatex编译。修改编译器方法如下：选项->设置TeXstudio，如下图所示：

  ![]()


* 写表格麻烦问题

  推荐工具：Latex 表格代码在线生成器，[链接](https://www.tablesgenerator.com/)

* 图片放大后不清晰问题

  建议图片用PPT、Excel或Visio画图，然后转pdf，裁剪，再转eps。推荐工具：Adobe Acrobat，非常方便。步骤如下：

  1. 使用ppt或visio画好图
  2. 新建一个ppt文件，只有一页，复制画好的图到当前ppt(尽量保持图在正中心)，然后导出为pdf
  3. 使用Adobe Acrobat打开pdf，编辑pdf->裁剪页面(尽量保持间距相同，空白别留太多)，然后按回车，确认
  4. 文件->到处到->内嵌式postscript

  图片生成完成。当然使用其他专业工具matlab等也可以直接生成eps。

* 其他问题

  基本问题都能搜索的到解决方案，善用搜索引擎。

