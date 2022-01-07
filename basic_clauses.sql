-- Let's use chipotle
USE chipotle;
-- What's in there?
SHOW TABLES;
DESCRIBE orders;

-- Let's talk about WHERE
USE albums_db;

-- We can use WHERE to find exact matches, BUT:
SELECT * FROM albums WHERE genre = 'Rock';

-- LIKE will allow us flexibility

SELECT * FROM albums WHERE genre LIKE '%Rock%';
 
 -- We can use the % wildcard to pad out characters that we want to ignore
 
 SELECT 
 name AS album_name, 
 artist AS band
 FROM albums 
WHERE release_date 
 BETWEEN 1990 AND 1999;
 
 
 -- Chaining boolean statements with WHERE
USE chipotle;
SELECT * FROM orders;

-- OR
SELECT * FROM orders 
WHERE choice_description LIKE '%Beans%'
OR order_id = 5;
-- AND
SELECT * FROM orders 
WHERE choice_description LIKE '%Beans%'
AND order_id = 5;

SELECT * FROM orders;

-- NULL is filtered by IS rather than =, <, >
SELECT * FROM orders WHERE choice_description IS NULL;


USE join_example_db;
SELECT * FROM users WHERE role_id IS NULL;

USE world;
SELECT * FROM city;

USE albums_db;


SELECT * FROM albums 
WHERE genre IN ('Rock', 'Hard Rock');

SELECT * FROM albums
WHERE genre LIKE '%Rock%' 
OR (genre LIKE '%Pop%'
AND genre LIKE '%Soul%');

-- ORDER BY

SELECT name FROM albums 
ORDER BY name DESC;

-- Descending order and chaining orders
SELECT * FROM albums 
ORDER BY artist DESC, name;

-- LIMIT and OFFSET
SELECT artist AS band, genre AS style FROM albums LIMIT 20;


-- LIMIT and OFFSET
SELECT artist AS band, genre AS style FROM albums LIMIT 20 OFFSET 10;