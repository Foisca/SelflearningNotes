#进阶4：常见函数
/*
概念：类似于java的方法，将一组逻辑语句封装在方法体中，对外暴露方法名
好处：1.隐藏了实现细节 	2.提高了代码重用性
调用：select 函数名(实参列表) [from 表];
特点：
	1：叫什么(函数名)
    2：干什么(函数功能)
分类：
	1.单行函数
    如concat, length, ifnull等
    2.分组函数
    功能：做统计使用，又称为统计函数，聚合函数，组函数
*/
#一：字符函数
#1.length 获取参数值的字节数
select length('john');
select length('张三丰');

show variables like '%char%';

#2.concat
select concat (last_name,'_', first_name) from employees;

#3.upper, lower
select upper('john');
select lower('JOHN');
#案例：将姓变大写，名变小写
select concat(upper(last_name),' ',lower(first_name)) 姓名 from employees;

#4.substr, substring(从1开始计算)
#截取从索引出开始后面的字符
select substr('John like Mary',10) output;
#截取从执行索引处制定字符长度的字符
select substr('John like Mary',1,4) output;

#案例：姓名中首字符大写，其他字符小写然后用_拼接，显示出来
select concat(upper(substr(last_name,1,1)),'_',lower(substr(last_name,2))) output
from employees;

#5.instr 返回第一次出现的子串索引
select instr('This is Foisca','Foisca') output;

#6.trim 去前后空格[自定义字符]
select trim(' Foisca   ') output;
select length(trim('           Foisca   ')) output;

select trim('a' from 'aaaaaKindleaaaaaaaa') output;
select trim('aa' from 'aaaaaKinaaaaaaaaadleaaaaaaaa') output;

#7.lpad  用制定字符左填充指定长度
select lpad('Foisca',10,'*') output;
select lpad('Foisca',3,'*') output;

#8.4pad  用制定字符右填充指定长度
select rpad('Foisca',10,'*') output;
select rpad('Foisca',3,'*') output;

#9.replace 
select replace('This is Foisca','Foisca','Kindle') output;
select replace('This is FoiscaFoiscaFoisca','Foisca','Kindle') output;


#二.数学函数
#round四舍五入
select round(1.65);
select round(1.45);
select round(-1.45);
select round(-1.65);

select round(1.567,2);

#2.ceil 向上取整
select ceil(1.34);
select ceil(-1.34);
select ceil(1.00);

#3.floor 向下取整
select floor(-9.99);

#4.truncate
select truncate(1.654,1);

#5.mod
select mod(10,3);
select 10%3;