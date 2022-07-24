INSERT INTO performers (performer_name)--+
VALUES
('DDT'),
('Sinatra'),
('Sektor Gaza'),
('ABBA'),
('Ruki vverh!'),
('Kipelov'),
('Puppo'),
('Armstrong')

INSERT INTO genres (genre) --+
VALUES
('rok'),
('jazz'),
('punk'),
('retro'),
('pop')

INSERT INTO albums (album_title, release_year_album) --+
VALUES
('Ottepel', 1991),  --DDT 1
('Vesna', 2018),   --DDT 1
('One', 1960),   --Sinatra 2
('Two', 1963),   --Sinatra 2
('Tuman', 1998),   --Sektor Gaza 3
('Album1', 1980),   --ABBA 4
('Popsa1', 2019),   --Ruki vverh! 5
('Vavilon', 2010),   --Kipelov 6
('Puppoalbum', 1987),   --Puppo 7
('Jazzone', 1955)   --Armstrong 8

INSERT INTO tracks (track_name, duration, Album_ID) --WHERE Album_ID = Albums.albumid --+
VALUES
('Ottepel11', '00:02:00', 1),
('My ottepel12', '00:07:14', 1),
('Ottepel13', '00:04:10', 1),   --Ottepel DDT
('Vesna1', '00:06:31', 2),
('Vesna2', '00:08:23', 2),
('Vesna3', '00:04:14', 2),
('Vesna4', '00:04:36', 2),   --Vesna DDT
('One1', '00:05:23', 3),
('One2', '00:02:24', 3),
('One3', '00:03:56', 3),   --One Sinatra
('Two1', '00:09:29',4),
('Two2', '00:03:51',4),
('Two3', '00:04:11',4),   --Two Sinatra
('Tuman1', '00:04:10',5),
('Tuman2', '00:04:54',5),
('My tuman3', '00:03:32',5),   --Tuman Sektor Gaza
('Album11', '00:03:59',6),
('Album12', '00:04:22',6),
('Album13', '00:02:45',6),   --Album1 ABBA
('Popsa11', '00:03:19', 7),
('Popsa12', '00:04:59', 7),
('Popsa13', '00:05:00', 7),   --Popsa1 Ruki vverh!
('My vavilon1', '00:04:01', 8),
('Vavilon2', '00:07:48', 8),
('Vavilon3', '00:06:29', 8),   --Vavilon Kipelov
('Puppoalbum1', '00:02:59', 9),
('Puppoalbum2', '00:03:01', 9),
('Puppoalbum3', '00:03:54', 9),   --Puppoalbum Puppo
('Jazzone1', '00:09:12', 10),
('Jazzone2', '00:12:25', 10),
('Jazzone3', '00:06:57', 10)   --Jazzone Armstrong

INSERT INTO collections (collection_name, release_year_collection) --+
VALUES
('Rok', 2020),
('Jazz', 1990),
('Best of the best', 1990),
('Retrou', 2000),
('Pop', 2022),
('PunkRok', 2019),
('Na vse vremena', 2020),
('Solyanka', 2022)

INSERT INTO performers_genres (performersid, genresid) --+
VALUES
   (1, 1),
   (1, 2),
   (1, 5),
   (2, 2),
   (3, 1),
   (3, 3),
   (3, 5),
   (4, 4),
   (4, 5),
   (5, 5),
   (6, 1),
   (6, 4),
   (7, 4),
   (7, 5),
   (8, 2)
   
INSERT INTO performers_albums (performersid, albumid) --+
VALUES
   (1, 1),
   (1, 2),
   (1, 8),
   (2, 3),
   (2, 4),
   (2, 10),
   (3, 5),
   (4, 6),
   (4, 9),
   (5, 7),
   (6, 8),
   (7, 9),
   (8, 10)
   
INSERT INTO tracks_collections (collectionid, trackid) --+
VALUES
   (1, 32),
   (1, 33),
   (1, 37),
   (1, 55),
   (2, 39),
   (2, 44),
   (2, 62),
   (3, 33),
   (3, 35),
   (3, 45),
   (3, 54),
   (4, 48),
   (4, 57),
   (5, 51),
   (5, 59),
   (5, 49),
   (6, 34),
   (6, 47),
   (6, 51),
   (7, 34),
   (7, 38),
   (7, 56),
   (8, 57),
   (8, 61),
   (8, 40),
   (8, 44),
   (8, 36),
   (8, 50),
   (8, 59)
   
