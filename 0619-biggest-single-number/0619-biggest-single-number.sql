
SELECT MAX(num) AS num
FROM (
SELECT
    m.num
FROM MyNumbers m
JOIN MyNumbers n
ON m.num = n.num
GROUP BY m.num
HAVING COUNT(1) = 1
) x;