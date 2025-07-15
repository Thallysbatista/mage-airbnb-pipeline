



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`delivery_reviews_summary`




    OPTIONS()
    as (


select
  listing_id
  ,review_count
  ,avg_comment_length
  ,total_comment_length
  ,latest_review_date
  ,first_review_date
from `mage-airbnb-pipeline`.`raw_airbnb`.`trusted_reviews_aggregated`
    );
