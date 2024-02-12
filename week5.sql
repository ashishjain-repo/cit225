system cls;

use sakila;


/* SELECT 'CUST' typ
, c.first_name
, c.last_name
FROM customer c
UNION ALL
SELECT 'ACTR' typ
, a.first_name
, a.last_name
FROM actor a;
 */

/* SELECT 'ACTR' typ
, a.first_name
, a.last_name
FROM actor a
UNION ALL
SELECT 'ACTR' typ
, a.first_name
, a.last_name
FROM actor a; */

/* SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION ALL
SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'; */

/* SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION
SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'; */

/* SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.first_name LIKE 'D%' AND c.last_name LIKE 'T%'
INTERSECT
SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'D%' AND a.last_name LIKE 'T%'; */

/* SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
INTERSECT
SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';
 */

/* SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
EXCEPT
SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%' */

/* SELECT a.first_name fname
, a.last_name lname
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION ALL
SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
ORDER BY lname, fname; */

/* SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION ALL 
SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION
SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'; */

/* SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION
(
    SELECT a.first_name
    , a.last_name
    FROM actor a
    WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
    UNION ALL
    SELECT c.first_name
    , c.last_name
    FROM customer c
    WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
) */

/* SELECT 1 num, 'abc' str
UNION
SELECT 9 num, 'xyz' str;  */

/* SELECT a.first_name as fname
, a.last_name as lname
FROM actor a
WHERE a.last_name LIKE 'L%'
UNION
SELECT a.first_name
, a.last_name
FROM actor a
WHERE a.last_name LIKE 'L%'
ORDER BY lname; */

/* SELECT a.first_name as fname
, a.last_name as lname
FROM actor a
WHERE a.last_name LIKE 'L%'
UNION ALL
SELECT c.first_name
, c.last_name
FROM customer c
WHERE c.last_name LIKE 'L%'
ORDER BY lname; */

/* SELECT c.city_id as 'id'
, c.city as 'name'
FROM city c
WHERE c.city LIKE 'S%o%a'
UNION
SELECT co.country_id
, co.country
FROM country co
WHERE co.country LIKE 'S%o%a'; */

SELECT c.city_id as 'id'
, c.city as name
FROM city c
WHERE c.city LIKE 'S%o%a'
UNION
SELECT co.country_id
, co.country
FROM country co
WHERE co.country LIKE 'S%o%a'
ORDER BY name desc;

/* SELECT a.first_name as first_name
, a.last_name as last_name
, f.title as title
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.first_name LIKE 'M%' AND f.title LIKE 'LOVE%'
UNION
SELECT a.first_name
, a.last_name
, f.title
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.last_name LIKE 'W%' AND f.title LIKE 'LIFE%'
ORDER BY last_name ASC; */

/* SELECT DISTINCT a.last_name as last_name
, f.title as title
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.first_name LIKE 'M%' AND f.title LIKE 'LOVE%'
UNION
SELECT a.last_name
, f.title
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.last_name LIKE 'W%' AND f.title LIKE 'LIFE%'
ORDER BY last_name ASC; */

SELECT first_name
, last_name
FROM customer
WHERE last_name LIKE 'D%'
EXCEPT 
SELECT first_name
, last_name
FROM customer
WHERE last_name LIKE 'DI%';

/* SELECT 1 num, 'one' str
UNION
SELECT 2 num, 'two' str
UNION
SELECT 3 num, 'three' str
UNION
SELECT 2 num, 'two' str; */

/* SELECT 1 num, 'one' str
UNION ALL
SELECT 2 num, 'two' str
UNION ALL
SELECT 3 num, 'three' str
UNION ALL
SELECT 2 num, 'two' str
ORDER BY 1, 2; */

/* SELECT first_name
    ,      last_name
    FROM   customer
    WHERE  last_name LIKE 'D%'
    AND   (first_name,last_name) NOT IN
            (SELECT first_name
             ,      last_name
             FROM   customer
             WHERE  last_name LIKE 'DI%'); */

/* SELECT 1 num, 'one' str
UNION
SELECT 2 num, 'two' str
UNION
SELECT 3 num, 'three' str
UNION
SELECT 2 num, 'two' str; */