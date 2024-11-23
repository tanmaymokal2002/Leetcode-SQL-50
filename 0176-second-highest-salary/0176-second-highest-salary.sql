# Approach 1:
SELECT
	(SELECT
		DISTINCT salary 
	FROM EMPLOYEE
	ORDER BY salary DESC
	LIMIT 1, 1) AS SecondHighestSalary
