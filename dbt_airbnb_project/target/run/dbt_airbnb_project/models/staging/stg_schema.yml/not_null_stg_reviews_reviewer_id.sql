
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (








select reviewer_id
from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_reviews`
where reviewer_id is null






    ) dbt_internal_test
