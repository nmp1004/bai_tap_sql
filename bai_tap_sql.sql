CREATE DATABASE app_food


CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255)
);

INSERT INTO users (full_name, email, password) VALUES
('Nguyen Van A', 'nguyenvana@example.com', 'password123'),
('Tran Thi B', 'tranthib@example.com', 'securepass456'),
('Le Van C', 'levanc@example.com', 'strongpassword789'),
('Pham Van D', 'phamvand@example.com', 'userpass321'),
('Vo Thi E', 'vothie@example.com', 'mypassword123'),
('Hoang Van F', 'hoangvanf@example.com', 'secure123pass'),
('Nguyen Thi G', 'nguyenthig@example.com', 'pass123word'),
('Tran Van H', 'tranvanh@example.com', 'password456'),
('Le Thi I', 'lethii@example.com', 'user456pass'),
('Pham Thi K', 'phamthik@example.com', 'examplepass789');

CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)
);

INSERT INTO restaurants (res_name, image, description) VALUES
('Nhà hàng A', 'restaurant_a.jpg', 'Nhà hàng sang trọng với menu đa dạng'),
('Nhà hàng B', 'restaurant_b.jpg', 'Không gian thoải mái với đội ngũ đầu bếp chất lượng'),
('Nhà hàng C', 'restaurant_c.jpg', 'Đặc sản vùng miền, hương vị độc đáo'),
('Nhà hàng D', 'restaurant_d.jpg', 'Buffet phong cách, phục vụ ẩm thực đa dạng'),
('Nhà hàng E', 'restaurant_e.jpg', 'Nơi lý tưởng cho các sự kiện đặc biệt'),
('Nhà hàng F', 'restaurant_f.jpg', 'Menu phong phú, phục vụ 24/7'),
('Nhà hàng G', 'restaurant_g.jpg', 'Không gian thoáng đãng, phục vụ gia đình và nhóm'),
('Nhà hàng H', 'restaurant_h.jpg', 'Hương vị truyền thống với phong cách hiện đại'),
('Nhà hàng I', 'restaurant_i.jpg', 'Địa điểm lý tưởng cho họp nhóm và tiệc cưới'),
('Nhà hàng K', 'restaurant_k.jpg', 'Những món ăn ngon từ nguyên liệu tươi sạch');

CREATE TABLE rate_res (
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	amount int NOT NULL,
	date_rate DATETIME
)

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 4, '2024-01-01 12:30:00'),
(2, 3, 5, '2024-01-02 15:45:00'),
(3, 2, 3, '2024-01-03 18:20:00'),
(4, 4, 4, '2024-01-04 10:10:00'),
(5, 6, 5, '2024-01-05 08:55:00'),
(6, 8, 2, '2024-01-06 14:00:00'),
(7, 5, 4, '2024-01-07 19:30:00'),
(8, 7, 5, '2024-01-08 11:45:00'),
(9, 9, 3, '2024-01-09 17:15:00'),
(10, 10, 4, '2024-01-10 22:05:00');



CREATE TABLE like_res (
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	date_like datetime
)


INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-01-01 14:20:00'),
(2, 3, '2024-01-02 16:30:00'),
(3, 2, '2024-01-03 19:45:00'),
(4, 4, '2024-01-04 11:40:00'),
(5, 6, '2024-01-05 09:15:00'),
(6, 8, '2024-01-06 15:25:00'),
(7, 5, '2024-01-07 20:10:00'),
(8, 7, '2024-01-08 12:55:00'),
(9, 9, '2024-01-09 18:30:00'),
(10, 10, '2024-01-10 23:20:00');


CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

INSERT INTO food_type (type_name) VALUES
('Mì Quảng'),
('Phở'),
('Bún riêu'),
('Cơm niêu'),
('Hủ tiếu'),
('Bánh mì'),
('Gỏi cuốn'),
('Bún chả'),
('Hải sản'),
('Lẩu');

CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	des VARCHAR(255),
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES food_type(type_id)
)

INSERT INTO food (food_name, image, price, des, type_id) VALUES
('Mì Quảng Gà', 'mi_quang_ga.jpg', 50.0, 'Mì Quảng với gà nướng', 1),
('Phở Bò', 'pho_bo.jpg', 40.0, 'Phở với nước dùng thơm ngon', 2),
('Bún Riêu Cua', 'bun_rieu_cua.jpg', 35.0, 'Bún riêu với cua tươi ngon', 3),
('Cơm Niêu Xá Xíu', 'com_nieu_xa_xiu.jpg', 60.0, 'Cơm niêu với xá xíu xốt mắc khén', 4),
('Hủ Tiếu Nam Vang', 'hu_tieu_nam_vang.jpg', 45.0, 'Hủ tiếu Nam Vang đặc biệt', 5),
('Bánh Mì Hòa Mã', 'banh_mi.jpg', 25.0, 'Bánh mì chảo thơm ngon', 6),
('Gỏi Cuốn Tôm Thịt', 'goi_cuon.jpg', 30.0, 'Gỏi cuốn tôm thịt mát lạnh', 7),
('Bún Chả Hà Nội', 'bun_cha.jpg', 55.0, 'Bún chả Hà Nội đặc trưng', 8),
('Lẩu Hải Sản', 'lau_hai_san.jpg', 75.0, 'Lẩu hải sản tươi ngon', 9),
('Lẩu Lẩu', 'lau.jpg', 70.0, 'Lẩu lẩu đầy ắp hương vị', 10);

CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id)
)	

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Trứng ốp', 5.0, 1),
('Bánh mì nướng', 8.0, 6),
('Chả giò', 10.0, 8),
('Mực xào nước mắm', 12.0, 9),
('Bò bía', 7.0, 2),
('Bánh mì mềm', 6.0, 6),
('Bún lá', 9.0, 3),
('Gỏi cuốn chay', 8.0, 7),
('Chả cá Lã Vọng', 15.0, 8),
('Cua hấp xả', 18.0, 3);


CREATE TABLE orders(
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255)
);

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 5, 'ORDER12345', '1,2,4,6,7');


INSERT INTO like_res (user_id, res_id, date_like) VALUES
(3, 2, '2024-01-12 08:30:00'),
(5, 2, '2024-02-05 14:15:00'),
(7, 7, '2024-02-18 19:45:00'),
(2, 4, '2024-03-02 10:20:00'),
(8, 4, '2024-03-15 12:55:00'),
(6, 5, '2024-04-01 16:40:00'),
(4, 2, '2024-04-14 21:10:00'),
(10, 3, '2024-05-03 11:25:00'),
(1, 3, '2024-05-17 17:00:00'),
(9, 1, '2024-06-08 22:30:00');


--- Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT us.user_id , us.full_name , COUNT(lr.user_id) as number_of_like FROM users as us
LEFT JOIN like_res as lr
ON us.user_id = lr.user_id
GROUP BY us.user_id
ORDER BY number_of_like desc
LIMIT 5;

--- Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT res.res_id , res.res_name, COUNT(lr.res_id) as 
number_of_like FROM restaurants as res
LEFT JOIN like_res as lr 
ON res.res_id = lr.res_id
GROUP BY res.res_id
ORDER BY number_of_like desc
LIMIT 2;

--- Tìm người đã đặt hàng nhiều nhất.
SELECT us.full_name , MAX(od.amount) as number_of_order
FROM users as us 
LEFT JOIN orders as od
ON us.user_id = od.user_id
GROUP BY us.user_id
ORDER BY number_of_order DESC
LIMIT 1;

--- - Tìm người dùng không hoạt động trong hệ thống 
SELECT us.user_id , us.full_name FROM users as us
LEFT JOIN orders as od
ON us.user_id = od.user_id
LEFT JOIN like_res as lr
ON us.user_id = lr.user_id
LEFT JOIN rate_res as rr
ON us.user_id = rr.user_id
WHERE (od.user_id is NULL) AND (lr.user_id is NULL) AND (rr.user_id is NULL);