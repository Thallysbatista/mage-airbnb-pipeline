



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`delivery_reviews_summary`




    OPTIONS()
    as (


with aggregated as (
  select
     r.listing_id
    ,count(*) as review_count
    ,avg(length(review_comment)) as avg_comment_length
    ,sum(length(review_comment)) as total_comment_length
    ,max(review_date) as latest_review_date
    ,min(review_date) as first_review_date
  from `mage-airbnb-pipeline`.`raw_airbnb`.`trusted_reviews` r
  group by 1
)

, enriched as (
  select
     a.*
    ,c.year       as latest_review_year
    ,c.month      as latest_review_month
    ,c.week       as latest_review_week
    ,c.quarter    as latest_review_quarter
  from aggregated a
  left join `mage-airbnb-pipeline`.`raw_airbnb`.`dim_calendar` c
    on a.latest_review_date = c.date_day
)

select * from enriched
    );
