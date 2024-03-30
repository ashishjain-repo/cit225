use sakila;
/* SELECT first_name, last_name,
 CASE
 WHEN active = 1 THEN 'ACTIVE'
 ELSE 'INACTIVE'
 END activity_type
 FROM customer; */
/* SELECT first_name, last_name
 ,   IF(active =1, 'ACTIVE', 'INACTIVE')
 FROM customer;  */
/* SELECT c.first_name, c.last_name,
 CASE
 WHEN active = 0 THEN 0
 ELSE
 (SELECT count(*) FROM rental r
 WHERE r.customer_id = c.customer_id)
 END 'num_rentals'
 FROM customer c; */
/* SELECT monthname(rental_date) rental_month
 ,   COUNT(*) num_rentals
 FROM rental
 WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01'
 GROUP BY monthname(rental_date); */
/* SELECT
    SUM(IF(monthname(rental_date) = 'May',1,0)) AS May_rentals
,   SUM(IF(monthname(rental_date) = 'June',1,0))  AS June_rentals
,   SUM(IF(monthname(rental_date) = 'July',1,0)) AS July_rentals
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01'; */

/* SELECT a.first_name,
    a.last_name,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM film_actor fa
            INNER JOIN film f
            ON fa.film_id = f.film_id
            WHERE fa.actor_id = a.actor_id
            AND f.rating = 'G'
        ) THEN 'Y'
        ELSE 'N'
    END g_actor,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM film_actor fa
                INNER JOIN film f ON fa.film_id = f.film_id
            WHERE fa.actor_id = a.actor_id
                AND f.rating = 'PG'
        ) THEN 'Y'
        ELSE 'N'
    END pg_actor,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM film_actor fa
                INNER JOIN film f ON fa.film_id = f.film_id
            WHERE fa.actor_id = a.actor_id
                AND f.rating = 'NC-17'
        ) THEN 'Y'
        ELSE 'N'
    END nc17_actor
FROM actor a
WHERE a.last_name LIKE 'S%'
    OR a.first_name LIKE 'S%'; */

-- Exercise:-

-- Exercise 10: 1
SELECT name
,   CASE
        WHEN name IN('English','Italian','French','German')
        THEN 'latin1'
        WHEN name IN('Japanese','Mandarin')
        THEN 'utf8'
        ELSE 'unknown'
    END character_set
FROM language;

-- Exercise 10: 2

SELECT 
    SUM(CASE WHEN rating ='G' THEN 1 ELSE 0 END) G
,   SUM(CASE WHEN rating ='PG' THEN 1 ELSE 0 END) PG
,   SUM(CASE WHEN rating ='PG-13' THEN 1 ELSE 0 END) "PG-13"
,   SUM(CASE WHEN rating ='R' THEN 1 ELSE 0 END) R
,   SUM(CASE WHEN rating ='NC-17' THEN 1 ELSE 0 END) "NC-17"
FROM film;

/* SELECT f.title
,CASE (SELECT COUNT(*) FROM inventory i
            WHERE  i.film_id = f.film_id)
            WHEN 0 THEN 'Out of Stock'
            WHEN 1 THEN 'Scarce'
            WHEN 2 THEN 'Scarce'
            WHEN 3 THEN 'Available'
            WHEN 4 THEN 'Available'
            ELSE 'Common'
    END AS availability
    FROM   film f
    WHERE  SUBSTR(f.title,1,2) BETWEEN 'AC' and 'AL'; */

-- Exercise 10: 5
SELECT SUBSTR(last_name,1,1) AS starts_with
,   SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) AS active_count
,   SUM(CASE WHEN active = 0 THEN 1 ELSE 0 END) AS inactive_count
FROM customer
GROUP BY SUBSTR(last_name,1,1)
HAVING SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) > 30
ORDER BY 1;