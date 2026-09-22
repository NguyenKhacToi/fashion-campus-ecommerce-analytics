create or replace table 
`fashion-campus-508609.fashion_campus_silver.fact_order_item`

as 
select
  booking_id,
  safe_cast(product_id as int64) as product_id,
  safe_cast(quantity as int64) as quantity,
  safe_cast(item_price as numeric) as item_price,
  safe_cast(quantity as int64)*safe_cast(item_price as numeric) as line_value
from `fashion-campus-508609.fashion_campus_bronze.transaction`;