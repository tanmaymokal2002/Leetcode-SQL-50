#Approach 1:
/*
WITH cte AS
(SELECT 
	customer_id
    , min(order_date) AS min_order_date
    , min(customer_pref_delivery_date) AS min_customer_pref_delivery_date
FROM Delivery
GROUP BY customer_id)

SELECT
	ROUND(
		SUM(IF(min_order_date = min_customer_pref_delivery_date, 1, 0))*100 /
        COUNT(min_order_date)
    , 2) AS immediate_percentage
FROM cte
*/

#Approach 2: Using Window Functions
SELECT
	ROUND(SUM(immediate)*100/COUNT(customer_id) ,2) AS immediate_percentage
FROM (SELECT *
	, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rnk
    , IF(order_date = customer_pref_delivery_date, 1, 0) AS immediate
FROM Delivery) AS new_table
WHERE rnk = 1;

/*
If there were duplicate first orders then this code won't work so use ROW_NUMBER() else I used RANK() first
*/


