SHOW databases;
USE albums_db;
DESCRIBE albums;
SELECT * FROM albums LIMIT 2;
SELECT DISTINCT artist FROM albums;
SELECT release_date FROM albums 
ORDER BY release_date DESC LIMIT 2;
SELECT release_date FROM albums 
ORDER BY release_date LIMIT 2;
-- A. 6
-- B. 23
-- C. id
-- D. 1967, 2011

-- 4 a.
SELECT name FROM albums 
WHERE artist = 'Pink Floyd';
-- b. 
SELECT release_date FROM albums
WHERE name like 'Sgt%';
-- c. 
SELECT genre FROM albums
WHERE name = 'Nevermind';
-- d. 
SELECT name FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
-- e 
SELECT name FROM albums
WHERE sales < 20;
-- f Because I was very specific in using "Rock"
SELECT name FROM albums
WHERE genre = 'Rock';
