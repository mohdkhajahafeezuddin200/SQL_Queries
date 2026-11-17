-- q.1

select
  w.WarehouseID,
  w.Warehouse,
  count(distinct o.OrderID) as prd_handled,
  coalesce(sum(oi.Quantity),0) as total_qty,
  coalesce(sum(oi.total),0) as total_sales
from `e1.warehouses` as w
left join `e1.orders` as o
  on w.WarehouseID = o.WarehouseID
left join `e1.order_items` as oi
  on o.OrderID = oi.OrderID
group by 
  w.WarehouseID,
  w.Warehouse
having total_sales > 200000
order by total_sales desc


select * from `e1.warehouses`


-- q.2
why not avg(total) --> deno. differs


average customer spending

select
  o.CustomerID,
  sum(oi.Total) as total_sales
from `e1.order_items` as oi
inner join `e1.orders` as o
  on oi.OrderID = o.OrderID
group by o.CustomerID

-- resizing

select
  o.CustomerID,
  sum(oi.Total) as total_sales
from `e1.order_items` as oi
inner join `e1.orders` as o
  on oi.OrderID = o.OrderID
group by o.CustomerID
-- sub-sub-query
select
  avg(total_sales) as avg_spending
from (  select
    o.CustomerID,
    sum(oi.Total) as total_sales
  from `e1.order_items` as oi
  inner join `e1.orders` as o
    on oi.OrderID = o.OrderID
  group by o.CustomerID
)

select
  c.CustomerID,
  c.Name,
  sum(oi.total) as total_sales
from `e1.customers` as c
left join `e1.orders` as o
on c.CustomerID = o.CustomerID
left join `e1.order_items` as oi
on o.OrderID = oi.OrderID
group by 
  c.CustomerID,
  c.Name
having total_sales > (
  sum(oi.Total)/count(o.OrderID)
)
order by total_sales desc
-----finally.....done
select
  c.CustomerID,
  c.Name,
  sum(oi.total) as total_sales
from `e1.customers` as c
inner join `e1.orders` as o
  on c.CustomerID = o.CustomerID
inner join `e1.order_items` as oi
  on o.OrderID = oi.OrderID
group by 
  c.CustomerID,
  c.Name
having total_sales > (select
  avg(total_sales) as avg_spending
from (  select
    o.CustomerID,
    sum(oi.Total) as total_sales
  from `e1.order_items` as oi
  inner join `e1.orders` as o
    on oi.OrderID = o.OrderID
  group by o.CustomerID
  )
)
order by total_sales desc

-- q.
select 
  p.ProductID,
  sum(oi.total) as total_sales
from `e1.order_items` as oi
inner join `e1.products` as p
on p.ProductID = oi.ProductID
inner join `e1.categories` as c
on p.CategoryID = c.CategoryID
group by p.ProductID, c.CategoryID

select
  avg(total_sales) as avg_sales
from (select 
  p.ProductID,
  c.CategoryID,
  sum(oi.total) as total_sales
from `e1.order_items` as oi
inner join `e1.products` as p
on p.ProductID = oi.ProductID
inner join `e1.categories` as c
on p.CategoryID = c.CategoryID
group by p.ProductID, c.CategoryID)

select 
  p.ProductID,
  p.ProductName,
  c.CategoryName,
  sum(oi.total) as total_sales
from `e1.order_items` as oi
right join `e1.products` as p
on p.ProductID = oi.ProductID
right join `e1.categories` as c
on p.CategoryID= c.CategoryID
group by 
  p.ProductID,
  p.ProductName,
  c.CategoryName
having total_sales > (select
                            avg(total_sales) as avg_sales
                          from (select 
                            p.ProductID,
                            c.CategoryID,
                            sum(oi.total) as total_sales
                          from `e1.order_items` as oi
                          inner join `e1.products` as p
                          on p.ProductID = oi.ProductID
                          inner join `e1.categories` as c
                          on p.CategoryID = c.CategoryID
                          group by p.ProductID, c.CategoryID)
)
order by total_sales desc

-- q.

select
  o.OrderID,
  o.OrderDate,
  c.Name,
  sum(oi.total) as total_order_value,

from `e1.orders` as o
left  join `e1.order_items` as oi
on o.OrderID = oi.OrderID
inner join `e1.customers` as c
on o.Customerid = c.CustomerID
group by 
  o.OrderID,
  o.OrderDate,
  c.Name




-- case when statements
syntax:
case
  when condition1 then result1
  when condition2 then result2
  when condition3 then result3
  else default_result
end

-- practice q
select 
  CustomerID,
  age,
  Name,
  case
    when age>17 and Age<21 then "genz"
    when age>20 and age<41 then "adult"
    when age > 41 then "senior_city"
  end as age_group
from `e1.customers` 


    select 
      CustomerID,
      Gender,
      case
        when gender = "F" then "female"
        when gender = "M" then "male"
      end 
    from `e1.customers`

