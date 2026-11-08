select
  Status,
  count(*) as no_of_order,
  round(sum(count(*)* 100)/count(*) , 2) as total_order
from `e1.orders`
group by Status

-- select * from `e1.orders`
-- subquery - > query within a query

select
  Status,
  count(*) as no_of_order,
  count(*)*100/(select count(*) from `e1.orders`) as percentage
from `e1.orders`
group by Status
order by percentage desc
select * from `e1.order_items`

-- q.2
select
  ProductID,
  sum(Quantity) as total_qty,
  count(*) as no_of_order_items,
  sum(total) as total_sales
from `e1.order_items`
group by ProductID
order by total_qty desc
limit 5

-- q.3
select
  count(*) as no_of_items,
  sum(quantity) as total_quantity_sold,
  sum(total) as total_sale
from `e1.order_items`
where total > 2500
group by ProductID
having no_of_items >= 3

-- q.4
select
  ProductID,
  min(SellingPrice) as min_sp,
  max(SellingPrice) as max_sp,
  round(avg(SellingPrice) , 2) as avg_sp,
  count(*) as noOfOrderItems
from `e1.order_items`
group by ProductID
having min_sp > 1000
order by avg_sp desc
-- q.5
select 
  SupplierID,
  count(*) as prd_supplied,
  sum(select * from `e1.order_items`)
from `e1.products`

-- q.6
select 
  WarehouseID,
  count(distinct ProductID) as no_of_diff_stored,
  sum(stock) as total_stock,
  round(avg(stock) , 2) as avg_stock
from `e1.inventory`
group by WarehouseID
having no_of_diff_stored >=5 
order by total_stock desc

select * from `e1.inventory`
---------------Sub-Query
-- q,7
select
  ProductID,
from `e1.products`
where mrp > (select avg(mrp) as avg_mrp from `e1.products`)
-- group by ProductID


select
  ProductID,
from `e1.products`
where mrp > (
              select avg(mrp) 
              from `e1.products`
            )

-- q.

select *
from `e1.products`
where mrp< (
            select avg(mrp)
            from `e1.products`
          )

-- q.9
select
  *
from `e1.products`
where MRP  = (select max(mrp) from `e1.products`)

select distinct(MRP)
from `e1.products`
order by MRP desc
limit 5

select *
from `e1.products`
where MRP >= min(
                select distinct(MRP)
                from `e1.products`
                order by MRP desc
                limit 5
              )
