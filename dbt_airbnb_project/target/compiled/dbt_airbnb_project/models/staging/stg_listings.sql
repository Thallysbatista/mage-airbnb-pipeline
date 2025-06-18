

with source as (
  select *
  from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
)

select
    cast(_id                                          as STRING)   as listing_id
  ,cast(host.host_id                                  as STRING)   as host_id
  ,cast(name                                          as STRING)   as name
  ,cast(description                                   as STRING)   as description
  ,cast(property_type                                 as STRING)   as property_type
  ,cast(room_type                                     as STRING)   as room_type
  ,cast(bed_type                                      as STRING)   as bed_type
  ,cast(minimum_nights                                as INT64)    as minimum_nights
  ,cast(maximum_nights                                as INT64)    as maximum_nights
  ,cast(cancellation_policy                           as STRING)   as cancellation_policy
  ,cast(accommodates                                  as INT64)    as accommodates
  ,cast(bedrooms                                      as INT64)    as bedrooms
  ,cast(beds                                          as INT64)    as beds
  ,cast(number_of_reviews                             as INT64)    as number_of_reviews
  ,cast(bathrooms                                     as FLOAT64)  as bathrooms
  ,cast(price                                         as NUMERIC)  as price
  ,cast(address.country                               as STRING)   as country
  ,cast(address.market                                as STRING)   as market
  ,cast(review_scores.review_scores_rating            as INT64)    as review_scores_rating
  ,cast(review_scores.review_scores_accuracy          as INT64)    as review_scores_accuracy
  ,cast(review_scores.review_scores_cleanliness       as INT64)    as review_scores_cleanliness
  ,cast(review_scores.review_scores_checkin           as INT64)    as review_scores_checkin
  ,cast(review_scores.review_scores_communication     as INT64)    as review_scores_communication
  ,cast(review_scores.review_scores_location          as INT64)    as review_scores_location
  ,cast(review_scores.review_scores_value             as INT64)    as review_scores_value
from source
