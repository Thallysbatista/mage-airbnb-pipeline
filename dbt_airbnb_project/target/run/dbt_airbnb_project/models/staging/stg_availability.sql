
  
    

    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`stg_availability`
      
    
    

    OPTIONS()
    as (
      

with src as (
  select
    _id                                   as listing_id
  , availability
  from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
)

select
    listing_id
  ,cast(availability.availability_30  as INT64) as available_30
  ,cast(availability.availability_60  as INT64) as available_60
  ,cast(availability.availability_90  as INT64) as available_90
  ,cast(availability.availability_365 as INT64) as available_365
from src
    );
  