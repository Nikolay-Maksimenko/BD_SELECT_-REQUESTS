SELECT title, year_of_release FROM albums 
WHERE year_of_release = 2018;

SELECT title, duration FROM tracks 
ORDER BY duration DESC LIMIT 1;

SELECT title FROM tracks 
WHERE duration >= 210;

SELECT title FROM collections 
WHERE year_of_release BETWEEN 2018 AND 2020;

SELECT name FROM performers 
WHERE name NOT LIKE '% %';

SELECT title FROM tracks 
WHERE title LIKE '%My%' OR title LIKE '%You%';
