WITH raw_links AS (
    SELECT * FROM MOVIELENS.RAW.raw_links
)

SELECT 
    imdbId AS imdb_id,
    movieId AS movie_id,
    tmdbId AS tmdb_id
FROM raw_links