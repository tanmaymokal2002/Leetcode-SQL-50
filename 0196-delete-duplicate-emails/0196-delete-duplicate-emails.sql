#Approach 1: using window functions
WITH cte AS
(SELECT 
    id
    , email
    , ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rnk
FROM Person)

DELETE 
FROM Person
WHERE id IN (SELECT id FROM cte WHERE rnk > 1)
