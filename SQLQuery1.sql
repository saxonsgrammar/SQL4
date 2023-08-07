-- 1 ///// done
SELECT TOP 10 u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст], u.sex AS [Пол],
ROUND(AVG(CAST(Rating AS float)), 2) AS [Средний балл]
FROM anketa_rate r JOIN users u
ON u.user_id = r.id_kogo
GROUP BY u.nick, u.user_id, u.age, u.sex
ORDER BY 5 DESC

-- 2 ///// done
SELECT DISTINCT u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст], u.sex AS [Пол]
FROM users u, education e
WHERE u.my_smoke = 1 AND u.my_drink = 1 AND u.my_drugs = 1 AND u.id_education = e.id AND e.id = 4

-- 3 ///// done
SELECT u.nick AS [Имя пользователя], u.user_id AS [ID], u.sex AS [Пол],
u.rost AS [Рост], u.ves AS [Вес]
FROM users u JOIN gender g ON u.sex = g.id
WHERE u.nick LIKE '%Na%' AND u.sex = 2 AND u.age BETWEEN 18 AND 65 AND u.rost BETWEEN 145 AND 175 
AND u.ves BETWEEN 40 AND 100

-- 4 ///// done
SELECT u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст],
u.hair_color AS [Цвет волос], u.eyes_color AS [Цвет глаз], u.my_build AS [Фигура]
FROM users u JOIN gender g ON u.sex = g.id JOIN eyescolor e ON u.eyes_color = e.id
JOIN haircolor h ON u.hair_color = h.id JOIN figure f ON u.my_build = f.id
WHERE g.id = 2 AND e.id = 4 AND h.id = 1 AND f.id = 2 
UNION
SELECT u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст],
u.hair_color AS [Цвет волос], u.eyes_color AS [Цвет глаз], u.my_build AS [Фигура]
FROM users u JOIN gender g ON u.sex = g.id JOIN eyescolor e ON u.eyes_color = e.id
JOIN haircolor h ON u.hair_color = h.id JOIN figure f ON u.my_build = f.id
WHERE g.id = 1 AND e.id = 2 AND h.id = 4 AND f.id = 4 

-- 5 ///// done
SELECT u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст], u.sex AS [Пол]
FROM users u JOIN gender g ON u.sex = g.id JOIN users_moles um ON u.user_id = um.user_id
JOIN moles m ON m.id = um.moles_id JOIN framework f ON f.id = u.id_framework 
JOIN users_interes ui ON u.user_id = ui.user_id JOIN interes i ON i.id = ui.interes_id
WHERE m.id = 2 AND f.id = 1 AND i.id = 23

-- 6 ///// done
SELECT u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст], 
gor.name as [Знак зодиака], u.sex AS [Пол], COUNT(gf.id_to) AS [Количество подарков]
FROM users u JOIN goroskop gor ON u.id_zodiak = gor.id JOIN gift_service gf ON u.user_id = gf.id_to
WHERE gor.id = 12
GROUP BY u.nick, u.user_id, u.age, gor.name, gor.name, u.sex

-- 7 ///// done
SELECT u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст], u.sex AS [Пол], COUNT(ul.languages_id) AS [Количество языков]
FROM users u JOIN users_languages ul ON ul.user_id = u.user_id JOIN languages l ON l.id = ul.languages_id
JOIN kitchen k ON k.id = u.like_kitchen
WHERE k.id = 2 
GROUP BY u.age, u.nick, u.user_id, u.sex
HAVING COUNT(ul.languages_id) >= 5 

-- 8 ///// done
SELECT u.nick AS [Имя пользователя], u.user_id AS [ID], u.age AS [Возраст]
FROM users u JOIN region r ON u.religion = r.id JOIN users_sport us ON us.user_id = u.user_id
JOIN sport s ON s.id = us.sport_id JOIN residence rs ON rs.id = u.my_home
WHERE r.id = 6 AND rs.id = 9 AND (s.id = 9 OR s.id = 6)