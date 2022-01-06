# This is a comment
-- So is this
/* This comment
 * spans multiple lines
 */
 
 USE numbers;
 
 
 SELECT n, category
 FROM numbers2;
 
 SELECT category, supergroup FROM numbers2;
 
 SELECT DISTINCT category from numbers2;
 
SELECT DISTINCT category, supergroup from numbers2;

SELECT * FROM numbers2;

SELECT *
FROM numbers2
WHERE n <= 6;

SELECT *
FROM numbers2
WHERE category = 'a';
 
SELECT *
FROM numbers2
WHERE weather = 'cloudy';

SELECT *
FROM numbers2
WHERE n > 100;
	
SELECT
	n AS the_original_number,
	category,
	n * 2 AS n_times_two
FROM numbers2;

SELECT 'Hi There Innis!' AS message;


