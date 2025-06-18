



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`stg_reviews`




    OPTIONS()
    as (
      -- models/staging/stg_reviews.sql



with source as (
    select
        _id         as raw_listing_id,
        reviews     as raw_reviews_array
    from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
),

exploded as (
    select
         cast(raw_listing_id                   as string)  as listing_id
        ,cast(review.reviewer_id               as string)  as reviewer_id
        ,cast(review.date                      as date)    as review_date
        ,cast(review.reviewer_name             as string)  as reviewer_name
        ,cast(review.comments                  as string)  as review_comment
    from source
    cross join unnest(raw_reviews_array) as review
)

select * from exploded
    );
