#Approach 1: my solution
WITH cte AS
(SELECT d.name As Department
	, e.name AS Employee
    , e.salary AS Salary
    , DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.Salary DESC) AS rn
FROM Employee e
JOIN Department d ON e.departmentId = d.id
ORDER BY Department, Salary DESC, Employee)

SELECT Department
	, Employee
    , Salary
FROM cte
WHERE rn < 4