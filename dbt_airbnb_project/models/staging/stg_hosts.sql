{{ config(materialized='table') }}

with source as (
  select *
  from {{ source('raw_airbnb', 'listings_and_reviews_raw') }}
)

select
    cast(host.host_id       as STRING)  as host_id
  ,cast(host.host_name     as STRING)   as host_name
  ,cast(host.host_location as STRING)   as host_location
from source
