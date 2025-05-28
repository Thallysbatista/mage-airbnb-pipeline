-- models/staging/stg_availability.sql
{{ config(materialized='table') }}

with src as (
  select
    _id as listing_id,
    availability
  from {{ source('raw_airbnb', 'listings_and_reviews_raw') }}
)

select
  listing_id,
  availability.availability_30  as available_30,
  availability.availability_60  as available_60,
  availability.availability_90  as available_90,
  availability.availability_365 as available_365
from src
