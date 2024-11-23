# Approach 1:
/*
SELECT
	(SELECT
		DISTINCT salary 
	FROM EMPLOYEE
	ORDER BY salary DESC
	LIMIT 1, 1) AS SecondHighestSalary
*/

#Approach 2:
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary <> (SELECT MAX(salary) FROM Employee)






