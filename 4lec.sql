
-- how many different cities do the customers belong to

select * from `e1.customers`

select count(distinct city)
from `e1.customers`


select distinct city
from `e1.customers`

select * from `e1.products`
-- limit 4

q.1
-- how many diff product doe we have

select count(*)
from `e1.products`

-- how many customers are from mumbai

select count(City)
from `e1.customers`
where city = "Mumbai"

select *
from `e1.customers`
where city = "Mumbai"

-- count no.of diff customers 

select count(distinct Name)
from `e1.customers`
-- calculates no.of rows

select count(*)
from `e1.customers`

--count(column) cla number of non-null values in that column

select count(name)
from `e1.customers`


-- how mant diff supplier state exist
\
select * from `e1.suppliers`

select count(distinct state)
from `e1.suppliers`

-- tota; sales  values

select * from `e1.order_items`

select count(*)
from `e1.order_items`

-- aggregation sum

select sum(Total)
from `e1.order_items`

-- how many individual productt units were sold 

select sum(quantity)
from `e1.order_items`

-- total quantity sold where order items quam >1

select sum(quantity)
from `e1.order_items`
where quantity > 1

select *
from `e1.order_items`
where quantity  =3




