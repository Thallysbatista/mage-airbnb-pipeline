

with source as (
    select * 
    from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
)

select
    host.host_id       as host_id,
    host.host_name     as host_name,
    host.host_location as host_location
from source