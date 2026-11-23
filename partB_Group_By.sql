--1
SELECT genre, count(*) AS number_of_movies FROM movies
GROUP BY genre;

--2
SELECT year, sum(revenue) AS total_revenue FROM movies
GROUP BY year;

--3
SELECT genre, avg(revenue) AS avg_revenue FROM movies
GROUP BY genre;

--4
SELECT genre, language, avg(revenue) AS avg_revenue FROM movies
GROUP BY genre, language;

--5
SELECT language, COUNT(*) AS movie_number FROM movies
GROUP BY language
ORDER BY movie_number, language LIMIT 1;

--6 
SELECT country, COUNT(*) AS movie_number FROM movies
GROUP BY country
ORDER BY movie_number DESC, country LIMIT 1;

--7
SELECT genre, COUNT(*) AS movie_number FROM movies
GROUP BY genre
HAVING COUNT(*) > 2;

--8
SELECT year, SUM(revenue) AS Total_revenue FROM movies
GROUP BY year
HAVING SUM(revenue) > 1000;

--9
SELECT language, COUNT(*) AS movie_number FROM movies
GROUP BY language
HAVING COUNT(*) >= 3;
