#Approach 1: using left join 

SELECT 
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empID = b.empID
WHERE b.bonus < 1000 OR b.bonus IS NULL
