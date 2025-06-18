



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`trusted_reviews_aggregated`




    OPTIONS()
    as (
      -- models/trusted/trusted_reviews_aggregated.sql



with reviews as (
    select * from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_reviews`
),

aggregated as (
    select
         listing_id
        ,count(*)                              as review_count
        ,avg(length(review_comment))          as avg_comment_length
        ,sum(length(review_comment))          as total_comment_length
        ,max(review_date)                     as latest_review_date
        ,min(review_date)                     as first_review_date
    from reviews
    group by listing_id
)

select * from aggregated
    );
