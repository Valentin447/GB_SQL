-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE DATABASE home_work_2;
USE home_work_2;

CREATE TABLE sales(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    bucket VARCHAR(30)
);

INSERT INTO sales(order_date, bucket)
VALUES
("2021-01-01", "101 to 300"),
("2021-01-02", "101 to 300"),
("2021-01-03", "less than equal to 100"),
("2021-01-04", "101 to 300"),
("2021-01-05", "greater than 300");


-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT bucket, COUNT(*) AS bucket_count
FROM sales
GROUP BY bucket


-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE orders(
	orderid INT AUTO_INCREMENT PRIMARY KEY,
    employeeid VARCHAR(20),
    amount DECIMAL(10,2),
    orderstatus VARCHAR(30)
);

INSERT INTO orders(employeeid, amount, orderstatus)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");

ALTER TABLE orders
ADD order_summary VARCHAR(50) NOT NULL;

SELECT orderid, orderstatus,
CASE orderstatus
WHEN "OPEN"
THEN "Order is in open state."
WHEN "CLOSED"
THEN "Order is closed."
WHEN "CANCELLED"
THEN "Order is cancelled."
ELSE "FAIL"
END AS order_summary
FROM orders;


-- Чем NULL отличается от 0?
-- 0 - это определенное значение поля равное нулю. NULL - это пустое поле в котором нет никакого значение.