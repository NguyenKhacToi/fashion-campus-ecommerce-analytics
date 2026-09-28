create or replace table 
`fashion-campus-508609.fashion_campus_gold.fact_order`

as
select
  booking_id,
  customer_id,
  session_id,
  created_at as order_time,
  payment_method,
  payment_status,
  coalesce(promo_code,"No Promo") as promo_code,
  promo_amount,
  shipment_fee,
  total_amount
from `fashion-campus-508609.fashion_campus_silver.fact_order`;