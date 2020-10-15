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
