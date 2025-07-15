{{ config(materialized = 'table') }}

select
  listing_id
  ,review_count
  ,avg_comment_length
  ,total_comment_length
  ,latest_review_date
  ,first_review_date
from {{ ref('trusted_reviews_aggregated') }}
