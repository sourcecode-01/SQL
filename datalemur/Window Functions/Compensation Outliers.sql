SELECT employee_id,salary,status
FROM
(SELECT employee_id,salary,avg_sal,
CASE WHEN salary > (avg_sal*2) then 'Overpaid'
WHEN salary < avg_sal/2 then 'Underpaid'
ELSE 'equalpaid' END AS status
FROM
(SELECT employee_id,salary,title,AVG(salary) OVER(partition by title ) 
AS avg_sal FROM employee_pay) a) b WHERE b.status IN 
('Underpaid','Overpaid');
