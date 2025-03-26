--6
BEGIN;

-- Remove duplicates from work
CREATE TABLE temp_work AS 
SELECT DISTINCT ON (work_id, artist_id, museum_id, title) * FROM work;

DELETE FROM work;
INSERT INTO work SELECT * FROM temp_work;
DROP TABLE temp_work;

-- Remove duplicates from product_size
CREATE TABLE temp_product_size AS 
SELECT DISTINCT ON (size_id, work_id, sale_price, regular_price) * FROM product_size;

DELETE FROM product_size;
INSERT INTO product_size SELECT * FROM temp_product_size;
DROP TABLE temp_product_size;

-- Remove duplicates from subject
CREATE TABLE temp_subject AS 
SELECT DISTINCT ON (work_id, subject) * FROM subject;

DELETE FROM subject;
INSERT INTO subject SELECT * FROM temp_subject;
DROP TABLE temp_subject;

-- Remove duplicates from image_link
CREATE TABLE temp_image_link AS 
SELECT DISTINCT ON (work_id, image_link) * FROM image_link;

DELETE FROM image_link;
INSERT INTO image_link SELECT * FROM temp_image_link;
DROP TABLE temp_image_link;

COMMIT;
