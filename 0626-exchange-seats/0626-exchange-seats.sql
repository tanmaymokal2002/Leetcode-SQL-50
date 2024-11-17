
# Approach 1: using cases
/*
Time Complexity: O(n log n) (dominantly due to the ORDER BY clause).
Space Complexity: O(n) (due to sorting and temporary storage).
*/
SELECT 
	CASE
		WHEN 
			id = (SELECT MAX(id) FROM SEAT) AND MOD(id, 2) = 1
            THEN id
		WHEN 
			MOD(id, 2) = 1 
            THEN id+1
		ELSE
			id-1
    END AS id, student
FROM Seat
ORDER BY id







