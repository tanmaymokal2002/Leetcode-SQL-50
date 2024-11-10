SELECT 
	activity_date AS day
    , COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date 
BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27' 
GROUP BY activity_date

/*
You can also deal with 30 days filtering as follows:

activity_date > '2019-06-27' AND activity_date <= '2019-07-27'

activity_day BETWEEN '2019-06-28' AND '2019-07-27' (here we manually calculated date prior to 30 days of  '2019-07-27')

DATEDIFF('2019-07-27', activity_date)<30 
AND 
DATEDIFF('2019-07-27', activity_date)>=0 

DATEDIFF('2019-07-27', activity_date) BETWEEN 0 AND 29
*/