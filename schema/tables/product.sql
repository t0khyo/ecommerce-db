CREATE TABLE product(
    product_id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price NUMERIC(7,2) NOT NULL CHECK(price > 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0,

    FOREIGN KEY(category_id) REFERENCES category
);