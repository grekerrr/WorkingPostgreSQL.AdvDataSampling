-- 1.���������� ������������ � ������ �����
SELECT g.genre, COUNT(pg.performersid) FROM genres g
JOIN performers_genres pg ON g.genresid = pg.genresid
GROUP BY g.genre

-- 2.���������� ������, �������� � ������� 2019-2020 �����
SELECT a.album_title, a.release_year_album, COUNT(t.trackid) AS tracks_count FROM albums a
JOIN tracks t ON a.albumid = t.album_id
WHERE a.release_year_album BETWEEN 2019 AND 2020
GROUP BY a.album_title, a.release_year_album

-- 3.������� ����������������� ������ �� ������� �������
SELECT a.album_title, AVG(t.duration) AS duration FROM albums a
JOIN tracks t ON a.albumid = t.album_id
GROUP BY a.album_title

-- 4.��� �����������, ������� �� ��������� ������� � 2020 ����
SELECT p.performer_name, a.release_year_album FROM performers p
JOIN performers_albums pa ON p.performersid = pa.performersid 
JOIN albums a ON pa.albumid = a.albumid
WHERE a.release_year_album != 2020

-- 5.�������� ���������, � ������� ������������ ���������� ����������� (�������� ����)
SELECT distinct c.collection_name FROM collections c
JOIN tracks_collections tc ON c.collectionid = tc.collectionid
JOIN tracks t ON tc.trackid = t.trackid
JOIN albums a ON t.album_id = a.albumid
JOIN performers_albums pa ON a.albumid = pa.albumid
JOIN performers p ON pa.performersid = p.performersid
WHERE p.performer_name LIKE 'DDT'

-- 6.�������� ��������, � ������� ������������ ����������� ����� 1 �����
SELECT a.album_title FROM albums a
JOIN performers_albums pa ON a.albumid = pa.albumid
JOIN performers p ON pa.performersid = p.performersid
JOIN performers_genres pg ON p.performersid = pg.performersid
GROUP BY p.performer_name , a.album_title
HAVING COUNT(pg.genresid) > 1

-- 7.������������ ������, ������� �� ������ � ��������
SELECT t.track_name FROM tracks t
LEFT JOIN tracks_collections tc ON t.trackid = tc.trackid
WHERE tc.trackid IS NULL

-- 8.�����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������)
SELECT p.performer_name, t.duration FROM performers p
JOIN performers_albums pa ON p.performersid = pa.performersid
JOIN albums a ON pa.albumid = a.albumid
JOIN tracks t ON a.albumid = t.album_id
WHERE t.duration IN (SELECT MIN(duration) FROM tracks)

-- 9.�������� ��������, ���������� ���������� ���������� ������
SELECT DISTINCT a.album_title, COUNT(t.trackid) FROM albums a
JOIN tracks t ON t.album_id = a.albumid
GROUP BY a.album_title
   HAVING COUNT(t.trackid) IN (
      SELECT COUNT(t.trackid) FROM albums a2 
      GROUP BY a.album_title
      ORDER BY count(t.trackid)
   )