create or replace table 
`fashion-campus-508609.fashion_campus_silver.fact_click_stream`

as 
select 
  trim(event_id) as event_id,
  trim(session_id) as session_id, 
  upper(trim(event_name)) as event_name,
  datetime(safe_cast(event_time as timestamp)) as event_time,
  upper(trim(traffic_source)) as traffic_source,
  safe_cast(product_id as int64) as product_id,
  safe_cast(quantity as int64) as quantity,
  safe_cast(item_price as numeric) as item_price,
  trim(payment_status) as payment_status,
  trim(search_keywords) as search_keywords,
  if(promo_code is not null, upper(trim(promo_code)), null) as promo_code,
  safe_cast(promo_amount as numeric) as promo_amount
from `fashion-campus-508609.fashion_campus_bronze.click_stream`;