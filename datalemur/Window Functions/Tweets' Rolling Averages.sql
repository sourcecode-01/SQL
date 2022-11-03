SELECT user_id,tweet_date,ROUND(AVG(cnt) OVER(PARTITION BY user_id 
ORDER BY tweet_date rows BETWEEN 2 preceding AND current row),2) 
AS rolling_avg_3days
FROM
(SELECT user_id,tweet_date,COUNT(tweet_date) as cnt FROM tweets GROUP BY 
user_id,tweet_date) a;
