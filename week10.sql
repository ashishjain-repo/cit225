use sakila;
system cls;

/* SELECT a.actor_id as 'Actor Id',a.last_update as 'Last Added' ,CONCAT(a.first_name, ', ' ,a.last_name) as 'Full Name', COUNT(*) as 'Title'
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
RIGHT JOIN film f
ON fa.film_id = f.film_id
-- GROUP BY a.first_name, a.last_name
GROUP BY a.actor_id
ORDER BY COUNT(*) DESC; */

/* SELECT COUNT(first_name)
FROM actor; */

/* SELECT * FROM actor
ORDER BY first_name; */

/* SELECT a.first_name, f.title
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
RIGHT JOIN film f
ON fa.film_id = f.film_id
WHERE a.actor_id IS NULL; */

SELECT a.first_name, f.title, c.name
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
RIGHT JOIN film f
ON fa.film_id = f.film_id
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
RIGHT JOIN category c
ON fc.category_id = c.category_id
ORDER BY f.title;