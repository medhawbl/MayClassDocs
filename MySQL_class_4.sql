sub query - query inside a query

main query(
	sub query - 1 row
)


#fetch all the departments based on location - california
select * from departments where location_id = 
(select location_id from locations where state_province='california');

Single row operators - if sub query returns single row then use single row operators like =, >, <, >= etc

multiple row operators - if sub query returns more than one row then use multiple row operators like 
			in, any etc
			
			
#get all employees who has job id same as employee with id 141 and salary is same as employee with id 143
select job_id from employees where employee_id = 141;
select salary from employees where employee_id = 143;
select * from employees where job_id = (select job_id from employees where employee_id = 141)
AND salary = (select salary from employees where employee_id = 143);


#fetch all employees who have the minimum salary
select min(salary) from employees;
select * from employees where salary = (select min(salary) from employees);


#fetch employee first name, department id and salary of all employees who have same salary 
#as the minimum salary of department with id 50
select min(salary) from employees where department_id=50;
select first_name, department_id, salary from employees where salary = 
(select min(salary) from employees where department_id=50);


#fetch employee first name, department id and salary of all employees who have same salary 
#as the minimum salary of shipping department
#fetch details of all employees
#minimum salary of shipping department
#get id of shipping department
select department_id from departments where department_name='shipping';
select first_name, department_id, salary from employees where salary = 
(select min(salary) from employees where department_id = 
(select department_id from departments where department_name='shipping'));


#fetch departments whose minimum salary is greater than minimum salary of sales department
#fetch departments with salary greater than sales department
#minimum salary of sales department
#get id of sales department
select department_id from departments where department_name = 'sales';
select min(salary) from employees where department_id = 
(select department_id from departments where department_name = 'sales');
select department_id, min(salary) from employees group by department_id
having min(salary) > (select min(salary) from employees where department_id = 
(select department_id from departments where department_name = 'sales'));


#fetch employess whose salary is less than salaries of employee with job id 'it prog'

write a query to select firstname and hire date of employees who were hired after employee steven

#query to find employees who report to king or employees who have king as manager
select employee_id from employees where last_name='king' and manager_id is null;
select * from employees where manager_id = 
(select employee_id from employees where last_name='king' and manager_id is null);


#query to find top salaried employee details in each department
#employee details with top salaried
#find maximum salary in each department
select department_id, max(salary) from employees group by department_id;
select * from employees where (department_id, salary) in 
(select department_id, max(salary) from employees group by department_id);


#query to find employee details of first highest salaried person

#query to find employee details of second highest salaried person
#get employee details 
#second highest salaried person
#first highest salaried person
select max(salary) from employees;
select max(salary) from employees where salary not in (select max(salary) from employees);
select * from employees where salary = 
(select max(salary) from employees where salary not in (select max(salary) from employees));


#fetch top 5 highest salaries
select distinct salary from employees order by salary desc limit 5;

#query to get first name, employee id, salary of employees whose salary is within top 5 highest salaries
select distinct salary from employees order by salary desc limit 5;
select first_name, employee_id, salary from employees where salary in
(select * from(select distinct salary from employees order by salary desc limit 5) as t);

#6th - 10th highest salaries

main query ANY(
	sub query - multiple rows
)

or - operators

(a==1 or b==2)
print "hello";

ALL -- and
(a==1 and b==2)
print "hello";

any operator
FROM employees
WHERE salary < ANY
(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';


all operator
WHERE salary < ALL
(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';


set operators
union - combines both the data but it will eliminate duplicates
a = {1, 2, 3, 4}
b = {1, 2, 3}
a union b ----> r={1, 2, 3, 4}

union all - combine all the rows without eliminating the dulicates
r={1, 2, 3, 4, 1, 2, 3}

intersection - gives common data
r={1, 2, 3}

minus - r ={4}

DML - select, insert, update, delete, merge
DDl - create, alter, drop, rename, truncate
DCL - grant, revoke
TCL - commit, rolback, savepoint

create - 
create table tablename (
columns_name datatype constraint
columns_name datatype constraint
columns_name datatype constraint
columns_name datatype constraint
)

constraint - rules to columns
primary key - unique + not null
foreign key - primary key in one table which acts as a foreign key for another table - relate tables
unique - no duplicates
not null - it should not be null


training@whitebox-learning.com


			

