SELECT category,product,total_spend
FROM
(SELECT category,product,total_spend,
row_number() OVER(PARTITION BY category ORDER BY total_spend DESC) 
AS rw FROM
(SELECT category,product,SUM(spend) AS total_spend FROM product_spend 
where extract(year from transaction_date)='2022' GROUP BY category,
product) a) b WHERE b.rw<3;
