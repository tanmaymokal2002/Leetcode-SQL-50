# Approach 1:
SELECT 
    class
FROM Courses
GROUP BY class
HAVING COUNT(1) >= 5