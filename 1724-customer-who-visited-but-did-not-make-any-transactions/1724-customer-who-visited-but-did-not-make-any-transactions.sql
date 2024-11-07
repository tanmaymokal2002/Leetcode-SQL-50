# Approach 1: using JOINS
/*
SELECT 
    v.customer_id,
    COUNT(1) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON t.visit_id = v.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id
*/

#Approach 2: Using Subquery
SELECT 
    customer_id,
    COUNT(1) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id



