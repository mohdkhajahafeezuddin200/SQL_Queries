-- which method represents highest payment amtyt

select 
  Method,
  sum(Amount) as total_payment_amt
from `e1.payments`
group by Method
order by total_payment_amt desc

-- sort customers by city alphaba.. , within each city sort them from oldest to youngest

select *
from `e1.customers`
order by City asc , age desc

-- display the supplierid's with high no.of prod 1st if tied hihgavg sp 1st

select 
  SupplierID,
  count(*) as no_of_products,
  avg(SellingPrice) as avg_sp
from `e1.products`
group by SupplierID 
order by no_of_products desc , avg_sp desc

-- ques practice-----------------------AJ sir special-----

select 
  SupplierID,
  count(*) as count_products
from `e1.products`
where mrp>1000
group by SupplierID
having count_products > 2
order by count_products desc 
limit 5
 
-- product by category 1, within each category sort by sp from high to low
select 
  ProductID,
  CategoryID,
  SellingPrice
from `e1.products`
order by CategoryID, SellingPrice desc

select 
  ProductName
from `e1.products`
where mrp> 20000

-- suppliers with > 3 products

select
  SupplierID,
  count(*) as prd_cnt
from `e1.products`
group by SupplierID
having prd_cnt>3

select
  SupplierID,
  count(*) as prd_cnt
from `e1.products`
group by SupplierID
having prd_cnt>3

-- whivh cus have placed > 5 prod?
select
  CustomerID,
  count(*) as order_placed
from `e1.orders`
group by CustomerID
having order_placed > 5

-- suppliers with 2 or fewer product?
select 
  SupplierID,
  count(*) as supplier_prd
from `e1.products`
group by SupplierID
having supplier_prd <= 2

-- products whose sales is > 50k
select 
  ProductID,
  sum(Total) as prd_sales
from `e1.order_items`
group by ProductID
having prd_sales > 50000
-- order by prd_sales desc

select
  SupplierID,
  count(*) as prd_cnt
from `e1.products`
where mrp > 10000
group by SupplierID
having prd_cnt > 2
order by prd_cnt desc
limit 5

