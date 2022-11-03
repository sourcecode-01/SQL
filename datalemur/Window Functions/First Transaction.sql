SELECT COUNT(DISTINCT user_id) AS users
FROM (
    SELECT 
      user_id, 
      spend, 
      RANK() OVER (
        PARTITION BY user_id 
        ORDER BY transaction_date ASC) AS row_num
    FROM user_transactions) AS purchase_num
WHERE row_num = 1 
  AND spend >= 50;
