USE master 
GO 

-- check previous existence of database
IF EXISTS (SELECT name FROM sys.databases
	WHERE name = 'nprsamples')
	DROP DATABASE nprsamples
GO 
CREATE DATABASE nprsamples
GO

-- switch to new database nprsamples
USE nprsamples

-- to create state table
CREATE TABLE ST
(
stateID char(2) NOT NULL PRIMARY KEY,
stateName varchar(50)
)

-- to create store table
CREATE TABLE Store
(
store_id char(10) NOT NULL PRIMARY KEY,
storeAdd varchar(50),
storeCity varchar(50),
stateID char(2) FOREIGN KEY REFERENCES ST(stateID),
storeZIP char(5),
storePhone char(10)
)

-- to cretae customer table
CREATE TABLE Customers
(
customer_id char(10) NOT NULL PRIMARY KEY,
customerFirstName varchar(50) NOT NULL,
customerLastName varchar(50),
customerPhone char(10) NOT NULL,
customerEmail varchar(50),
customerAdd varchar(50) NOT NULL,
customerCity varchar(50) NOT NULL,
stateID char(2) FOREIGN KEY REFERENCES ST(stateID),
customerZIP char(5)
)

-- to create employee table
CREATE TABLE Employee 
(
emp_id char(10) NOT NULL PRIMARY KEY,
empFirstName varchar(50),
empLastName varchar(50) NOT NULL,
empPhone char(10) NOT NULL,
empEmail varchar(50),
empAdd varchar(50),
empCity varchar(50),
stateID char(2) FOREIGN KEY REFERENCES ST(stateID),
empZIP char(5),
empSSN char(9) NOT NULL
)

-- to create caregory table
CREATE TABLE Category 
(
category_id char(10) NOT NULL PRIMARY KEY,
category_type varchar(50)
)

-- to create product table
CREATE TABLE Products
(
product_id char(10) NOT NULL PRIMARY KEY,
category_id char(10) FOREIGN KEY REFERENCES Category(category_id),
prod_name varchar(50),
prod_size varchar(50),
prod_price float
)

-- to create order table
CREATE TABLE Orders
(
order_id char(10) NOT NULL PRIMARY KEY,
customer_id char(10) FOREIGN KEY REFERENCES Customers(customer_id),
order_time datetime
)

CREATE TABLE Orderline
(
orderline_id char(10) NOT NULL PRIMARY KEY,
order_id char(10) FOREIGN KEY REFERENCES Orders(order_id),
product_id char(10) FOREIGN KEY REFERENCES Products(product_id),
quantity int
)

-- appointment scheduling
CREATE TABLE Appointment
(
appointment_no char(10) NOT NULL PRIMARY KEY,
customer_id char(10) FOREIGN KEY REFERENCES Customers(customer_id),
category_id char(10) FOREIGN KEY REFERENCES Category(category_id),
emp_id char(10) FOREIGN KEY REFERENCES Employee(emp_id),
slot datetime
)

-- vendor table
create TABLE Vendor 
(
vendor_id char(10) NOT NULL PRIMARY KEY, 
venFirstName varchar(50),
venLastName varchar(50) NOT NULL,
venPhone char(10) NOT NULL,
venEmail varchar(50),
venAdd varchar(50),
venCity varchar(50),
stateID char(2) FOREIGN KEY REFERENCES ST(stateID),
venZIP char(5)
)
