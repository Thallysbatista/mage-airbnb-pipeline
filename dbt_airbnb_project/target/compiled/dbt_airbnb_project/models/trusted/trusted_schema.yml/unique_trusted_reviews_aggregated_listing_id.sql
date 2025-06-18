



with dbt_test__target as (

  select listing_id as unique_field
  from `mage-airbnb-pipeline`.`raw_airbnb`.`trusted_reviews_aggregated`
  where listing_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1
