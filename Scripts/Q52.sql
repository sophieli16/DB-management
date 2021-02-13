--natural join
CREATE TABLE Q52intructorsteaching AS 
SELECT name,ID,dept_name,salary
FROM instructor
NATURAL JOIN teaches

SELECT * FROM Q52intructorsteaching

--select and project
CREATE TABLE Q52 AS 
SELECT DISTINCT name,ID,dept_name,salary
FROM Q52intructorsteaching
WHERE dept_name = "Comp. Sci."

SELECT * FROM Q52
