SELECT
    c.customer_id,
    (c.first_name || ' ' || c.last_name) AS full_name,
    SUM(o.total_amount) AS total_spent
FROM
    customer AS c
    JOIN orders AS o ON c.customer_id = o.customer_id
WHERE
    o.order_date >= DATE '2025-04-01' - INTERVAL '1 month'
    AND o.order_date < DATE '2025-04-01'
GROUP BY
    c.customer_id, full_name
HAVING
    SUM(o.total_amount) > 500
ORDER BY
    total_spent DESC;
