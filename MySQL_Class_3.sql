#get the maximun salary of an employee working as programmer
select max(salary) 
from employees
where job_id='IT_PROG';

##get the job id and maximum salary of the employees where maximun salary is greater than or equal to 4000
select job_id, max(salary)
from employees
group by job_id
having max(salary) >= 4000;

primary key - unique key using which you can identify a particular record
Foreign keys - 

joins - get the records from multiple tables

types of joins
---------------
natural joins
inner joins
outer joins
	- left joins
	- right joins
self join
cross join/cartesian product

natural join - joins 2 tables based on all the common columns
between 2 tables provided the column name and the data type 
of the column for both tables

department id and manager id - same
employee
-----------
department_id
manager_id

departments
-----------
department_id
manager_id

employee 									department
empid  name deptid managerid				deptid     deptname   	managerid
10	   john  60			96						50			IT			95
20     xyz   60			96						60			hr			97
30     abc   50			96						70			sales		96
40    eert	 40			95						80			admin		94
50    def	 50			95

natural join - 4 rows

natural join - 5 rows

left join - 
empid  name deptid managerid  deptname   	
10	   john  60			96		hr			
20     xyz   60			96		hr			
30     abc   50			96		IT		
40    eert	 40			95		null				
50    def	 50			95		IT

right join - 
fetch all the colums from the right table abd matching colums from the left table and for 
unmatched columns it will give null

cross join -
empid  name deptid managerid  deptname   	
10	   john  60			96		it	
10	   john  60			96		hr	
10	   john  60			96		sales	
10	   john  60			96		admin	
20     xyz   60			96		it	
20     xyz   60			96		hr	
20     xyz   60			96		sales	
20     xyz   60			96		admin			

using clause - you can slect one column to join 2 tables, but you should have same column name
on clause - you can join 2 tables with different column names

#get first_name, last_name, employee_id, department_id and department name of all the employees
select first_name, last_name, employee_id, department_id, department_name
from employees
natural join departments;

#get department id, department name, location id and city based on the departments
SELECT department_id, department_name,
location_id, city
FROM departments
NATURAL JOIN locations ;


#get first_name, last_name, employee_id, department_id and department name of all the employees
select first_name, last_name, employee_id, department_id, department_name
from employees
join departments
using (department_id);

inner join - join 2 tables and pull the records only which are common

self join - joining the same table to fetch the records

#get first_name, last_name, employee_id, department_id and department name of all the employees
select e.first_name, e.last_name, e.employee_id, e.department_id, d.department_name
from employees e
inner join departments d
on e.department_id = d.department_id;


#get employee name, and manager id along with manager name
SELECT e.last_name emp, m.last_name mgr
FROM employees e JOIN employees m
ON (e.manager_id = m.employee_id);	

#query to get department name and number of employees in each department
select d.department_name, count(*) as employees_count
from departments d
inner join employees e
on e.department_id = d.department_id
group by d.department_id, d.department_name
order by d.department_name;

left join - it will fetch all the records from the left table 
			and only matching records from the right table and 
			for whatever records it dosent match it will give null
			
cross join / cartesian product - 
employee and departments
10				5
10 * 5 = 50







