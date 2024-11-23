# Approach 1:
SELECT
	(SELECT
		DISTINCT salary 
	FROM EMPLOYEE
	ORDER BY salary DESC
	LIMIT 1 OFFSET 1) AS SecondHighestSalary
