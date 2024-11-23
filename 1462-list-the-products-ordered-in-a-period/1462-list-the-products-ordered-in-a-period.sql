
# Approach 1:
SELECT 
	p.product_name
    , SUM(o.unit) AS unit
FROM Products AS p
INNER JOIN Orders AS o ON p.product_id = o.product_id
WHERE EXTRACT(YEAR FROM order_date) = 2020 
AND  EXTRACT(MONTH FROM order_date) = 2
GROUP BY p.product_name, p.product_category
HAVING SUM(o.unit) >= 100



