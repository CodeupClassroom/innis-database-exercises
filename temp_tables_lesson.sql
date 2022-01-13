-- Temporary tables

-- CREATE
-- what is in the table

CREATE TEMPORARY TABLE temptable1(
col1 INT UNSIGNED NOT NULL);

-- Use the database associated with my username
USE ada_674;

CREATE TEMPORARY TABLE temptable1(
col1 INT UNSIGNED NOT NULL);

-- check out what we have so far

SELECT Database();
SHOW TABLES;
SELECT * FROM temptable1;

-- Let's add some data

-- INSERT
DESCRIBE temptable1;

INSERT INTO temptable1(col1) VALUES (1), (2), (3), (4);

SELECT * FROM temptable1;

-- Using data from abother database
SELECT * FROM mall_customers.customers LIMIT 5;
SELECT DATABASE();

-- Create a temporary table from another database's info
CREATE TEMPORARY TABLE fakecustomers AS (
	SELECT * FROM mall_customers.customers LIMIT 5
);

-- ALTERS, UPDATES, DROPS

-- ALTER: add a new field or remove a field
-- ALTER: use in conjunction with add/drop

-- Let's drop a table
SELECT * FROM temptable1;
DROP table temptable1;

SELECT * FROM fakecustomers;

-- remove annual income
ALTER TABLE fakecustomers DROP COLUMN annual_income;

ALTER TABLE fakecustomers ADD genderage VARCHAR(40);

-- Updating:

UPDATE fakecustomers SET genderage = CONCAT('gdr: ', gender, 'age: ', age);

SELECT * FROM fakecustomers;

-- remove rows conditionally

DELETE FROM fakecustomers WHERE customer_id % 2 = 0;

UPDATE fakecustomers SET gender = CASE WHEN gender = 'Female' THEN 'gorl' ELSE 'not giorl' END;
