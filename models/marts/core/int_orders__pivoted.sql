{%- set paymentmethods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

with payments as (
    select * from {{ ref('stg_payments') }}
),
pivoted as (
    select
        order_id,
        {% for paymentmethod in paymentmethods -%}
        sum(case when paymentmethod = '{{paymentmethod}}' then amount else 0 end) as {{paymentmethod}}_amount
        {%- if not loop.last -%}
         ,
        {%- endif %}
        {% endfor -%}
        
        
    from payments
    where status ='success'
    group by 1
    
)
select * from pivoted