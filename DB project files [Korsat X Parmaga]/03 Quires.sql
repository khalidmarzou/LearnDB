USE myDB

SELECT * FROM Customers

SELECT * FROM Products

SELECT * FROM Orders

SELECT * FROM OrderDetails

SELECT CONCAT(C.FirstName,' ',C.LastName) AS 'Full Name' , P.Name as 'Product Name', P.Color as 'Product Color',
	   P.Price as 'Item Price',  OD.Quantity,(P.Price * OD.Quantity) AS 'Total Price' , O.OrderDate , O.ShipppedDate
	FROM OrderDetails OD
	JOIN Orders O		on OD.OrderID = O.OrderID
	JOIN Products P		on OD.ProductID = P.ProductID
	JOIN Customers C	on O.CustomerID = C.CustomerID