create or replace table 
`fashion-campus-508609.fashion_campus_gold.fact_order_item` 

as
select
    booking_id,
    product_id,
    quantity,
    item_price,
    line_value
from
    `fashion-campus-508609.fashion_campus_silver.fact_order_item`;