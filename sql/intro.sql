--  tables - users, orders, products, categories, suppliers, shippers, employees, customers
--  columns - id, name, email, phone, address, city, state, zip, country, created_at, updated_at
--  foreign keys - user_id, order_id, product_id, category_id, supplier_id, shipper_id, employee_id, customer_id
--  indexes - user_id, order_id, product_id, category_id, supplier_id, shipper_id, employee_id, customer_id
--  unique - email, phone, address, city, state, zip, country
--  timestamps - created_at, updated_at
--  relationships - one to one, one to many, many to many

--  users
CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
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

--Dummy data 
INSERT INTO users (name, email, phone, address, city, state, zip, country)
VALUES
('John Doe', 'johndoe1@example.com', '1234567890', '123 Main St', 'New York', 'NY', '10001', 'USA'),
('Jane Smith', 'janesmith2@example.com', '1234567891', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),
('Alice Johnson', 'alicej3@example.com', '1234567892', '789 Oak St', 'Chicago', 'IL', '60601', 'USA'),
('Bob Williams', 'bobw4@example.com', '1234567893', '321 Pine St', 'Houston', 'TX', '77001', 'USA'),
('Charlie Brown', 'charlieb5@example.com', '1234567894', '654 Cedar St', 'Miami', 'FL', '33101', 'USA'),
('Daniel Green', 'danielg6@example.com', '1234567895', '987 Birch St', 'Seattle', 'WA', '98101', 'USA'),
('Emily White', 'emilyw7@example.com', '1234567896', '159 Maple St', 'Denver', 'CO', '80201', 'USA'),
('Frank Harris', 'frankh8@example.com', '1234567897', '753 Walnut St', 'Boston', 'MA', '02101', 'USA'),
('Grace Lee', 'gracel9@example.com', '1234567898', '258 Spruce St', 'San Francisco', 'CA', '94101', 'USA'),
('Henry Adams', 'henrya10@example.com', '1234567899', '369 Willow St', 'Dallas', 'TX', '75201', 'USA'),
('Ivy Carter', 'ivyc11@example.com', '1234567800', '951 Redwood St', 'Atlanta', 'GA', '30301', 'USA'),
('Jack Evans', 'jacke12@example.com', '1234567801', '852 Palm St', 'Austin', 'TX', '73301', 'USA'),
('Kelly Moore', 'kellym13@example.com', '1234567802', '741 Poplar St', 'Phoenix', 'AZ', '85001', 'USA'),
('Liam Nelson', 'liamn14@example.com', '1234567803', '369 Cherry St', 'Philadelphia', 'PA', '19101', 'USA'),
('Mia Foster', 'miaf15@example.com', '1234567804', '258 Sycamore St', 'Detroit', 'MI', '48201', 'USA'),
('Noah Brooks', 'noahb16@example.com', '1234567805', '147 Magnolia St', 'Portland', 'OR', '97201', 'USA'),
('Olivia Scott', 'olivias17@example.com', '1234567806', '369 Ash St', 'San Diego', 'CA', '92101', 'USA'),
('Peter King', 'peterk18@example.com', '1234567807', '951 Cypress St', 'Charlotte', 'NC', '28201', 'USA'),
('Quinn Murphy', 'quinnm19@example.com', '1234567808', '753 Beech St', 'Indianapolis', 'IN', '46201', 'USA'),
('Ryan Reed', 'ryanr20@example.com', '1234567809', '654 Hickory St', 'Nashville', 'TN', '37201', 'USA'),
('Sophia Bailey', 'sophiab21@example.com', '1234567810', '123 Oakwood St', 'San Antonio', 'TX', '78201', 'USA'),
('Thomas Walker', 'thomasw22@example.com', '1234567811', '258 Redwood St', 'Columbus', 'OH', '43201', 'USA'),
('Uma Patel', 'umap23@example.com', '1234567812', '369 Elmwood St', 'Jacksonville', 'FL', '32201', 'USA'),
('Victor Hall', 'victorh24@example.com', '1234567813', '951 Pinewood St', 'Louisville', 'KY', '40201', 'USA'),
('Wendy Turner', 'wendyt25@example.com', '1234567814', '753 Cedarwood St', 'Oklahoma City', 'OK', '73101', 'USA'),
('Xander Collins', 'xanderc26@example.com', '1234567815', '654 Willowwood St', 'Kansas City', 'MO', '64101', 'USA'),
('Yasmine Diaz', 'yasmined27@example.com', '1234567816', '123 Birchwood St', 'Las Vegas', 'NV', '89101', 'USA'),
('Zack Martin', 'zackm28@example.com', '1234567817', '258 Maplewood St', 'New Orleans', 'LA', '70101', 'USA'),
('Abby Simmons', 'abbys29@example.com', '1234567818', '369 Palmwood St', 'Baltimore', 'MD', '21201', 'USA'),
('Brian Lopez', 'brianl30@example.com', '1234567819', '951 Oakridge St', 'Minneapolis', 'MN', '55401', 'USA');

--  orders
CREATE TABLE orders(
 order_id INT PRIMARY KEY AUTO_INCREMENT,
 user_id INT,
 order_date DATETIME NOT NULL,
 ship_date DATETIME NOT NULL,
 status ENUM('pending', 'shipped', 'delivered') NOT NULL,
 created_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
)
-- Dummy data
INSERT INTO orders (user_id, order_date, ship_date, status) 
VALUES
(1, '2024-02-01 10:30:00', '2024-02-03 15:45:00', 'shipped'),
(2, '2024-02-02 11:15:00', '2024-02-05 16:30:00', 'delivered'),
(3, '2024-02-03 12:00:00', '2024-02-06 17:00:00', 'pending'),
(4, '2024-02-04 13:45:00', '2024-02-07 14:15:00', 'shipped'),
(5, '2024-02-05 14:30:00', '2024-02-08 18:00:00', 'delivered'),
(6, '2024-02-06 15:00:00', '2024-02-09 12:30:00', 'pending'),
(7, '2024-02-07 16:15:00', '2024-02-10 13:45:00', 'shipped'),
(8, '2024-02-08 17:30:00', '2024-02-11 15:00:00', 'delivered'),
(9, '2024-02-09 18:45:00', '2024-02-12 16:15:00', 'pending'),
(10, '2024-02-10 19:30:00', '2024-02-13 17:30:00', 'shipped'),
(11, '2024-02-11 20:45:00', '2024-02-14 18:45:00', 'delivered'),
(12, '2024-02-12 21:30:00', '2024-02-15 19:30:00', 'pending'),
(13, '2024-02-13 22:15:00', '2024-02-16 20:15:00', 'shipped'),
(14, '2024-02-14 23:00:00', '2024-02-17 21:00:00', 'delivered'),
(15, '2024-02-15 08:45:00', '2024-02-18 08:45:00', 'pending'),
(16, '2024-02-16 09:30:00', '2024-02-19 09:30:00', 'shipped'),
(17, '2024-02-17 10:15:00', '2024-02-20 10:15:00', 'delivered'),
(18, '2024-02-18 11:00:00', '2024-02-21 11:00:00', 'pending'),
(19, '2024-02-19 12:45:00', '2024-02-22 12:45:00', 'shipped'),
(20, '2024-02-20 13:30:00', '2024-02-23 13:30:00', 'delivered'),
(21, '2024-02-21 14:15:00', '2024-02-24 14:15:00', 'pending'),
(22, '2024-02-22 15:00:00', '2024-02-25 15:00:00', 'shipped'),
(23, '2024-02-23 16:45:00', '2024-02-26 16:45:00', 'delivered'),
(24, '2024-02-24 17:30:00', '2024-02-27 17:30:00', 'pending'),
(25, '2024-02-25 18:15:00', '2024-02-28 18:15:00', 'shipped'),
(26, '2024-02-26 19:00:00', '2024-02-29 19:00:00', 'delivered'),
(27, '2024-02-27 20:45:00', '2024-03-01 20:45:00', 'pending'),
(28, '2024-02-28 21:30:00', '2024-03-02 21:30:00', 'shipped'),
(29, '2024-02-29 22:15:00', '2024-03-03 22:15:00', 'delivered'),
(30, '2024-03-01 23:00:00', '2024-03-04 23:00:00', 'pending');
