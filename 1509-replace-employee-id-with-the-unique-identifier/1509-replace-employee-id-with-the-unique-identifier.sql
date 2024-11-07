# Write your MySQL query statement below

-- Approach 1: using LEFT JOIN
/*
SELECT 
    EU.unique_id,
    E.name
FROM Employees AS E
LEFT JOIN EmployeeUNI AS EU ON E.id = EU.id
*/

-- Approach 2: using RIGHT JOIN
/*
SELECT 
    EU.unique_id,
    E.name
FROM EmployeeUNI AS EU
RIGHT JOIN Employees AS E ON E.id = EU.id
*/

-- Approach 3: using Subquery
SELECT
    (SELECT unique_id FROM EmployeeUNI WHERE id=E.id) AS unique_id,
    name
FROM Employees AS E