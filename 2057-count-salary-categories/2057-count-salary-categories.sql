# Approach 1:
/*
WITH salaries AS
(SELECT
	CASE WHEN SUM(income) < 20000 THEN 'Low Salary'  
		 WHEN SUM(income) BETWEEN 20000 AND 50000 THEN 'Average Salary' 
         ELSE 'High Salary'
	END AS category
FROM Accounts
GROUP BY account_id),
categories AS
(SELECT 'Low Salary' AS category
UNION ALl
SELECT 'Average Salary' AS category
UNION ALl
SELECT 'High Salary' AS category)

SELECT
	c.category
    , COUNT(s.category) AS accounts_count
FROM categories c
LEFT JOIN salaries s ON s.category = c.category
GROUP BY c.category
ORDER BY c.category
*/

#Approach 2: only using UNION ALL
SELECT 'Low Salary' AS category,
	COUNT(CASE WHEN income < 20000 THEN 1 END) AS accounts_count
FROM Accounts a
UNION ALL
SELECT 'Average Salary' AS category,
	COUNT(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 END) AS accounts_count
FROM Accounts a
UNION ALL
SELECT 'High Salary' AS category,
	COUNT(CASE WHEN income > 50000 THEN 1 END) AS accounts_count
FROM Accounts a

