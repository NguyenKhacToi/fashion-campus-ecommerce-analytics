create or replace table 
`fashion-campus-508609.fashion_campus_silver.fact_order`

as 
select
  booking_id,
  any_value(safe_cast(customer_id as int64)) as customer_id,
  any_value(trim(session_id)) as session_id,
  min(datetime(safe_cast(created_at as timestamp))) as created_at,
  any_value(trim(payment_method)) as payment_method,
  any_value(trim(payment_status)) as payment_status,
  any_value(safe_cast(promo_amount as numeric)) as promo_amount,
  any_value(if(promo_code is not null, upper(trim(promo_code)), null)) as promo_code,
  any_value(safe_cast(shipment_fee as numeric)) as shipment_fee,
  min(datetime(safe_cast(shipment_date_limit as timestamp))) as shipment_date_limit,
  any_value(safe_cast(shipment_location_lat as float64)) as shipment_location_lat,
  any_value(safe_cast(shipment_location_long as float64)) as shipment_location_long,
  any_value(safe_cast(total_amount as numeric)) as total_amount
from `fashion-campus-508609.fashion_campus_bronze.transaction`
group by booking_id;