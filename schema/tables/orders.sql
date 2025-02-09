CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(7,2) NOT NULL CHECK(total_amount > 0),

    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);