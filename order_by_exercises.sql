-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

USE employees;

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. (709 observations)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- a. In your comments, answer: What was the first and last name in the first row of the results? (10397	1955-11-11	Irena	Reutenauer	M	1993-05-21)

-- b. What was the first and last name of the last person in the table? (497788	1958-11-25	Vidya	Simmen	M	1988-03-25)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC, emp_no DESC;

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name.  (709 observations)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- a. In your comments, answer: What was the first and last name in the first row of the results? (46986	1964-10-15	Irena	Acton	M	1992-07-11)

-- b. What was the first and last name of the last person in the table? (97971	1956-07-14	Vidya	Zweizig	M	1986-12-22)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC, last_name DESC;

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. (709 observations)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- a. In your comments, answer: What was the first and last name in the first row of the results? (46986	1964-10-15	Irena	Acton	M	1992-07-11)

-- b. What was the first and last name of the last person in the table? (479435	1959-07-10	Maya	Zyda	M	1987-08-23)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name DESC;

-- 5. Write a query to find all employees whose last name starts AND ends with 'E'. Sort the results by their employee number. 

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY emp_no;

-- a. Enter a comment with the number of employees returned, the first employee number and their first and last name... (899 observations), (10021	1960-02-20	Ramzi	Erde	M	1988-02-10) 

-- b. and the last employee number with their first and last name. (499648	1960-09-03	Tadahiro	Erde	F	1992-08-13)

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY emp_no DESC;

-- 6. Write a query to to find all employees whose last name starts AND ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. 

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY hire_date DESC;

-- a. Enter a comment with the number of employees returned, the name of the newest employee (899 observations) (67892	1958-08-15	Teiji	Eldridge	M	1999-11-27) 

-- b. and the name of the oldest employee. (899 observations)(67892	1958-08-15	Teiji	Eldridge	M	1999-11-27)

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY hire_date;

-- b. interpreted in another way. (40660	1952-02-02	Piyush	Erbe	F	1988-04-04)

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY birth_date;

-- 7. Find all employees hired in the 90s AND born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. 

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;

-- a. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last (362 observations)(33936	1952-12-25	Khun	Bernini	M	1999-08-31)


-- b. and the name of the youngest emmployee who was hired first. (362 observations)(412745	1964-12-25	Douadi	Pettis	M	1990-05-04)

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date DESC, hire_date;
