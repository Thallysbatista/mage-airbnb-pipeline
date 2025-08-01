
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






with dbt_test__target as (

  select date_day as unique_field
  from `mage-airbnb-pipeline`.`raw_airbnb`.`dim_calendar`
  where date_day is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1






    ) dbt_internal_test
