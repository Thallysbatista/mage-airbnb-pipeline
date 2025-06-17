
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select listing_id
from `mage-airbnb-pipeline`.`raw_airbnb`.`stg_listings_and_reviews`
where listing_id is null



  
  
      
    ) dbt_internal_test