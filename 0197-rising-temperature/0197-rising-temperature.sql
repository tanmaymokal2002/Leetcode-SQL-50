# Approach 1:using JOIN
/*
SELECT 
    today.id
FROM Weather today
JOIN Weather yesterday 
ON DATEDIFF(today.recordDate, yesterday.recordDate) = 1
WHERE today.temperature > yesterday.temperature
*/

# Approach 2: using LAG
/*
WITH previous_Weather_Data AS
(
SELECT
    id,
    recordDate,
    temperature,
    LAG(recordDate, 1) OVER(ORDER BY recordDate) AS prev_recordDate,
    LAG(temperature, 1) OVER(ORDER BY recordDate) AS prev_temperature
FROM Weather
)
     
SELECT id
FROM previous_Weather_Data
WHERE temperature > prev_temperature
    AND recordDate = DATE_ADD(prev_recordDate, INTERVAL 1 DAY)
*/

#Approach 3: Using Subquery
/*
SELECT id
FROM weather w1
WHERE
    w1.temperature > 
    (
        SELECT w2.temperature
        FROM weather w2
        WHERE w2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY)
    )
*/

#Approach 4: Using CROSS JOIN
SELECT today.id
FROM Weather yesterday
CROSS JOIN Weather today
WHERE DATEDIFF(today.recordDate, yesterday.recordDate) = 1
    AND today.temperature > yesterday.temperature;
