create or replace table 
`fashion-campus-508609.fashion_campus_gold.dim_customer`

as 
select
  customer_id,
  gender,
  birthdate,
  device_type,
  device_version,
  home_location,
  first_join_date,
  
  date_diff(first_join_date, birthdate,year)
  - case 
      when extract(month from first_join_date) < extract(month from birthdate)
        or (extract(month from first_join_date) = extract(month from birthdate)
            and extract(day from first_join_date) < extract(day from birthdate))
      then 1
      else 0
    end as customer_age,
  
  case 
    when date_diff(first_join_date, birthdate,year)
          - case 
              when extract(month from first_join_date) < extract(month from birthdate)
                or (extract(month from first_join_date) = extract(month from birthdate)
                    and extract(day from first_join_date) < extract(day from birthdate))
              then 1
              else 0
            end <15
    then 'Under 15'

    when date_diff(first_join_date, birthdate,year)
          - case 
              when extract(month from first_join_date) < extract(month from birthdate)
                or (extract(month from first_join_date) = extract(month from birthdate)
                    and extract(day from first_join_date) < extract(day from birthdate))
              then 1
              else 0
            end between 15 and 27
    then '15-17'

    when date_diff(first_join_date, birthdate,year)
          - case 
              when extract(month from first_join_date) < extract(month from birthdate)
                or (extract(month from first_join_date) = extract(month from birthdate)
                    and extract(day from first_join_date) < extract(day from birthdate))
              then 1
              else 0
            end between 18 and 24
    then '18-24'

    when date_diff(first_join_date, birthdate,year)
          - case 
              when extract(month from first_join_date) < extract(month from birthdate)
                or (extract(month from first_join_date) = extract(month from birthdate)
                    and extract(day from first_join_date) < extract(day from birthdate))
              then 1
              else 0
            end between 25 and 34
    then '25-34'

    else '35+'
  
  end as customer_age_group

from `fashion-campus-508609.fashion_campus_silver.dim_customer`;