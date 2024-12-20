#Logic is same but just some minute diff

#Approach 1:
/*
SELECT e1.name
FROM Employee e1
JOIN (
	SELECT managerId, count(*) AS cnt
	FROM Employee 
	GROUP BY managerId
	HAVING count(*) >= 5
) e2
ON e1.id = e2.managerId
*/

#Approach 2:
/*
SELECT e1.name
FROM Employee e1
JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY e2.managerId, e1.name
HAVING count(1) >= 5;
*/

#Approach 3:
SELECT e.name
FROM Employee e
WHERE e.id IN (
SELECT managerId
FROM Employee 
GROUP BY managerId
HAVING COUNT(*) >= 5
)

