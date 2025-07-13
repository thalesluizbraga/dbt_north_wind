{{ config(materialized='view') }}

with postgres_db_order_details as (

select
    cast(order_id as int) as order_id,
    cast(product_id as int) as product_id,
    cast(unit_price as real) as unit_price,
    cast(quantity as int) as quantity,
    cast(discount as real) as discount
    

from
    order_details

)
select * from postgres_db_order_details
