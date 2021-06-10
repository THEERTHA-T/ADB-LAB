use company;

/* 1. Write a query to display the number of cities in the country */

select country_id,count(city)as number_of_city from locations group by country_id;

/* 2. Write a query to display minimal salary of employees in every department*/

select department_id,min(salary) from employees group by department_id;

/*3. Write a query to display maximum salary of employees in every department.*/

select department_id,max(salary) from employees group by department_id;

/*4. Write a query to display sum of salary of employees in every department.*/

select department_id,sum(salary)from employees group by department_id;

/* 5. Display the ID of departments with average salary greater than 15000.*/

select department_id,avg(salary)from employees group by department_id having avg(salary)>15000;

/* 6. Write a query to display the number of employees managed by the manager.*/

select manager_id,count(employee_id)from employees group by manager_id;

/* 7. Write a query to display managers who are managing more than 3 employees.*/

select manager_id,count(employee_id)from employees group by manager_id having count(employee_id)>3;

/*8. Write a query to increase salary of employee 111 to 5000.*/

update employees set salary=salary+5000 where employee_id=111;
select * from employees where employee_id=111;






























