SELECT order_date , product_type,
SUM(quantity) over(PARTITION BY product_type ORDER BY order_date) as cum_purchased
FROM total_trans
order by order_date;
