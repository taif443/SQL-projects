## This query finds the bike with the highest total usage time and identifies the station where it is most often used, helping the company highlight it in their marketing.
WITH longest_used_bike AS 
( 
 SELECT bike_id, SUM(duration_minutes) AS trip_duration 
 FROM bigquery-public-data.austin_bikeshare.bikeshare_trips
 GROUB BY bike_id
 ORDER BY trip_duration DESC
 LIMIT 1  
)

SELECT trips.start_station_id,
COUNT (*) AS trip_ct
FROM longest_used_bike AS longest
INNER JOIN 
bigquery-public-data.austin_bikeshare.bikeshare_trips AS trips
ON longest.bike_id = trips.bike_id
GROUP BY trip_ct DESC
LIMIT 1
