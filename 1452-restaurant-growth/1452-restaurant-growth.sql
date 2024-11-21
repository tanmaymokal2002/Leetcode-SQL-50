
#Approach 1: using window functions 
/*
WITH cte AS
(SELECT visited_on
	, SUM(amount) AS total_amount
FROM Customer
GROUP BY visited_on),
cte2 AS
(SELECT
	visited_on
    , SUM(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
    , ROUND(AVG(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM cte)

SELECT *
FROM cte2
WHERE visited_on >= ( SELECT MIN(visited_on) FROM cte2 ) + INTERVAL 6 DAY
ORDER BY visited_on
*/

#Approch 2: shorter version and using only subqueries

SELECT visited_on
	, (
		SELECT SUM(amount)
        FROM Customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount
    , ROUND((
		SELECT SUM(amount)/7
        FROM Customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ), 2) AS average_amount
FROM Customer c
WHERE visited_on >= (SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM Customer)
GROUP BY visited_on
ORDER BY visited_on

