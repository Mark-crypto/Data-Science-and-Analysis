-- Using WHERE keyword
SELECT * FROM ecommerce_store.products WHERE price > 500;
-- using LIKE keyword 
SELECT * FROM ecommerce_store.users WHERE name LIKE "John Doe";
SELECT * FROM ecommerce_store.users WHERE name LIKE "J%";
SELECT * FROM ecommerce_store.users WHERE name LIKE "Grace____";
-- using MAX, MIN, AVG and COUNT
SELECT name AS Most_Expensive_Product, price FROM ecommerce_store.products WHERE price = (SELECT MAX(price) FROM ecommerce_store.products);
SELECT name AS Cheapest_Product, price FROM ecommerce_store.products WHERE price = (SELECT MIN(price) FROM ecommerce_store.products);
SELECT AVG(price) AS Average_Price FROM ecommerce_store.products;
SELECT COUNT(product_id) AS Total_Products FROM ecommerce_store.products;
-- using GROUP BY/ ORDER BY
SELECT COUNT(supplier_id) AS Total , name AS Supplier_Companies from ecommerce_store.suppliers GROUP BY name ORDER BY(name) ASC;
SELECT ROUND(AVG(price),2) as Average, name as Products FROM ecommerce_store.products GROUP BY name ORDER BY(price) ASC;

-- Having vs where
SELECT name AS Products_Available, price from products GROUP BY product_id HAVING price > 500;
SELECT name AS Out_of_stock, category_id, supplier_id from products where status = 'out_of_stock' ORDER BY (price) ASC;

-- limits
select * from employees LIMIT 5;

-- Retrieve orders with customer details
SELECT orders.order_id, orders.order_date, orders.status, customers.first_name, customers.last_name
FROM orders 
JOIN customers 
ON orders.user_id = customers.customer_id;

-- Union query showing all customer names and order statuses
SELECT first_name AS name, 'Customer' AS type
FROM customers
UNION
SELECT status AS name, 'Order' AS type
FROM orders;
