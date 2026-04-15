--Bai 1
select products.product_name, avg(price) as avg_price from products group by product_name;
SELECT 
    product_name, 
    price, 
    AVG(price) OVER () AS avg_overall_price
FROM products;
--Bai 2
SELECT 
    category_id,
    product_name,
    price,
    AVG(price) OVER (PARTITION BY category_id) AS avg_category_price
FROM products;
--Bai 3
UPDATE products SET price = 35000 WHERE product_id IN (1, 2);
SELECT 
    product_name, 
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num,
    RANK() OVER (ORDER BY price DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY price DESC) AS dense_rank_num
FROM products
ORDER BY price DESC;
--Bai 4
WITH daily_revenue AS (
    -- Bước 1: Tính tổng doanh thu mỗi ngày [cite: 68]
    SELECT 
        o.order_date, 
        SUM(oi.quantity * oi.price) AS total_daily_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_date
)
SELECT 
    order_date, 
    total_daily_revenue,
    SUM(total_daily_revenue) OVER (ORDER BY order_date) AS running_total_revenue
FROM daily_revenue;



