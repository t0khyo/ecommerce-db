SELECT 
    product_id,
    name,
    description,
    price,
    category_id
FROM product
WHERE 
    LOWER(name) LIKE '%camera%'
    OR
    LOWER(description) LIKE '%camera%'
LIMIT 10 OFFSET 0;