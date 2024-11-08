# Approach 1: using self join
/*
SELECT 
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp),3) AS processing_time
FROM Activity a,
     Activity b
WHERE 
    a.machine_id = b.machine_id AND
    a.process_id = b.process_id AND
    a.activity_type = 'start' AND
    b.activity_type = 'end'
GROUP BY machine_id
*/

#Approach 2: using subquery
SELECT
    machine_id,
    ROUND(SUM(CASE WHEN activity_type='start' THEN timestamp*-1 ELSE timestamp END)*1.0/(SELECT COUNT(DISTINCT process_id)), 3) AS processing_time
FROM Activity
GROUP BY machine_id


