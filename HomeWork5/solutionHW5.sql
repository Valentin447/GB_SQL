-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;
SELECT * FROM CheapCars;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost < 30000;
SELECT * FROM CheapCars;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW SkodaAudi AS SELECT * FROM Cars WHERE name = "Skoda" OR name = "Audi";
SELECT * FROM SkodaAudi;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
CREATE VIEW Analysis_ord AS SELECT * FROM analysis JOIN orders ON analysis.an_id = orders.ord_an;
SELECT an_name, an_price FROM Analysis_ord WHERE ord_datetime >= "2020-02-05 00:00:00" AND ord_datetime < "2020-02-12 00:00:00";
