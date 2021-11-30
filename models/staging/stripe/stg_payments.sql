with payments as(
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status,
        {{cents_to_dollars('amount')}} as amount,
        _BATCHED_AT
    from {{ source('stripe', 'payment') }}

)
select * from payments 