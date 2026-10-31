-- select *
-- from `e1.categories`

alter table `e1.categories`
rename column string_field_0 to CategoryID

alter table `e1.categories`
rename column string_field_1 to CategoryName

-- recap lec 2

delete from `e1.categories`
where CategoryID = "CategoryID"

select *
from `e1.customers`
limit 5

select distinct CustomerID  -- doesn't make sense
-- this is known as primary key
from `e1.customers`

-------------------------------------------------------lec start--------------------------------------------------------------------------


-- give information of customer with id c014

select *
from `e1.customers`
where CustomerID = "C014"

-------------------syntax
select col1, col2, ..
from table_name
where condition

select
  CustomerID,
  Name,
  Gender
from `e1.customers`
where CustomerID = "C014"

-- customers who spent > 100000  this will need join concept
select *
from `e1.payments`


select *
from `e1.payments`
where Amount = 100000

select city , Name
from `e1.customers`

-- all product cateegories

select CategoryID
from `e1.products`


select distinct CategoryID
from `e1.products`

select CategoryName
from `e1.categories`

-- display cuustomers from nagpur

select
  CustomerID,
  City
from `e1.customers`
where city= "Nagpur"

select *
from `e1.customers`
where gender =  "F"

select 
from `e1.customers`
where gender =  "M"

select *
from `e1.customers`
where age >= 30

prodducts costing at most 50000

select *
from `e1.products`
where SellingPrice <= 50000

select *
from `e1.orders`
limit 6

-- delivered orders

select *
from `e1.orders`
where Status = "Delivered"

select distinct Status
from `e1.orders`

select *
from `e1.orders`
where Status = "delivered"  -- case sensitive

-- orders not delivered
select *
from `e1.orders`
where status= "Cancelled" or Status = "Shipped"

method-2

select *
from `e1.orders`
where Status != "Delivered"

-- total customers --> 100

select Name
from `e1.customers`

select count(*)  --- count no.of rows
from `e1.customers` 

-- count cus from mumbai --> 20

select count(*)
from `e1.customers`
where city = "Mumbai"

select *
from `e1.customers`
where city = "Mumbai"

select *
from `e1.customers`
where department = "Operations"

select * from `e1.suppliers`


select *
from `e1.products`
where supplierID = "SUP003"

select * from `e1.inventory`

select *
from `e1.inventory`
where stock < 30

-- find all customers who signed up after 2023-1-1

select * from `e1.customers`

select *
from `e1.customers`
where SignupDate > "2023-01-01"

-- count how many diff prodeuct cat exsit in pro table

select * from `e1.products`

select count( distinct CategoryID)
from `e1.products`
