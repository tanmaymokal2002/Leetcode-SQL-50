#Approach 1:
WITH cte AS
((SELECT requester_id
	, COUNT(1) AS num_of_friends
FROM RequestAccepted
GROUP BY requester_id)
UNION ALL
(SELECT accepter_id
	, COUNT(1) AS num_of_friends
FROM RequestAccepted
GROUP BY accepter_id))

SELECT
	requester_id AS id
    , SUM(num_of_friends) AS num
FROM cte
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1
