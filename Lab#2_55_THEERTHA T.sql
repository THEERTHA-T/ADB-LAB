use company;

/*Write a query to display all the countries*/

select * from countries;

/* Write a query to display specific columns like email and phone number for all the employees.*/

select employee_id,email,phone_number from employees;

/*Write a query to display the data of employee whose last name is “Fay”*/

select * from employees where last_name="Fay";

/*Write a query to find the hire date for employees whose last name is “Grant” or “Whalen”*/

select first_name,last_name,hire_date from employees where last_name="Grant" or last_name="Whalen";

/*Write a query to display name of the employee who do not have a phone number.*/

select first_name,last_name from employees where phone_number is null;

/*Write a query to get all the employees who work for department 8*/

select first_name,last_name from employees where department_id="8";

/*Write a query to display the departments in the descending order.*/

select department_name from Dept order by department_name DESC;

/*Write a query to display all the employees whose last name starts with “K”.*/

select employee_id,first_name,last_name from employees where last_name like "K%";

/*Display name of the employees whose hire dates are between 1995 and 1997*/

select first_name,last_name from employees where hire_date between '1995-01-01' and '1997-12-31';


/*. Write a query to display jobs where the maximum salary is less than 5000*/

select job_title from jobs where max_salary<5000;

/*Write a query to display email address in lower case*/

select lower(email) as email from employees;

/*Write a query to display name of the employees who were hired in 1995.*/

select first_name,last_name from employees where hire_date between '1995-01-01' and '1995-12-31';

/*Write a query to insert an employee “Paul Newton” in department 11*/

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
values(522,'Paul','Newton','paul.newton@sqltutorial.org','785.152.1459','1999-01-22',2,4500.00,205,11);
select *from employees;

/* Write a query to delete the shipping department*/

alter table employees drop constraint employees_ibfk_2;
alter table employees add constraint employees_ibfk_2 foreign key(department_id) references Dept(department_id) on delete cascade;
delete from Dept where department_name="Shipping"; 
select * from Dept;




  




















































