CREATE TABLE order_history (
    order_id INTEGER NOT NULL,
    order_date TIMESTAMP NOT NULL,
    total_amount NUMERIC(7,2) CHECK(total_amount > 0),

    customer_id INTEGER NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),

    PRIMARY KEY (order_id)
);


INSERT INTO order_history (order_id, order_date, total_amount,
                           customer_id, first_name, last_name, email)
SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM
    orders AS o
    JOIN customer AS c ON c.customer_id = o.customer_id;
