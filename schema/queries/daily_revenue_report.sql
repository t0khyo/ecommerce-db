SELECT 
        DATE(order_date) AS ORDER_DATE,
        sum(total_amount) AS DAILY_REVENUE
       
FROM orders
WHERE DATE(Order_date) = '2025-01-01'
GROUP BY order_date;
