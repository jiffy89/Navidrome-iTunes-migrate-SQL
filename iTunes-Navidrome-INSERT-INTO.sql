ATTACH DATABASE '/location/of/library.db' AS iTunesLib;

INSERT INTO annotation 
SELECT 
	"your_user_id" AS user_id,
	m.id AS item_id,
	"media_file" AS item_type,
	t.play_count AS play_count,
	COALESCE(t.play_date_utc, '2013-11-11 11:11:11') AS play_date,
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(rating, '100', '5'),'80','4'),'60','3'),'40','2'),'20','1')  AS rating,
	"0" AS starred,
	NULL AS starred_at
FROM media_file m
JOIN tracks t ON m.album = t.album AND m.title = t.name --AND m.disc_number = t.disc_number
WHERE m.title  IS NOT NULL 
	AND t.play_count IS NOT NULL
	
-- item_type : album
INSERT INTO annotation 
SELECT
	"your_user_id" AS user_id,
	a.id AS item_id,
	"album" AS item_type,
	SUM(t.play_count) AS play_count,
	COALESCE(t.play_date_utc, '2013-11-11 11:11:11') AS play_date,
	"0"  AS rating,
	"0" AS starred,
	NULL AS starred_at
FROM tracks t
JOIN album a ON a.name = t.album 
WHERE play_count > 0
GROUP BY t.album

-- item_type : artist
INSERT INTO annotation 
SELECT
	"your_user_id" AS user_id,
	a.id AS item_id,
	'artist' AS item_type,
	SUM(t.play_count) AS play_count,
	COALESCE(t.play_date_utc, '2013-11-11 11:11:11') AS play_date,
	"0"  AS rating,
	"0" AS starred,
	NULL AS starred_at
FROM tracks t
JOIN artist a ON a.name = t.artist 
WHERE play_count > 0
GROUP BY a.name
