
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (








select host_id
from `mage-airbnb-pipeline`.`raw_airbnb`.`delivery_host_summary`
where host_id is null






    ) dbt_internal_test
