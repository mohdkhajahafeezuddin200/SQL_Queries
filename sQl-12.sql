-- filter out those product whose mrp is among the top 5 distinct mrp

select min(( select distinct(mrp)
from `e1.products`
order by MRP desc
limit 5))
from `e1.products`

-------------new concept --> in clause-----

select *
from `e1.products`
where (MRP = 4927) or (MRP = 4937) or (MRP = 4698) or (MRP = 4880) or (MRP = 4662) 


select *
from `e1.products`
where MRP in (4927,  4937 , 4698,  4880, 4662)  


select *
from `e1.products`
where MRP in (
              select distinct(mrp)
              from `e1.products` 
              order by MRP desc
              limit 5
            )

-- q.1
select *
from `e1.products`
where mrp in (
              select max(mrp)
              from `e1.products`
            )

select *
from `e1.products`
where mrp = (
              select max(mrp)
              from `e1.products`
            )

-- select *
-- from `e1.products`
-- where mrp in "4937"

-- q.2

select
  SupplierID,
  count(*) as no_of_pro_supply
from `e1.products`
group by SupplierID
having no_of_pro_supply>=5

select *
from `e1.products`
where SupplierID in (
                      select
                        SupplierID,
                      from `e1.products`
                      group by SupplierID
                      having count(*)>=5
                    )

-- q.3
select 
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders>=3

select 
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having count(*) >= 3
order by no_of_orders desc

-- q.
select *
from `e1.customers`
where CustomerID in (
                    select 
                      CustomerID,
                    from `e1.orders`
                    group by CustomerID
                    having count(*) >= 3
                    order by count(*) desc
                    )

-- adv q.
select
  SupplierID,
  count(*) as prd_cnt,
  avg(prd_cnt) as prd_supplied
from `e1.products`
group by SupplierID

select 
  SupplierID,
  count(*) as prd_cnt,
  sum(prd_cnt)/5 as avg_supplied_prd
from `e1.products`
group by SupplierID


-- wow!!

select
  avg(prd_cnt) as avg_supplied_prd
from (select 
  SupplierID,
  count(*) as prd_cnt
from `e1.products`
group by SupplierID)


select 
  count(*) as no_of_prd
from `e1.products`
having no_of_prd > (select
                    avg(prd_cnt) as avg_supplied_prd
                  from (select 
                          SupplierID,
                          count(*) as prd_cnt 
                  from `e1.products`
                  group by SupplierID)
)
