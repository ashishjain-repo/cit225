use sakila;
system cls;

/* SELECT customer_id
, first_name
, last_name
FROM customer
WHERE customer_id = (
    SELECT MAX(customer_id) FROM customer
); */
-- SELECT MAX(customer_id) FROM customer;

/* SELECT city_id
, city
FROM city
-- WHERE country_id <>
WHERE country_id =
(SELECT country_id FROM country WHERE country = 'India'); */

/* SELECT country_id
FROM country
WHERE country IN('Canada','Mexico'); */

/* SELECT city_id
, city
FROM city
WHERE country_id IN
(
    SELECT country_id
    FROM country
    WHERE country IN('Canada','Mexico')
); */

/* SELECT city_id
, city
FROM city
WHERE country_id NOT IN
(
    SELECT country_id
    FROM country
    WHERE country IN('Canada','Mexico')
); */

/* SELECT first_name
, last_name
FROM customer
WHERE customer_id <> ALL
(
    SELECT customer_id
    FROM payment
    WHERE amount = 0
); */

/* SELECT first_name
, last_name
FROM customer
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM payment
    WHERE amount = 0
); */

/* SELECT customer_id
, count(*)
FROM rental
GROUP BY customer_id
HAVING count(*) > ALL
(
    SELECT count(*)
    FROM rental r
    INNER JOIN customer c
    ON r.customer_id = c.customer_id
    INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    INNER JOIN country co
    ON ct.country_id = co.country_id
    WHERE co.country IN('United States','Mexico','Canada')
    GROUP BY r.customer_id
); */

/* SELECT c.first_name
FROM rental r
INNER JOIN customer c
ON r.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
INNER JOIN country co
ON ct.country_id = co.country_id
WHERE co.country IN ('United States','Mexico','Canada')
GROUP BY r.customer_id */


/* SELECT customer_id
, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > ANY
(
    SELECT sum(p.amount)
    FROM payment p
    INNER JOIN customer c
    ON p.customer_id = c.customer_id
    INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    INNER JOIN country co
    ON ct.country_id = co.country_id
    WHERE co.country IN('Bolivia','Paraguay','Chile')
    GROUP BY co.country
); */

/* SELECT customer_id
, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > ANY
(
    SELECT sum(p.amount)
    FROM payment p
    INNER JOIN customer c
    ON p.customer_id = c.customer_id
    INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    INNER JOIN country co
    ON ct.country_id = co.country_id
    WHERE co.country IN('Bolivia','Paraguay','Chile')
    GROUP BY co.country
); */

/* SELECT fa.actor_id
, fa.film_id
FROM film_actor fa
WHERE fa.actor_id IN
(
    SELECT actor_id 
    FROM actor 
    WHERE last_name = 'MONROE'
)
AND fa.film_id IN
(
    SELECT film_id
    FROM film
    WHERE rating = 'PG'
); */

/* SELECT actor_id
, film_id
FROM film_actor
WHERE (actor_id, film_id) IN
(
    SELECT a.actor_id
    , f.film_id
    FROM actor a
    CROSS JOIN film f
    WHERE a.last_name = 'MONROE' AND f.rating = 'PG'
); */

/* SELECT c.first_name
, c.last_name
FROM customer c
WHERE 20 = (
    SELECT count(*)
    FROM rental r
    WHERE r.customer_id = c.customer_id
); */

/* SELECT c.first_name, c.last_name
FROM customer c
WHERE
(SELECT sum(p.amount) FROM payment p
WHERE p.customer_id = c.customer_id)
BETWEEN 180 AND 240; */

/* SELECT c.first_name
, c.last_name
FROM customer c
WHERE EXISTS
(
    SELECT 1
    FROM rental r
    WHERE r.customer_id = c.customer_id AND  date(r.rental_date) < '2005-05-25'
); */

-- Exercise 1
/* SELECT f.title
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name =
(
    SELECT name
    FROM category
    WHERE name = 'Action'
); */

-- Exercise 2
/* SELECT f.title
FROM film f
WHERE EXISTS
(
    SELECT c.name
    FROM category c
    INNER JOIN film_category fc
    ON c.category_id = fc.category_id
    WHERE (c.name = 'Action') AND (fc.film_id = f.film_id)
); */

-- Exercise 3
/* SELECT act.actor_id, grp.level
FROM
(
    SELECT actor_id, COUNT(*) as roles_played
    FROM film_actor
    GROUP BY actor_id
)act
INNER JOIN
(
    SELECT 'Hollywood Star' as 'level', 30 as min_roles, 99999 as max_roles
    UNION ALL
    SELECT 'Prolific Actor' AS 'level', 20 as min_roles, 29 as max_roles
    UNION ALL
    SELECT 'Newcomer' AS 'level', 1 as min_roles, 19 as max_roles
)grp
ON act.roles_played BETWEEN (grp.min_roles) AND (grp.max_roles); */

-- Exercise 4
/* SELECT actor_id, film_id
FROM film_actor
WHERE (actor_id, film_id) IN
(
    SELECT a.actor_id, f.film_id
    FROM actor a
    CROSS JOIN film f
    WHERE a.last_name = 'MONROE' AND f.rating = 'PG'
); */

-- Exercise 5
/* SELECT fa.actor_id
, fa.film_id
FROM film_actor fa
WHERE EXISTS
(
    SELECT null
    FROM actor a
    WHERE a.last_name = 'MONROE'
    AND a.actor_id = fa.actor_id
)
AND EXISTS
(
    SELECT null
    FROM film f
    WHERE f.rating = 'PG'
    AND f.film_id = fa.film_id
); */
/* SELECT city_id
, city
FROM city ct
INNER JOIN country c
ON ct.country_id = c.country_id
WHERE c.country IN('Canada','Mexico'); */

/* SELECT first_name
,      last_name
FROM   customer
WHERE  customer_id IN
 (SELECT customer_id
  FROM   payment
  WHERE  amount = 0); */

  /* SELECT actor_id
 ,      film_id
 FROM   film_actor
 WHERE  (actor_id, film_id) IN
(SELECT a.actor_id
 ,      f.film_id
 FROM   actor a INNER JOIN film_actor fa
 ON     a.actor_id = fa.actor_id INNER JOIN film f
 ON     fa.film_id = f.film_id
 WHERE  a.last_name = 'MONROE'
 AND    f.rating = 'PG'); */

 /* SELECT city_id
 ,      city
 FROM   city
 WHERE  country_id IN
  (SELECT country_id
   FROM   country
   WHERE  country = ('Canada','Mexico')); */

   /* SELECT first_name
 ,      last_name
 FROM   customer
 WHERE  customer_id <> ALL
  (SELECT customer_id
   FROM   payment
   WHERE  amount = 0); */

   /* SELECT actor_id
 ,      film_id
 FROM   film_actor
 WHERE  (actor_id, film_id) IN
  (SELECT a.actor_id
   ,      f.film_id
   FROM   actor a CROSS JOIN film f
   WHERE  a.last_name = 'MONROE'
   AND    f.rating = 'PG'); */

/* SELECT actor_id
,      film_id
FROM   film_actor
WHERE  (actor_id, film_id) IN
 (SELECT a.actor_id
  ,      f.film_id
  FROM   actor a INNER JOIN film_actor fa
  ON     a.actor_id = fa.actor_id INNER JOIN film f
  ON     fa.film_id = f.film_id
  WHERE  a.last_name = 'MONROE'
  AND    f.rating = 'PG'); */

/* SELECT actor_id
 ,      film_id
 FROM   film_actor
 WHERE  (actor_id, film_id) IN
  (SELECT a.actor_id
   ,      f.film_id
   FROM   actor a INNER JOIN film_actor fa
   ON     a.actor_id = fa.actor_id INNER JOIN film f
   ON     fa.film_id = f.film_id
   WHERE  a.last_name = 'MONROE'
   AND    f.rating = 'PG'); */
   /* SELECT first_name
 ,      last_name
 FROM   customer
 WHERE  customer_id IN
  (SELECT customer_id
   FROM   payment
   WHERE  amount = 0); */

SELECT first_name
 ,      last_name
 FROM   customer
 WHERE  customer_id NOT IN
  (SELECT customer_id
   FROM   payment
   WHERE  amount = 0);
