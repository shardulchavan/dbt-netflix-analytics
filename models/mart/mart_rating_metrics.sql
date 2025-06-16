{{
    config(
        materialized = 'table'
    )
}}
WITH ratings AS (
    SELECT 
        r.user_id,
        r.movie_id,
        r.rating,
        DATE_TRUNC('month', r.rating_timestamp) AS rating_month,
        m.genres
    FROM {{ ref('src_ratings') }} r
    JOIN {{ ref('src_movies') }} m 
      ON r.movie_id = m.movie_id
),

flattened AS (
    SELECT 
        user_id,
        movie_id,
        rating,
        rating_month,
        genre.value::STRING AS genre
    FROM ratings,
         LATERAL FLATTEN(input => SPLIT(genres, '|')) AS genre
),

aggregated AS (
    SELECT 
        rating_month,
        genre,
        COUNT(*) AS total_ratings,
        COUNT(DISTINCT user_id) AS active_users,
        COUNT(DISTINCT movie_id) AS rated_movies,
        ROUND(AVG(rating), 2) AS avg_rating
    FROM flattened
    GROUP BY rating_month, genre
)

SELECT *
FROM aggregated
ORDER BY rating_month, genre
