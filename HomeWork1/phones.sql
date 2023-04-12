-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными

CREATE DATABASE HomeWork1;
USE HomeWork1;

CREATE TABLE phones (
  idphons INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  brand VARCHAR(45) NOT NULL,
  model VARCHAR(45) NOT NULL,
  quantity INT NOT NULL,
  price INT NOT NULL);

INSERT INTO phones (brand, model, quantity, price) VALUES ('Samsung', 'Galaxy A73', 1, 34489);
INSERT INTO phones (brand, model, quantity, price) VALUES ('Xiaomi', 'Redmi A1', 5, 3463);
INSERT INTO phones (brand, model, quantity, price) VALUES ('Xiaomi', '12T', 2, 35990);
INSERT INTO phones(brand, model, quantity, price) VALUES ('Samsung', 'Galaxy A53', 2, 32299);
INSERT INTO phones(brand, model, quantity, price) VALUES ('HTC', 'Wildfire E3', 12, 11455);
INSERT INTO phones (brand, model, quantity, price) VALUES ('HUAWEI', 'Nova Y70', 6, 11755);

-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT brand, price FROM phones WHERE quantity > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM phones WHERE brand = 'samsung';