
-- select * 
-- from `e1.employees`
-- limit 6

-- how many different products are there overall
select 
  count(distinct ProductName) as diff_products
from `e1.products`

select 
  distinct ProductName
from `e1.products`

-- how many products are there in each category
select
  CategoryID,
  count(*) as product_cat
from `e1.products`
group by CategoryID

-- how many units of each product sold

select
  ProductID,
  sum(Quantity) as units_sold
from `e1.order_items`
group by ProductID

-- what is total sales value by each procduct

select
  ProductID,
  sum(Total) as total_sales
from `e1.order_items`
group by ProductID

-- what is the avg selling priceat which each product were sold?

select
  ProductID,
  avg(SellingPrice) as avg_selling_price
from `e1.order_items`
group by ProductID

-- what is lowest and highest selling price
select
  ProductID,
  max(SellingPrice) as high_sp,
  min(SellingPrice) as low_sp
from `e1.order_items`
group by ProductID

-- for each of order status what is the no.of orders for each customers

select
  CustomerID,
  Status
from `e1.orders`
where CustomerID = "C088"

select
  CustomerID,
  Status,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID, Status

-- how many inventory records are made for each warehouse

select * from `e1.inventory`

select
  WarehouseID,
  count(*) as count_inv
from `e1.inventory`
group by WarehouseID

-- how many oders are handled by each of employees for each Status

select * from `e1.orders`

select
  EmployeeID,
  Status,
  count(*) as no_0f_orders
from `e1.orders`
group by Status, EmployeeID

select 
  EmployeeID,
  count(distinct EmployeeID) as no_of_employees
from `e1.orders`
group by EmployeeID

-- how many products in each category has mrp above 20,000

select
  CategoryID,
  count(*) as no_of_products
from `e1.products`
where MRP > 20000
group by CategoryID


select * from `e1.products`

select
  CategoryID,
  count(*) as no_of_products
from `e1.products`
where MRP > 2000
group by CategoryID

-- what is total qty sold foe each product where qty > 1
select * from `e1.order_items`


select
  ProductID,
  sum(Quantity) as total_qty
from `e1.order_items`
where Quantity > 1
group by ProductID

-- what is avg payment for each payment method among successful payments

select * from `e1.payments`

select
  Method,
  avg(Amount) as avg_payment
from `e1.payments`
where Status = "Success"
group by Method

select
  Method,
  round(avg(Amount) , 2) as avg_payment
from `e1.payments`
where Status = "Success"
group by Method

select
--  distinct Status,
 count(distinct Status) as types
from `e1.payments`




