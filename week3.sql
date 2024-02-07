use sakila;

-- The Between Operator
/*
SELECT customer_id
, rental_date
FROM rental
WHERE rental_date
BETWEEN '2005-06-14'
AND '2005-06-16';
*/

/*
SELECT customer_id
, payment_date
, amount
FROM payment
WHERE amount 
BETWEEN 10.0 AND 11.99;
*/

-- String Ranges

/*
SELECT last_name
, first_name
FROM customer
WHERE last_name 
BETWEEN 'FA' AND 'FRB';
*/

-- Membership Conditions
/*
SELECT title
, rating
FROM film
WHERE rating = 'G' OR rating = 'PG';
*/

/*
SELECT title
, rating
FROM film
WHERE rating IN ('G','PG');
*/

-- Using Subqueries

/*
SELECT title
, rating
FROM film
WHERE rating IN (SELECT rating FROM film WHERE title LIKE '%PET%');
*/

-- Using not in

/*
SELECT title
, rating 
FROM film
WHERE rating NOT IN ('PG-13','NC-17','R');
*/

-- Matching Conditions

/*
SELECT last_name
, first_name
FROM customer
WHERE left(last_name, 1) = 'Q';
*/

-- Using Wildcards
/*
SELECT last_name
, first_name
FROM customer
WHERE last_name LIKE '_A_T%S';
*/

/*
SELECT last_name
, first_name
FROM customer
WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%';
*/

-- Using Regular Experssion

/*
SELECT last_name
, first_name
FROM customer
WHERE last_name REGEXP '^[QY]';
*/

-- Null: That four letter word

/*
SELECT rental_id
, customer_id
FROM rental
WHERE return_date IS NULL;
*/

/*
SELECT rental_id
, customer_id
, return_date
FROM rental
WHERE return_date IS NOT NULL;
*/

/*
SELECT rental_id
, customer_id
, return_date
FROM rental
WHERE return_date IS NULL
OR return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';
*/

-- Exercise:-
/*
SELECT payment_id
, customer_id
, amount
, date(payment_date)
FROM payment
WHERE payment_id BETWEEN 101 AND 120;
*/
-- 4.1
/*
SELECT payment_id
, customer_id
, amount
, date(payment_date)
FROM payment
WHERE (payment_id BETWEEN 101 AND 120) AND customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23');
*/
-- 4.2
/*
SELECT payment_id
, customer_id
, amount
, date(payment_date)
FROM payment
WHERE (payment_id BETWEEN 101 AND 120) AND customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19');*/
-- 4.3
/*
SELECT payment_id
, customer_id
, amount
, date(payment_date)
FROM payment
WHERE (amount IN ('1.98','7.98','9.98'));
*/
-- 4.4
/*
SELECT p.payment_id
, p.customer_id
, p.amount
, date(p.payment_date)
, c.first_name
, c.last_name
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
WHERE last_name LIKE '_A%W%' LIMIT 2;

SELECT first_name 
, last_name
FROM customer
WHERE last_name LIKE '_A%W%';
*/
SELECT first_name 
, last_name
FROM customer
WHERE last_name LIKE '_E%';