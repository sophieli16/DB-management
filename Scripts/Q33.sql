--rename
CREATE TABLE Q33renamed AS(
SELECT student, hand_pref AS hand_pref_stu, char_name
FROM `Students`
) WITH DATA;

INSERT INTO Q33renamed SELECT student, hand_pref AS hand_pref_stu, char_name
FROM `Students`

SELECT * FROM Q33renamed

--natural join
CREATE TABLE Q33stuchar AS(
SELECT *
FROM `Q33renamed`
NATURAL JOIN `Characters`
) WITH DATA;

INSERT INTO Q33stuchar
SELECT *
FROM `Q33renamed`
NATURAL JOIN `Characters`

SELECT * FROM Q33stuchar

--project and select
CREATE TABLE Q33righty AS(
SELECT *
FROM `Q33stuchar`
WHERE `hand_pref_stu`= "R"
) WITH DATA;

INSERT INTO Q33righty SELECT *
FROM `Q33stuchar`
WHERE `hand_pref_stu`= "R"
SELECT * FROM Q33righty

--rename
CREATE TABLE Q33rightycopy AS(
SELECT student AS student_2, hand_pref, hand_pref_stu,age, char_name,loudness AS loudness_2
FROM `Q33righty`
) WITH DATA;

INSERT INTO Q33rightycopy SELECT student AS student_2, hand_pref, hand_pref_stu,age, char_name,loudness AS loudness_2
FROM `Q33righty`

SELECT * FROM Q33rightycopy

--project and select
CREATE TABLE Q33 AS(
SELECT DISTINCT student,student_2
FROM `Q33righty`,`Q33rightycopy`
WHERE `loudness`= `loudness_2` AND student <> student_2
) WITH DATA;

INSERT INTO Q33 SELECT DISTINCT student,student_2
FROM `Q33righty`,`Q33rightycopy`
WHERE `loudness`= `loudness_2` AND student <> student_2

SELECT * FROM Q33 