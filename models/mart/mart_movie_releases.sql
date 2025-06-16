{{
    config(
        materialized = 'table'
    )
}}

WITH fct_ratings AS(
    SELECT * FROM {{ref('fct_ratings')}}
),
seed_dates AS (
    SELECT * FROM {{ref('seed_movie_release_dates')}}
)

SELECT 
    fr.*,
    CASE 
    WHEN sd.release_date IS NULL THEN 'UNKNOWN'
    ELSE 'KNOWN'
    END AS release_info_available
FROM fct_ratings fr
LEFT JOIN seed_dates sd
ON fr.movie_id = sd.movie_id