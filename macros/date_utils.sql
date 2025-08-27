{% macro get_season(date) %}

CASE WHEN MONTH(TO_TIMESTAMP({{date}})) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{date}})) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{date}})) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END

{% endmacro %}

{% macro day_type(date) %}
CASE
    WHEN DAYNAME(TO_TIMESTAMP({{date}})) in ('Sat','Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END
{% endmacro %}