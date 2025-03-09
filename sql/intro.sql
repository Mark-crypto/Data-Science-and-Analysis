--  tables - users, orders, products, categories, suppliers, shippers, employees, customers
--  columns - id, name, email, phone, address, city, state, zip, country, created_at, updated_at
--  foreign keys - user_id, order_id, product_id, category_id, supplier_id, shipper_id, employee_id, customer_id
--  indexes - user_id, order_id, product_id, category_id, supplier_id, shipper_id, employee_id, customer_id
--  unique - email, phone, address, city, state, zip, country
--  timestamps - created_at, updated_at
--  relationships - one to one, one to many, many to many

--  users
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(12) UNIQUE NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    -- INDEX user_id (id),
    -- FOREIGN KEY (user_id) REFERENCES orders(user_id)
)