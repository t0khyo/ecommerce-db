-- Drop tables if exits.
\i schema/drop-db.sql

-- Create tables.
\i schema/tables/customer.sql
\i schema/tables/category.sql
\i schema/tables/product.sql
\i schema/tables/orders.sql
\i schema/tables/order_details.sql

-- Insert sample data
\i schema/dump-data.sql
