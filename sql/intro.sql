CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

INSERT INTO users(name, email, phone, address, city, state, zip, country)
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
 ship_date DATETIME ,
 status ENUM('pending', 'shipped', 'delivered') NOT NULL,
 created_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id));

 -- Add a new foreign key referencing customers
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (user_id) REFERENCES customers(customer_id);
 
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

--  products
CREATE TABLE PRODUCTS(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category_id INT,
    supplier_id INT,
    status ENUM('in_stock', 'out_of_stock') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

-- Dummy data
INSERT INTO PRODUCTS (name, description, price, category_id, supplier_id, status) 
VALUES
('Laptop', 'High-performance laptop with 16GB RAM and 512GB SSD', 1200.00, 1, 1, 'in_stock'),
('Smartphone', 'Latest smartphone with AMOLED display and 5G', 850.00, 2, 2, 'in_stock'),
('Wireless Headphones', 'Noise-canceling wireless headphones', 150.00, 3, 3, 'in_stock'),
('Gaming Console', 'Next-gen gaming console with 1TB storage', 500.00, 4, 4, 'out_of_stock'),
('Smartwatch', 'Waterproof smartwatch with health tracking', 200.00, 5, 5, 'in_stock'),
('Mechanical Keyboard', 'RGB mechanical keyboard for gaming', 120.00, 6, 6, 'in_stock'),
('Monitor', '4K UHD 27-inch monitor with HDR support', 300.00, 7, 7, 'in_stock'),
('External Hard Drive', '2TB external HDD for data storage', 80.00, 8, 8, 'in_stock'),
('Bluetooth Speaker', 'Portable speaker with deep bass', 90.00, 9, 9, 'out_of_stock'),
('Smart TV', '55-inch 4K Smart TV with streaming apps', 700.00, 10, 10, 'in_stock'),
('Router', 'Wi-Fi 6 router with high-speed connectivity', 130.00, 11, 11, 'in_stock'),
('Tablet', '10-inch Android tablet with stylus support', 300.00, 12, 12, 'in_stock'),
('Wireless Mouse', 'Ergonomic wireless mouse with long battery life', 50.00, 13, 13, 'in_stock'),
('Electric Kettle', '1.7L electric kettle with auto shut-off', 40.00, 14, 14, 'out_of_stock'),
('Air Fryer', '4L digital air fryer with adjustable temperature', 100.00, 15, 15, 'in_stock'),
('Refrigerator', 'Energy-efficient refrigerator with large capacity', 800.00, 16, 16, 'in_stock'),
('Microwave Oven', 'Convection microwave oven with grill function', 250.00, 17, 17, 'out_of_stock'),
('Coffee Maker', 'Automatic coffee machine with milk frother', 180.00, 18, 18, 'in_stock'),
('Gaming Chair', 'Ergonomic gaming chair with lumbar support', 220.00, 19, 19, 'in_stock'),
('Portable AC', 'Compact portable air conditioner for rooms', 400.00, 20, 20, 'in_stock'),
('Fitness Tracker', 'Wearable fitness tracker with heart rate monitor', 60.00, 21, 21, 'out_of_stock'),
('Dash Cam', 'Car dash camera with night vision and loop recording', 110.00, 22, 22, 'in_stock'),
('VR Headset', 'Virtual reality headset with high-resolution display', 350.00, 23, 23, 'in_stock'),
('Robot Vacuum', 'Smart robot vacuum cleaner with mapping technology', 500.00, 24, 24, 'in_stock'),
('Security Camera', 'Wireless security camera with motion detection', 90.00, 25, 25, 'in_stock'),
('Power Bank', '20000mAh power bank with fast charging', 45.00, 26, 26, 'out_of_stock'),
('E-Reader', 'Lightweight e-reader with glare-free display', 130.00, 27, 27, 'in_stock'),
('Smart Light Bulb', 'Wi-Fi smart bulb with color-changing features', 25.00, 28, 28, 'in_stock'),
('Graphics Card', 'High-performance graphics card for gaming', 600.00, 29, 29, 'out_of_stock'),
('Electric Toothbrush', 'Rechargeable electric toothbrush with multiple modes', 75.00, 30, 30, 'in_stock');

--  categories
CREATE TABLE categories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
    
--  dummy data
INSERT INTO categories (name, description) VALUES
('Electronics', 'Devices and gadgets including laptops, smartphones, and accessories'),
('Home Appliances', 'Kitchen and household electrical appliances'),
('Gaming', 'Gaming consoles, accessories, and peripherals'),
('Furniture', 'Home and office furniture'),
('Fashion', 'Clothing, footwear, and accessories'),
('Health & Beauty', 'Skincare, personal care, and wellness products'),
('Automotive', 'Car accessories and spare parts'),
('Sports & Outdoors', 'Sports equipment and outdoor gear'),
('Books', 'Fiction, non-fiction, and educational books'),
('Toys & Games', 'Kids toys, board games, and collectibles'),
('Office Supplies', 'Stationery, printers, and office furniture'),
('Groceries', 'Food, beverages, and household essentials'),
('Music & Audio', 'Musical instruments, speakers, and headphones'),
('Cameras & Photography', 'Cameras, lenses, and photography accessories'),
('Pet Supplies', 'Pet food, grooming, and accessories');

--  suppliers
CREATE TABLE suppliers(
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    products_supplies TEXT NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
    
--  dummy data
INSERT INTO suppliers (name, email, phone, products_supplies, address, city, state, zip, country) VALUES
('TechWorld Distributors', 'contact@techworld.com', '1234567890', 'Laptops, Smartphones, Accessories', '123 Tech Street', 'New York', 'NY', '10001', 'USA'),
('Home Essentials Ltd', 'sales@homeessentials.com', '9876543210', 'Kitchen Appliances, Air Conditioners', '456 Home Ave', 'Los Angeles', 'CA', '90001', 'USA'),
('GameGear Supplies', 'support@gamegear.com', '1122334455', 'Gaming Consoles, Controllers, Keyboards', '789 Gaming Blvd', 'San Francisco', 'CA', '94102', 'USA'),
('Furniture Masters', 'info@furnituremasters.com', '2233445566', 'Office Chairs, Tables, Sofas', '101 Office Lane', 'Chicago', 'IL', '60601', 'USA'),
('Fashion Trends Inc.', 'hello@fashiontrends.com', '3344556677', 'Clothing, Footwear, Accessories', '202 Fashion Street', 'Miami', 'FL', '33101', 'USA'),
('Health & Beauty Corp', 'contact@hbcorp.com', '4455667788', 'Skincare, Personal Care, Cosmetics', '303 Wellness Drive', 'Houston', 'TX', '77001', 'USA'),
('AutoParts Depot', 'service@autoparts.com', '5566778899', 'Car Accessories, Spare Parts', '404 Auto Road', 'Detroit', 'MI', '48201', 'USA'),
('Outdoor Gear Hub', 'sales@outdoorgear.com', '6677889900', 'Camping Gear, Bicycles, Fishing Equipment', '505 Adventure Ave', 'Denver', 'CO', '80201', 'USA'),
('Book Haven', 'hello@bookhaven.com', '7788990011', 'Fiction, Non-fiction, Textbooks', '606 Literature St', 'Seattle', 'WA', '98101', 'USA'),
('Toy Kingdom', 'toys@toykingdom.com', '8899001122', 'Kids Toys, Board Games, Collectibles', '707 Fun Lane', 'Orlando', 'FL', '32801', 'USA'),
('OfficePro Supplies', 'contact@officepro.com', '9900112233', 'Printers, Stationery, Office Desks', '808 Work Ave', 'Boston', 'MA', '02101', 'USA'),
('Grocery Wholesale', 'orders@grocerywholesale.com', '1000112233', 'Food, Beverages, Household Essentials', '909 Market St', 'Dallas', 'TX', '75201', 'USA'),
('Music Central', 'support@musiccentral.com', '1100223344', 'Guitars, Headphones, Speakers', '111 Melody Drive', 'Nashville', 'TN', '37201', 'USA'),
('Camera Pros', 'sales@camerapros.com', '2200334455', 'Cameras, Lenses, Tripods', '121 Photography Ave', 'San Diego', 'CA', '92101', 'USA'),
('Pet Haven', 'pets@pethaven.com', '3300445566', 'Pet Food, Grooming Products, Accessories', '131 Pet Street', 'Phoenix', 'AZ', '85001', 'USA');

--  shippers
CREATE TABLE shippers(
    shipper_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

--  dummy data
INSERT INTO shippers (name, email, phone, address, city, state, zip, country) VALUES
('FastTrack Logistics', 'support@fasttrack.com', '1234567890', '123 Express Lane', 'New York', 'NY', '10001', 'USA'),
('SwiftShip Couriers', 'info@swiftship.com', '9876543210', '456 Speed Blvd', 'Los Angeles', 'CA', '90001', 'USA'),
('Global Freight', 'contact@globalfreight.com', '1122334455', '789 Cargo Street', 'San Francisco', 'CA', '94102', 'USA'),
('Rapid Movers', 'service@rapidmovers.com', '2233445566', '101 Quick Drive', 'Chicago', 'IL', '60601', 'USA'),
('Prime Express', 'orders@primeexpress.com', '3344556677', '202 Fast Avenue', 'Miami', 'FL', '33101', 'USA'),
('Eagle Logistics', 'hello@eaglelogistics.com', '4455667788', '303 Wings Street', 'Houston', 'TX', '77001', 'USA'),
('Titan Shipping', 'support@titanshipping.com', '5566778899', '404 Titan Road', 'Detroit', 'MI', '48201', 'USA'),
('Skyline Couriers', 'sales@skylinecouriers.com', '6677889900', '505 Skyline Ave', 'Denver', 'CO', '80201', 'USA'),
('OceanWave Transport', 'contact@oceanwave.com', '7788990011', '606 Harbor Lane', 'Seattle', 'WA', '98101', 'USA'),
('Pioneer Freight', 'help@pioneerfreight.com', '8899001122', '707 Trailblazer St', 'Orlando', 'FL', '32801', 'USA');

--  employees
CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_number VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL,
    date_enrolled DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    branch VARCHAR(50) NOT NULL,
    national_id VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL,
    status ENUM('active' ,'inactive', 'on_leave') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

--  dummy data
INSERT INTO employees (employee_number, name, email, phone, role, date_enrolled, salary, branch, national_id, address, city, state, zip, country, status) VALUES
('EMP001', 'John Doe', 'johndoe@email.com', '1234567890', 'Software Engineer', '2022-05-15', 75000.00, 'New York', '100001', '123 Main St', 'New York', 'NY', '10001', 'USA', 'active'),
('EMP002', 'Jane Smith', 'janesmith@email.com', '9876543210', 'Project Manager', '2021-08-21', 90000.00, 'Los Angeles', '100002', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA', 'active'),
('EMP003', 'Mike Johnson', 'mikejohnson@email.com', '1122334455', 'HR Manager', '2020-07-10', 85000.00, 'San Francisco', '100003', '789 Oak St', 'San Francisco', 'CA', '94102', 'USA', 'active'),
('EMP004', 'Alice Brown', 'alicebrown@email.com', '2233445566', 'Data Analyst', '2019-09-05', 72000.00, 'Chicago', '100004', '101 Pine St', 'Chicago', 'IL', '60601', 'USA', 'on_leave'),
('EMP005', 'David Wilson', 'davidwilson@email.com', '3344556677', 'IT Support', '2023-02-18', 65000.00, 'Miami', '100005', '202 Maple St', 'Miami', 'FL', '33101', 'USA', 'active'),
('EMP006', 'Emma Davis', 'emmadavis@email.com', '4455667788', 'Marketing Specialist', '2022-11-30', 70000.00, 'Houston', '100006', '303 Cedar St', 'Houston', 'TX', '77001', 'USA', 'inactive'),
('EMP007', 'Robert Miller', 'robertmiller@email.com', '5566778899', 'Finance Officer', '2021-06-22', 88000.00, 'Detroit', '100007', '404 Birch St', 'Detroit', 'MI', '48201', 'USA', 'active'),
('EMP008', 'Sophia Martinez', 'sophiamartinez@email.com', '6677889900', 'UX Designer', '2020-04-14', 77000.00, 'Denver', '100008', '505 Aspen St', 'Denver', 'CO', '80201', 'USA', 'on_leave'),
('EMP009', 'James Anderson', 'jamesanderson@email.com', '7788990011', 'Network Engineer', '2019-12-09', 82000.00, 'Seattle', '100009', '606 Spruce St', 'Seattle', 'WA', '98101', 'USA', 'active'),
('EMP010', 'Olivia White', 'oliviawhite@email.com', '8899001122', 'Customer Support', '2023-03-28', 60000.00, 'Orlando', '100010', '707 Palm St', 'Orlando', 'FL', '32801', 'USA', 'inactive'),
('EMP011', 'William Thomas', 'williamthomas@email.com', '9900112233', 'Cybersecurity Analyst', '2022-08-16', 86000.00, 'Boston', '100011', '808 Redwood St', 'Boston', 'MA', '02101', 'USA', 'active'),
('EMP012', 'Isabella Moore', 'isabellamoore@email.com', '1000112233', 'Business Analyst', '2021-10-04', 81000.00, 'Dallas', '100012', '909 Sycamore St', 'Dallas', 'TX', '75201', 'USA', 'on_leave'),
('EMP013', 'Liam Taylor', 'liamtaylor@email.com', '1100223344', 'Sales Executive', '2020-01-19', 75000.00, 'Nashville', '100013', '111 Beech St', 'Nashville', 'TN', '37201', 'USA', 'active'),
('EMP014', 'Mia Hernandez', 'miahernandez@email.com', '2200334455', 'Operations Manager', '2018-05-07', 95000.00, 'San Diego', '100014', '121 Poplar St', 'San Diego', 'CA', '92101', 'USA', 'inactive'),
('EMP015', 'Benjamin Lewis', 'benjaminlewis@email.com', '3300445566', 'Supply Chain Manager', '2017-03-12', 97000.00, 'Phoenix', '100015', '131 Magnolia St', 'Phoenix', 'AZ', '85001', 'USA', 'active');

--  newsletter subscribers
CREATE TABLE newsletter_subscribers(
    subscriber_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(200) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);  

INSERT INTO newsletter_subscribers (email, name) VALUES
('alice.johnson@email.com', 'Alice Johnson'),
('bob.smith@email.com', 'Bob Smith'),
('carla.doe@email.com', 'Carla Doe'),
('daniel.white@email.com', 'Daniel White'),
('emma.taylor@email.com', 'Emma Taylor'),
('frank.miller@email.com', 'Frank Miller'),
('grace.brown@email.com', 'Grace Brown'),
('henry.wilson@email.com', 'Henry Wilson'),
('isabella.davis@email.com', 'Isabella Davis'),
('jack.thomas@email.com', 'Jack Thomas'),
('kate.hernandez@email.com', 'Kate Hernandez'),
('leo.martinez@email.com', 'Leo Martinez'),
('mia.clark@email.com', 'Mia Clark'),
('noah.rodriguez@email.com', 'Noah Rodriguez'),
('olivia.lopez@email.com', 'Olivia Lopez'),
('peter.scott@email.com', 'Peter Scott'),
('quinn.green@email.com', 'Quinn Green'),
('ryan.adams@email.com', 'Ryan Adams'),
('sophia.hill@email.com', 'Sophia Hill'),
('tyler.baker@email.com', 'Tyler Baker');

ALTER TABLE orders
ADD CONSTRAINT chk_ship_date CHECK (order_date < ship_date);

-- customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO customers (first_name, last_name, email, phone, address, city, country)
VALUES
('John', 'Doe', 'john.doe@gmail.com', '1234567890', '123 Main St', 'Nairobi', 'Kenya'),
('Jane', 'Smith', 'jane.smith@yahoo.com', '9876543210', '456 Elm St', 'Mombasa', 'Kenya'),
('Robert', 'Brown', 'robert.brown@hotmail.com', '0723456789', '789 Pine St', 'Kisumu', 'Kenya'),
('Emily', 'Johnson', 'emily.johnson@gmail.com', '0711223344', '321 Maple Ave', 'Nakuru', 'Kenya'),
('Michael', 'Davis', 'michael.davis@yahoo.com', '0788564321', '654 Oak St', 'Eldoret', 'Kenya'),
('Olivia', 'Wilson', 'olivia.wilson@gmail.com', '0722334455', '890 Cedar Rd', 'Thika', 'Kenya'),
('William', 'Anderson', 'will.anderson@gmail.com', '0799887766', '567 Birch St', 'Meru', 'Kenya'),
('Sophia', 'Thomas', 'sophia.thomas@yahoo.com', '0700112233', '432 Aspen Dr', 'Kakamega', 'Kenya'),
('James', 'Moore', 'james.moore@gmail.com', '0734455667', '765 Walnut St', 'Machakos', 'Kenya'),
('Isabella', 'Taylor', 'isabella.taylor@gmail.com', '0711345678', '111 Spruce Ave', 'Nairobi', 'Kenya'),
('David', 'Martin', 'david.martin@yahoo.com', '0744455666', '222 Willow Rd', 'Mombasa', 'Kenya'),
('Mia', 'Lee', 'mia.lee@gmail.com', '0722665544', '333 Chestnut St', 'Kisumu', 'Kenya'),
('Daniel', 'White', 'daniel.white@gmail.com', '0767788990', '444 Fir Ln', 'Nakuru', 'Kenya'),
('Charlotte', 'Harris', 'charlotte.harris@gmail.com', '0711223345', '555 Redwood Rd', 'Thika', 'Kenya'),
('Matthew', 'Clark', 'matthew.clark@gmail.com', '0733445566', '666 Cypress Ave', 'Eldoret', 'Kenya'),
('Abigail', 'Lewis', 'abigail.lewis@yahoo.com', '0711887766', '777 Sycamore St', 'Meru', 'Kenya'),
('Ethan', 'Walker', 'ethan.walker@gmail.com', '0722998877', '888 Poplar Rd', 'Nairobi', 'Kenya'),
('Amelia', 'Hall', 'amelia.hall@gmail.com', '0799441122', '999 Maple St', 'Kisumu', 'Kenya'),
('Liam', 'Allen', 'liam.allen@hotmail.com', '0788992233', '123 Cedar Ln', 'Nakuru', 'Kenya'),
('Evelyn', 'Scott', 'evelyn.scott@gmail.com', '0700223344', '456 Pine Rd', 'Thika', 'Kenya'),
('Mason', 'King', 'mason.king@yahoo.com', '0733556677', '789 Walnut Ln', 'Mombasa', 'Kenya'),
('Harper', 'Green', 'harper.green@gmail.com', '0722885566', '321 Fir Rd', 'Eldoret', 'Kenya'),
('Noah', 'Baker', 'noah.baker@gmail.com', '0711667788', '654 Cypress Ln', 'Kakamega', 'Kenya'),
('Ava', 'Nelson', 'ava.nelson@yahoo.com', '0744778899', '987 Oak Rd', 'Machakos', 'Kenya'),
('Oliver', 'Carter', 'oliver.carter@gmail.com', '0799112233', '543 Birch Ln', 'Meru', 'Kenya'),
('Lily', 'Perez', 'lily.perez@gmail.com', '0711445566', '876 Spruce Ave', 'Kisumu', 'Kenya'),
('Elijah', 'Roberts', 'elijah.roberts@gmail.com', '0722556677', '112 Maple St', 'Nairobi', 'Kenya'),
('Emily', 'Turner', 'emily.turner@gmail.com', '0700334455', '334 Cedar Ln', 'Mombasa', 'Kenya'),
('Benjamin', 'Phillips', 'ben.phillips@gmail.com', '0733778899', '778 Walnut Rd', 'Thika', 'Kenya'),
('Sophia', 'Adams', 'sophia.adams@gmail.com', '0722003344', '567 Fir Ln', 'Nakuru', 'Kenya');
