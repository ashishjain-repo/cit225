

-- Outer Joins

/* SELECT f.film_id, f.title, COUNT(*) num_copies
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title; */

/* SELECT f.film_id
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id
WHERE i.film_id IS NULL; */

/* SELECT f.film_id, f.title, COUNT(i.inventory_id) num_copies
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title; */

/* SELECT f.film_id, f.title, i.inventory_id
FROM inventory i
RIGHT OUTER JOIN film f
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15; */

-- Three-Way Outer Joins

/* SELECT f.film_id, f.title, i.inventory_id, r.rental_date
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
LEFT OUTER JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE f.film_id BETWEEN 13 AND 15; */

-- Cross Joins

/* SELECT c.name category_name, l.name language_name
FROM category c
CROSS JOIN language l; */

/* SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
UNION ALL
SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
UNION ALL
SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit; */

/* SELECT cust.first_name, cust.last_name, date(r.rental_date)
FROM 
(
    SELECT customer_id, first_name, last_name
    FROM customer
) cust
NATURAL JOIN rental r; */

-- Exercise 1-2

/* SELECT c.name, sum(p.amount)
FROM customer c 
LEFT OUTER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.name; */

/* SELECT c.name, sum(p.amount)
FROM payment p
RIGHT OUTER JOIN customer c
ON c.customer_id = p.customer_id
GROUP BY c.name; */



/* SELECT f.film_id left_id
,      i.film_id right_id
,      f.title
FROM   film f LEFT OUTER JOIN inventory i
ON     f.film_id = i.film_id
WHERE  i.film_id IS NULL
ORDER BY 1; */

 /* SELECT  *
FROM   (SELECT 'Yes'   AS reply
UNION ALL
SELECT 'No'    AS reply) decided CROSS JOIN
(SELECT 'Maybe' AS reply) undecided; */

/* SELECT f.film_id left_id
,i.film_id right_id
,f.title
FROM   film f RIGHT OUTER JOIN inventory i
ON     f.film_id = i.film_id
WHERE  i.film_id IS NULL
ORDER BY 1; */

/* SELECT DISTINCT f.film_id left_id
, i.film_id right_id
, f.title
FROM film f NATURAL JOIN inventory i
ON f.film_id = i.film_id
ORDER BY 1; */
/* SELECT f.film_id left_id
,      i.film_id right_id
,      f.title
FROM   film f RIGHT OUTER JOIN inventory i
ON     f.film_id = i.film_id
WHERE  i.film_id IS NULL
ORDER BY 1; */


-- Exercise 1
/* SELECT CONCAT(c.first_name, ' ', c.last_name) AS name,
SUM(p.amount)
FROM customer c
LEFT JOIN payment p 
ON c.customer_id = p.customer_id
WHERE CONCAT(c.first_name, ' ', c.last_name) IN ('MARY SMITH', 'BARBARA JONES', 'ELLA OLIVER')
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY name; */

-- Execise 2
/* SELECT CONCAT(c.first_name, ' ', c.last_name) AS name,
SUM(p.amount)
FROM customer c
RIGHT JOIN payment p 
ON c.customer_id = p.customer_id
WHERE CONCAT(c.first_name, ' ', c.last_name) IN ('MARY SMITH', 'BARBARA JONES', 'ELLA OLIVER')
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY name; */

-- Exercise 3

/* SELECT ones.num + tens.num + 1 as counter
FROM 
(
    SELECT 0 num UNION ALL
    SELECT 1 num UNION ALL
    SELECT 2 num UNION ALL
    SELECT 3 num UNION ALL
    SELECT 4 num UNION ALL
    SELECT 5 num UNION ALL
    SELECT 6 num UNION ALL
    SELECT 7 num UNION ALL
    SELECT 8 num UNION ALL
    SELECT 9 num
) ones
CROSS JOIN
(
    SELECT 0 num UNION ALL
    SELECT 10 num UNION ALL
    SELECT 20 num UNION ALL
    SELECT 30 num UNION ALL
    SELECT 40 num UNION ALL
    SELECT 50 num UNION ALL
    SELECT 60 num UNION ALL
    SELECT 70 num UNION ALL
    SELECT 80 num UNION ALL
    SELECT 90 num
) tens
ORDER BY counter; */



-- Exercise 4:

/* SELECT f.film_id
, f.title
, i.inventory_id
FROM inventory i 
RIGHT JOIN film f
ON i.film_id = f.film_id
WHERE f.title REGEXP '^RA(I|N).*$'
ORDER BY f.film_id, f.title, i.inventory_id; */

-- Exercise 5:

/* SELECT   f.film_id
, f.title
, i.inventory_id
FROM inventory i
RIGHT JOIN film f
ON i.film_id = f.film_id
WHERE f.title REGEXP '^RA(I|N).*$'
AND i.inventory_id IS NULL
ORDER BY f.film_id, f.title, i.inventory_id; */