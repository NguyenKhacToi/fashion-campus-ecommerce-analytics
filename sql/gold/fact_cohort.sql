create or replace table
`fashion-campus-508609.fashion_campus_gold.fact_cohort` 

as
with successful_orders as (
    select
        customer_id,
        date(order_time) as order_date
    from
        `fashion-campus-508609.fashion_campus_gold.fact_order`
    where
        payment_status = 'Success'
),

first_purchase as (
    select
        customer_id,
        date_trunc(min(order_date), month) as cohort_month
    from
        successful_orders
    group by
        customer_id
),

customer_activity as (
    select distinct
        o.customer_id,
        f.cohort_month,
        date_trunc(o.order_date, month) as activity_month
    from
        successful_orders o
    join
        first_purchase f
    on
        o.customer_id = f.customer_id
),

cohort_activity as (
    select
        cohort_month,
        activity_month,
        count(distinct customer_id) as active_customers
    from
        customer_activity
    group by
        cohort_month,
        activity_month
),

cohort_size as (
    select
        cohort_month,
        count(distinct customer_id) as cohort_customers
    from
        first_purchase
    group by
        cohort_month
)

select
    a.cohort_month,
    a.activity_month,

    date_diff(
        a.activity_month,
        a.cohort_month,
        month
    ) as months_since_first_purchase,

    a.active_customers,

    s.cohort_customers,

    safe_divide(
        a.active_customers,
        s.cohort_customers
    ) as retention_rate

from
    cohort_activity a
join
    cohort_size s
on
    a.cohort_month = s.cohort_month

order by
    a.cohort_month,
    a.activity_month;