-- looking at a basic conditional statement in a query:
SELECT * FROM employees
WHERE first_name IN ('Vidya', 'Irena', 'Maya');

-- first name of all current managers?

-- Select our first name
SELECT first_name
-- FROM employees
FROM employees
-- make a condition:
WHERE emp_no IN(
-- select employee numbers
	SELECT emp_no
-- from department manager table (to get managers)
	FROM dept_manager
-- establish current managers
	WHERE to_date > NOW());
	
-- Subquery on its own, outputting a list of employee no's
SELECT emp_no
FROM dept_manager WHERE to_date > NOW();

-- Nested subqueries:
-- Every employees that has a salary that is over the average

SELECT * FROM employees
-- make a condition for our employee numbers
WHERE emp_no IN(
-- establishing a subquery to get employee numbers from salaries
	SELECT emp_no
	FROM salaries
	-- where the salary is more than the average
	WHERE salary > (
	-- use a separate subquery to get the average salary
	SELECT AVG(salary) FROM salaries WHERE to_date > NOW())
AND to_date > NOW());

SELECT AVG(salary) FROM salaries;

-- this will break

SELECT emp_no
	FROM salaries
	WHERE salary > AVG(salary);
	
# Show me all the names for folks who are engineers and were hired on christmas
select *
from employees
where emp_no in (
   select emp_no
      from titles
         where title = "Engineer"
           and emp_no in (
                select emp_no
                    from employees
                        where hire_date like '%-12-25'
            )  
);



# Aliasing a subquery to treat it as a "table"
# Have to have the alias for this "query as table" to work
select current_salary.salary
from (
	select *
	from salaries
	where to_date > now()
) as current_salary;

# Have to have the alias for this "query as table" to work
select *
from (
	select *
	from salaries
	where to_date > now()
) as current_salary
join employees using(emp_no);
	
	
	