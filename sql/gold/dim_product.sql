create or replace table 
`fashion-campus-508609.fashion_campus_gold.dim_product`

as 
select
  id as product_id,
  gender,
  masterCategory,
  subCategory,
  articleType,
  baseColour,
  season,
  year as product_year,
  usage,
  product_name
from `fashion-campus-508609.fashion_campus_silver.dim_product`;