{% macro test_table_not_empty(model, column_name=1) %}
{# We are keeping the column to make use of this in case we want personalized validations 
    but if we use only in a table context, it will be ignored and replaced by 1 (default) #}
{% set error_threshold = kwargs.get('error_threshold', 0) %}
{# This threshols is also an option to make the test more dynamic in case we decide to validate
    tables with less than 100 rows, for example #}

WITH count_rows AS (

    SELECT
        count({{ column_name }}) AS cnt
    FROM {{ model }}

)

SELECT
    cnt
FROM count_rows
WHERE cnt <= {{ error_threshold }}
{# We expect here to return no values, if cnt is smaller than the threshold the test will fail #}
{% endmacro %}