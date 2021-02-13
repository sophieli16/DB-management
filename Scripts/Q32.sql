--rename
CREATE TABLE Q32renamed AS(
SELECT student, hand_pref AS hand_pref_stu, char_name
FROM `Students`
) WITH DATA;

INSERT INTO Q32renamed SELECT student, hand_pref AS hand_pref_stu, char_name
FROM `Students`

SELECT * FROM Q32renamed

--rename
CREATE TABLE Q32renamed2 AS(
SELECT student AS student_2, hand_pref AS hand_pref_stu_2, char_name AS char_name_2
FROM `Students`
) WITH DATA;

INSERT INTO Q32renamed2 SELECT student AS student_2, hand_pref AS hand_pref_stu_2, char_name AS char_name_2
FROM `Students`

SELECT * FROM Q32renamed2

--rename and theta-join
CREATE TABLE Q32samehandpref AS (
SELECT student,char_name,student_2,char_name_2,hand_pref_stu AS hand_pref
FROM `Q32renamed`
JOIN `Q32renamed2`
ON hand_pref_stu = hand_pref_stu_2 AND student <> student_2 
) WITH DATA;

INSERT INTO Q32samehandpref SELECT student,char_name,student_2,char_name_2,hand_pref_stu AS hand_pref
FROM `Q32renamed`
JOIN `Q32renamed2`
ON hand_pref_stu = hand_pref_stu_2 AND student <> student_2

SELECT * FROM Q32samehandpref

/*
--rename and theta-join
CREATE TABLE Q32studentcouples AS (
SELECT student,char_name,student_2,char_name_2, hand_pref
FROM `Q32samehandpref`
JOIN (SELECT `young`,`old` FROM `Couples`)
ON young = char_name AND OLD = char_name_2 OR young=char_name_2 AND OLD=char_name
) WITH DATA;

INSERT INTO Q32studentcouples SELECT student,char_name,student_2,char_name_2, hand_pref
FROM `Q32samehandpref`
JOIN (SELECT `young`,`old` FROM `Couples`)
ON young = char_name AND OLD = char_name_2 OR young=char_name_2 AND OLD=char_name

SELECT * FROM Q32studentcouples
*/

--rename
CREATE TABLE Q32characters AS (
SELECT char_name,hand_pref AS hand_pref_char,loudness
FROM `Characters` 
) WITH DATA;

INSERT INTO Q32characters SELECT char_name,hand_pref AS hand_pref_char,loudness
FROM `Characters` 

SELECT * FROM Q32characters

--rename
CREATE TABLE Q32characters2 AS (
SELECT char_name AS char_name_2,hand_pref AS hand_pref_char_2,loudness AS loudness_2
FROM `Characters` 
) WITH DATA;

INSERT INTO Q32characters2 SELECT char_name AS char_name_2,hand_pref AS hand_pref_char_2,loudness AS loudness_2
FROM `Characters` 

SELECT * FROM Q32characters2

--rename and theta-join
CREATE TABLE Q32charactercouples AS (
SELECT char_name,hand_pref_char,loudness,char_name_2,hand_pref_char_2,loudness_2
FROM `Q32characters`
JOIN `Q32characters2`
ON char_name_2 <> char_name AND loudness=loudness_2 AND hand_pref_char <> hand_pref_char_2
) WITH DATA;

INSERT INTO Q32charactercouples SELECT char_name,hand_pref_char,loudness,char_name_2,hand_pref_char_2,loudness_2
FROM `Q32characters`
JOIN `Q32characters2`
ON char_name_2 <> char_name AND loudness=loudness_2 AND hand_pref_char <> hand_pref_char_2

SELECT * FROM Q32charactercouples

--natural join
CREATE TABLE Q33coupletest AS(
SELECT *
FROM `Q32charactercouples`
NATURAL JOIN `Q32samehandpref`
) WITH DATA;

INSERT INTO Q33coupletest
SELECT *
FROM `Q32charactercouples`
NATURAL JOIN `Q32samehandpref`

SELECT * FROM Q33coupletest

--project and select
CREATE TABLE Q32 AS (SELECT student, student_2
FROM `Q33coupletest`
WHERE loudness = loudness_2
) WITH DATA;

INSERT INTO Q32 
SELECT student, student_2
FROM `Q33coupletest`
WHERE loudness = loudness_2

SELECT * FROM Q32