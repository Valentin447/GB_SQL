-- 1) Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
SELECT color, COUNT(*)
FROM auto
WHERE mark = "BMW" OR mark = "LADA"
GROUP BY color;

-- 2) Вывести на экран марку авто и количество AUTO не этой марки
SELECT mark
FROM auto
WHERE mark ="LADA"
GROUP BY mark
UNION ALL SELECT COUNT(*) FROM auto WHERE mark !="LADA";

-- Задание №3.
-- Даны 2 таблицы test_a test_b:
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
SELECT test_a.*
FROM test_a
LEFT JOIN test_b ON test_b.id = test_a.id 
WHERE test_b.id IS NULL;