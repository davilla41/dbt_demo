WITH BIKE as (
    SELECT
    DISTINCT
    start_statio_id as station_id,
    start_station_name as station_name,
    start_lat as station_lat,
    start_lng as station_lng
    FROM {{ ref('stg_bike') }}  
    
)
SELECT *
FROM BIKE