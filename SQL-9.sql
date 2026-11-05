-- displat suppid & no.of pro supplied by each supp
-- show supp with highest pro 1st

select
  SupplierID,
  count(*) as prd_cnt
from `e1.products` 
group by SupplierID
order by prd_cnt desc

-- q2.
select
  ProductID,
  sum(Total) as total_sales
from `e1.order_items`
group by ProductID
order by total_sales desc
limit 10

-- q.3
select
  ProductID,
  sum(total) as total_sales
from `e1.order_items`
group by ProductID
having total_sales > 50000
order by total_sales desc 

-- q4. calcul no.of transaction total payment for each method where status = "success" and in descending
select
  Method,
  count(*) as no_of_transaction,
  sum(Amount) as total_payment
from `e1.payments`
where Status = "Success"
group by Method
order by total_payment desc

-- q.5 display customers with no.of products > 3

select 
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders > 3
order by no_of_orders desc

-- q.6 pro whose mrp > 20000 and for each cate display hhaving > 2
select 
  CategoryID,
  count(*) as pro_cnt
from `e1.products`
where MRP > 2000
group by CategoryID
having pro_cnt > 2
order by pro_cnt desc

-- q.7
select 
  WarehouseID,
  sum(stock) as total_stock,
  avg(stock) as avg_stock,
  max(stock) as max_stock,
  min(stock) as min_stock
from `e1.inventory`
group by WarehouseID
order by total_stock desc

select 
  WarehouseID,
  sum(stock) as total_stock,
  round(avg(stock), 3) as avg_stock,
  max(stock) as max_stock,
  min(stock) as min_stock
from `e1.inventory`
group by WarehouseID
order by total_stock desc

-- q.8 for every status, count total orders display most common one 1st
select
  Status,
  count(*) as no_of_orders
from `e1.orders`
group by Status
order by no_of_orders desc

-- q.9
select
  count(*) as no_of_orderitems,
  sum(Quantity) as total_qty,
  sum(Total) as total_sales,
  avg(SellingPrice) as avg_sp
from `e1.order_items`
where SellingPrice>10000
group by ProductID
having total_sales > 50000
order by total_sales desc

