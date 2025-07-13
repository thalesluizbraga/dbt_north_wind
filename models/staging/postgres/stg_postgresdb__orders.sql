{{ config(materialized='view') }}

with postgres_db_orders as (

select
    cast(order_id as int) as order_id,
    cast(customer_id as varchar) as customer_id,
    cast(employee_id as int) as employee_id,
    cast(order_date as date) as order_date,
    cast(required_date as date) as required_date,
    cast(shipped_date as date) as shipped_date,
    cast(ship_via as int) as ship_via,
    cast(freight as real) as freight,
    cast(ship_name as varchar) as ship_name
from
    orders

)
select * from postgres_db_orders
