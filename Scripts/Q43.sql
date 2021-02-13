--natural join and rename
CREATE TABLE Q43driversvehicles AS(
SELECT *
FROM `Drivers` 
NATURAL JOIN (SELECT `vehicle_name`, transmission AS `driving_capability` , fuel_efficiency FROM `Vehicles`) 
) WITH DATA;

INSERT INTO Q43driversvehicles SELECT *
FROM `Drivers` 
NATURAL JOIN (SELECT `vehicle_name`, transmission AS `driving_capability` , fuel_efficiency FROM `Vehicles`) 

SELECT * FROM Q43driversvehicles

--rename
CREATE TABLE Q43driversvehicles2 AS(
SELECT VEHICLE_NAME AS VEHICLE_NAME_2, driving_capability AS driving_capability_2,years_of_exp AS years_of_exp_2,driver_name AS driver_name_2, fuel_efficiency AS fuel_efficiency_2
FROM `Q41driversvehicles` 
) WITH DATA;

INSERT INTO Q43driversvehicles2 SELECT VEHICLE_NAME AS VEHICLE_NAME_2, driving_capability AS driving_capability_2,years_of_exp AS years_of_exp_2,driver_name AS driver_name_2, fuel_efficiency AS fuel_efficiency_2
FROM `Q41driversvehicles` 

SELECT * FROM Q43driversvehicles2

--theta-join
CREATE TABLE Q43compare AS (
SELECT *
FROM `Q42driversvehicles`
JOIN `Q42driversvehicles2` 
ON (years_of_exp - years_of_exp_2) > 10 AND driving_capability_2 = "A" AND driving_capability = "A"
) WITH DATA;

INSERT INTO Q43compare SELECT *
FROM `Q42driversvehicles`
JOIN `Q42driversvehicles2` 
ON (years_of_exp - years_of_exp_2) > 10 AND driving_capability_2 = "A" AND driving_capability = "A"

SELECT * FROM Q43compare

--project and select
CREATE TABLE Q43 AS (SELECT driver_name, driver_name_2
FROM `Q43compare`
WHERE driving_capability_2 = "A" AND driving_capability = "A"
) WITH DATA;

INSERT INTO Q43 
SELECT driver_name, driver_name_2
FROM `Q43compare`
WHERE driving_capability_2 = "A" AND driving_capability = "A"

SELECT * FROM Q43