--TABLE1 : Customers
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


.mode box
-- SQL QUERY1 : หายอดขายสูงสุดของแต่ละสาขา
WITH highest_sale AS (
  SELECT 
    branch_id,
    MAX(total_price) AS 'highest_total'
  FROM orders
  GROUP BY branch_id
)

SELECT 
  name,
  highest_total
FROM branchs
JOIN highest_sale USING(branch_id);


-- SQL QUERY2 : รายชื่อลูกค้าที่มียอดซื้อสูงที่สุด
WITH highest_paid_customer AS (
  SELECT 
    customer_id,
    SUM(total_price) AS 'total_paid'
  FROM orders
  GROUP BY customer_id
)

SELECT 
  name,
  MAX(total_paid) AS 'highest_paid_customer'
FROM customers
JOIN highest_paid_customer USING(customer_id);

-- SQL QUERY3 : เมนูที่ขายดีที่สุด ของแต่ละสาขา
WITH highest_menu_sale_per_branch AS (
  SELECT 
    branch_id,
    menu_id,
    MAX(total_price) AS 'highest_menu_total'
  FROM orders
  GROUP BY branch_id, menu_id
)

  SELECT 
    A.name,
    C.name,
    MAX(B.highest_menu_total) AS 'sale_total'
  FROM branchs A
  JOIN highest_menu_sale_per_branch B ON A.branch_id = B.branch_id
  JOIN menus C ON B.menu_id = C.menu_id
  GROUP BY 1
  ORDER BY 3 DESC;