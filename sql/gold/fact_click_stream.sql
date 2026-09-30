create or replace table 
`fashion-campus-508609.fashion_campus_gold.fact_click_stream`

as 
select
    event_id,
    session_id,
    event_name,
    event_time,
    date(event_time) as event_date,
    traffic_source,
    product_id,
    quantity,
    item_price,
    payment_status,
    search_keywords,
    promo_code,
    promo_amount
from `fashion-campus-508609.fashion_campus_silver.fact_click_stream`;