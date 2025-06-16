{% snapshot snap_ratings %}

{{
    config(
        target_schema='snapshots',
        unique_key=['user_id', 'movie_id'],
        strategy='timestamp',
        updated_at='rating_timestamp',
        invalidate_hard_deletes=True
    )
}}

SELECT 
    {{dbt_utils.generate_surrogate_key(['user_id','movie_id'])}} AS raw_key,
    user_id,
    movie_id,
    rating,
    CAST(rating_timestamp AS TIMESTAMP_NTZ) AS rating_timestamp
FROM {{ ref('src_ratings') }}

{% endsnapshot %}
