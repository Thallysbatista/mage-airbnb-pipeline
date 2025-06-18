



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`stg_calendar`




    OPTIONS()
    as (
      -- models/staging/stg_availability.sql


with src as (
  select
    _id as listing_id,
    availability
  from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
)

select
  listing_id,
  availability.availability_30  as available_30,
  availability.availability_60  as available_60,
  availability.availability_90  as available_90,
  availability.availability_365 as available_365
from src
    );
