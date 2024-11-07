-- Approach 1:
/*
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
*/

-- Approach 2:
SELECT name
FROM Customer
WHERE COALESCE(referee_id, 0) <> 2; 
-- coalesce replaces null values to 0 before checking with 2