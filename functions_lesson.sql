-- CONCAT (string concatenation)

-- breakage:
SELECT 'Hello' + ' world';

-- correct:
SELECT 4 + 5;
SELECT CONCAT('Hello', ' world', '!');

-- SUBSTRINGS:

-- first arg: subject
-- second arg: starting character
-- third: # of characters

-- REMEMBER: indexing in SQL starts at 1, not zero

SELECT SUBSTR('Hello world!', 3, 4);

-- UPPER / LOWER
SELECT LOWER('Hello WozRlDD');
SELECT UPPER('Hello WozRlDD');

-- CONCAT on a table
USE albums_db;
SELECT CONCAT(name, ' by ', artist) FROM albums;

-- stacked functions:
USE albums_db;

SELECT 
UPPER(CONCAT(name, ' by ', artist)) FROM albums
WHERE genre LIKE '%rock%';


-- TIME FUNCTIONS:

-- NOW:
SELECT NOW();

-- CURRENT DATE, CURRENT TIME
SELECT CURDATE();
SELECT CURTIME();
SELECT UNIX_TIMESTAMP();

SELECT * FROM albums;

-- Looking at maximum sales values:
SELECT sales FROM albums
ORDER BY sales DESC
LIMIT 1;
-- OR:
SELECT artist,
MAX(sales) 
FROM albums
GROUP BY artist;

DESCRIBE albums;

-- CASTING to a different data type:
SELECT CAST(123 AS CHAR) AS charnum;