--natural join and rename
CREATE TABLE Q42driversvehicles AS(
SELECT *
FROM `Drivers` 
NATURAL JOIN (SELECT `vehicle_name`, transmission AS `driving_capability` , fuel_efficiency FROM `Vehicles`) 
) WITH DATA;

INSERT INTO Q42driversvehicles SELECT *
FROM `Drivers` 
NATURAL JOIN (SELECT `vehicle_name`, transmission AS `driving_capability` , fuel_efficiency FROM `Vehicles`) 

SELECT * FROM Q42driversvehicles

--rename
CREATE TABLE Q42driversvehicles2 AS(
SELECT VEHICLE_NAME AS VEHICLE_NAME_2, driving_capability AS driving_capability_2,years_of_exp AS years_of_exp_2,driver_name AS driver_name_2, fuel_efficiency AS fuel_efficiency_2
FROM `Q41driversvehicles` 
) WITH DATA;

INSERT INTO Q42driversvehicles2 SELECT VEHICLE_NAME AS VEHICLE_NAME_2, driving_capability AS driving_capability_2,years_of_exp AS years_of_exp_2,driver_name AS driver_name_2, fuel_efficiency AS fuel_efficiency_2
FROM `Q41driversvehicles` 

SELECT * FROM Q42driversvehicles2

--rename and theta-join
CREATE TABLE Q42compare AS (
SELECT *
FROM `Q42driversvehicles`
JOIN `Q42driversvehicles2` 
ON fuel_efficiency = fuel_efficiency_2 AND driving_capability = DRIVING_CAPABILITY_2 AND driver_name <> driver_name_2 
) WITH DATA;

INSERT INTO Q42compare SELECT *
FROM `Q42driversvehicles`
JOIN `Q42driversvehicles2` 
ON fuel_efficiency = fuel_efficiency_2 AND driving_capability = DRIVING_CAPABILITY_2 AND driver_name <> driver_name_2 

SELECT * FROM Q42compare

--rename and theta-join
CREATE TABLE Q42partner AS (
SELECT *
FROM `Q42compare`
JOIN `Partners` 
ON driver_name = rookie AND driver_name_2 = `experienced` 
) WITH DATA;

INSERT INTO Q42partner SELECT *
FROM `Q42compare`
JOIN `Partners` 
ON driver_name = rookie AND driver_name_2 = `experienced` 

SELECT * FROM Q42partner

--project and select
CREATE TABLE Q42 AS (SELECT driver_name, driver_name_2
FROM `Q42partner`
WHERE driving_capability = DRIVING_CAPABILITY_2
) WITH DATA;

INSERT INTO Q42 
SELECT driver_name, driver_name_2
FROM `Q42partner`
WHERE driving_capability = DRIVING_CAPABILITY_2

SELECT * FROM Q42