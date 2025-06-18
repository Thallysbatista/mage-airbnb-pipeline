
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (








select price
from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_listings`
where price is null






    ) dbt_internal_test
