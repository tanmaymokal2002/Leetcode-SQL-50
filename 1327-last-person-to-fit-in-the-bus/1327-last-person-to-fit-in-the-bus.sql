#Approach 1: using self join
WITH cte AS
(SELECT 
	q1.turn
FROM Queue q1 
JOIN Queue q2 ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1)

SELECT person_name
FROM Queue
WHERE turn = (SELECT turn FROM cte)