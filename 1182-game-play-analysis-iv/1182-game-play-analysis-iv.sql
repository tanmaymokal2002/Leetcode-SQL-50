# Approach 1 : 
/*
SELECT
    ROUND(COUNT(DISTINCT player_id) /
    (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, DATE_SUb(event_date, INTERVAL 1 DAY))
IN
(SELECT 
    player_id
    , MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id)
*/

# Approach 2: using cte and innerjoin
WITH first_logins AS
(SELECT a.player_id AS first_login_players
    , MIN(a.event_date) AS first_login_date
FROM Activity a
GROUP BY a.player_id)
, consec_logins AS
(SELECT 
	COUNT(f.first_login_players) AS consec_login_count
FROM first_logins f
JOIN Activity a ON a.player_id = f.first_login_players
	AND f.first_login_date = DATE_SUB(a.event_date, INTERVAL 1 DAY))

SELECT 
	ROUND(
		(SELECT consec_login_count FROM consec_logins)  /
        (SELECT COUNT(first_login_players) FROM first_logins)
    , 2) AS fraction


