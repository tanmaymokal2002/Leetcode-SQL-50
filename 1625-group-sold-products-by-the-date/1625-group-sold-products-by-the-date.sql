# Approach 1:

SELECT
    sell_date
    , COUNT(DISTINCT product) AS num_sold
    , GROUP_CONCAT(
        DISTINCT product
        ORDER BY product
        SEPARATOR ',' -- by default it is ',' so no need of this line
    ) AS products
FROM Activities
GROUP BY sell_date