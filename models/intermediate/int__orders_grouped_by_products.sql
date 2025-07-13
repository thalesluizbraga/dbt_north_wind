{{ config(materialized='view') }}

with tb_quantity_of_orders_by_product_id as (
    select 
        product_id,
        count(distinct order_id) as qt_orders
    from 
        {{ ref('stg_postgresdb__order_details') }} 
    group by 
        product_id
),

tb_products as (

select 
    product_id,
    product_name
from  
    {{ ref('stg_postgresdb__products') }} 

),

tb_order_grouped_by_products as (

select 
    a.product_id,
    a.product_name,
    coalesce(b.qt_orders, 0) as qt_orders
from 
    tb_products as a
left join 
    tb_quantity_of_orders_by_product_id as b on a.product_id = b.product_id

)

select * from tb_order_grouped_by_products