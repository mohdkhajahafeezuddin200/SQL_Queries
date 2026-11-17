
-- q.
select
  c.CustomerID,
  c.Name,
  count(o.OrderID) as no_of_order,
  sum(p.Amount) as total_pay
from `e1.customers` as c
inner join `e1.orders` as o
on c.CustomerID = o.CustomerID
inner join `e1.payments` as p
on p.OrderID = o.OrderID
where p.Status = "Success"
group by c.CustomerID,c.Name
having total_pay > 50000
order by total_pay desc

select * from `e1.products`
select * from `e1.order_items`

-- q.2
select
  p.ProductID,
  p.ProductName,
  c.CategoryName,
  s.suppliername,
  count(oi.OrderID) as no_of_records,
  sum(oi.Quantity) as total_qty,
  sum(oi.Total) as sales,
  avg(oi.SellingPrice) as avg_sp
from `e1.products` as p
join `e1.categories` as c
  on p.CategoryID = c.CategoryID
inner join `e1.suppliers` as s
  on p.SupplierID = s.supplierID
inner join `e1.order_items` as oi
  on p.ProductID = oi.ProductID
group by 
  p.ProductID, 
  p.ProductName, 
  c.CategoryName,
  s.suppliername
having sales > 100000
order by sales desc
limit 10

-- q.
select
  c.CategoryID,
  c.CategoryName,
  count(p.ProductID) as qualifying_prd,
  avg(p.mrp) as avg_mrp,
  max(p.mrp) as max_mrp,
  min(p.mrp) as min_mrp
from `e1.products` as p
inner join `e1.categories` as c
  on c.CategoryID  = p.CategoryID
where p.MRP>2000
group by
  c.CategoryID,
  c.CategoryName
having qualifying_prd>2
order by avg_mrp desc

select * from `e1.suppliers`

select
  c.CategoryID,
  c.CategoryName,
  count(p.ProductID) as qualifying_prd,
  round(avg(p.mrp) ,2) as avg_mrp, 
  max(p.mrp) as max_mrp,
  min(p.mrp) as min_mrp
from `e1.products` as p
inner join `e1.categories` as c
  on c.CategoryID  = p.CategoryID
where p.MRP>2000
group by
  c.CategoryID,
  c.CategoryName
having qualifying_prd>2
order by avg_mrp desc

-- q.3
select
  c.CustomerID,
  c.Name,
  c.City,
  o.OrderID
from `e1.customers` as c
left join `e1.orders` as o
on c.CustomerID = o.CustomerID
where o.OrderID is null
group by
  c.CustomerID,
  c.Name,
  c.City,
  o.OrderID
order by c.Name asc

-- q.4
select
  s.supplierID,
  s.suppliername,
  count(*) as supplied_prd,
  avg(p.mrp) as avg_mrp,
  sum(oi.total) as sales,
  sum(oi.quantity) as total_qty
from `e1.suppliers` as s
left join `e1.products` as p
  on s.supplierID = p.SupplierID
inner join `e1.order_items` as oi
  on oi.ProductID = p.ProductID
where s.supplierID is null
group by
  s.supplierID,
  s.suppliername
order by sales desc
----new concept (coalesce)
select
  s.supplierID,
  s.suppliername,
  count(distinct p.ProductID) as no_of_prds,
  round(avg(p.mrp),3) as avg_mrp,
  coalesce(sum(oi.total),0) as sales,
  coalesce(sum(oi.quantity),0) as total_qty
from `e1.suppliers` as s
left join `e1.products` as p
  on s.supplierID = p.SupplierID
left join `e1.order_items` as oi
  on oi.ProductID = p.ProductID
group by
  s.supplierID,
  s.suppliername
order by sales desc


select
  s.supplierID,
  s.suppliername,
  count(distinct p.ProductID) as no_of_prds,
  avg(p.mrp) as avg_mrp,
  coalesce(sum(oi.total),0) as sales,
  coalesce(sum(oi.quantity),0) as total_qty
from `e1.suppliers` as s
left join `e1.products` as p
  on s.supplierID = p.SupplierID
left join `e1.order_items` as oi
  on oi.ProductID = p.ProductID
group by
  s.supplierID,
  s.suppliername
order by sales desc

--hw in next trend...

select * from `e1.products`
