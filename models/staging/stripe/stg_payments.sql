with payments as(
    select
        id as payment_id,
        orderid as order_id,
        status,
        amount/100 as amount,
        _BATCHED_AT
    from {{ source('stripe', 'payment') }}

)
select * from payments 