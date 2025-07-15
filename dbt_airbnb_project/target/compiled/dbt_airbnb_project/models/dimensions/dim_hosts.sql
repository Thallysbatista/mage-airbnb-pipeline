

with raw as (
  select
      host_id
      ,host_name
      ,host_location
  from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_hosts`
)

select
  host_id
  ,any_value(host_name)     as host_name -- Aqui usamos any_value() para pegar um valor arbitrário (e consistente) por host_id.
  ,any_value(host_location) as host_location
from raw
group by host_id
