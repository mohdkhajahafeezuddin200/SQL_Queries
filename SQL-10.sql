-- q.1
select
  SupplierID,
  count(*) as no_of_products,
  avg(MRP) as avg_mrp,
  max(MRP) as max_mrp
from `e1.products`
group by SupplierID
having no_of_products >= 3
order by no_of_products desc

-- q.2
select
  CategoryID,
  count(*) as no_of_products,
  avg(MRP) as avg_mrp,
  max(mrp) as max_mrp
from `e1.products`
group by CategoryID
having avg_mrp > 150
order by avg_mrp desc

select
  CategoryID,
  count(*) as no_of_products,
  avg(MRP) as avg_mrp,
  max(mrp) as max_mrp
from `e1.products`
group by CategoryID
having avg_mrp > 15000
order by avg_mrp desc

-- q.3
select
  ProductID,
  sum(Quantity) as total_qty,
  sum(total) as total_sales
from `e1.order_items`
group by ProductID
having
  total_qty>=10 and
  total_sales > 100000
order by total_sales desc

-- q.4

select
  ProductID,
  ProductName,
  MRP,
  SellingPrice,
  (MRP - SellingPrice) as discount_amt
from `e1.products`
where SellingPrice < MRP
order by discount_amt desc

p1 --> 2k discount
p2 --> 1k discount mrp/selling
100000 --> 98000
2000-->1000

-- q.5

select
  ProductID,
  ProductName,
  MRP,
  SellingPrice,
  round(((mrp-SellingPrice)/MRP)*100 , 2) as discount_percentage
from `e1.products`
where SellingPrice < MRP
group by 
  ProductID,
  ProductName,
  MRP,
  SellingPrice
having discount_percentage >= 10
order by discount_percentage desc

select
  ProductID,
  ProductName,
  MRP,
  SellingPrice,
  round(((mrp-SellingPrice)/MRP)*100 , 2) as discount_percentage
from `e1.products`
where  round(((mrp-SellingPrice)/MRP)*100 , 2)>= 10
order by discount_percentage desc
-- q.6

select
  Method,
  count(*) as successful_transaction,
  sum(Amount) as total_amt,
  round(avg(Amount), 2) as avg_amt,
  max(Amount) as max_amt
from `e1.payments`
where Status = "Success"
group by Method
having total_amt >100000

-- q.7
select 
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders>=4 and no_of_orders<=8
order by no_of_orders desc
limit 10

select 
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders between 4 and 8
order by no_of_orders desc
limit 10
-- between is inlucsive
select 
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders between 4 and 8
order by no_of_orders desc
-- limit 10

-- q.8

select
  WarehouseID,
  sum(stock) as total_stock,
  avg(stock) as avg_stock,
  max(stock) as mx_stock,
  min(stock) as mn_stock
from `e1.inventory`
group by WarehouseID
having total_stock > 500
order by total_stock desc

select
  WarehouseID,
  sum(stock) as total_stock,
  round(avg(stock), 2) as avg_stock,
  max(stock) as mx_stock,
  min(stock) as mn_stock
from `e1.inventory`
group by WarehouseID
having total_stock > 500
order by total_stock desc

-- q.9
select
  ProductID,
  count(*) as no_of_inventory,
  min(stock) as min_stock,
  max(stock) as max_stock
from `e1.inventory`
group by ProductID 
having min_stock<20

