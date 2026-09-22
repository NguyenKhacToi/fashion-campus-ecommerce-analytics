create or replace table 
`fashion-campus-508609.fashion_campus_silver.dim_date`

as 
select 

    #Primary Key
    d as date,
    cast(format_date('%Y%m%d',d) as int64) as date_key,
    #Year
    extract(year from d) as year,
    #Quarter
    extract(quarter from d) as quarter_number,
    'Q'|| extract(quarter from d) as quarter,
    extract(year from d) || '/Q' || extract(quarter from d) as year_quarter,
    #Month
    extract(month from d) as month_number,
    format_date('%b',d) as month_name_short,
    format_date('%B',d) as month_name_long,
    format_date('%Y-%m',d) as year_month,
    cast(format_date('%Y%m',d) as int64 ) as year_month_key,
    #Day
    extract(day from d) as day,
    extract(dayofyear from d) as day_of_year,
    #Week
    extract(isoweek from d) as week_of_year,
    #Day of Week
    case
        when extract(dayofweek from d)=1 then 7
        else extract(dayofweek from d)-1
    end as day_of_week_number,
    format_date('%A',d) as day_of_week,
    format_date('%a',d) as day_of_week_short,
    #Weekend
    case
        when extract(dayofweek from d) in (1,7)
        then True
        else False
    end as is_weekend,
    #Month Boundary
    date_trunc(d,month) as start_of_month,
    last_day(d) as end_of_month,
    #Quarter Boundary
    date_trunc(d,quarter) as start_of_quarter,
    last_day(d,quarter) as end_of_quarter,
    #Year Boundary
    date_trunc(d,year) as start_of_year,
    last_day(d,year) as end_of_year

from 
unnest(
    generate_date_array(
        date '2016-01-01',
        date '2022-12-31'
    )
) as d