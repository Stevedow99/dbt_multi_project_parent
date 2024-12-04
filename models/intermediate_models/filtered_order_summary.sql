{{
    config(
        materialized = 'table',
        tags=['finance', 'filtered']
    )
}}

with base_data as (
    select 
        order_key, 
        priority_code, 
        net_item_sales_amount
    from {{ ref('fct_orders') }}
)

select 
    order_key,
    priority_code,
    (net_item_sales_amount * 1400) as net_item_sales_amount
from base_data
order by order_key
