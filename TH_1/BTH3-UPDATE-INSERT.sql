--BTH3
--select
--1
SELECT * into CacKhachHangMy
FROM Customers
WHERE Country = 'USA'
--2
select TOP 5 e.EmployeeID, e.FirstName + ''+ e.LastName as 'Ho Ten', COUNT(o.OrderID)as 'SLDH'
INTO NamNVGioi
FROM Employees e, Orders o
where e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.FirstName + ''+ e.LastName
order by COUNT(o.OrderID) desc
--5
SELECT top 5 c.Country, COUNT(o.OrderID)as 'SLDH'
into NamQGItMuaHang
FROM Customers c, Orders o
where	c.CustomerID = o.CustomerID 
group by c.Country
order by COUNT(o.OrderID) 

--update

select * 
from KH

--1
UPDATE KH
SET COUNTRY=N'My'
WHERE country = 'USA'
--2
update KH
SET Country =(
		Case Country
			when 'Germany' then N'Duc'
			else N'Phap'
		end
)
WHERE COUNTRY IN ('Germany', 'France')

--3
select * into NCC from Suppliers

update NCC
SET Country =(
		Case Country
			when 'Germany' then N'Duc'
			else N'Phap'
		end
)
WHERE COUNTRY IN ('Germany', 'France')
--4
select * into LoaiSP from Categories

update LoaiSP
set CategoryName = (
			case CategoryName
				when 'Beverages' then N'nuoc giai khat'
				else 'GIA VI'
			end
)
where CategoryName in ('Beverages','Condiments')
--5
update LoaiSP
set CategoryName = (
			case CategoryName
				when 'Confections' then N'banh keo'
				else 'hai san'
			end
)
where CategoryName in ('Confections','Seafood')

--6
select * into KH from Customers
update KH
SET PostalCode = REPLACE(Postalcode,LEFT(PostalCode, 2), 18)
WHERE COUNTRY = 'Germany'
select * from KH 
order by Country


--INSERT INTO
INSERT INTO LoaiSP(CategoryName, Description)
Values (N'Van phong pham', N'sach, vo, giay, but, muc'),
(N'Van phong pham', N'sach, vo, giay, but, muc')

select * into KH1 from Customers

--INSERT INTO SELECT
delete from KH1

Insert into KH1
SELECT * FROM KH where country = 'USA' 