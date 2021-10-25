SELECT name, COUNT(*) FROM jenre 
LEFT JOIN performersjenre ON jenre.id = performersjenre.jenre_id 
GROUP by name
ORDER BY COUNT(*);

SELECT COUNT(*) FROM albums 
RIGHT JOIN tracks ON albums.id = tracks.album_id 
WHERE year_of_release BETWEEN 2019 AND 2020;

SELECT albums.title, AVG(duration) FROM albums 
RIGHT JOIN tracks ON albums.id = tracks.album_id 
GROUP by albums.title;

SELECT name FROM performers 
WHERE id NOT IN (SELECT DISTINCT performer_id FROM albums 
LEFT JOIN performersalbums pa ON albums.id = pa.album_id 
WHERE year_of_release = 2020);

SELECT collections.title FROM collections 
JOIN collectionstracks ON collections.id = collectionstracks.collection_id 
JOIN tracks ON collectionstracks.track_id = tracks.id 
JOIN performersalbums ON tracks.album_id = performersalbums.album_id 
JOIN performers ON performersalbums.performer_id = performers.id 
WHERE name = 'The Cranberries';

SELECT albums.title FROM albums 
JOIN performersalbums ON albums.id = performersalbums.album_id 
WHERE performer_id IN (SELECT performer_id FROM performersjenre 
GROUP by performer_id 
HAVING COUNT(*) > 1) 
GROUP by albums.title;

SELECT title FROM tracks 
LEFT JOIN collectionstracks ON tracks.id = collectionstracks.track_id 
WHERE collection_id IS NULL;

SELECT name FROM performers 
JOIN performersalbums ON performers.id = performersalbums.performer_id 
JOIN albums ON performersalbums.album_id = albums.id 
JOIN tracks ON albums.id = tracks.album_id 
WHERE duration = (SELECT MIN(duration) FROM tracks);

SELECT albums.title, COUNT(*) FROM albums 
JOIN tracks ON albums.id = tracks.album_id 
GROUP by albums.title 
HAVING COUNT(*) = (SELECT COUNT(*) FROM tracks 
GROUP by album_id 
ORDER BY COUNT(*) 
LIMIT 1);