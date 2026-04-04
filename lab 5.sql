--Bai 1:
--1
select order_details.order_id, products.product_name, order_details.quantity, products.price
from order_details
inner join products
on order_details.product_id = products.product_id
--2
select customers.full_name, orders.order_id 
from customers
left join orders
on customers.customer_id = orders.customer_id

--Bai 2:
--1
select order_details.order_id, products.product_name
from order_details
right join products
on order_details.product_id = products. product_id
--2
select full_name as contact_name, phone as PhoneNumber from customers
union
select supplier_name as contact_name, contact_info as PhoneNumber from suppliers

--Bai 3
 
--1
select product_name, price
from products
where supplier_id in (
select supplier_id from suppliers where supplier_name = 'Công ty sữa Việt Nam')
--2
select product_name, 
price,
(select AVG(price) from products) as average_price
from products;

--Bai 4
--1
select order_id, total_value from (
select order_id,
SUM(quantity * unit_price) as total_value from order_details
group by order_id) 
as order_sum 
where total_value > 50000; 
--2
select supplier_name 
from suppliers
where exists (
select 1 from products where products.supplier_id = suppliers.supplier_id
); 






