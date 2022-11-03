SELECT COUNT(merchant_id) FROM
(SELECT merchant_id,
date_part('minute',transaction_timestamp-
LAG(transaction_timestamp) OVER(PARTITION BY merchant_id, 
credit_card_id, amount ORDER BY transaction_timestamp)) AS 
minute_difference FROM transactions) a WHERE
minute_difference <=10;
