#Approach 1:
SELECT
    customer_id
FROM CUSTOMER
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = 
    (SELECT COUNT(product_key) FROM Product)