-- q.product wise sales with product names

select
  p.ProductName,
  sum(oi.total) as total_sales_per_prd
from `e1.products` as p
join `e1.order_items` as oi
on p.ProductID = oi.ProductID
group by p.ProductID,p.ProductName
order by total_sales_per_prd desc


-- -- m-2
-- select 
--   ProductName,
--   (MRP* SellingPrice) as total_sales_per_prd
-- from `e1.products`
-- group by ProductName,MRP,SellingPrice

-- q.2
select *
from `e1.customers`

select *
from `e1.order_items`

select 
  c.Name,
  sum(oi.Total) as sales_custname
from `e1.customers` as c
inner join `e1.orders` as o
on c.CustomerID = o.CustomerID
from `e1.orders` as  o
join `e1.order_items` as oi
on o.OrderID= oi.OrderID
group by c.Name

-- q.3
select 
  c.CategoryName,
  sum(oi.Total) as sales_custname
from `e1.products` as p
inner join `e1.order_items` as oi
on oi.ProductID = p.ProductID
join `e1.categories` as c
on p.CategoryID = c.CategoryID
group by c.CategoryName
order by sales_custname desc

select * from `e1.products`

-- q.4
select
  s.supplierID,
  p.ProductID,
  sum(oi.total) as total_sales
from `e1.products` as p
inner join `e1.order_items` as oi
on p.ProductID= oi.ProductID
inner join `e1.suppliers` as s
on s.supplierID = p.SupplierID
group by s.supplierID, p.ProductID
order by total_sales desc

