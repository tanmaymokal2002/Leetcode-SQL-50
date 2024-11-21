
#Approach 1: did on own
/*
WITH cte AS
(SELECT
	m.title,
    u.name,
    mr.movie_id,
    mr.user_id,
    mr.rating,
    mr.created_at
FROM Movies m
JOIN MovieRating mr ON m.movie_id = mr.movie_id
JOIN Users u ON u.user_id = mr.user_id),
cte2 AS (
    SELECT 
        name,
        COUNT(name) AS cnt
    FROM cte
    GROUP BY name
),
cte3 AS 
(
	SELECT 
		title AS movie,
		AVG(rating) AS avg_rating
	FROM cte
	WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
	GROUP BY title
)



SELECT results
FROM
	(SELECT 
		name AS results
	FROM cte2
	WHERE cnt = (SELECT MAX(cnt) FROM cte2)
	ORDER BY name ASC
	LIMIT 1) AS max_user
UNION ALL
SELECT results
FROM
	(SELECT
		movie AS results
	FROM cte3
	WHERE avg_rating = (SELECT MAX(avg_rating) FROM cte3)
    ORDER BY results ASC
	LIMIT 1) AS max_movie_avg
*/

#Approach 2:

#Approach 2:
WITH cte AS
(SELECt mr.*
	, u.name
    , m.title
FROM MovieRating mr 
LEFT JOIN Users u ON mr.user_id = u.user_id
LEFT JOIN Movies m ON m.movie_id = mr.movie_id)

(SELECT name AS results
FROM cte
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)
UNION ALL
(SELECT title
FROM cte
WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1)
