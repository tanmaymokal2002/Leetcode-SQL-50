
#Approach 1: your solution
# you made wrong choices there is no need of cte and group by in outer query
# learn from your mistakes only right and is not enough have to be optimized as well
/*
WITH cte AS
(SELECT 
	ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE (lat, lon) NOT IN (
	SELECT lat, lon
	FROM Insurance
	GROUP BY lat, lon
	HAVING COUNT(1) > 1
    )
AND tiv_2015 IN (
	SELECT tiv_2015
	FROM Insurance
	GROUP BY tiv_2015
	HAVING COUNT(1) > 1
)
GROUP BY tiv_2015)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM cte
*/

#Approach 2:
SELECT 
	 ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE (lat, lon) IN ( 
	SELECT lat, lon
	FROM Insurance
	GROUP BY lat, lon
	HAVING COUNT(*) = 1
    )
AND tiv_2015 IN (
	SELECT tiv_2015
	FROM Insurance
	GROUP BY tiv_2015
	HAVING COUNT(*) > 1
)