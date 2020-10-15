#进阶3：排序查询

/*
引入：
	select * from employees;

语法：
	select 查询列表
    from 表
    [where 筛选条件]
    order by 排序列表 [asc|desc]
特点：
	1.asc代表升序，desc代表降序(默认是升序)
    2.order by子句中可以支持单个字段，多个字段，表达式，函数，别名
    3.order by子句一般是放在查询语句最后面，limit子句除外
*/

#案例1：查询员工信息，要求工资从高到低
select * from employees order by salary desc;
select * from employees order by salary;

#案例2：查询部门编号>=90的员工信息，按入职时间先后进行排序
select * 
from employees
where department_id >= 90
order by hiredate asc;

#案例3：按年薪高低显示员工的信息和年薪[按表达式排序]
select *, salary*12*(1+ifnull(commission_pct,0)) 年薪
from employees
order by salary*12*(1+ifnull(commission_pct,0)) asc;

#案例4：按年薪高低显示员工的信息和年薪[按别名排序]
select *, salary*12*(1+ifnull(commission_pct,0)) 年薪
from employees
order by 年薪 asc;

#案例5：按姓名的长度显示员工的姓名和工资[按函数排序]
select length(last_name) 字节长度,last_name, salary
from employees
order by 字节长度 desc;

#案例6：查询员工信息，先按工资排序，再按员工编号排序
select * 
from employees
order by salary asc,employee_id desc;

/*
作业
1.查询员工的姓名，部门和年薪，按年薪降序 按姓名升序
2.选择工资不在8000到17000的员工的姓名和工资，按工资降序排序
3.插叙邮箱中包含e的员工信息，并按邮箱的字节数降序，再按部门号升序
*/
#1.查询员工的姓名，部门和年薪，按年薪降序 按姓名升序
select last_name, department_id,salary*(12*(1+ifnull(commission_pct,0))) 年薪
from employees
order by 年薪, last_name;


#2.选择工资不在8000到17000的员工的姓名和工资，按工资降序排序
select last_name,salary
from employees
where salary>17000 or salary < 8000
#not between 8000 and 17000
order by salary desc;

#3.查询邮箱中包含e的员工信息，并按邮箱的字节数降序，再按部门号升序
select *
from employees
where email like '%e%'
order by length(email) desc, department_id asc;

