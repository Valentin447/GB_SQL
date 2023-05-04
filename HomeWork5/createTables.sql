CREATE DATABASE home_work_5;
USE home_work_5;

CREATE TABLE Cars (
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name VARCHAR(30) NOT NULL,
  cost INT NOT NULL
);

INSERT INTO Cars (name, cost) VALUES
  ("Audi", 52642),
  ("Mercedes", 57127),
  ("Skoda", 9000),
  ("Volvo", 29000),
  ("Bentley", 350000),
  ("Citroen", 21000),
  ("Hummer", 41400),
  ("Volkswagen", 21600);

CREATE TABLE GroupsAn (
  gr_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- ID группы;
  gr_name VARCHAR(30) NOT NULL, -- название группы;
  gr_temp VARCHAR(20) NOT NULL-- температурный режим хранения.
);

INSERT INTO GroupsAn (gr_name, gr_temp) VALUES
  ("Биохимические исследования", "от -30 до 0"),
  ("Гормональные исследования", "от -30 до 0"),
  ("Анализы для ЗОЖ", "от 0 до +25");

CREATE TABLE Analysis(
  an_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- ID анализа;
  an_name VARCHAR(30) NOT NULL, -- название анализа;
  an_cost INT NOT NULL, -- себестоимость анализа;
  an_price INT NOT NULL, -- розничная цена анализа;
  an_group INT NOT NULL REFERENCES GroupsAn (gr_id)-- группа анализов.
);

INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES
  ("Глюкоза (в крови)", 120, 195, 1),
  ("Гликированный гемоглобин", 300, 450, 1),
  ("Фруктозамин", 750, 985, 1),
  ("АКТГ", 500, 790, 2),
  ("Кортизол", 400, 490, 2),
  ("Вегетарианцы", 1200, 1445, 3),
  ("Микро- и макроэлементы", 1150, 1355, 3);

CREATE TABLE Orders(
	ord_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- ID заказа;
	ord_datetime DATETIME NOT NULL,-- дата и время заказа;
	ord_an INT NOT NULL REFERENCES Analysis (an_id) -- ID анализа
);

INSERT INTO Orders (ord_datetime, ord_an) VALUES
  ("2020-02-03 12:43:23", 3),
  ("2020-02-05 18:06:16", 2),
  ("2020-02-05 20:32:45", 7),
  ("2020-02-07 08:23:34", 4),
  ("2020-02-08 10:02:10", 4),
  ("2020-02-10 13:53:15", 2),
  ("2020-02-13 14:33:14", 5),
  ("2020-02-17 18:09:16", 6);