--natural join
CREATE TABLE Q54coursessection AS 
SELECT course_id,building,room_number
FROM course
NATURAL JOIN section

SELECT * FROM Q54coursessection

--natural join
CREATE TABLE Q54roomcapacity AS 
SELECT course_id,building,room_number,capacity
FROM Q54coursessection
NATURAL JOIN classroom 

SELECT * FROM Q54roomcapacity

--select and project
CREATE TABLE Q54courseids AS 
SELECT DISTINCT course_id
FROM Q54roomcapacity
WHERE capacity>100

SELECT * FROM Q54courseids

--natural join
CREATE TABLE Q54 AS 
SELECT course_id,title
FROM Q54courseids
NATURAL JOIN course 

SELECT * FROM Q54
