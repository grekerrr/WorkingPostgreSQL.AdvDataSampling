-- 1.количество исполнителей в каждом жанре
SELECT g.genre, COUNT(pg.performersid) FROM genres g
JOIN performers_genres pg ON g.genresid = pg.genresid
GROUP BY g.genre

-- 2.количество треков, вошедших в альбомы 2019-2020 годов
SELECT a.album_title, a.release_year_album, COUNT(t.trackid) AS tracks_count FROM albums a
JOIN tracks t ON a.albumid = t.album_id
WHERE a.release_year_album BETWEEN 2019 AND 2020
GROUP BY a.album_title, a.release_year_album

-- 3.средняя продолжительность треков по каждому альбому
SELECT a.album_title, AVG(t.duration) AS duration FROM albums a
JOIN tracks t ON a.albumid = t.album_id
GROUP BY a.album_title

-- 4.все исполнители, которые не выпустили альбомы в 2020 году
SELECT p.performer_name, a.release_year_album FROM performers p
JOIN performers_albums pa ON p.performersid = pa.performersid 
JOIN albums a ON pa.albumid = a.albumid
WHERE a.release_year_album != 2020

-- 5.названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT distinct c.collection_name FROM collections c
JOIN tracks_collections tc ON c.collectionid = tc.collectionid
JOIN tracks t ON tc.trackid = t.trackid
JOIN albums a ON t.album_id = a.albumid
JOIN performers_albums pa ON a.albumid = pa.albumid
JOIN performers p ON pa.performersid = p.performersid
WHERE p.performer_name LIKE 'DDT'

-- 6.название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT a.album_title FROM albums a
JOIN performers_albums pa ON a.albumid = pa.albumid
JOIN performers p ON pa.performersid = p.performersid
JOIN performers_genres pg ON p.performersid = pg.performersid
GROUP BY p.performer_name , a.album_title
HAVING COUNT(pg.genresid) > 1

-- 7.наименование треков, которые не входят в сборники
SELECT t.track_name FROM tracks t
LEFT JOIN tracks_collections tc ON t.trackid = tc.trackid
WHERE tc.trackid IS NULL

-- 8.исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT p.performer_name, t.duration FROM performers p
JOIN performers_albums pa ON p.performersid = pa.performersid
JOIN albums a ON pa.albumid = a.albumid
JOIN tracks t ON a.albumid = t.album_id
WHERE t.duration IN (SELECT MIN(duration) FROM tracks)

-- 9.название альбомов, содержащих наименьшее количество треков
SELECT DISTINCT a.album_title, COUNT(t.trackid) FROM albums a
JOIN tracks t ON t.album_id = a.albumid
GROUP BY a.album_title
   HAVING COUNT(t.trackid) IN (
      SELECT COUNT(t.trackid) FROM albums a2 
      GROUP BY a.album_title
      ORDER BY count(t.trackid)
   )