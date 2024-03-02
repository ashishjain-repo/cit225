use sakila;
# system cls;

SELECT f.title AS 'Film Name', r.rental_date AS 'Date Rented', CONCAT('Staff: ',st.first_name,' ',st.last_name) AS 'Staff - On Duty'
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN store s
ON i.store_id = s.store_id
INNER JOIN staff st
ON s.store_id = st.store_id
WHERE f.title LIKE 'ACE%';
