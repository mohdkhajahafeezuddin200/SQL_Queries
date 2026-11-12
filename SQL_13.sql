
-- adv q. continue



-- "show me product name and category name" --> join clause
select
  CategoryID,
  categoryname
from `e1.categories`

select
  ProductName
from `e1.products`
where CategoryID in (select
  CategoryID,
from `e1.categories`)

product -- productName
likage : category id
categories --> categoryname


tableName.columnName

  Syntax:
select
from table1
join table2
on table1.key = table2.key


-- q.
select *
from `e1.products`
join `e1.categories`
on `e1.products`.CategoryID = `e1.categories`.CategoryID

select *
from `e1.products`
join `e1.categories`
on  `e1.categories`.CategoryID = `e1.products`.CategoryID 

select *
from `e1.products`
join `e1.categories`
on products.CategoryID = categories.CategoryID


select *
from `e1.categories`
join `e1.products`
on  `e1.categories`.CategoryID = `e1.products`.CategoryID 


select *
from `e1.products` as p
join `e1.categories` as c
on p.CategoryID = c.CategoryID

select 
  p.ProductID,
  p.ProductName,
  c.CategoryID,
  c.CategoryName
from `e1.products` as p
inner join `e1.categories` as c
on p.CategoryID = c.CategoryID

  join by default is inner join

-- q.
select
  p.ProductID,
  p.ProductName,
  c.CategoryID,
  c.CategoryName
from `e1.products` as p
join `e1.categories` as c
on c.CategoryID  = p.CategoryID
where c.CategoryName = "Electronics"

-- q.2
select
  p.CategoryID,
  p.ProductName,
  c.CategoryName,
  p.mrp
from `e1.products` as p
join `e1.categories` as c
on c.CategoryID = p.CategoryID
order by p.MRP desc
-- select * from `e1.products`
-- q.3
select
  p.ProductName,
  c.CategoryName,
  (MRP - SellingPrice) as discount_amount
from `e1.products` as p
join `e1.categories` as c
on c.CategoryID = p.CategoryID

-- q.4
select
  p.ProductName,
  p.ProductID,
  s.suppliername,
  s.state
from `e1.products` as p
join `e1.suppliers` as s
on p.SupplierID = s.supplierID

-- q.5
-- select * from `e1.orders`

select
  o.Status,
  c.City,
  c.Name,
  o.CustomerID
from `e1.orders` as  o
join `e1.customers` as c
on o.CustomerID = c.CustomerID
where o.Status = "Delivered"

select *
from `e1.orders`

-- crirtical thinking question.
select
  o.OrderID,
  sum(p.Total) as total_sales_per_order
from `e1.order_items` as p
inner join `e1.orders` as o
on p.OrderID = o.OrderID
group by o.OrderID
order by total_sales_per_order desc


-- q.
select
  o.CustomerID,
  sum(p.Total) as total_sales_per_customer
from `e1.customers` as c
inner join `e1.orders` as o
on p.OrderID = o.OrderID
group by o.CustomerID

select * from `e1.customers`
select * from `e1.order_items`

 customernmae - customers table
 total sales --> order_items 
  no linkage
 
i  will take 3rd table (orders table) as linkage


customerid -> customers+`e1.orders`

orderid -> orders+ order_item 's 2 joins

select
  c.CustomerID,
  sum(oi.Total) as total_sale
from `e1.customers` as c
inner join `e1.orders` as o
on c.CustomerID= o.CustomerID
inner join `e1.order_items` as oi
on o.OrderID = o.OrderID
group by c.CustomerID
order by total_sale desc
