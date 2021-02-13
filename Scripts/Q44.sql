--theta join
CREATE TABLE Q44winners AS (
SELECT DISTINCT driver_name
FROM `Drivers` 
JOIN `Tournaments` 
ON driver_name = winner 
) WITH DATA;

INSERT INTO Q44winners 
SELECT DISTINCT driver_name
FROM `Drivers` 
JOIN `Tournaments` 
ON driver_name = winner  

SELECT * FROM Q44winners

--rename
CREATE TABLE Q44drivers AS (
SELECT driver_name AS driver_2
FROM `Drivers` 
) WITH DATA;

INSERT INTO Q44drivers 
SELECT driver_name AS driver_2
FROM `Drivers` 

SELECT * FROM Q44drivers

--minus
CREATE TABLE Q44losers AS (
SELECT *
FROM `Q44drivers`
EXCEPT
SELECT *
FROM `Q44winners`
) WITH DATA;

INSERT INTO Q44losers 
SELECT *
FROM `Q44drivers`
EXCEPT
SELECT *
FROM `Q44winners`

SELECT * FROM Q44losers

--theta join
CREATE TABLE Q44 AS (
SELECT driver_name,driver_2
FROM `Q44losers` 
JOIN `Q44winners` 
ON driver_name <> driver_2 
) WITH DATA;

INSERT INTO Q44 
SELECT driver_name,driver_2
FROM `Q44losers` 
JOIN `Q44winners` 
ON driver_name <> driver_2 

SELECT * FROM Q44
