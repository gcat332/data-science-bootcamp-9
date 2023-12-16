--Table from HW#2 SQL class

CREATE TABLE customers (
  customer_id int unique,
  name varchar(30)
);
INSERT INTO customers VALUES 
  (1,'One'),
  (2,'Two'),
  (3,'Three'),
  (4,'Four'),
  (5,'Five'),
  (6,'Six'),
  (7,'Seven'),
  (8,'Eight'),
  (9,'Nine'),
  (10,'Ten');

--TABLE2 : ORDERS
CREATE TABLE orders (
  order_id int unique,
  customer_id int,
  branch_id int,
  order_date date,
  total_price decimal,
  menu_id int
);
INSERT INTO orders VALUES 
  (1,1,1,'2023-11-01',100.99,1),
  (2,1,1,'2023-11-01',50.99,2),
  (3,1,1,'2023-11-01',80.99,3),
  (4,2,1,'2023-11-01',120.99,1),
  (5,3,2,'2023-11-01',100.99,1),
  (6,4,2,'2023-11-01',140.99,2),
  (7,5,2,'2023-11-01',200.99,3),
  (8,6,3,'2023-11-01',170.49,1),
  (9,7,3,'2023-11-01',120.49,3),
  (10,8,3,'2023-10-10',140.99,2);

--TABLE3 : BRANCHS
CREATE TABLE branchs (
  branch_id int unique,
  name varchar(40)
);
INSERT INTO branchs VALUES 
  (1,'Bangna'),
  (2,'On-Nut'),
  (3,'Chatuchak');

--TABLE4 : MENUS
CREATE TABLE menus (
  menu_id int unique,
  name varchar(40)
);
INSERT INTO menus VALUES 
  (1,'Hawaiian'),
  (2,'Peperoni'),
  (3,'Chesse');
