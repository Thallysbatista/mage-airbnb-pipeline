-- models/trusted/trusted_reviews_aggregated.sql



select
   listing_id
  ,review_comment
  ,review_date
from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_reviews`
where review_date is not null
