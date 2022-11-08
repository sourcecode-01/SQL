SELECT age_bucket,send_perc,open_perc FROM age_breakdown b JOIN 
(SELECT user_id,ROUND((send/(open+send))*100,2) as send_perc,
ROUND((open/(open+send))*100,2) as open_perc 
FROM
(SELECT user_id,
SUM(CASE WHEN activity_type='open' then time_spent ELSE 0 end) as open,
SUM(CASE WHEN activity_type='send' then time_spent ELSE 0 end) as send
FROM activities GROUP BY user_id) tmp) tmp2 ON 
b.user_id=tmp2.user_id ORDER BY age_bucket asc;
