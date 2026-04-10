--Bai 1
select count (*) as total_products from products; 
select avg(price) as average_price from products;
select min(price) as lowest_price from products;
select max(price) as highest_price from products; 

--Bai 2
select suppliers.supplier_name, count(products.product_id) as soluong_sp from suppliers
join products
on suppliers.supplier_id = products.supplier_id
group by suppliers.supplier_name
having count(products.product_id) > 1;

--Bai 3
select order_id, TO_CHAR(order_date, 'DD/MM/YYYY') as ngaydathang
from orders
where extract( year from order_date) = 2025
and
extract(month from order_date) = 10; 

--Bai 4
select customers.full_name,
SUM(order_details.quantity * order_details.unit_price) as tong_tien_chi 
from customers
join orders
on customers.customer_id = orders.customer_id
join order_details
on orders.order_id = order_details.order_id
group by customers.full_name
having SUM(order_details.quantity * order_details.unit_price) > 100000
order by tong_tien_chi desc; 





















