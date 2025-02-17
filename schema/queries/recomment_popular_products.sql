-- /* design a query to 
--      suggest popular products in the same category 
--      for the same author, 
--      excluding the Purchased before product from the recommendations?
-- */

-- @block Step 1: Identify the popular products in a category
SELECT 
    p.product_id,
    p.name,
    p.category_id,
    SUM(od.quantity) as total_sold
from 
    product as p 
    JOIN order_details as od on p.product_id = od.product_id
WHERE category_id = 1
GROUP BY p.product_id, p.name, p.category_id
ORDER BY SUM(od.quantity) DESC;

-- @block Step 2: Identify the previously purchased products in the category
SELECT
    oh.order_id, oh.customer_id, p.product_id, p.name
FROM
    order_history as oh
    JOIN order_details AS od on oh.order_id = od.order_id
    JOIN product AS p ON od.product_id = p.product_id
WHERE oh.customer_id = 3 AND p.category_id = 1;

-- @block Step 3: exclude the purchased before product
WITH purchased_products AS (
    SELECT
        p.product_id
    FROM
        order_history as oh
        JOIN order_details AS od on oh.order_id = od.order_id
        JOIN product AS p ON od.product_id = p.product_id
    WHERE oh.customer_id = 3 AND p.category_id = 1
)
SELECT 
    p.product_id, 
    p.name, 
    p.category_id, 
    SUM(od.quantity) AS total_sold
FROM 
    product AS p
    JOIN order_details AS od ON p.product_id = od.product_id
WHERE 
    p.category_id = 1
    AND p.product_id NOT IN (SELECT product_id FROM purchased_products)
GROUP BY 
    p.product_id, p.name, p.category_id
ORDER BY 
    total_sold DESC
LIMIT 3;
    