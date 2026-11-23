--1
SELECT t.first_name, t.last_name, c.country_name FROM tourists AS t
INNER JOIN countries AS c
ON t.country_id = c.id;

--2
SELECT t.first_name, t.last_name, t.* FROM tourists AS t
INNER JOIN tours AS u
ON t.tour_id = u.id;

--3
SELECT t.first_name, t.last_name, u.* FROM tourists AS t
LEFT JOIN tours AS u
ON t.tour_id = u.id;

--4
SELECT t.first_name, t.last_name, u.* FROM tourists AS t
FULL OUTER JOIN tours AS u
ON t.tour_id = u.id;

--5
SELECT t.* FROM tourists AS t
LEFT JOIN tours AS u
ON t.tour_id = u.id
WHERE u.id IS NULL;

DELETE FROM tourists
WHERE tour_id IS NULL;

--6
SELECT u.* FROM tours AS u
LEFT JOIN tourists AS t
ON u.id = t.tour_id
WHERE t.id IS NULL;

UPDATE tours
SET start_date = DATE(start_date, '+1 year'),
end_date = DATE(end_date, '+1 year')
WHERE id NOT IN (
SELECT DISTINCT tour_id
FROM tourists
WHERE tour_id IS NOT NULL
);

--7
SELECT COUNT(*) AS trips_without_tourists FROM tours AS u
LEFT JOIN tourists AS t
ON u.id = t.tour_id
WHERE t.id IS NULL;

--8
SELECT t.first_name, t.last_name, u.tour_name FROM tourists AS t
CROSS JOIN tours AS u;
