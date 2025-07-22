{{ config(materialized = 'table') }}

with enriched as (
  select
    host_id,
    host_name,
    price,
    number_of_reviews
  from {{ ref('trusted_listings_enriched') }}
),

agg as (
  select
    host_id,
    host_name,
    sum(price)             as total_price,
    sum(number_of_reviews) as total_reviews
  from enriched
  group by 1,2
)

select
  host_id,
  host_name,
  total_price,
  total_reviews,
  {{ safe_divide('total_price', 'total_reviews') }} as avg_price_per_review
from agg
