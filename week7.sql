-- SELECT customer_id FROM rental;

/* SELECT customer_id
FROM rental
GROUP BY customer_id; */

/* SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id; */

/* SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
ORDER BY 2 DESC; */

/* SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
WHERE count(*) >= 40; */

/* SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
HAVING count(*) >= 40; */

/* SELECT MAX(amount) max_amt
, MIN(amount) min_amt
, AVG(amount) avg_amt
, SUM(amount) tot_amt
, COUNT(*) num_payments
FROM payment; */

/* SELECT customer_id
, MAX(amount) max_amt
, MIN(amount) min_amt
, AVG(amount) avg_amt
, SUM(amount) tot_amt
, COUNT(*) num_payments
FROM payment
GROUP BY customer_id; */

/* SELECT COUNT(customer_id) num_rows,
COUNT(DISTINCT customer_id) num_customers
FROM payment; */

/* SELECT MAX(datediff(return_date,rental_date))
FROM rental; */

-- Exercise 1
/* SELECT COUNT(*)
FROM payment; */

-- Exercise 2
/* SELECT customer_id, COUNT(*) customer_id, SUM(amount)
FROM payment
GROUP BY customer_id; */

-- Exercise 3
/* SELECT customer_id, COUNT(*) customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40; */

-- Exercise 4
/* SELECT f.title, f.rating, count(*)
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
WHERE f.rating IN ('G','PG','PG-13')
GROUP BY f.rating, f.title
HAVING (COUNT(*) >=9 AND COUNT(*) <= 12)
ORDER BY f.title ASC; */

-- Exercise 5
/* SELECT f.title, f.rating, count(*)
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE f.title LIKE 'C%'
GROUP BY f.title, f.rating
HAVING (count(*) > 2)
ORDER BY f.title ASC; */