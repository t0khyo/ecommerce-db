SELECT
    DATE(order_date) AS ORDER_DATE,
    SUM(total_amount) AS DAILY_REVENUE
FROM
    orders
WHERE
    DATE(order_date) = '2025-01-01'
GROUP BY
    DATE(order_date);
