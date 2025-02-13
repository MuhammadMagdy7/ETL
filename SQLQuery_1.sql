CREATE DATABASE warehouse;
DROP TABLE dbo.youtube_data;
DROP TABLE dbo.category_data;

SELECT video_id, COUNT(video_id) AS "count of Id"
FROM youtube_data
GROUP BY video_id
HAVING COUNT(video_id) > 1 
ORDER BY COUNT(video_id) DESC;


SELECT *
FROM youtube_data;

SELECT *
FROM dbo.category_data;

ALTER TABLE youtube_data
ALTER COLUMN video_id NVARCHAR(100) NOT NULL;

ALTER TABLE youtube_data
ADD CONSTRAINT vid_unique_key PRIMARY KEY (video_id);


ALTER TABLE category_data
ALTER COLUMN id NVARCHAR(100) NOT NULL;

ALTER TABLE category_data
ADD CONSTRAINT unique_key PRIMARY KEY (id);

SELECT category_id FROM youtube_data
WHERE category_id NOT IN (SELECT id FROM category_data);

DELETE FROM youtube_data
WHERE category_id NOT IN (SELECT id FROM category_data);


ALTER TABLE youtube_data 
ALTER COLUMN category_id NVARCHAR(100);


SELECT (SELECT 
            title 
        FROM category_data
        WHERE id = category_id
) AS Title ,COUNT(category_id) AS COUNT
FROM youtube_data AS y
GROUP BY category_id
HAVING COUNT(category_id) > 5
ORDER BY COUNT(category_id) DESC;



ALTER TABLE youtube_data 
ADD CONSTRAINT FK_category_data 
FOREIGN KEY (category_id) 
REFERENCES category_data(id);


SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'youtube_data' AND COLUMN_NAME = 'category_id'

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'category_data' AND COLUMN_NAME = 'id'


WITH CTE AS (
    SELECT video_id, ROW_NUMBER() OVER (PARTITION BY video_id ORDER BY video_id) AS rn
    FROM youtube_data
)
DELETE FROM youtube_data WHERE video_id IN (SELECT video_id FROM CTE WHERE rn > 1);

