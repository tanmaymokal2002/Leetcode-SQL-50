#Approach 1: using AVG
/*
SELECT 
    s.user_id,
    ROUND(
		AVG(IF(c.action='confirmed', 1, 0)) 
    , 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c 
    ON s.user_id = c.user_id
GROUP BY s.user_id
ORDER BY s.user_id DESC;
*/

#Approach 2: using Avg but without Avg clause
SELECT 
	s.user_id,
	CASE
		WHEN c.user_id IS NULL THEN 0 
        ELSE ROUND(SUM(c.action='confirmed')/COUNT(s.user_id), 2)
    END AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c 
ON s.user_id = c.user_id
GROUP BY s.user_id