-- 52 1.
SELECT p.firstname, p.middlename, p.lastname, pp.phonenumber, pnt.Name 
FROM person.Person p
JOIN Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID
JOIN Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
ORDER BY p.BusinessEntityID DESC;

-- 52 2.
Select Name,Rating,Comments
From Production.Product p
left Join Production.ProductReview pr on p.ProductID = pr.ProductID
order by Rating ASC

-- 52 3.
select Name,OrderQty,ScrappedQty
from Production.WorkOrder wo
right join Production.Product p ON wo.ProductID = p.ProductID
order by p.ProductID ASC

-- 59 1.

select c.CategoryName,COUNT(p.ProductID) as Total_Product
from Products p
join Categories c ON p.CategoryID = c.CategoryID 
group by c.CategoryName

-- 59 2.

select p.ProductName,Sum(od.UnitPrice * od.Quantity) as TotalValue
from Products p
join [Order Details] od on od.ProductID = p.ProductID
join Orders o ON od.OrderID = o.OrderID
where YEAR(o.OrderDate) = 1997
group by p.ProductName

-- 59 3.

select c.CompanyName, Sum(od.UnitPrice * od.Quantity) as TotalValue
from Orders o
join [Order Details] od ON o.OrderID = od.OrderID
join Customers c ON c.CustomerID = o.CustomerID
group by c.CompanyName
having Sum(od.UnitPrice * od.Quantity) > 5000

-- 59 4.

select c.CompanyName, Sum(od.UnitPrice * od.Quantity) as TotalValue , o.OrderDate
from Orders o
join [Order Details] od ON o.OrderID = od.OrderID
join Customers c ON c.CustomerID = o.CustomerID
group by c.CompanyName, o.OrderDate
having 
Sum(od.UnitPrice * od.Quantity) > 5000
AND MONTH(o.OrderDate) between 1 and 6
and year(o.OrderDate) = 1997

-- 59 5.

select c.CompanyName as buyer,s.CompanyName as supplier, Sum(od.UnitPrice * od.Quantity) as TotalValue
from Orders o
join [Order Details] od ON o.OrderID = od.OrderID
join Customers c ON c.CustomerID = o.CustomerID
join Products p ON od.ProductID = p.ProductID
join Suppliers s ON s.SupplierID = p.SupplierID
group by c.CompanyName,s.CompanyName
order by buyer,supplier


-- 59 6.
select s.CompanyName as supplier_name, p.ProductName, c.CompanyName as customer_name
from customers AS c
join Orders o ON o.CustomerID = c.CustomerID
join [Order Details] od ON od.OrderID = o.OrderID
join Products p ON p.ProductID = od.ProductID
join Suppliers s ON s.SupplierID = p.SupplierID
GROUP BY ROLLUP (s.CompanyName,  p.ProductName, c.CompanyName)

-- 59 7.
select s.CompanyName as supplier_name, p.ProductName, c.CompanyName as customer_name
from customers AS c
join Orders o ON o.CustomerID = c.CustomerID
join [Order Details] od ON od.OrderID = o.OrderID
join Products p ON p.ProductID = od.ProductID
join Suppliers s ON s.SupplierID = p.SupplierID
GROUP BY cube (s.CompanyName,  p.ProductName, c.CompanyName)

-- 62 1.
select Country
from Customers
Union
select Country
from Suppliers

--62 2.
select Country, 'Customers' as Kolom_asal
from Customers
UNION
select  Country, 'Supplier' as Kolom_asal
from Suppliers

--62 3.
select distinct City, COUNT(CustomerID) as total_customer
from Customers 
where city in (select City
from Suppliers)
group by city

--62 4.
select City
from Suppliers
where city not in (select City
from Customers)

--62 5.
select City,count(CustomerID) as Jumlah_Customer
from Customers
where city not in (select City
from Suppliers)
group by City

--66 1.
select c.CompanyName, o.OrderDate
from Customers c
right join Orders o ON o.CustomerID = c.CustomerID
where not exists(
	select 1
	from orders o
	where o.CustomerID = c.CustomerID
	and o.OrderDate between '1997-04-01' and '1997-04-30'
)

--66 2.
select s.CompanyName, o.OrderID , count(p.ProductID) as jumlah_order
from Suppliers s
join Products p ON p.SupplierID = s.SupplierID
join [Order Details] od ON od.ProductID = p.ProductID
join Orders o ON o.OrderID = od.OrderID
group by o.OrderID,s.CompanyName
having count(p.ProductID) = 1

--66 3.
select c.CompanyName,p.ProductName,sum(od.Quantity) as Total_Order
from Customers c
join Orders o ON o.CustomerID = c.CustomerID
join [Order Details] od ON od.OrderID = o.OrderID
join Products p ON p.ProductID = od.ProductID
group by c.CompanyName,p.ProductName
having sum(od.Quantity) > (
	select avg(od.Quantity) as avg_Order
	from Orders o
	join [Order Details] od ON o.OrderID = od.OrderID
)
--66 4.
select s.CompanyName,s.City
from Suppliers s 
where City in (
	select c.City
	from Customers c)

-- 92 1.
WITH CTE (SalesOrderID, TotalSalesAmount)
 AS-- Define the CTE query.
 (
    SELECT SalesOrderID, TotalDue
    FROM Sales.SalesOrderHeader
 )
-- Define the outer query referencing the CTE name.
SELECT SalesOrderID, TotalSalesAmount
FROM CTE
where TotalSalesAmount > 10000

-- 92 2.
WITH CTE (ProductID,ProductName,Total_Quantity_Order)
 AS-- Define the CTE query.
 (
    SELECT p.ProductID,p.Name,sum(sod.OrderQty) as total_qantity_order
    FROM Production.Product p
	join sales.SalesOrderDetail sod on sod.ProductID = p.ProductID
	group by p.ProductID,p.Name
 )
-- Define the outer query referencing the CTE name.
SELECT ProductID, ProductName, Total_Quantity_Order
FROM CTE
order by Total_Quantity_Order DESC

-- 92 3.
WITH CTE (SalesOrderID,OrderDate,Total_Sales_Amount)
 AS-- Define the CTE query.
 (
    SELECT sod.SalesOrderID, soh.OrderDate, soh.TotalDue
    FROM Sales.SalesOrderDetail sod
	join sales.SalesOrderHeader soh on soh.SalesOrderID = sod.SalesOrderID
	where year(soh.OrderDate) = 2012
 )
-- Define the outer query referencing the CTE name.
SELECT SalesOrderID, OrderDate, Total_Sales_Amount
FROM CTE