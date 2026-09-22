create or replace table 
`fashion-campus-508609.fashion_campus_silver.dim_customer` 

as
select 
  safe_cast(customer_id as int64) as customer_id,
  trim(first_name) as first_name,
  trim(last_name) as last_name,
  trim(username) as username,
  trim(email) as email,
  upper(trim(gender)) as gender,
  safe_cast(birthdate as date) as birthdate,
  trim(device_type) as device_type,
  trim(device_id) as device_id,
  trim(device_version) as device_version,
  safe_cast(home_location_lat as float64) as home_location_lat,
  safe_cast(home_location_long as float64) as home_location_long,
  trim(home_location) as home_location,
  trim(home_country) as home_country,
  safe_cast(first_join_date as date) as first_join_date
from `fashion-campus-508609.fashion_campus_bronze.customer`;