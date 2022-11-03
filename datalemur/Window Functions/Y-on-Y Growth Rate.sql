SELECT year,product_id,curr_year_spend,prev_year_spend,
ROUND(100 * (curr_year_spend - prev_year_spend)/ prev_year_spend, 2) 
AS yoy_rate FROM
(SELECT EXTRACT(year FROM transaction_date) AS year,product_id,
spend as curr_year_spend,
lag(spend,1) OVER(PARTITION BY product_id ORDER BY product_id,
EXTRACT(year FROM transaction_date)) AS prev_year_spend 
FROM user_transactions) a;
