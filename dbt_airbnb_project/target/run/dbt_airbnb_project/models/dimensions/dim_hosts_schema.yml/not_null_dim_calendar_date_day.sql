
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (








select date_day
from `mage-airbnb-pipeline`.`raw_airbnb`.`dim_calendar`
where date_day is null






    ) dbt_internal_test
