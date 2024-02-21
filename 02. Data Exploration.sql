-- Checking number of rows =5719877
SELECT COUNT(*) AS total_row
FROM `gda-capstone-01.cyclistic23.combined`;

-- Checking the data types of all columns
SELECT column_name, data_type
FROM gda-capstone-01.cyclistic23.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined';

-- Checking null value of every columns
SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `gda-capstone-01.cyclistic23.combined`;

-- Checking duplicated rows
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS count_duplicate_rows
FROM `gda-capstone-01.cyclistic23.combined`;

-- Checking characters (length) - ride_id
SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS length_of_rows
FROM `gda-capstone-01.cyclistic23.combined`
GROUP BY length_ride_id;

-- Checking bike types
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS bike_type
FROM `gda-capstone-01.cyclistic23.combined`
GROUP BY rideable_type;

-- Checking riding duration - started_at, ended_at
SELECT ride_id, started_at, ended_at
FROM `gda-capstone-01.cyclistic23.combined`
WHERE 
TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

#started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC
  
-- Checking riding duration - longer than 24 hours
SELECT COUNT(*) AS longer_24_hours
FROM `gda-capstone-01.cyclistic23.combined`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440; 

-- Checking riding duration - less than 1 minute
SELECT COUNT(*) AS less_1_minutes
FROM `gda-capstone-01.cyclistic23.combined`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1; 

-- Checking starting station with null value
SELECT COUNT(ride_id) AS start_station_null
FROM `gda-capstone-01.cyclistic23.combined`
WHERE start_station_name IS NULL OR start_station_id IS NULL;

-- Checking ending station with null value
SELECT COUNT(ride_id) AS end_station_null
FROM `gda-capstone-01.cyclistic23.combined`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

-- Checking start and end of latitude and longitude with null value
SELECT COUNT(*) AS count_end_null
FROM `gda-capstone-01.cyclistic23.combined`
WHERE
start_lat IS NULL OR
start_lng IS NULL OR
end_lat IS NULL OR
end_lng IS NULL;

#Checking membership type
SELECT member_casual, COUNT(*) as member_type
FROM `gda-capstone-01.cyclistic23.combined`
GROUP BY member_casual;

