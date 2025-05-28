{{ config(
    materialized = 'table'
) }}

with source as (
    select
        _id           as listing_id
        ,reviews
    from {{ source('raw_airbnb', 'listings_and_reviews_raw') }}
),

exploded as (
    -- “explode” o array de reviews em linhas individuais
    select
        source.listing_id
        ,review.reviewer_id             as reviewer_id
        ,review.date                    as date
        ,review.reviewer_name           as reviewer_name
        ,review.comments                as comments
    from source
    cross join unnest(reviews) as review
)

select * from exploded
