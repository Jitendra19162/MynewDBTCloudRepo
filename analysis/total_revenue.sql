with total_revenue as (
    select sum(amount) as total_revenue
    from {{ ref('stg_payments') }}
    where status ='success'
)
select * from total_revenue