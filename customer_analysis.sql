select *
from `e1.products`
limit 6

-- select *
-- from `e1.customers`
-- limit 5


-- show the names of all customers(specific constumer) and all rows of a column

select Name
from `e1.customers`

-- show customers cities

select City
from `e1.customers`

-- finance team wants to see payments methods

select *
from `e1.payments`
limit 7


select Method
from `e1.payments`

-- Hr wants employee names

select *
from `e1.employees`
limit 4

select string_field_1
from `e1.employees` 

select Name
from `e1.employees` 

-- to change the  col name

Alter table `e1.employees`
rename column string_field_0 to EmployeeID


Alter table `e1.employees`
rename column string_field_1 to Name

Alter table `e1.employees`
rename column string_field_2 to Department

-- to delete a row

delete from `e1.employees`
where EmployeeID = "EmployeeID"

-- accessing multiple cols at once

select *
from `e1.products`

-- we want productid and name

select ProductID , ProductName
from `e1.products`

select * from `e1.orders`

-- companies standard

select
  ProductID ,
  ProductName
from `e1.products`



select
   ProductName,
   ProductID 
from `e1.products`

-- fetching 3 cols

select 
  ProductID,
  ProductName,
  CategoryID
from `e1.products`
limit 10

select name
from `e1.customers`

select name
from customers

select sellingprice
from `e1.products`

select 
  Name,
  City
from `e1.customers`

-- to change the items of a col to another col

select 
  Name
  City
from `e1.customers`

-- to see differnt cities only
select distinct city
from `e1.customers`

-- different payment methods?

select distinct Method
from `e1.payments`

-- different states

select * from `e1.suppliers`

select distinct state
from `e1.suppliers`

ALter table `e1.suppliers`
rename column  string_field_2 to state


ALter table `e1.suppliers`
rename column  string_field_1 to suppliername


ALter table `e1.suppliers`
rename column  string_field_0 to supplierID

-- differnt brands

-- types of disitnct

-- numerical col == amount in payments

select *
from `e1.payments`

-- how many distinct amounts do we have?

-- ans 273

select distinct amount
from `e1.payments`

-- applying distinct on multiple columns

-- distict age & city
select *
from `e1.customers`

select distinct age,city
from `e1.customers`

-- on which dates atleast one customer signed up

select SignupDate
from `e1.customers`


select distinct SignupDate
from `e1.customers`

-- what are unique combination of paymentmethod and status

select distinct method,status
from `e1.payments`

