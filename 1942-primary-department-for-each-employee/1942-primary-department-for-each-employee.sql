#Approach 1: using Union
/*
SELECT
    employee_id
    , department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT
    employee_id
    , department_id
FROM Employee
GROUP BY employee_id
HAVINg COUNT(employee_id) = 1
*/

#Approach 2: using window functions
WITH cte AS
(SELECT 
    *
    , COUNT(employee_id) OVER(PARTITION BY employee_id) AS Employee_Count
FROM Employee)

SELECT
    employee_id
    , department_id
FROM cte
WHERE Employee_Count = 1 OR primary_flag = 'Y'

