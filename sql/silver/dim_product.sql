create or replace table 
`fashion-campus-508609.fashion_campus_silver.dim_product`

as 
select
  safe_cast(id as int64) as id,
  trim(gender) as gender,
  trim(masterCategory) as masterCategory,
  trim(subCategory) as subCategory,
  trim(articleType) as articleType,
  trim(baseColour) as baseColour,
  trim(season) as season,
  safe_cast(year as int64) as year,
  trim(usage) as usage,
  trim(productDisplayName) as product_name
from `fashion-campus-508609.fashion_campus_bronze.product`;