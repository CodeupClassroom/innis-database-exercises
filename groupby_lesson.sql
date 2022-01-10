-- USE chipotle database
USE chipotle;
-- check out fields
SELECT * FROM orders LIMIT 2;

-- We can use DISTINCT to find UNIQUE values in our fields
SELECT DISTINCT order_id FROM orders;

-- Another way we can look at this is with a GROUPBY

SELECT order_id FROM orders
GROUP BY order_id;

-- With GROUP BY we can now get statistics on
-- subpopulations that exist in the groupings,
-- allowing us to call functions that we used in the last lesson

SELECT * FROM orders;

-- We can call a function like MAX()
-- in order to get the maximum item price for each orders
-- in order to tell SQL what to do with the extra values
-- We need to SPECIFY HOW TO BREAK DOWN THE EXTRA VALUES

SELECT order_id, MAX(item_price)
FROM orders
GROUP BY order_id;

-- Lets look at order_id and maximum item price where
-- the maximum item price is above $8.00

SELECT order_id, MAX(item_price) AS most_expensive
FROM orders
GROUP BY order_id
HAVING most_expensive LIKE '%8.%';


-- ORDERING:
-- be explicit about ordering as we were before
-- the following will break (likely)
SELECT order_id FROM orders GROUP BY order_id DESC;

-- query the same idea this way to proceed appropriately
SELECT order_id FROM orders GROUP BY order_id ORDER BY order_id DESC;