



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`delivery_host_summary`




    OPTIONS()
    as (


with enriched as (
  select
    host_id,
    host_name,
    price,
    number_of_reviews
  from `mage-airbnb-pipeline`.`raw_airbnb`.`trusted_listings_enriched`
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


  case
    when total_reviews = 0 then null
    else total_price / total_reviews
  end
 as avg_price_per_review
from agg
    );
