SELECT 
ROUND(
100.0 * COUNT(CASE WHEN status='completed successfully' THEN NULL 
ELSE trip_id END)/COUNT(trip_id),2)
FROM orders o
JOIN customers c ON c.customer_id=o.customer_id
WHERE EXTRACT(MONTH FROM signup_timestamp)='6' AND
signup_timestamp + interval '14' day >= order_timestamp;
