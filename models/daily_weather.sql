WITH daily_weather as (
    SELECT
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds

    FROM {{source('demo','weather')}}

),
daily_weather_agg as (
    SELECT
    daily_weather,
    weather,
    ROUND(AVG(temp),2) as avg_temp,
    ROUND(AVG(pressure),2) as avg_pressure,
    ROUND(AVG(humidity),2) as avg_humidity,
    ROUND(AVG(clouds),2) as avg_clouds
    --count(weather),
    --ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) AS row_number
    FROM daily_weather
    GROUP BY daily_weather, weather
    QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1

)

SELECT *
FROM daily_weather_agg