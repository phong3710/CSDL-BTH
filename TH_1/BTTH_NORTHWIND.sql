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

--12
SELECT OrderID, CustomerID, EmployeeID, OrderDate, ShipCountry, Freight
FROM Orders
WHERE (ShipCountry = 'USA' AND Freight>300) OR (ShipCountry = 'Argentina' and Freight < 5)

--13
SELECT OrderID, CompanyName, FirstName + ' ' + LastName as 'Name', OrderDate, ShipCountry, ShippedDate, Freight
FROM Orders o , Employees e , Customers c
WHERE o.EmployeeID = e.EmployeeID and c.CustomerID = o.CustomerID and 
	((ShipCountry = 'USA' and Freight > 300)or(ShipCountry = 'Argentina' and Freight < 5))

--14
select OrderID, OrderDate, CompanyName, FirstName + ' ' + LastName as 'Name', Freight, 'New-Freight' = 1.1*Freight
from Orders o , Employees e , Customers c
where (o.EmployeeID = e.EmployeeID and c.CustomerID = o.CustomerID) and (YEAR(OrderDate)=1997 and MONTH(OrderDate)=4)

--15
select ProductID, UnitPrice, UnitsInStock, ProductName, SupplierID, Total = UnitPrice * UnitsInStock
from Products
where Discontinued = 1

--16
select TitleOfCourtesy + LEFT(LastName, 1)+' '+ FirstName as 'Name', HireDate, Title, BirthDate, HomePhone
from Employees
where YEAR(HireDate)<= 1993 
--17
select OrderID, OrderDate, CompanyName as 'Customer', LastName as 'Employee'
from Orders o , Employees e , Customers c
where (o.EmployeeID = e.EmployeeID and c.CustomerID = o.CustomerID) and MONTH(OrderDate)=4

--18
select OrderID, OrderDate, CompanyName as 'Customer', LastName as 'Employee'
from Orders o , Employees e , Customers c
where (o.EmployeeID = e.EmployeeID and c.CustomerID = o.CustomerID) and Year(OrderDate)%2 = 0

--19
select OrderID, OrderDate, CompanyName as 'Customer', LastName as 'Employee'
from Orders o , Employees e , Customers c
where (o.EmployeeID = e.EmployeeID and c.CustomerID = o.CustomerID) and DAY(OrderDate)IN (5,13,14,23)
--20
SELECT o.OrderID, ProductName, dt.UnitPrice, Quantity, Discount, dt.UnitPrice * Quantity as 'Thanh tien', dt.UnitPrice * Quantity * Discount as 'TienGiamGia', 
		(dt.UnitPrice * Quantity) - (dt.UnitPrice * Quantity * Discount) as 'TienPhaiTra' 	 
FROM [Order Details] dt, Orders o, Products p
WHERE dt.OrderID = o.OrderID and p.ProductID = dt.ProductID and YEAR(OrderDate)= 1997
 --21
 SELECT o.OrderID, ProductName, dt.UnitPrice, Quantity, Discount, dt.UnitPrice * Quantity as 'Thanh tien', dt.UnitPrice * Quantity * Discount as 'TienGiamGia', 
		(dt.UnitPrice * Quantity) - (dt.UnitPrice * Quantity * Discount) as 'TienPhaiTra' 	 
FROM [Order Details] dt, Orders o, Products p
WHERE dt.OrderID = o.OrderID and p.ProductID = dt.ProductID and YEAR(OrderDate)= 1997 and Discount > 0 
		and ((dt.UnitPrice * Quantity) - (dt.UnitPrice * Quantity * Discount)) < 50
 

