{{ config(materialized='table') }}

with source as (
    select * 
    from {{ source('raw_airbnb', 'listings_and_reviews_raw') }}
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
