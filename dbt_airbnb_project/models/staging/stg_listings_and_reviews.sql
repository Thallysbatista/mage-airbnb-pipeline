{{ config(materialized = 'table') }}

with source as (
  select
    cast(_id                                  as STRING)   as listing_id
    ,cast(host.host_id                        as STRING)   as host_id
    ,cast(name                                as STRING)   as name
    ,cast(room_type                           as STRING)   as room_type
    ,cast(property_type                       as STRING)   as property_type
    ,cast(price                               as NUMERIC)  as price
    ,cast(minimum_nights                      as INT64)    as minimum_nights
    ,cast(maximum_nights                      as INT64)    as maximum_nights
    ,cast(number_of_reviews                   as INT64)    as number_of_reviews
    ,cast(accommodates                        as INT64)    as number_of_people
    ,cast(beds                                as INT64)    as number_of_beds
    ,cast(bedrooms                            as INT64)    as number_of_bedrooms
    ,cast(review_scores.review_scores_rating  as FLOAT64)  as review_score
    ,cast(address.country                     as STRING)   as country
    ,cast(address.market                      as STRING)   as market
  from {{ source('raw_airbnb', 'listings_and_reviews_raw') }}
)

select * from source
