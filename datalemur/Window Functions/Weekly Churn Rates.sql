SELECT
week,
ROUND(SUM(CASE when day_diff>=28 then 0 else 1 end)*100.0/COUNT(*),2) 
churn_rate FROM
(SELECT Dense_RANK() over(ORDER BY DATE_PART('week',signup_date))  
week,user_id,EXTRACT(day from (last_login-signup_date)) day_diff
FROM users WHERE EXTRACT(month from signup_date) = 6 and 
EXTRACT(year from signup_date) = 2022) tmp GROUP BY week;
