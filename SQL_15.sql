-- q.1

select
  p.ProductID,
  p.ProductName,
  sum(oi.total) as total_sales
from `e1.products` as p
inner join `e1.order_items` as oi
on p.ProductID= oi.ProductID
group by p.ProductID, p.ProductName
order by total_sales desc

-- q.2 find product with no sales
-- select
--   p.ProductName,
--   sum(total) as total_sale
-- from `e1.products` as p
-- inner join `e1.order_items` as o
-- on p.ProductID = o.ProductID
-- group by p.ProductName
-- having total_sale = 0

-- actual method
left and right table--???
left is from .....
right is after join..
misssing values--> null

select
  p.ProductID,
  p.ProductName
from `e1.products` as p
left join `e1.order_items` as oi
on p.ProductID = oi.ProductID
group by p.ProductID,p.ProductName
having sum(oi.total) is null

-- customers sho refidter but no order placed
select * from `e1.customers`
select * from `e1.orders`

select
  c.CustomerID,
  c.Name,
  o.OrderID
from `e1.customers` as c
left join `e1.orders` as o
on c.CustomerID= o.CustomerID
where o.OrderID is null
group by c.CustomerID,c.Name, o.OrderID

-- q.
select
  c.CustomerID,
  count(*) as no_of_orders
from `e1.customers` as c
left join `e1.orders` as o
on c.CustomerID = o.CustomerID
where o.OrderID is null
group by c.CustomerID

-- q.\
select
  c.CustomerID,
  c.Name,
  count(o.OrderID) as no_of_order 
from `e1.customers` as c
left join `e1.orders` as o
on c.CustomerID = o.CustomerID
group by c.CustomerID,c.Name
order by count(o.OrderID) asc

-- with right join
select
  c.CustomerID,
  c.Name,
  count(o.OrderID) as no_of_order 
from `e1.orders` as o
right join `e1.customers` as c
on c.CustomerID = o.CustomerID
group by c.CustomerID,c.Name
order by count(o.OrderID) asc

select * from `e1.payments`
-- q.adv\\

select
  c.CustomerID,
  c.Name,
  count(o.OrderID) as no_of_orders,
  sum(p.amount) as total_payments
from `e1.customers` as c
inner join `e1.orders` as o
on c.CustomerID = o.CustomerID
inner join `e1.payments` as p
on p.OrderID  = o.OrderID
where p.status = "Success"
group by c.CustomerID,c.Name
having total_payments > 50000
order by total_payments desc
