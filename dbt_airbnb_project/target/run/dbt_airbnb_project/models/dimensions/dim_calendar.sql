



    create or replace table `mage-airbnb-pipeline`.`raw_airbnb`.`dim_calendar`




    OPTIONS()
    as (
      with calendar as (
    select
      date_day
      ,extract(year from date_day)         as year
      ,extract(month from date_day)        as month
      ,format_date('%Y-%m', date_day)      as year_month
      ,format_date('%b', date_day)         as month_name
      ,extract(dayofweek from date_day)    as day_of_week
      ,format_date('%A', date_day)         as day_name
      ,extract(week from date_day)         as week
      ,extract(quarter from date_day)      as quarter
      ,case when extract(dayofweek from date_day) in (1, 7) then true else false end as is_weekend
      ,case when date_day = current_date() then true else false end as is_today
    from unnest(generate_date_array('2009-01-01', '2019-12-31', interval 1 day)) as date_day
)
select * from calendar
    );
