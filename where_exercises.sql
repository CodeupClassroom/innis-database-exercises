-- 1. Create a file named where_exercises.sql. Make sure to use the employees database.

USE employees;
SELECT database();

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. (709 observations or rows)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? (709 observations; it matches.)

SELECT *
FROM employees
WHERE first_name = 'Irena' 
    OR first_name = 'Vidya' 
    OR first_name =  'Maya';

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', using OR, AND who is male. Enter a comment with the number of records returned. (441 observations)

SELECT *
FROM employees
WHERE gender = 'M'
AND 
    (first_name = 'Irena' 
     OR first_name = 'Vidya' 
     OR first_name = 'Maya');

-- We can also write our query like this... (441 observations; it matches.)

SELECT *
FROM employees
WHERE 
    (first_name = 'Irena' 
     OR first_name = 'Vidya' 
     OR first_name = 'Maya')
AND gender = 'M';

-- 5. Find all employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. (7330 observations)

SELECT *
FROM employees 
WHERE last_name like 'E%';

-- 6. Find all employees whose last name starts OR ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. (30_723 observations)

SELECT *
FROM employees 
WHERE last_name LIKE 'E%' 
OR last_name LIKE '%E';

-- How many employees have a last name that ends with E, but does not start with E? (23_393 observations)

SELECT *
FROM employees 
WHERE last_name LIKE '%E' 
AND NOT last_name LIKE 'E%';

-- 7. Find all employees employees whose last name starts AND ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. (899 observations)

SELECT *
FROM employees 
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E';

-- We can also write our query like this... (899 observations; it matches.)

SELECT *
FROM employees
WHERE last_name LIKE 'E%E';

-- How many employees' last names end with E, regardless of whether they start with E? (24_292 observations)

SELECT *
FROM employees 
WHERE last_name LIKE '%E';

-- 8. Find all employees hired in the 90s. Enter a comment with the number of employees returned. (135_214 obesrvations)

SELECT * 
FROM employees
WHERE hire_date LIKE '199%';

-- We can also use WHERE BETWEEN AND. (135_214 observations; it matches.)

SELECT * 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- 9. Find all employees born on Christmas. Enter a comment with the number of employees returned. (842 observations)

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';

-- 10. Find all employees hired in the 90s AND born on Christmas. Enter a comment with the number of employees returned. (362 observations)

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';

-- 11. Find all employees with a 'q' in their last name. Enter a comment with the number of records returned. (1873 observations)

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- 12. Find all employees with a 'q' in their last name but NOT 'qu'. How many employees are found? (547 observations)

SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
AND NOT last_name LIKE '%qu%';