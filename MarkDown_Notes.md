段落的表示方式
=============

####1.
#标题最多有六级
##标题最多有六级
###标题最多有六级
####标题最多有六级
#####标题最多有六级
######标题最多有六级
#######

###2.
使用 - 和 = 来标记一级和二级标题！
个数不计

一级标题
=
一级标题2
=====

二级标题
-------

##段落
回车就可以换行
##字体
*斜体文本*
_斜体文本_
**粗体文本**
__粗体文本__
***粗斜体文本***
___粗斜体文本___
##分割线
至少三个连续的*，-或者_，可以建立分割线
***
行内只能加空格字符
* *  *
------
看看效果
______
##删除线
文字两端加上~~
~~删除线~~
##下划线
通过HTML的<u>标签来实现
<u>下划线的文本<u>
##脚注
要注明的文本1[^1]
要注明的文本2[^2]
[^1]:这是要注明的文本。
[^2]:这是要注明的文本2。

##Markdown支持有序和无序列表
#####无序列表用*，+和-作为列表标记，注意符号后面要加一个空格字符
* 第一项
* 第二项
* 第三项
- 第一项
- 第二项
- 第三项
+ 第一项
+ 第二项
+ 第三项
#####有序列表用数字加上.来表示(有无空格有区别)
1.第一项
2.第二项
3.第三项
1. 第一项
2. 第二项
3. 第三项
##列表嵌套
#####列表嵌套只需要在子列表中添加四个空格即可(也就是一个tab)
注意这里同样可以用*，+，-
1. 第一项：
    * 第一项嵌套的第一个元素
    - 第一项嵌套的第二个元素
2. 第二项：
    + 第二项嵌套的第一个元素
    - 第二项嵌套的第二个元素
        + 多重嵌套
        + 多重嵌套

##区块
>最外层
>>第一层嵌套
>>>第二层嵌套
>>>
>>>>第三层嵌套

####区块中使用列表
>最外层
>1. Elem1
>2. Elem2
>+ First
>+ Second
>> 第一层嵌套
>>>第二层嵌套
####列表中实用区块
* 第一项
    >区块1层
    >
    >>区块2层
* 第二项
##Markdown代码
`用反引号括起来`
`printf()`函数
####区块代码
#####Way 1
```
#include<iostream>
using namespace std;
...
...
```
#####Way2
    this is code 
    this is code
#####Way3
<code>this is code</code>

<pre><code>this is code</code></pre>
##Markdown链接
[bilibili](https://www.bilibili.com/)
这是一个链接 [菜鸟教程](https://www.runoob.com)
或者
<链接地址>
<https://www.bilibili.com/>
###高级链接
这个链接用 1 作为网址变量 [Google][1]
这个链接用 runoob 作为网址变量 [Runoob][runoob]
然后在文档的结尾为变量赋值（网址）
##Markdown 图片

![alt 属性文本](https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg)

![图片2][picture]

开头一个感叹号 !
接着一个方括号，里面放上图片的替代文字
接着一个普通括号，里面放上图片的网址，最后还可以用引号包住并加上选择性的 'title' 属性的文字。


[1]: http://www.google.com/
[runoob]: http://www.runoob.com/
[picture]:https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg

##Markdown表格
Markdown 制作表格使用 | 来分隔不同的单元格，使用 - 来分隔表头和其他行。

|  表头   | 表头  |
|  ----  | ----  |
| 单元格  | 单元格 |
| 单元格  | 单元格 |
| 测试|一样|
|不对齐也是一样的||

###对其方式
-: 设置内容和标题栏居右对齐。
:- 设置内容和标题栏居左对齐。
:-: 设置内容和标题栏居中对齐。
|左对齐|右对齐|居中对齐|
|:-----|----:| :----: |
|左    |右   |中      |

##Markdown 高级技巧
####支持HTML元素
不在 Markdown 涵盖范围之内的标签，都可以直接在文档里面用 HTML 撰写。

目前支持的 HTML 元素有：<kbd><b> <i> <em> <sup> <sub> <br>
</kbd> </b> </i> </em> </sup> </sub> </br>
使用 <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd> 重启电脑
<kbd>ctrl</kdb>

###Markdown转义字符

**文本加粗** 
\*\* 正常显示星号 \*\*
\
###以下都是转移字符支持的字符

\\   反斜线
\`   反引号
\*   星号
\_   下划线
\{\}  花括号
\[\]  方括号
\(\)  小括号
\#   井字号
\+   加号
\-   减号
\.   英文句点
\!   感叹号

###公式
$$
\mathbf{V}_1 \times \mathbf{V}_2 =  \begin{vmatrix} 
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\frac{\partial X}{\partial u} &  \frac{\partial Y}{\partial u} & 0 \\
\frac{\partial X}{\partial v} &  \frac{\partial Y}{\partial v} & 0 \\
\end{vmatrix}
${$tep1}{\style{visibility:hidden}{(x+1)(x+1)}}
$$
