-- Case Statements And The IF Function

USE numbers;

SELECT
    n,
    IF(n <= 5, 'small', 'large') AS number_description
FROM numbers;

SELECT
    n,
    IF(n % 2 = 0, 'even', 'odd') AS number_description
FROM numbers;

-- A **case statement**

-- A case statement has two forms: one that is more verbose and more flexible,
-- one that is simpler, but not as flexible.

-- general version: multiple custom conditions

SELECT
    n,
    CASE
        WHEN n < 4 THEN 'small'
        WHEN n < 8 THEN 'medium'
        ELSE 'large'
    END AS number_description
FROM numbers;

-- Each expression after each `when` is evaluated and the first true one is the
-- value that will be returned.
--
-- Simple version: compares with =

SELECT
    n,
    CASE n
        WHEN 4 THEN 'four'
        WHEN 5 THEN 'five'
        ELSE n
    END AS number_description
FROM numbers;

SELECT
    n,
    CASE n
        WHEN 4 THEN 'four'
        WHEN 5 THEN 'five'
        WHEN 6 THEN n * 100
        ELSE CONCAT('the number is ', n)
    END AS number_description
FROM numbers;

-- Another example

SELECT
    name,
    IF(
        quantity > 0,
        CONCAT('We Have ', quantity, ' ', name, 's'),
        'OUT OF STOCK'
    ) as message
FROM fruits;

-- Cross tabulation

USE employees;

SELECT
    d.dept_name,
    SUM(IF(e.gender = 'F', 1, 0)) AS 'gender = F',
    SUM(IF(e.gender = 'M', 1, 0)) AS 'gender = M'
FROM employees e
JOIN dept_manager dm USING (emp_no)
JOIN departments d USING (dept_no)
GROUP BY d.dept_name;
