
-- ==========================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- DATABASE: e-commerce_analysis
-- MYSQL 8.0+
-- ==========================================

CREATE DATABASE IF NOT EXISTS `e-commerce_analysis`;

USE `e-commerce_analysis`;

-- ==========================================
-- STEP 1: DROP EXISTING TABLES
-- ==========================================

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

SET FOREIGN_KEY_CHECKS = 1;

-- ==========================================
-- STEP 2: CREATE CUSTOMERS TABLE
-- ==========================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(60) NOT NULL,
    signup_date DATE NOT NULL
);

-- ==========================================
-- STEP 3: CREATE PRODUCTS TABLE
-- ==========================================

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(60) NOT NULL,
    list_price DECIMAL(10,2) NOT NULL
);

-- ==========================================
-- STEP 4: CREATE ORDERS TABLE
-- ==========================================

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

-- ==========================================
-- STEP 5: CREATE ORDERDETAILS TABLE
-- ==========================================

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_details_order
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    CONSTRAINT fk_details_product
    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

-- ==========================================
-- STEP 6: INSERT CUSTOMERS
-- ==========================================

INSERT INTO Customers VALUES
(1,'Aarav Sharma','Delhi','2024-01-10'),
(2,'Diya Patel','Mumbai','2024-01-18'),
(3,'Rohan Reddy','Hyderabad','2024-02-02'),
(4,'Ananya Singh','Bengaluru','2024-02-16'),
(5,'Vivaan Gupta','Delhi','2024-03-04'),
(6,'Isha Nair','Chennai','2024-03-21'),
(7,'Arjun Kumar','Hyderabad','2024-04-08'),
(8,'Meera Joshi','Pune','2024-04-27'),
(9,'Kabir Das','Kolkata','2024-05-11'),
(10,'Saanvi Rao','Bengaluru','2024-05-25'),
(11,'Aditya Verma','Mumbai','2024-06-09'),
(12,'Kiara Mehta','Pune','2024-06-20');

-- ==========================================
-- STEP 7: INSERT PRODUCTS
-- ==========================================

INSERT INTO Products VALUES
(101,'Wireless Mouse','Electronics',799.00),
(102,'Mechanical Keyboard','Electronics',2499.00),
(103,'USB-C Hub','Electronics',1899.00),
(104,'Cotton T-Shirt','Clothing',599.00),
(105,'Running Shoes','Clothing',2999.00),
(106,'Coffee Mug','Home & Kitchen',349.00),
(107,'Desk Lamp','Home & Kitchen',1299.00),
(108,'Water Bottle','Home & Kitchen',499.00),
(109,'SQL Basics Book','Books',699.00),
(110,'Data Analytics Guide','Books',999.00);

-- ==========================================
-- STEP 8: INSERT ORDERS
-- ==========================================

INSERT INTO Orders VALUES
(1001,1,'2025-01-05','Delivered',3298.00),
(1002,2,'2025-01-12','Delivered',1598.00),
(1003,3,'2025-01-20','Delivered',2999.00),
(1004,4,'2025-02-02','Delivered',3198.00),
(1005,1,'2025-02-14','Delivered',1899.00),
(1006,5,'2025-02-18','Cancelled',799.00),
(1007,6,'2025-03-03','Delivered',1748.00),
(1008,7,'2025-03-15','Delivered',3698.00),
(1009,2,'2025-03-28','Delivered',2499.00),
(1010,8,'2025-04-04','Delivered',1698.00),
(1011,9,'2025-04-19','Returned',699.00),
(1012,10,'2025-04-26','Delivered',4298.00),
(1013,3,'2025-05-08','Delivered',1498.00),
(1014,11,'2025-05-17','Delivered',3798.00),
(1015,12,'2025-05-29','Delivered',1998.00),
(1016,4,'2025-06-06','Delivered',2999.00),
(1017,5,'2025-06-18','Delivered',2098.00),
(1018,1,'2025-07-02','Delivered',1698.00),
(1019,6,'2025-07-14','Delivered',2999.00),
(1020,7,'2025-07-23','Delivered',1398.00),
(1021,8,'2025-08-09','Delivered',2499.00),
(1022,9,'2025-08-21','Delivered',1298.00),
(1023,10,'2025-09-05','Delivered',3198.00),
(1024,11,'2025-09-16','Delivered',1899.00),
(1025,12,'2025-10-01','Delivered',2999.00),
(1026,2,'2025-10-18','Delivered',1048.00),
(1027,3,'2025-11-07','Delivered',3798.00),
(1028,4,'2025-11-19','Delivered',1698.00),
(1029,5,'2025-12-03','Delivered',2499.00),
(1030,10,'2025-12-20','Delivered',1998.00);

-- ==========================================
-- STEP 9: INSERT ORDER DETAILS
-- ==========================================

INSERT INTO OrderDetails VALUES
(1,1001,102,1,2499.00),
(2,1001,101,1,799.00),
(3,1002,104,1,599.00),
(4,1002,109,1,699.00),
(5,1002,106,1,300.00),
(6,1003,105,1,2999.00),
(7,1004,102,1,2499.00),
(8,1004,108,1,499.00),
(9,1004,106,1,200.00),
(10,1005,103,1,1899.00),
(11,1006,101,1,799.00),
(12,1007,107,1,1299.00),
(13,1007,109,1,449.00),
(14,1008,105,1,2999.00),
(15,1008,108,1,499.00),
(16,1008,106,1,200.00),
(17,1009,102,1,2499.00),
(18,1010,107,1,1299.00),
(19,1010,108,1,399.00),
(20,1011,109,1,699.00),
(21,1012,105,1,2999.00),
(22,1012,103,1,1299.00),
(23,1013,104,1,599.00),
(24,1013,110,1,899.00),
(25,1014,102,1,2499.00),
(26,1014,101,1,799.00),
(27,1014,106,1,500.00),
(28,1015,110,1,999.00),
(29,1015,107,1,999.00),
(30,1016,105,1,2999.00),
(31,1017,103,1,1899.00),
(32,1017,106,1,199.00),
(33,1018,107,1,1299.00),
(34,1018,109,1,399.00),
(35,1019,105,1,2999.00),
(36,1020,104,1,599.00),
(37,1020,110,1,799.00),
(38,1021,102,1,2499.00),
(39,1022,107,1,1299.00),
(40,1023,105,1,2999.00),
(41,1023,109,1,199.00),
(42,1024,103,1,1899.00),
(43,1025,105,1,2999.00),
(44,1026,106,1,349.00),
(45,1026,109,1,699.00),
(46,1027,102,1,2499.00),
(47,1027,103,1,1299.00),
(48,1028,107,1,1299.00),
(49,1028,108,1,399.00),
(50,1029,102,1,2499.00),
(51,1030,110,2,999.00);

-- ==========================================
-- STEP 10: VERIFY TABLES AND RECORD COUNTS
-- ==========================================

SHOW TABLES;

SELECT 'Customers' AS Table_Name, COUNT(*) AS Total_Rows FROM Customers
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'OrderDetails', COUNT(*) FROM OrderDetails;

-- ==========================================
-- PROJECT DATABASE CREATED SUCCESSFULLY
-- ==========================================
