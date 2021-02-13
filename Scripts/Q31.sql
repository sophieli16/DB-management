--natural join
CREATE TABLE Q31studentchar AS(
SELECT *
FROM `Students`
NATURAL JOIN `Characters`
) WITH DATA;

INSERT INTO Q31studentchar SELECT *
FROM `Students`
NATURAL JOIN `Characters`

SELECT * FROM Q31studentchar

--rename and theta-join
CREATE TABLE Q31youngchar AS (
SELECT `old`, char_name AS char_young, student AS student_young, age AS age_young, loudness AS loudness_young, hand_pref AS hand_pref_young
FROM `Q31studentchar`
JOIN `Couples`
ON young = char_name
) WITH DATA;

INSERT INTO Q31youngchar SELECT `old`, char_name AS char_young, student AS student_young, age AS age_young, loudness AS loudness_young, hand_pref AS hand_pref_young
FROM `Q31studentchar`
JOIN `Couples`
ON young = char_name

SELECT * FROM Q31youngchar


--rename and theta-join
CREATE TABLE Q31oldyoungcharcouple AS (
SELECT char_young, student_young, char_name AS char_old, 
student AS student_old, age_young, loudness_young, hand_pref_young, 
age AS age_old, 
loudness AS loudness_old, 
hand_pref AS hand_pref_old
FROM `Q31youngchar`
JOIN `Q31studentchar`
ON old = char_name
) WITH DATA;

INSERT INTO Q31oldyoungcharcouple 
SELECT char_young, student_young, char_name AS char_old, 
student AS student_old, age_young, loudness_young, hand_pref_young, 
age AS age_old, 
loudness AS loudness_old, 
hand_pref AS hand_pref_old
FROM `Q31youngchar`
JOIN `Q31studentchar`
ON old = char_name

SELECT * FROM Q31oldyoungcharcouple

--project and select
CREATE TABLE Q31 AS (SELECT student_young, student_old
FROM `Q31oldyoungcharcouple`
WHERE hand_pref_old <> hand_pref_young
) WITH DATA;

INSERT INTO Q31 
SELECT student_young, student_old
FROM `Q31oldyoungcharcouple`
WHERE hand_pref_old <> hand_pref_young

SELECT * FROM Q31