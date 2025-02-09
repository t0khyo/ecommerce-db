SELECT 
    p.product_id, 
    p.name, 
    SUM(od.quantity) AS total_sold
FROM 
    product AS p
    JOIN order_details AS od ON p.product_id = od.product_id
    JOIN orders AS o ON od.order_id = o.order_id
WHERE 
    o.order_date BETWEEN '2025-01-01' AND '2025-01-31'
GROUP BY 
    p.product_id, p.name
ORDER BY 
    total_sold DESC
LIMIT 5;
