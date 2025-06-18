



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`trusted_listings_enriched`




    OPTIONS()
    as (
      -- models/trusted/trusted_listings_enriched.sql



with listings as (
  select * from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_listings`
),

hosts as (
  select * from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_hosts`
),

address as (
  select * from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_address`
),

availability as (
  select * from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_availability`
)

select
    l.listing_id
  ,l.name
  ,l.description
  ,l.property_type
  ,l.room_type
  ,l.bed_type
  ,l.minimum_nights
  ,l.maximum_nights
  ,l.cancellation_policy
  ,l.accommodates
  ,l.bedrooms
  ,l.beds
  ,l.number_of_reviews
  ,l.bathrooms
  ,l.price
  ,h.host_id
  ,h.host_name
  ,h.host_location
  ,a.street
  ,a.suburb
  ,a.government_area
  ,a.market
  ,a.country
  ,a.latitude
  ,a.longitude
  ,a.is_location_exact
  ,l.review_scores_rating
  ,l.review_scores_accuracy
  ,l.review_scores_cleanliness
  ,l.review_scores_checkin
  ,l.review_scores_communication
  ,l.review_scores_location
  ,l.review_scores_value
  ,av.available_30
  ,av.available_60
  ,av.available_90
  ,av.available_365
from listings l
left join hosts       h  on l.host_id = h.host_id
left join address     a  on l.listing_id = a.listing_id
left join availability av on l.listing_id = av.listing_id
    );
