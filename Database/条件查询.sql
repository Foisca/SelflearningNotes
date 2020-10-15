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

