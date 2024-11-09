#Approach 1:
SELECT e1.name
FROM Employee e1
JOIN (
	SELECT managerId, count(*) AS cnt
	FROM Employee 
	GROUP BY managerId
	HAVING count(*) >= 5
) e2
ON e1.id = e2.managerId





