--> find null, is not null
SELECT FirstName, MiddleName, LastName,
FirstName +' '+ MiddleName +' ' + LastName as FUllName
FROM Person.Person
where MiddleName is not NULL;

--> and
select * 
from HumanResources.Employee
where MaritalStatus = 'S' and Gender = 'F';

--> or
select * 
from HumanResources.Employee
where JobTitle = 'Design Engineer' or JobTitle = 'Research and Development Manager';

--> also or
select *
from HumanResources.Employee
where JobTitle IN ('Design Engineer','Research and Development Manager');

--> or
select *
from HumanResources.Employee
where BusinessEntityID IN (1,5,10, 15);

--> between
select *
from HumanResources.Employee
where BusinessEntityID between 1 and 10;

--> like, start with
select *
from Person.StateProvince 
where Name Like 'Ala%';

--> like, end with
select *
from Person.StateProvince 
where Name Like '%o';

--> like, end with 4 characters, 4*_
select *
from Person.StateProvince 
where Name Like 'Al____';

-->Order
-- sort by ascd
select  City, PostalCode
from Person.Address
ORDER by City;

--> sort by desc
select  City, PostalCode
from Person.Address
ORDER by City desc;

--> sort by desc and asc
select  FirstName, LastName, MiddleName
from Person.Person
Where MiddleName is not NULL
ORDER BY FirstName DESC,MiddleName asc, LastName ASC;

--> group by clause, sum
select SalesOrderID, SUM(UnitPrice) as 'Total Unit Price Per Sales'
from sales.SalesOrderDetail
group by SalesOrderID


--> group by clause, avg
select SalesOrderID, avg(UnitPrice) as 'average Unit Price Per Sales'
from sales.SalesOrderDetail
group by SalesOrderID


--> group by clause, count
select SalesOrderID, count(UnitPrice) as 'Times of Unit Price Per Sales'
from sales.SalesOrderDetail
group by SalesOrderID

--> group by clause, max, min
select SalesOrderID, 
max(UnitPrice) as 'max Unit Price Per Sales', 
min(UnitPrice) as 'min Unit Price Per Sales'
from sales.SalesOrderDetail
group by SalesOrderID


-->string function on SQL

SELECT FirstName, MiddleName, LastName,
		CONCAT(FirstName,' ', MiddleName,' ', LastName) as FullName
FROM Person.Person;

--> length function
SELECT FirstName, LEN(FirstName) as 'length'
FROM Person.Person;

--> left function
SELECT FirstName, LEFT(FirstName,2) as extractfromleft
FROM Person.Person;

--> right function
SELECT FirstName, RIGHT(FirstName,3) as extractfromright
FROM Person.Person;

--> substring function
SELECT FirstName, SUBSTRING(FirstName,3,4) as extractSubstring
FROM Person.Person;

-------->Date function
-->extract time by DAY(), MONTH(), YEAR()
select SalesOrderID, OrderDate, 
	DAY(OrderDate) as extractDay, 
	MONTH(OrderDate) as extractMonth,
	YEAR(OrderDate) as extractYear
from Sales.SalesOrderHeader;

-->select CURRENT_TIMESTAMP
select CURRENT_TIMESTAMP;

--> having clause, after group by, 
-->where cannot with sum() or other functions
select SalesOrderID, SUM(UnitPrice) as 'Total Unit Price Per Sales'
from sales.SalesOrderDetail
where SalesOrderID >50000
group by SalesOrderID
having sum(UnitPrice) >11111
order by SalesOrderID desc;

-->> FROM --> WHERE --> GROUP BY 
--> HAVING --> SELECT --> ORDER BY

-->use query inside another query, also called subquery
--> 'in' can be rplaced with '='
SELECT *
FROM Purchasing.PurchaseOrderHeader;

select PurchaseOrderID, EmployeeID
from Purchasing.PurchaseOrderHeader
where PurchaseOrderID in
(
SELECT PurchaseOrderID
FROM Purchasing.PurchaseOrderDetail
where PurchaseOrderDetailID =5
)

-->union operator, union all  will remove duplicate
select BusinessEntityID
from HumanResources.Employee
union all
select  BusinessEntityID
from Person.Person
union all
select CustomerID from Sales.Customer

-->inner join
select  pod.PurchaseOrderID as pod, pod.PurchaseOrderDetailID as poh,poh.OrderDate
from Purchasing.PurchaseOrderDetail pod
inner join 
	Purchasing.PurchaseOrderHeader poh
on pod.PurchaseOrderID = poh.PurchaseOrderID

-->left join, return null when no matching result
select p.BusinessEntityID, p.FirstName, p.LastName, bea.BusinessEntityID, bea.AddressID
from Person.Person p
left join 
Person.BusinessEntityAddress bea
on p.BusinessEntityID = bea.BusinessEntityID

-->right join, return null when no matching result
select p.BusinessEntityID, p.FirstName, p.LastName, 
		bea.BusinessEntityID, bea.AddressID
from Person.Person p
right join 
Person.BusinessEntityAddress bea
on p.BusinessEntityID = bea.BusinessEntityID

-->same as right join
select p.BusinessEntityID, p.FirstName, p.LastName, 
		bea.BusinessEntityID, bea.AddressID
from Person.Person p
right outer join 
Person.BusinessEntityAddress bea
on p.BusinessEntityID = bea.BusinessEntityID

--> full join= combination of left + right join
select p.BusinessEntityID, p.FirstName, p.LastName, bea.BusinessEntityID, bea.AddressID
from Person.Person p
full outer join 
Person.BusinessEntityAddress bea
on p.BusinessEntityID = bea.BusinessEntityID

--> data type
-->char and varchar is more popular

