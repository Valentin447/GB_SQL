CREATE DATABASE home_work_3;
USE home_work_3;

CREATE TABLE Work(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  surname VARCHAR(30) NOT NULL,
  specialty VARCHAR(30) NOT NULL,
  seniority INT NOT NULL,
  salary INT NOT NULL,
  age INT NOT NULL);

CREATE TABLE Salespeople(
	snum INT PRIMARY KEY NOT NULL,
  sname VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  comm VARCHAR(10) NOT NULL);
    
CREATE TABLE Customers(
	cnum INT PRIMARY KEY NOT NULL,
  cname VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  rating INT NOT NULL,
  snum INT NOT NULL);    
    
CREATE TABLE Orders(
	onum INT PRIMARY KEY NOT NULL,
  amt DECIMAL(6,2) NOT NULL,
  odate DATE NOT NULL,
  cnum INT NOT NULL,
  snum INT NOT NULL); 
    

INSERT INTO Work(name, surname, specialty, seniority, salary, age)
VALUE("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Каткина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидр", "Сидоров", "рабочий", 10, 20000, 35),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 5, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);

INSERT INTO Salespeople(snum, sname, city, comm)
VALUE(1001, "Peel","London",".12"),
(1002,"Serres", "San Jose", ".13"),
(1004, "Motika", "London", ".11"),
(1007, "Rifkin", "Barcelona", ".15"),
(1003, "Axelrod", "New York", ".10");

INSERT INTO Customers(cnum, cname, city, rating, snum)
VALUE(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

INSERT INTO Orders(onum, amt, odate, cnum, snum)
VALUE(3001, 18.69, "1990-10-03", 2008, 1007),
(3003, 767.19, "1990-10-03", 2001, 1001),
(3002, 1900.10, "1990-10-03", 2007, 1004),
(3005, 5160.45, "1990-10-03", 2003, 1002),
(3006, 1098.16, "1990-10-03", 2008, 1007),
(3009, 1713.23, "1990-10-04", 2002, 1003),
(3007, 75.75, "1990-10-04", 2004, 1002),
(3008, 4723.00, "1990-10-05", 2006, 1001),
(3010, 1309.95, "1990-10-06", 2004, 1002),
(3011, 9891.88, "1990-10-06", 2006, 1001);

-- 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm FROM Salespeople;

-- 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating, cname FROM Customers WHERE city="SanJose";

-- 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum FROM Customers;

-- 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
SELECT * FROM Customers WHERE cname LIKE "G%";

-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT * FROM Orders WHERE amt > 1000;

-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) AS minsum FROM Orders;

-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM Customers WHERE rating > 100 AND city != "Rome";

-- Для таблицы Work
-- Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT salary FROM Work
ORDER BY salary;

SELECT salary FROM Work
ORDER BY salary DESC;

-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT specialty , SUM(salary) AS sum FROM Work
GROUP BY specialty
HAVING sum > 100000;