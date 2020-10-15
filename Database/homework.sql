#1.查询工资大于12000的员工姓名和工资
select 
	last_name,
    salary
from 
	employees
where
	salary>=12000;

#2.查询员工号为176的员工的姓名和部门号和年薪
select 
	department_id,
    salary*12*(1+ifnull(commission_pct,0))as 年薪
from 
	employees
where 
	employee_id=176;

#3.选择工资不在5000到12000的员工的姓名和工资
select 
	last_name,
    salary
from
	employees
where
	salary<5000 or salary>12000;
#4.选择在20或50号部门工作的员工的姓名和部门号
select 
	last_name,
    department_id
from 
	employees
where
	department_id>20 and department_id<50;
	
#5.选择公司中没有管理者的员工姓名及job_id
#6.选择公司中有奖金的员工姓名，工资和奖金级别
#7.选择员工姓名的第三个字母是a的员工姓名
select 
	last_name
from
	employees
where
	last_name like "__a*";

