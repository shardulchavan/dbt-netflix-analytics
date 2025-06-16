with raw_movies AS (
    SELECT * FROM MOVIELENS.RAW.raw_movies
)
SELECT 
    movieId AS movie_id,
    title,
    genres
FROM raw_movies