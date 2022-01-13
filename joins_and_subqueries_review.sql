-- Subquery vs JOIN
---- If the output you desire comes from multiple tables, you need a JOIN
---- If the output you desire comes from one table, but is filtered by information
---- in another, you can use a subquery.
-- USING vs ON
---- whenever you have ON table_a.col = table_b.col you can use USING(col)
---- Ex
SELECT *
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date > CURDATE();
---- Prefer conditional logic in a WHERE

SELECT * FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no;
---- Same as
SELECT * FROM employees e JOIN dept_emp de USING (emp_no);

-- IN vs =
---- Use = with a scaler subquery, with a column subquery use IN
---- scaler subquery: a subquery that returns a single value (usually numeric)
---- scaler: a single value, as opposed to a list or vector or column of values

-- Relationship Types
---- One to One
------ user -> artist profile
------ user -> user profile
------ user table has email, password
------ artist profile has band name, genre
------ user profile has location, favorite artists
---- One to Many
------ the one is the "parent" or "owner"; e.g. a phone has a manufacturer
------ the "child" table or the many side of the relationship has fk to the parent
---- Many to Many
------ requires a join, associative (link) table to implement
------ e.g. employees <-> departments; dept_emp is the join table
