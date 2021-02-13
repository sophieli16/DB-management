--natural join
CREATE TABLE Q51intructorsteaching AS 
SELECT name,ID
FROM instructor
NATURAL JOIN teaches

SELECT * FROM Q51intructorsteaching

--select
CREATE TABLE Q51intructors AS 
SELECT DISTINCT name,ID
FROM instructor

SELECT * FROM Q51intructors

--minus
CREATE TABLE Q51 AS
SELECT *
FROM `Q51intructors`
EXCEPT
SELECT *
FROM Q51intructorsteaching

SELECT * FROM Q51