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

SELECT customer_id
, MAX(amount) max_amt
, MIN(amount) min_amt
, AVG(amount) avg_amt
, SUM(amount) tot_amt
, COUNT(*) num_payments
FROM payment
GROUP BY customer_id;