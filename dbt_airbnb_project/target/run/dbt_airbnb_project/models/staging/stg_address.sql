
  
    

    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`stg_address`
      
    
    

    OPTIONS()
    as (
      -- models/staging/stg_address.sql


with src as (
  select
    _id as listing_id,
    address
  from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
)

select
  listing_id
  ,address.street           as street
  ,address.suburb           as suburb
  ,address.government_area  as government_area
  ,address.market           as market
  ,address.country          as country
  ,address.country_code     as country_code
  ,address.location.coordinates[offset(1)] as latitude -- As coords vêm num array [longitude, latitude
  ,address.location.coordinates[offset(0)] as longitude
  ,address.location.is_location_exact     as is_location_exact
from src
    );
  