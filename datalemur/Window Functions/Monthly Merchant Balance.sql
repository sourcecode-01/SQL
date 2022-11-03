SELECT transaction_date,bal,SUM(bal) OVER(ORDER BY EXTRACT(month 
from transaction_date))
 AS balance FROM
(SELECT transaction_date,SUM(CASE WHEN type='deposit' THEN
amount ELSE -amount END) as bal FROM transactions 
GROUP BY transaction_date) a;
