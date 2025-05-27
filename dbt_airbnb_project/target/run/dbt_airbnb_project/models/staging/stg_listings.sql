
  
    

    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`stg_listings`
      
    
    

    OPTIONS()
    as (
      

with source as (
    select * 
    from `mage-airbnb-pipeline`.`raw_airbnb`.`listings_and_reviews_raw`
),

renamed as (
    select
        _id                     as listing_id,
        name,
        description,
        property_type,
        room_type,
        bed_type,
        minimum_nights,
        maximum_nights,
        cancellation_policy,
        accommodates,
        bedrooms,
        beds,
        number_of_reviews,
        bathrooms,
        price,
        address.country        as country,
        address.market         as market
    from source
)

select * from renamed
    );
  