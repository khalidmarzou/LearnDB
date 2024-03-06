---------- Hi there ----------
--This project is made by [Eng:Sabry Hosny]--
------hope that is useful-------

CREATE DATABASE myDB
USE myDB

------------CREATE TABLES------------
--create customers table
CREATE TABLE Customers
(
	CustomerID	INT PRIMARY KEY,
	FirstName	NVARCHAR(255),
	LastName	NVARCHAR(255),
	Address		NVARCHAR(255),
	City		NVARCHAR(100),
	Mobile		NVARCHAR(15),
	Email		NVARCHAR(50)
)

--create product table
CREATE TABLE Products 
(
	ProductID	INT PRIMARY KEY,
	Name		NVARCHAR(255),
	Color		NVARCHAR(25),
	Price		FLOAT
)

--create orders table
CREATE TABLE Orders
(
	OrderID			INT PRIMARY KEY,
	CustomerID		INT,
	OrderDate		DATE,
	ShipppedDate	DATE
)

--create orderdetails table
CREATE TABLE OrderDetails
( 
	OrderID		INT,
	ProductID	INT,
	Quantity	INT
)