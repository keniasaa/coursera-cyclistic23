-- Bikes types used by riders
SELECT member_casual, rideable_type, 
COUNT(*) AS total_rides
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides;

-- No. of rides per month
SELECT member_casual, month, 
COUNT(*) AS total_rides_per_month
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY member_casual, month
ORDER BY member_casual,total_rides_per_month;

-- No. of rides per day of week
SELECT member_casual, day_of_week, 
COUNT(*) AS total_rides_per_week
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual, total_rides_per_week;

-- No. of rides per hour
SELECT member_casual, 
EXTRACT(HOUR FROM started_at) AS hour_of_day, 
COUNT(*) AS total_rides_hour
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY member_casual,hour_of_day
ORDER BY member_casual, total_rides_hour;

-- Average ride_length per month
SELECT member_casual, month, AVG(ride_length_in_mins) AS avg_ride_month
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY member_casual, month
ORDER BY member_casual, avg_ride_month;

-- Average ride_length per day of week
SELECT member_casual, day_of_week, AVG(ride_length_in_mins) AS avg_ride_week
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual, avg_ride_week;


-- Average ride_length per hour
SELECT member_casual, EXTRACT(HOUR FROM started_at) AS hour_of_day, AVG(ride_length_in_mins) AS avg_ride_hour
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, avg_ride_hour;


-- Starting station locations
SELECT member_casual, start_station_name, 
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_rides
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY start_station_name, member_casual
ORDER BY member_casual;

-- Ending station locations
SELECT member_casual,end_station_name, 
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_rides
FROM gda-capstone-01.cyclistic23.cleaned
GROUP BY end_station_name, member_casual
ORDER BY member_casual;
