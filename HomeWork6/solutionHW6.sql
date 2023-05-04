-- Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

delimiter //
CREATE FUNCTION MyFunction (s INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE rem INT DEFAULT 0;
	DECLARE sec INT DEFAULT 0;
  DECLARE minutes INT DEFAULT 0;
  DECLARE hours INT DEFAULT 0;
  DECLARE days INT DEFAULT 0;
  DECLARE res VARCHAR(50) DEFAULT "";
  SET sec = s % 60;
  SET rem = (s - sec) / 60;
  SET minutes = rem % 60;
  SET rem = (rem - minutes) / 60;
  SET hours = rem % 24;
  SET days = (rem - hours) / 24;
  SET res = concat(days, " дней,", hours, " часов,", minutes, " минут,", sec, " секунд.");
	RETURN res;
END //

SELECT MyFunction(123456)


-- Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг + 2: х = 2, х+=2)

delimiter //
CREATE PROCEDURE EvenNumbers()
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE res VARCHAR(20) DEFAULT "";
    WHILE i <= 10 DO
		IF (i % 2 = 0) THEN 
			IF (res = "") THEN 
				SET res = i;
			ELSE
				SET res = concat(res, ", ", i);
			END IF;
        END IF;
		SET i = i + 1;
	END WHILE;
    SELECT res;
END //

CALL EvenNumbers();