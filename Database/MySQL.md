### DB = database



### DBMS = database management system

MySQL, Oracle, DB2, SqlServer

### SQL = Structure Query Language

1. 几乎所有的DBMS都支持SQL
2. 简单易学
3. 算然简单，但是很强有力，灵活使用其他语言元素，可以进行非常复杂的操作。

## 数据库操作

```mysql
1.查看当前所有的数据库
	show databases;	
2.打开指定的库
	use 库名;
3.查看当前的所有表
	show tables;
4.查看其他库的所有表
	show tables from 库名;
5.创建表
    create table 表名(
        列名 列类型，
        列名 列类型，
        ...
    );
6.查看表结构
	desc 表名;
7.查看服务器的版本
方式一: 登录到mysql服务端
	select version();
方式二: 没有登录到mysql服务端
	mysql --version
	or	
	mysql --v
```

## 语法规范

1. 不区分大小写，建议我们关键字大写，但是表名，列名小写；
2. 每条命令最好用分号结尾(\g也可以)；
3. 每条命令根据需要，可以进行缩进或换行；
4. 注释
   1. 单行注释： #注释文字
   2. 单行注释：--注释文字
   3. 多行注释：/* 注释文字 */



# SQL语言的分类

## 1.DQL语言(Data Query Language)

### 基础查询

```mysql
#进阶1：基础查询
/*
语法：
select 查询列表 from 表名;
特点: 
1.查询列表可以是：表中的字段、常量、表达式、函数
2.查询的结果是一个虚拟的表格
*/
use myemployees;
#1.查询单个字段
select last_name from employees;
#2.查询表中的多个字段
select last_name,salary,email from employees;
#3.查询表中的所有字段departments
select 
	employee_id,
	first_name,
	last_name,
	phone_number,
	job_id,salary,
	commission_pct,
	manager_id,
	department_id,
	hiredate 
from employees;
select * from employees;
#4.查询常量值
select 100;
select 'john';
#5.查询表达式
select 100%98;
#6.查询函数
select version();
#7.起别名
/*
1. 便于理解
2. 如果需要查询的字段有重名的情况，使用别名可以区分开来
*/
#方式一
select 100%98 as 结果 ;
select last_name as 姓, first_name as 名 from employees;
#方式二
select last_name 姓,first_name 名 from employees;
#案例： 查询salary, 显示结果为output
select salary as "output" from employees;
#8.去重
#案例：查询员工表中所有的部门编号
select distinct department_id from employees;
#9. +号的作用
/*
java 中的+号：
1.运算符：两个操作数都为数值型
2.连接符：只要有一个操作数为字符串

mysql中的+号：
.仅仅只有一个功能：运算符
select 100+90; 		两个操作数都为数值型，则做加法运算
select '123'+90; 	其中一个为字符型，试图将其转化为数值型，再进行运算
select 'john'+99; 	如果转换失败，则将字符型转换成0
select null+10; 	只要有一方为null，结果肯定为null
*/

#案例：查询员工名和姓连接为一个字段，并显示为 姓名
select concat('a','b','c') as result;
select
	concat(last_name ,' ', first_name) as 姓名 
from
	employees;

```



### 条件查询

```mysql
#进阶2：条件查询
use myemployees;
/*
语法： 
select 
	条件列表
from
	表名
where
	筛选条件;
    
分类；
	一、按条件表达式筛选
    条件运算符：> < = != <> >= <=
    二、按逻辑表达式筛选
    逻辑表达式：&&  ||  !
				and or not
	&&和and：两个都为true，结果为true，反之为false
    ||或or：两个只要有一个为true，结果为true，反之为false
    !或not：如果连接的条件本身为false，结果为true，反之为false
	三、模糊查询
		like
        between and
        in
        is null
*/
#一、按条件表达式筛选
#案例1：
select 
	*
from
	employees
where
	salary > 12000;

#案例2：查询部门编号不等于90号的员工和部门编号
select 
	last_name,
    department_id
from 
	employees
where
	department_id<>90;

#二、按逻辑表达式筛选
#案例1：查询工资在10000到20000之间的员工名，工资及奖金
select
	last_name,
    salary,
    commission_pct
from
	employees
where
	salary>=10000 and salary<=20000;
#案例2：查询部门标号不是在90到110之间的，或者工资高于15000的员工信息
select
	*
from 
	employees
where
	department_id<90 or department_id>110 or salary>15000;

#三、模糊查询
/* 
1.like
特点：
a.一般和通配符连用
	通配符：
	%：任意多个字符，包含0个字符
    _
*/
#1.like

#案例1：查询员工名中包含字符a的员工信息
select 
	*
from
	employees
where
	last_name like '%a%';
#案例2：查询员工名中第三个字符为n，第五个字符为l的员工名和工资
select 
	last_name,
    salary
from 
	employees
where
	last_name like '__n_l%';
#案例3：查询员工名中第二个字符为_的员工名

select
	last_name
from
	employees
where
	last_name like '_\_%';#使用转义字符
#2.between and
/* 
	1.使用between and可以提高代码简洁度
    2.包含临界值
    3.两个值不要调换顺序
*/

#案例1：查询员工编号在100到120之间的员工信息
select
	*
from
	employees
where
	employee_id>=100 and employee_id<=120;
#----------------------------------------
select
	*
from
	employees
where
	employee_id between 100 and 120;
    
#3.in
/*
含义：判断某字段是否属于in列表中的某一项
特点：
	1.使用in提高语句简洁度
    2.in列表的值类型必须一致或兼容
    3.不能使用通配符
*/
#案例：查询员工的工种编号是 IT_PROG, AD_VP, AD_PRES中的一个的员工名和工种编号
select 
	last_name,
    job_id
from
	employees
where
	job_id='IT_PROG' or job_id='AD_VP' or job_id='AD_PRES';
#--------------------------------------------------------    
select 
	last_name,
    job_id
from
	employees
where
	job_id in ('IT_PROG','AD_VP' ,'AD_PRES');

#4.is null
/*
=或者<>不能用于判断null值，
is null 或 is not null 才可以判断null
*/
#案例1：查询没有奖金的员工名和奖金率
SELECT
	last_name,
    commission_pct
FROM 
	employees
WHERE
	commission_pct is not NULL;

#安全等于  <=>
#也可以判断null值
#案例2：查询工资为12000的员工信息
select 
	last_name,
    salary
from
	employees
where
	salary <=> 12000;

#is null  vs  <=>
#is null: 仅可以判断null值
#<=>	: 既可以判断null，又可以判断普通数值

select 
	last_name,
    department_id,
    salary*12*(1+ifnull(commission_pct,0)) as 年薪
from
	employees
where
	employee_id=176;


```



### 排序查询

### 常见函数

### 分组函数

### 分组查询

### 连接查询

### 子查询

### 分页查询

### union联合查询

## 2.DML语言(Data Manipulation Language)

增删改

## 3.DDL语言(Data Define Language)

## 4.TCL语言(Transaction Control Language)

## *5.DCL语言(Data Control Language)