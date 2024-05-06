/* CREATE or REPLACE VIEW film_ctgry_actor AS
SELECT f.title
, c.name category_name
, a.first_name
, a.last_name
FROM film f INNER JOIN film_category fc
ON f.film_id = fc.film_id INNER JOIN category c
ON fc.category_id = c.category_id INNER JOIN film_actor fa
ON f.film_id = fa.film_id INNER JOIN actor a
ON fa.actor_id = a.actor_id; */

/* CREATE or REPLACE VIEW country_payments AS
SELECT ctry.country
,   (SELECT SUM(p.amount)
    FROM city c INNER JOIN address a
    ON c.city_id = a.city_id INNER JOIN customer cus
    ON a.address_id = cus.address_id INNER JOIN payment p
    ON cus.customer_id = p.customer_id
    WHERE c.country_id = ctry.country_id) AS tot_payments
FROM country ctry; */

/* CREATE OR REPLACE VIEW film_actor_v AS
SELECT a.actor_id
,   f.title
,   a.first_name
,   a.last_name
,   last_update_actor
,   film_id
,   title
,   description
,   release_year
,   language_id
,   original_language_id
,   rental_duration
,   rental_rate
,   length
,   replacement_cost
,   rating
,   special_features
,   last_update_film
FROM film f INNER JOIN film_actor fa
ON f.film_id = fa.film_id INNER JOIN actor a
ON fa.actor_id = a.actor_id; */

/* CREATE OR REPLACE VIEW film_actor_v AS
SELECT 
    a.actor_id AS actor_id,
    f.title AS film_title,
    a.first_name AS actor_first_name,
    a.last_name AS actor_last_name,
    a.last_update AS last_update_actor,
    f.film_id AS film_id,
    -- f.title AS film_title,
    f.description AS film_description,
    f.release_year AS film_release_year,
    f.language_id AS film_language_id,
    f.original_language_id AS film_original_language_id,
    f.rental_duration AS film_rental_duration,
    f.rental_rate AS film_rental_rate,
    f.length AS film_length,
    f.replacement_cost AS film_replacement_cost,
    f.rating AS film_rating,
    f.special_features AS film_special_features,
    f.last_update AS last_update_film
FROM 
    film f 
INNER JOIN 
    film_actor fa ON f.film_id = fa.film_id 
INNER JOIN 
    actor a ON fa.actor_id = a.actor_id; */

/* SELECT f.title AS film
,   IFNULL(
        CASE
            WHEN NOT f.film_id = fp.film_id
            AND f.prequel_id = fp.film_id THEN fp.title
        END, 'None') AS prequel
FROM film f LEFT JOIN film fp
ON f.prequel_id = fp.film_id
WHERE f.series_name = 'Harry Potter'
ORDER BY f.series_number; */
SELECT 
    f.title AS film,
    IFNULL(
        CASE
            WHEN f.prequel_id IS NOT NULL THEN fp.title
            ELSE 'None'
        END, 'None') AS prequel
FROM 
    film f 
LEFT JOIN 
    film fp ON f.prequel_id = fp.film_id
WHERE 
    f.series_name = 'Harry Potter'
ORDER BY 
    f.series_number;

