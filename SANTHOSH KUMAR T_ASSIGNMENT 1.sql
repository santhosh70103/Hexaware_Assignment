 --Task-1

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(40) UNIQUE NOT NULL,
    phone BIGINT NOT NULL,
    address VARCHAR(100) NOT NULL
);

INSERT INTO customers (customer_id, first_name, last_name, email, phone, address)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 1234567890, '123 Main St'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 9876543210, '456 Elm St'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 5555555555, '789 Oak St'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 2222222222, '101 Pine St'),
(5, 'Mary', 'Davis', 'mary.davis@example.com', 3333333333, '202 Maple St'),
(6, 'Tom', 'Wilson', 'tom.wilson@example.com', 4444444444, '303 Cedar St'),
(7, 'Sarah', 'Anderson', 'sarah.anderson@example.com', 6666666666, '404 Oak St'),
(8, 'Chris', 'Roberts', 'chris.roberts@example.com', 7777777777, '505 Elm St'),
(9, 'Laura', 'Garcia', 'laura.garcia@example.com', 8888888888, '606 Pine St'),
(10, 'Alex', 'Martinez', 'alex.martinez@example.com', 9999999999, '707 Maple St'),
(11, 'Jessica', 'Lee', 'jessica.lee@example.com', 1111111111, '808 Cedar St'),
(12, 'Michael', 'Lopez', 'michael.lopez@example.com', 5555555555, '909 Oak St'),
(13, 'David', 'Hernandez', 'david.hernandez@example.com', 6666666666, '010 Elm St'),
(14, 'Jennifer', 'Young', 'jennifer.young@example.com', 7777777777, '111 Pine St'),
(15, 'Amanda', 'King', 'amanda.king@example.com', 8888888888, '212 Maple St'),
(16, 'Mathan', 'Kumar', 'mathan@gmail.com', 7373783871, '107, Neduncheliyan Str, Sivagiri');

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(30) NOT NULL,
    description VARCHAR(100),
    price INT NOT NULL,
    category_id INT,
    CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO products (product_id, product_name, description, price, category_id)
VALUES
(101, 'Smartphone', 'A high-quality smartphone with advanced features.', 5000, 401),
(102, 'Laptop', 'A powerful laptop for work and entertainment.', 10000, 401),
(103, 'Tablet', 'A lightweight and portable tablet for on-the-go use.', 3000, 401),
(104, 'Headphones', 'Comfortable headphones with great sound quality.', 500, 401),
(105, 'Smartwatch', 'A smartwatch that tracks fitness and provides notifications.', 2000, 401),
(106, 'Camera', 'A digital camera with high-resolution images and video recording.', 4000, 401),
(107, 'Printer', 'A printer that produces high-quality prints.', 15000, 401),
(108, 'External Hard Drive', 'An external hard drive for extra storage.', 1200, 401),
(109, 'Wireless Router', 'A wireless router for fast and reliable internet connections.', 8000, 401),
(110, 'Gaming Console', 'A gaming console for immersive gaming experiences.', 3000, 401),
(111, 'Desktop Computer', 'A desktop computer with powerful performance.', 7000, 401),
(112, 'Monitor', 'A high-resolution monitor for clear visuals.', 2000, 401),
(113, 'Keyboard', 'A durable keyboard for comfortable typing.', 500, 401),
(114, 'Mouse', 'An ergonomic mouse for precise cursor control.', 2000, 401),
(115, 'Speaker System', 'A speaker system for rich and immersive audio.', 1000, 401),
(116, 'Grinder', 'Super-fast machine.', 5000, 402);

CREATE TABLE category
(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(20)
);

INSERT INTO category VALUES (401, 'Electronics'), (402, 'Furniture');

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount INT,
    status VARCHAR(20)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES
(201, 1, '2024-04-01', 30, 'ordered'),
(202, 1, '2024-04-02', 20, 'shipped'),
(203, 2, '2024-04-03', 15, 'pending'),
(204, 4, '2024-04-04', 25, 'ordered'),
(205, 5, '2024-04-05', 50, 'shipped'),
(206, 6, '2024-04-06', 30, 'pending'),
(207, 7, '2024-04-07', 40, 'ordered'),
(208, 8, '2024-04-08', 35, 'shipped'),
(209, 3, '2024-04-09', 60, 'pending'),
(210, 10, '2024-04-10', 45, 'ordered'),
(211, 11, '2024-04-11', 70, 'shipped'),
(212, 12, '2024-04-12', 55, 'pending'),
(213, 13, '2024-04-13', 80, 'ordered'),
(214, 14, '2024-04-14', 65, 'shipped'),
(215, 14, '2024-04-15', 90, 'pending');

CREATE TABLE order_details
(
    order_detail_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity)
VALUES
(501, 201, 101, 2),
(502, 201, 102, 1),
(503, 202, 103, 2),
(504, 204, 104, 1),
(505, 205, 105, 5),
(506, 206, 103, 1),
(507, 207, 107, 4),
(508, 208, 106, 1),
(509, 209, 109, 3),
(510, 210, 109, 2),
(511, 211, 110, 3),
(512, 212, 112, 4),
(513, 213, 113, 5),
(514, 214, 114, 2),
(515, 215, 115, 3);

CREATE TABLE inventory
(
    inventory_id INT PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    quantity_stock INT,
    last_stock_update DATE
);

INSERT INTO inventory (inventory_id, product_id, quantity_stock, last_stock_update)
VALUES
(601, 101, 10, '2024-04-01'),
(602, 102, 5, '2024-04-01'),
(603, 103, 8, '2024-04-01'),
(604, 104, 12, '2024-04-01'),
(605, 105, 15, '2024-04-01'),
(606, 106, 20, '2024-04-01'),
(607, 107, 25, '2024-04-01'),
(608, 108, 30, '2024-04-01'),
(609, 109, 35, '2024-04-01'),
(610, 110, 40, '2024-04-01'),
(611, 111, 45, '2024-04-01'),
(612, 112, 50, '2024-04-01'),
(613, 113, 50, '2024-04-01'),
(614, 114, 50, '2024-04-01'),
(615, 115, 50, '2024-04-01');

--Task-2

--1) Write an SQL query to retrieve the names and emails of all customers. 

SELECT first_name, last_name, email FROM customers;

-- 2) Write an SQL query to list all orders with their order dates and corresponding customer 
--names.

SELECT o.order_id, o.order_date, c.first_name, c.last_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

--3) Write an SQL query to insert a new customer record into the "customers" table. Include 
--customer information such as name, email, and address.

INSERT INTO customers VALUES (17, 'mathan', 'kumar', 'mathan@gmail.com', 107, 'neduncheliyan str, sivagiri');

--4) Write an SQL query to update the prices of all electronic gadgets in the "products" table by 
--increasing them by 10%.

SELECT * FROM products;
UPDATE products SET price = (price + price * 0.1);

--5)  Write an SQL query to delete a specific order and its associated order details from the 
--"orders" and "order_details" tables. Allow users to input the order ID as a parameter.

DECLARE @input_order_id INT;
SET @input_order_id = 4;
DELETE FROM order_details WHERE order_id = @input_order_id;
DELETE FROM orders WHERE order_id = @input_order_id;

--6) Write an SQL query to insert a new order into the "orders" table. Include the customer ID, 
--order date, and any other necessary information

SELECT * FROM orders;
INSERT INTO orders VALUES (4, 4, '2024-02-02', 6000);

--7) . Write an SQL query to update the contact information (e.g., email and address) of a specific 
--customer in the "customers" table. Allow users to input the customer ID and new contact 
--information.

DECLARE @input_email VARCHAR(40);
DECLARE @input_phone BIGINT;
DECLARE @input_address VARCHAR(100);
DECLARE @input_customer_id INT;
SET @input_email = 'dinesh2@gmail.com';
SET @input_phone = 7373783871;
SET @input_address = '107, Nedu. Sivagiri';
SET @input_customer_id = 5;

UPDATE customers SET email = @input_email, phone = @input_phone,
address = @input_address WHERE customer_id = @input_customer_id;

--8) Write an SQL query to recalculate and update the total cost of each order in the "orders" 
--table based on the prices and quantities in the "order_details" table.

UPDATE orders SET total_amount =
(SELECT SUM(od.quantity * p.price)
FROM order_details od
INNER JOIN products p ON od.product_id = p.product_id)
WHERE EXISTS (SELECT 1 FROM order_details od
WHERE od.order_id = orders.order_id);

SELECT * FROM orders;

--9) Write an SQL query to delete all orders and their associated order details for a specific 
--customer from the "orders" and "order_details" tables. Allow users to input the customer ID 
--as a parameter.

DECLARE @input_id INT;
SET @input_id = 6;

DELETE FROM order_details WHERE order_id IN
(SELECT order_id FROM orders WHERE customer_id = @input_id);

DELETE FROM orders WHERE customer_id = @input_id;

--10) Write an SQL query to insert a new electronic gadget product into the "products" table, 
--including product name, category, price, and any other relevant details

INSERT INTO products VALUES (17, 'Grinder', 'super fast machine', 5000, 401);


--11) Write an SQL query to update the status of a specific order in the "orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

ALTER TABLE orders ADD status VARCHAR(20);

SELECT * FROM orders;
DECLARE @input_status VARCHAR(20);
DECLARE @input_order_id INT;
SET @input_status = 'Shipped';
SET @input_order_id = 201;

UPDATE orders SET status = @input_status WHERE order_id = @input_order_id;

--12) Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "customers" table based on the data in the "orders" table.

SELECT c.customer_id, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

--Task-3

--1) Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
--customer name) for each order.

SELECT o.order_id, c.first_name, c.last_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

--2) Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue

SELECT p.product_id, p.product_name, SUM(od.quantity * p.price) AS total_revenue
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
--3) Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information.

SELECT c.first_name, c.last_name, c.email, c.phone, c.address, COUNT(o.order_id) AS total_orders_placed
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.phone, c.address
HAVING COUNT(o.order_id) > 0;

--4) Write an SQL query to find the most popular electronic gadget, which is the one with the highest
--total quantity ordered. Include the product name and the total quantity ordered

SELECT TOP 1 p.product_name, od.quantity
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id
ORDER BY od.quantity DESC;

--5) Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
--categories.

SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN category c ON p.category_id = c.category_id;

--6) Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value.

SELECT c.first_name, c.last_name, AVG(o.total_amount) AS average_order_value
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

--7) Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue.

SELECT TOP 1 o.order_id, c.first_name, c.last_name, SUM(p.price * od.quantity) AS total_revenue
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
GROUP BY o.order_id, c.first_name, c.last_name
ORDER BY total_revenue DESC;

--8) Write an SQL query to list electronic gadgets and the number of times each product has been 
--ordered.

SELECT p.product_name, COUNT(od.order_id) AS total_order
FROM products p 
INNER JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name;

--9) Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.

DECLARE @product_name VARCHAR(30);
SET @product_name = 'SmartPhone';
SELECT c.customer_id, c.first_name, c.last_name, c.email, c.phone, c.address
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = @product_name;

--10) Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
DECLARE @start_date DATE;
DECLARE @end_date DATE;
SET @start_date = '2023-04-01';
SET @end_date = '2024-07-01';
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE order_date BETWEEN @start_date AND @end_date;

--Task -4

--1) Write an SQL query to find out which customers have not placed any orders.

SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
WHERE c.customer_id NOT IN (SELECT o.customer_id FROM orders o);

--2) Write an SQL query to find the total number of products available for sale.

SELECT COUNT(product_id) AS total_products
FROM products
WHERE product_id IN (SELECT product_id FROM order_details GROUP BY product_id);

--3) Write an SQL query to calculate the total revenue generated by TechShop.

SELECT SUM(od.quantity * p.price) AS total_revenue
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id;

SELECT SUM(total_amount) AS total_revenue
FROM orders;

--4) Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
DECLARE @category_name VARCHAR(20);
SET @category_name = 'Electronics';
SELECT AVG(quantity)
FROM order_details
WHERE product_id IN (SELECT p.product_id FROM products p INNER JOIN category c ON p.category_id = c.category_id WHERE c.category_name = @category_name);

--5) Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.

DECLARE @customer_id INT;
SET @customer_id = 1;
SELECT SUM(od.quantity * p.price) AS total_revenue_by_customer_1
FROM order_details od 
INNER JOIN products p ON od.product_id = p.product_id
WHERE od.order_id IN (SELECT o.order_id FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id WHERE c.customer_id = @customer_id);

--6) Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed.

SELECT c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_orders DESC
OFFSET 0 ROWS FETCH FIRST 1 ROWS ONLY;

--7) Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.

SELECT TOP 1 p.category_id AS most_popular_category, SUM(od.quantity) AS total_quantity_ordered
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.category_id
ORDER BY SUM(od.quantity) DESC;

--8) Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.

SELECT TOP 1
    p.category_id AS most_popular_category,
    SUM(od.quantity) AS total_quantity_ordered
FROM
    order_details od
JOIN
    products p ON od.product_id = p.product_id
GROUP BY
    p.category_id
ORDER BY
    SUM(od.quantity) DESC;

--9) Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.

SELECT c.first_name, c.last_name, AVG(o.total_amount) AS average_order_value
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

--10) Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.

SELECT c.first_name, c.last_name, COUNT(od.order_id) AS total_order
FROM order_details od 
INNER JOIN orders o ON od.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name,
