
  
    

    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`stg_reviews`
      
    
    

    OPTIONS()
    as (
      

with source as (
  select
      _id     as listing_id
    , reviews
  from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
),

exploded as (
  select
    cast(source.listing_id          as STRING)   as listing_id
    ,cast(review.reviewer_id        as STRING)   as reviewer_id
    ,cast(review.date               as DATE)     as date
    ,cast(review.reviewer_name      as STRING)   as reviewer_name
    ,cast(review.comments           as STRING)   as comments
  from source
  cross join unnest(reviews) as review
)

select * from exploded
    );
  