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



