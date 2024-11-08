-- Approach 1:
/*
SELECT 
    today.id
FROM Weather today
JOIN Weather yesterday 
ON DATEDIFF(today.recordDate, yesterday.recordDate) = 1
WHERE today.temperature > yesterday.temperature
*/

# Approach 2;
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
