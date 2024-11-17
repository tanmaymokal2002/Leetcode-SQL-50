#Approach 1: using self join
-- won't work if id have gaps / is not a primary increasing key
/*
SELECT 
	DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE
	l1.id = l2.id-1 AND
    l2.id = l3.id-1 AND
    l1.num = l2.num AND
    l2.num = l3.num
*/

#Approach 2: using window functions
WITH cte AS
(SELECT 
	*
    , LEAD(num, 1) OVER() AS next_1
    ,  LEAD(num, 2) OVER() AS next_2
FROM Logs)

SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = next_1 AND num = next_2


