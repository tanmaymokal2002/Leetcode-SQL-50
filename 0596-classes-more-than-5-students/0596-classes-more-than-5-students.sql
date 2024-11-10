# Approach 1:
/*
SELECT 
    class
FROM Courses
GROUP BY class
HAVING COUNT(1) >= 5
*/

#Approach 2:

SELECT 
	DISTINCT class
FROM 
	(SELECT 
		class,
		COUNT(1) OVER(PARTITION BY class) AS frequency
	FROM Courses) x
WHERE frequency >= 5
