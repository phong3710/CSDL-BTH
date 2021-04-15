--2.
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City
FROM Customers
WHERE City = 'London' or City='France'

--3.
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country
FROM Customers
WHERE (Country = 'USA' and ContactTitle = 'Sales Manager') OR (Country = 'Mexico'and ContactTitle = 'Owner')

--4.
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country
FROM Customers
WHERE (Country = 'USA' and ContactTitle like '%Manager%') OR (Country = 'Mexico'and ContactTitle not like 'Owner')

--5

Select OrderID, OrderDate, CustomerID, EmployeeID
from  dbo.Orders
where YEAR(OrderDate)='1997' AND MONTH(OrderDate)<='6'

--6.
SET DATEFORMAT dmy
Select OrderID, OrderDate, CustomerID, EmployeeID
from  dbo.Orders
where OrderDate between '1/2/1997' and '28/2/1997'
--7
Select OrderID, OrderDate, Freight
from  dbo.Orders
where ShipCountry = 'UK' AND EmployeeID='2' AND YEAR(OrderDate)='1997'
--8
select ProductID, ProductName
from Products
where ProductName like 'Ch%'
--9
select ProductID, UnitPrice, UnitsInStock
from Products
where Discontinued = 1 and UnitsInStock > 0
--10
select CompanyName, ContactName, Country, Phone, Fax
from dbo.Customers
where Country NOT IN ('USA')
--11
select CompanyName, ContactName, Country, Phone, Fax
from dbo.Customers
where Country NOT IN ('Brazil', 'Italy', 'Spain', 'Venezuela', 'UK')

--12, 13
SELECT OrderID, CustomerID, EmployeeID, OrderDate, ShipCountry, Freight
FROM Orders
WHERE (ShipCountry = 'USA' AND Freight>300) OR (ShipCountry = 'Argentina' and Freight < 5)

--14
select OrderID, OrderDate, CustomerID, EmployeeID, Freight, 'New-Freight' = 1.1*Freight
from Orders
where YEAR(OrderDate)=1997 and MONTH(OrderDate)=4

--15
select ProductID, UnitPrice, UnitsInStock, ProductName, SupplierID, Total = UnitPrice * UnitsInStock
from Products
where Discontinued = 1