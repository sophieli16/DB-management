--rename
CREATE TABLE Q34renamed AS(
SELECT char_name AS char_name_2,hand_pref,age AS age_2,loudness AS loudness_2
FROM `Characters` 
) WITH DATA;

INSERT INTO Q34renamed SELECT char_name AS char_name_2,hand_pref,age AS age_2,loudness AS loudness_2
FROM `Characters` 

SELECT * FROM Q34renamed

--select and project
CREATE TABLE Q34sameloud AS(
SELECT DISTINCT age,age_2,loudness
FROM `Q34renamed`,`Characters` 
WHERE `loudness`= `loudness_2` AND char_name <> char_name_2
) WITH DATA;

INSERT INTO Q34sameloud SELECT DISTINCT age,age_2,loudness
FROM `Q34renamed`,`Characters` 
WHERE `loudness`= `loudness_2` AND char_name <> char_name_2

SELECT * FROM Q34sameloud 

--select and project
CREATE TABLE Q34 AS(
SELECT loudness,(age - age_2)
FROM `Q34sameloud` 
WHERE (age - age_2) >0
) WITH DATA;

INSERT INTO Q34 SELECT loudness,(age - age_2)
FROM `Q34sameloud` 
WHERE (age - age_2) >0

SELECT * FROM Q34 