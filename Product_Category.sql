CREATE TABLE products (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO products (name) VALUES 
    ('Milk'),
    ('Laptop'),
    ('Pen'),
    ('Keyboard');
CREATE TABLE categories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO categories (name) VALUES
    ('Food'),
    ('Device'),
    ('Writing Instrument'), 
    ('Drink');

CREATE TABLE products_categories (
    product_id BIGINT REFERENCES products (id),
    category_id BIGINT REFERENCES categories (id),
    PRIMARY KEY (product_id, category_id)
);

INSERT INTO products_categories (product_id, category_id) VALUES (1, 1), (1, 4), (2, 2), (3, 3);

-- products - categories
SELECT products.name, categories.name FROM products
LEFT JOIN products_categories ON products_categories.product_id = products.id
LEFT JOIN categories ON products_categories.category_id = categories.id;