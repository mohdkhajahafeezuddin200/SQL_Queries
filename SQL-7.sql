-----------------------New Concepts------------------------------

-- top 10 highest paying customers
order by

-- default --> asc
-- select ..
-- from table ..
-- order by column(s)

-- products from lowest sellingprice to highest

select * from `e1.order_items`

select
  distinct(ProductID),
  SellingPrice
from `e1.order_items`
order by SellingPrice

-- most expensive product 1st

select * from `e1.products`

select
  ProductID,
  SellingPrice
from `e1.products`
order by SellingPrice desc

-- oldest customers -> youngest customer(age)
select * from `e1.customers`

select
  Name,
  Age
from `e1.customers`
order by Age desc

select
  Name,
  Age
from `e1.customers`
order by Age asc

-- show top 10 most expensive products
select
  ProductID,
  SellingPrice
from `e1.products`
order by SellingPrice desc
limit 10

-- 10 least expensive sp products
select *
from `e1.products`
order by SellingPrice
limit 10

-- display all products alphabatically
select
  ProductName
from `e1.products`
order by ProductName asc

select * 
from `e1.customers`
order by Age asc

-- which inventory record has lowest stock
select * from `e1.inventory`

select *
from `e1.inventory`
order by stock asc

-- top 5 most valuable payments
select * 
from `e1.payments`
order by amount desc
limit 5

-- sorting order items by sales values

select 
  OrderID,
  ProductID,
  Total
from `e1.order_items`
order by total desc

-- show highest rated  review
select *
from `e1.reviews`
order by rating desc

-- show products with mrp> 1000 starring from most expensive
select *
from `e1.products` 
where mrp > 1000
order by MRP desc

-- 5 cheapest product whose mrp is above 700
select *
from `e1.products`
where mrp > 700
order by mrp asc
limit 5

-- suppliers with largest catalog 1st
select * 
from `e1.products`

alter table `e1.warehouses`
rename column string_field_0 to WarehouseID
alter table `e1.warehouses`
rename column string_field_1 to Warehouse

select * from `e1.warehouses` limit 5


select 
  SupplierID,
  count(*) as catalog_size
from `e1.products`
group by SupplierID
order by catalog_size desc

-- which 5 suppl 
select 
  SupplierID,
  count(*) as catalog_size
from `e1.products`
group by SupplierID
order by catalog_size desc
limit 5

-- top 5 products by total sales

select 
  ProductID,
  sum(Total) as total_sales
from `e1.order_items`
group by ProductID
order by total_sales desc
limit 5

-- sort products by category 1st, and within eavh cat, sort by sp from highest to lowest 

select *
from `e1.products`
order by CategoryID, SellingPrice desc

select *
from `e1.products`
order by CategoryID asc, SellingPrice desc
-- HW
select *
from `e1.products`
order by   SellingPrice desc ,CategoryID
