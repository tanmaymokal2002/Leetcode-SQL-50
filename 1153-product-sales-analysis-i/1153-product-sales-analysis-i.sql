# Approach 1: using JOINS
/*
SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales AS s
JOIN Product AS p ON s.product_id = p.product_id
*/

# Approach 2 : Using Subquery and implicit join
/*
SELECT 
    sub.product_name,
    s.year,
    s.price
FROM Sales s,
     (SELECT p.product_id, p.product_name FROM Product p) sub
WHERE sub.product_id = s.product_id
*/

# Approach 3 : Using Implicit Join(Not preferred)

SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales AS s, Product AS p 
WHERE s.product_id = p.product_id
