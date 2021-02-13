--natural join and rename
CREATE TABLE Q41driversvehicles AS(
SELECT *
FROM `Drivers` 
NATURAL JOIN (SELECT `vehicle_name`, transmission AS `driving_capability` , fuel_efficiency FROM `Vehicles`) 
) WITH DATA;

INSERT INTO Q41driversvehicles SELECT *
FROM `Drivers` 
NATURAL JOIN (SELECT `vehicle_name`, transmission AS `driving_capability` , fuel_efficiency FROM `Vehicles`) 

SELECT * FROM Q41driversvehicles

--rename
CREATE TABLE Q41driversvehicles2 AS(
SELECT VEHICLE_NAME AS VEHICLE_NAME_2, driving_capability AS driving_capability_2,years_of_exp AS years_of_exp_2,driver_name AS driver_name_2, fuel_efficiency AS fuel_efficiency_2
FROM `Q41driversvehicles` 
) WITH DATA;

INSERT INTO Q41driversvehicles2 SELECT VEHICLE_NAME AS VEHICLE_NAME_2, driving_capability AS driving_capability_2,years_of_exp AS years_of_exp_2,driver_name AS driver_name_2, fuel_efficiency AS fuel_efficiency_2
FROM `Q41driversvehicles` 

SELECT * FROM Q41driversvehicles2

--rename and theta-join
CREATE TABLE Q41compare AS (
SELECT *
FROM `Q41driversvehicles`
JOIN `Q41driversvehicles2` 
ON driving_capability = DRIVING_CAPABILITY_2 AND driver_name <> driver_name_2
) WITH DATA;

INSERT INTO Q41compare SELECT *
FROM `Q41driversvehicles`
JOIN `Q41driversvehicles2` 
ON driving_capability = DRIVING_CAPABILITY_2 AND driver_name <> driver_name_2

SELECT * FROM Q41compare

--rename and theta-join
CREATE TABLE Q41partner AS (
SELECT *
FROM `Q41compare`
JOIN `Partners` 
ON driver_name = rookie AND driver_name_2 = `experienced` 
) WITH DATA;

INSERT INTO Q41partner SELECT *
FROM `Q41compare`
JOIN `Partners` 
ON driver_name = rookie AND driver_name_2 = `experienced` 

SELECT * FROM Q41partner

--project and select
CREATE TABLE Q41 AS (SELECT driver_name, driver_name_2
FROM `Q41partner`
WHERE driving_capability = DRIVING_CAPABILITY_2
) WITH DATA;

INSERT INTO Q41 
SELECT driver_name, driver_name_2
FROM `Q41partner`
WHERE driving_capability = DRIVING_CAPABILITY_2

SELECT * FROM Q41