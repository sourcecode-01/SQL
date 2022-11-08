SELECT DISTINCT t1.user_id FROM
transactions t1 JOIN transactions t2 ON
date(t2.transaction_date)=date(t1.transaction_date)+1
JOIN transactions t3 ON
date(t3.transaction_date)=date(t2.transaction_date)+1
ORDER BY t1.user_id


SELECT user_id FROM
(SELECT user_id,transaction_date,
lag(transaction_date) OVER(PARTITION BY user_id
ORDER BY transaction_date) as prev_day,
lead(transaction_date) OVER(PARTITION BY user_id
ORDER BY transaction_date) as next_day FROM transactions) tmp
WHERE prev_day = transaction_date - interval '1' day OR
next_day = transaction_date + interval '1' day
GROUP BY 1 HAVING COUNT(*)=3;
