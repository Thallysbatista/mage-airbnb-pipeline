





select host_id
from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_listings`
where host_id is null
