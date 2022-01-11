-- Pick which database we elect to use
USE join_example_db;
-- Check out the tables
SHOW TABLES;

-- Check out both tables
DESCRIBE roles;
SELECT * FROM roles;

DESCRIBE users;
SELECT * FROM users;


-- users:
-- primary key: id
-- relationship with roles: role_id
-- fields: id, name*, email, role_id

-- roles:
-- primary key: id
-- relationship with users: id
-- fields: id, name*

-- roles.name <> users.name (!=)

-- Let's relate the tables
-- Let's form a relationship <3 uwu

-- INNER JOIN
-- grab everything
SELECT * 
-- from users as left table
FROM users
-- join it to roles
JOIN roles
-- how we want to build that ~~connection~~ (so romantic)
ON users.role_id = roles.id;

-- LEFT JOIN
-- grab everything
SELECT * 
-- from users as left table
FROM users
-- join it to roles
LEFT JOIN roles
-- how we want to build that ~~connection~~ (so romantic)
ON users.role_id = roles.id;


-- RIGHT JOIN
-- grab everything
SELECT * 
-- from users as left table
FROM users
-- join it to roles
RIGHT JOIN roles
-- how we want to build that ~~connection~~ (so romantic)
ON users.role_id = roles.id;


-- RIGHT JOIN
-- ORDER MATTERS!!!
-- grab everything
SELECT * 
-- from users as left table
FROM roles
-- join it to roles
RIGHT JOIN users
-- how we want to build that ~~connection~~ (so romantic)
ON users.role_id = roles.id;


-- INNER JOIN
-- selecting specific fields
SELECT users.email, roles.name 
-- from users as left table
FROM users
-- join it to roles
JOIN roles
-- how we want to build that ~~connection~~ (so romantic)
ON users.role_id = roles.id;

-- INNER JOIN

SELECT hamsandwich.email, big_party.name 
-- from users as left table
FROM users hamsandwich
-- join it to roles
JOIN roles big_party
-- how we want to build that ~~connection~~ (so romantic)
ON hamsandwich.role_id = big_party.id;

-- Lets make a linked join (associative)
USE world;
SELECT * FROM city;

-- primary key: id,
-- possible association: CountryCode

SELECT * FROM country LIMIT 2;
DESCRIBE country;
-- primary key: Code 
-- association: Code -> city.CountryCode

SELECT * FROM countrylanguage LIMIT 2;
DESCRIBE countrylanguage;
-- association: CountryCode


-- Joining more than two tables:
SELECT * 
FROM city
JOIN country
ON city.CountryCode = country.Code
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode;


-- USING
SELECT * 
FROM city
JOIN countrylanguage
ON city.CountryCode = countrylanguage.CountryCode;

SELECT * 
FROM city
JOIN countrylanguage
USING(CountryCode);