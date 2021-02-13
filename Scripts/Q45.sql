--theta join
CREATE TABLE Q45winners AS (
SELECT DISTINCT driver_name
FROM `Drivers` 
JOIN `Tournaments` 
ON driver_name = winner 
) WITH DATA;

INSERT INTO Q45winners 
SELECT DISTINCT driver_name
FROM `Drivers` 
JOIN `Tournaments` 
ON driver_name = winner  

SELECT * FROM Q45winners

--natural join
CREATE TABLE Q45 AS (
SELECT DISTINCT driver_name, vehicle_name
FROM `Q45winners` 
NATURAL JOIN `Drivers` 
) WITH DATA;

INSERT INTO Q45 
SELECT DISTINCT driver_name, vehicle_name
FROM `Q45winners` 
NATURAL JOIN `Drivers` 

SELECT * FROM Q45
