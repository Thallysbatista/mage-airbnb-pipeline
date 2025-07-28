

with src as (
  select
    _id      as listing_id
  ,address
  from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
)

select
    listing_id
  ,nullif(address.street, '')                                   as street
  ,nullif(address.suburb, '')                                   as suburb
  ,nullif(address.government_area, '')                          as government_area
  ,nullif(address.market, '')                                   as market
  ,nullif(address.country, '')                                  as country
  ,nullif(address.country_code, '')                             as country_code
  ,cast(address.location.coordinates[offset(1)] as FLOAT64)     as latitude
  ,cast(address.location.coordinates[offset(0)] as FLOAT64)     as longitude
  ,cast(address.location.is_location_exact as BOOLEAN)          as is_location_exact
from src
