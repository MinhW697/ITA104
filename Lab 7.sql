--Bai 1
explain analyze
select * from customers where phone = '0319871239';
--Seq Scan (viết tắt của Sequential Scan) là một phương thức truy xuất dữ liệu mà hệ quản trị cơ sở dữ liệu (DBMS) sẽ đọc toàn bộ các dòng trong một bảng từ đầu đến cuối để tìm kết quả phù hợp
--Seq không hiệu quả vì truy vấn một điều kiện rất hẹp mà quét toàn bộ bảng là không hợp 

--Bai 2
create index idx_customers_phone on customers(phone);
-- giá trị execution time đã nhanh hơn rất nhiều
-- Index (chỉ mục) là cấu trúc dữ liệu đặc biệt giúp tăng tốc độ truy vấn dữ liệu bằng cách tạo ra "lối tắt" để tìm kiếm thông tin, tương tự như mục lục trong sách. Thay vì phải quét toàn bộ bảng, database có thể sử dụng index để nhanh chóng xác định vị trí của dữ liệu cần tìm.

--Bai 3
explain analyze 
insert into customers (customer_id, full_name, phone, address) values
(3,'Đào Hồng Sơn', 0913874982, '8 Tô Hiệu, Hà Nội'); 
-- Index làm chậm thao tác INSERT, UPDATE, DELETE do phải cập nhật cả bảng index mỗi khi có sự thay đổi dữ liệu. Việc thay đổi này chỉ xứng đáng khi bảng chỉ đọc hoặc ít ghi

--Bai 4
create index idx_customers_address on customers(address);
explain 
select * from customers where address = '7 Thiền Quang' or phone like '0912%';
-- Cách Bitmap Scan hoạt động: Gồm 2 bước: (1) Bitmap Index Scan tạo bitmap của matching rows từ index, (2) Bitmap Heap Scan đọc rows từ bảng theo thứ tự physical storage. Hiệu quả hơn Index Scan khi cần đọc nhiều rows vì giảm random I/O.