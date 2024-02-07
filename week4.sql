system cls;
USE sakila;

-- 5.1
/*
SELECT c.first_name
, c.last_name
, a.address
, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.district = 'California';
*/

-- 5.2
/*
SELECT f.title
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE a.first_name = "JOHN";
*/

-- 5.3
/*
SELECT DISTINCT(a1.address) 'Address 1'
, a2.address 'Address 2'
, a1.city_id 'City'
FROM address a1
INNER JOIN address a2
ON a1.city_id = a2.city_id 
AND a1.address < a2.address
ORDER BY a1.city_id ASC;
*/

-- From PPT file:-
/*
SELECT c.first_name
, c.last_name
, a.address
FROM customer c
JOIN address a
ON c.address_id = a.address_id
LIMIT 10;
*/

/*
SELECT c.first_name
, c.last_name
, a.address
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id;
*/
/*
SELECT c.first_name
, c.last_name
, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id;
*/

/*
SELECT c.first_name
, c.last_name
, ct.city
FROM customer c
INNER JOIN address a
(SELECT a.address_id
, a.address
, ct.city
FROM address a
INNER JOIN city ct
ON a.city_id = ct.city_id;
WHERE a.district = 'California') addr
ON c.address_id = addr.address_id;
*/

/*
SELECT f.title
FROM film f
INNER JOIN film_actor fa1
ON f.film_id = fa1.film_id
INNER JOIN actor a1
ON fa1.actor_id = a1.actor_id
INNER JOIN film_actor fa2
ON f.film_id = fa2.film_id
INNER JOIN actor a2
ON fa2.actor_id = a2.actor_id
WHERE (a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN')
AND (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH');
*/
/*
SELECT f.title, f_prnt.title prequel
FROM film f
INNER JOIN film f_prnt
ON f_prnt.film_id = f.prequel_film_id
WHERE f.prequel_film_id IS NOT NULL;
*/


/*
SELECT c.first_name
, c.last_name
, a.address
FROM customer c
INNER JOIN address a
-- ON c.address_id = a.address_id;
-- using (address_id);
WHERE c.address_id = a.address_id;
*/
/*
SELECT c.first_name
, c.last_name
, a.address
, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
LIMIT 10;
*/
/*
SELECT c.first_name
, c.last_name
, addr.address
, addr.city
FROM customer c
INNER JOIN (SELECT a.address_id, a.address, ct.city
FROM address a
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.district = 'California'
) addr
ON c.address_id = addr.address_id;
*/
/*
SELECT a.address_id
, a.address
, ct.city
FROM address a
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.district = 'California';
*/
/*
SELECT f.title
FROM film f
INNER JOIN film_actor fa1
ON f.film_id = fa1.film_id
INNER JOIN actor a1
ON fa1.actor_id = a1.actor_id
INNER JOIN film_actor fa2
ON f.film_id = fa2.film_id
Inner JOIN actor a2
ON fa2.actor_id = a2.actor_id
WHERE (a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN')
AND (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH');
*/

-- Exercise 1
/*
SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.district = 'California';
*/

-- Exercise 2
/*
SELECT f.title
, CONCAT(a.first_name, ' ', a.last_name)
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JOHN';
*/

-- Exercise 3
/*
SELECT DISTINCT(a1.address) 'Address 1'
, a2.address 'Address 2'
, a1.city_id 'City'
FROM address a1
INNER JOIN address a2
ON a1.city_id = a2.city_id 
AND a1.address < a2.address
ORDER BY a1.city_id ASC;
*/
-- Quiz 5.4
/*
SELECT a1.address AS 'addr1', a2.address AS 'addr2', ct.city AS 'City'
FROM address a1
INNER JOIN city ct
ON a1.city_id = ct.city_id
INNER JOIN address a2
ON a2.city_id = ct.city_id
WHERE a1.address != a2.address;
*/
-- Quiz 5.5
/*
SELECT DISTINCT s.first_name, s.last_name
FROM staff s
INNER JOIN rental r
ON s.staff_id = r.staff_id
*/

/*
SELECT f.title
, f.length
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE (a.first_name = 'JOE' AND a.last_name = 'SWANK')
AND (f.length >= 90 AND f.length <= 120);
/*
SELECT   f.title AS film
, fp.title AS prequel
FROM film f
LEFT JOIN film fp
ON f.prequel_id = fp.film_id
WHERE f.series_name = 'Harry Potter'
AND fp.series_name = 'Harry Potter'
ORDER BY f.series_number;
*/