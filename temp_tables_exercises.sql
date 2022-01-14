-- Exercise 1
-- Using the example from the lesson, create a temporary table called employees_with_departments 
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
-- Update the table so that full name column contains the correct data
-- Remove the first_name and last_name columns from the table.
-- What is another way you could have ended up with this same table?

-- step 1: create the query using the db_name.table_name syntax
select first_name, last_name, dept_name
from employees.employees
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no)
where to_date > curdate();

-- use that query to make a temporary table
use test3;
create temporary table employees_with_departments as (
    select first_name, last_name, dept_name
    from employees.employees
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where to_date > curdate()
);

-- step 3
alter table employees_with_departments add full_name VARCHAR(30);

-- step 4
update employees_with_departments set full_name = concat(first_name, ' ', last_name);

-- step 5
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- double check
select * from employees_with_departments;

-- Another way to create the same result? Create the full_name in the original query





-- Exercise 2
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

use test3;

-- clean up any old version of this table (only if it already exists)
drop table if exists payments;

create temporary table payments as (
    select payment_id, customer_id, staff_id, rental_id, amount * 100 as amount_in_pennies, payment_date, last_update
    from sakila.payment
);

select * from payments;
describe payments;

ALTER TABLE payments MODIFY amount_in_pennies int NOT NULL;

describe payments;





-- Exercise 3
-- Find out how the current average pay in each department compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries. 
-- In terms of salary, what is the best department right now to work for? The worst?

-- Historic average and standard deviation b/c the problem says "use historic average"
-- 63,810 historic average salary
-- 16,904 historic standard deviation

-- Obtain the average histortic salary and the historic standard deviation of salary
-- Write the numbers down:
-- 63,810 historic average salary
-- 16,904 historic standard deviation
select avg(salary) as avg_salary, std(salary) as std_salary
from employees.salaries ;

create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);

-- Create columns to hold the average salary, std, and the zscore
alter table current_info add average float(10,2);
alter table current_info add standard_deviation float(10,2);
alter table current_info add zscore float(10,2);

update current_info set average = 63810;
update current_info set standard_deviation = 16904;

-- z_score  = (avg(x) - x) / std(x) */
update current_info 
set zscore = (department_current_average - historic_avg) / historic_std;

select * from current_info
order by zscore desc;




-- Exercise 3 in a more programmatic way
-- Historic average and standard deviation b/c the problem says "use historic average"
-- 63,810 historic average salary
-- 16,904 historic standard deviation
create temporary table historic_aggregates as (
    select avg(salary) as avg_salary, std(salary) as std_salary
    from employees.salaries 
);

create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);

select * from current_info;

alter table current_info add historic_avg float(10,2);
alter table current_info add historic_std float(10,2);
alter table current_info add zscore float(10,2);

update current_info set historic_avg = (select avg_salary from historic_aggregates);
update current_info set historic_std = (select std_salary from historic_aggregates);

select * from current_info;

update current_info 
set zscore = (department_current_average - historic_avg) / historic_std;

select * from current_info
order by zscore desc;