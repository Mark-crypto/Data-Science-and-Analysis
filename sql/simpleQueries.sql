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