-- models/trusted/trusted_reviews_aggregated.sql

{{ config(materialized = 'table') }}

select
   listing_id
  ,review_comment
  ,review_date
from {{ ref('stg_reviews') }}
where review_date is not null
