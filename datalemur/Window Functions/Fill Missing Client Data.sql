SELECT product_id,
first_value(category) OVER(PARTITION BY cnt ORDER BY product_id)
AS category,name FROM
(select *,sum(case when category is null then 0 else 1 end) 
over(ORDER BY product_id) as cnt
from products) a;
