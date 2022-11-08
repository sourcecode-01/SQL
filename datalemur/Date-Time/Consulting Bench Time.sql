SELECT employee_id,
365-sum(end_date-start_date+1) AS bench_days 
FROM consulting_engagements c
LEFT JOIN staffing s 
ON c.job_id=s.job_id
WHERE date_part('year', start_date)=2021 AND is_consultant='true'
GROUP BY employee_id;
