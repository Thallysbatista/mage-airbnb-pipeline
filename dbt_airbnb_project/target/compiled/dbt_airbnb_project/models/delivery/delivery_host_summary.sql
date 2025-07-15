

with listings as (
  select * from `mage-airbnb-pipeline`.`raw_airbnb`.`trusted_listings_enriched`
)

select
  host_id
  ,host_name
  ,count(distinct listing_id)   as total_listings
  ,avg(price)                   as avg_price_per_host
  ,avg(review_scores_rating)    as avg_host_score
from listings
group by 1,2
