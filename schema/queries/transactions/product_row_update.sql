BEGIN;

SELECT *
FROM product
WHERE product_id = 211
FOR UPDATE;

UPDATE product
SET stock_quantity = stock_quantity - 1
WHERE product_id = 211;

COMMIT;