with listings as (
  select * from {{ ref('trusted_listings_enriched') }}
),

reviews as (
  select
    listing_id
    ,count(*) as review_count
  from {{ ref('trusted_reviews') }}
  group by listing_id
)

select
  l.listing_id
  ,l.name
  ,l.market
  ,l.country
  ,l.price
  ,l.review_scores_rating            as avg_review_score
  ,coalesce(r.review_count, 0)       as total_reviews
  ,l.available_30                    as avail_next_30d
  ,l.available_90                    as avail_next_90
from listings l
left join reviews r
  on l.listing_id = r.listing_id
