SELECT measurement_day,
SUM(CASE WHEN rw % 2!=0 THEN measurement_value ELSE 0 END) AS odd_sum,
SUM(CASE WHEN rw % 2=0 THEN measurement_value ELSE 0 END) AS even_sum
FROM
(SELECT measurement_value,CAST(measurement_time as date) AS 
measurement_day,row_number() OVER(PARTITION BY CAST(measurement_time 
as date) ORDER BY measurement_time) AS rw FROM measurements) a 
GROUP BY a.measurement_day;
