use employees;

select *
from departments;

select *
from dept_emp;

select *
from dept_manager;

select *
from employees;

select *
from salaries;

select *
from titles;

-- 1. Select the information from the “dept_no” column of the “departments” table
SELECT dept_no
FROM departments 
ORDER BY dept_no;

-- 2. Select all data from the “departments” table
SELECT *
FROM departments
ORDER BY dept_no;

-- 3.Select all people from the “employees” table whose first name is “Elvis”
SELECT * 
FROM employees
WHERE first_name = 'Elvis';

-- 4.Retrieve a list with all female employees whose first name is Kellie
SELECT *
FROM employees
WHERE gender = 'F' and First_name = 'Kellie';

-- 5.Retrieve a list with all employees whose first name is either Kellie or Aruna
SELECT * 
FROM employees
WHERE first_name ='Kellie' or first_name ='Aruna';

-- 6. Retrieve a list of all female employees whose first name is either Kellie or Aruna.
SELECT *
FROM employees
WHERE gender='F' and (first_name='Kellie' or first_name='Aruna');
                            
-- 7. Use the IN operator to select all individuals from the “employees” table whose first name is either “Denis”, or “Elvis”.
SELECT *
FROM employees
WHERE first_name IN ('Denis','Elvis');


-- 8. Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT *
FROM employees
WHERE first_name NOT IN ('John','Mark','Jacob');

-- 9. Working with the “employees” table, use the LIKE operator to select the data about all individuals,  whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
SELECT *
FROM employees
WHERE first_name LIKE'Mark%';

-- ***10. Retrieve a list of all employees who have been hired in the year 2000. Retrieve a list with all employees whose employee number is written with 5 characters and starts with “1000”
SELECT *
FROM employees
WHERE emp_no >= '1000' and YEAR(hire_date) = 2000
ORDER BY emp_no;


-- 11. Extract all individuals from the ‘employees’ table whose first name contains “Jack”
SELECT * 
FROM employees
WHERE first_name LIKE '%Jack%';


-- 12. Once you have done that, extract another list containing the names of employees that do not contain “Jack”
SELECT *
FROM employees
WHERE first_name NOT LIKE '%Jack%';


-- 13. Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT *
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;


-- 14. Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT *
FROM employees
WHERE emp_no NOT BETWEEN '10004' AND'10012';


-- 15. Select the names of all departments with numbers between ‘d003’ and ‘d006’
SELECT *
FROM dept_emp
WHERE dept_no BETWEEN 'd003' AND 'd006';


-- 16. Select the names of all departments whose department number value is not null.
SELECT *
FROM dept_emp
WHERE dept_no IS NOT NULL;


-- 17.  Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT *
FROM employees
WHERE gender ='F' AND YEAR(hire_date) >= 2000;


-- 18. Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT *
FROM salaries
WHERE salary >150000;


--  19. Obtain a list with all different “hire dates” from the “employees” table. 
SELECT DISTINCT hire_date
FROM employees;


-- 20.  How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT COUNT(*)
FROM salaries
WHERE salary >= 100000;


-- 21.  How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise
SELECT COUNT(*)
FROM dept_manager;

-- 22. Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT *
FROM employees
ORDER BY hire_date DESC;


-- 23.  Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary,” must show the number of employees contracted to that salary. Lastly, sort the output by the first column.
SELECT salary,
       COUNT(CASE WHEN salary >80000 THEN 1 ELSE 0 END) AS 'emps_with_same_salary'
FROM salaries
WHERE salary >80000
GROUP BY Salary
ORDER BY salary;

SELECT salary,
       COUNT(*) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;

-- 24. Select all employees whose average salary is higher than $120,000 per annum.
SELECT e.emp_no,
       e.first_name,
       AVG(s.salary) AS average_salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY emp_no,
         first_name
HAVING AVG(salary) > 120000;

select *
from employees;

-- 25. Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT emp_no,
       COUNT(*) AS number_of_contracts
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(*) >1
ORDER BY COUNT(*) DESC;


-- 26. Select the first 100 rows from the ‘dept_emp’ table.
SELECT *
FROM dept_emp
LIMIT 100;


-- 27. Select all employees whose last name starts with "M".
SELECT *
FROM employees
WHERE last_name LIKE 'M%';


-- 28. List all employees who were born after the 5th of July 1990.
SELECT *
FROM employees
WHERE birth_date > 1990-07-05;

-- 29. Show the first name and last name of all employees whose last names are exactly 6 characters long.
SELECT *
FROM employees
WHERE LENGTH(last_name) = 6;


-- 30. How many staff does each department have?
SELECT de.dept_no,
	   d.dept_name,
       COUNT(de.emp_no) AS staff_count
FROM dept_emp de
JOIN departments d
ON d.dept_no = de.dept_no
GROUP BY dept_no
ORDER BY COUNT(emp_no) ASC;
       



