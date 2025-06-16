WITH raw_genome_scores AS (
    SELECT * FROM {{source('netflix_dbt','r_genome_scores')}}
)

SELECT 
    movieId as movie_id,
    tagId AS tag_id,
    relevance   
FROM raw_genome_scores
