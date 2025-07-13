{{ config(materialized='view') }}

with tb_quantity_of_orders_by_employee as (

select 
    employee_id,
    count(distinct order_id) as qt_orders
from 
    {{ ref('stg_postgresdb__orders') }} 
group by 
    employee_id

),

tb_employee as (

select 
    employee_id,
    last_name,
    first_name
from  
    {{ ref('stg_postgresdb__employee') }} 

),

tb_order_grouped_by_employee as (

select 
    a.employee_id,
    a.last_name,
    a.first_name,
    coalesce(b.qt_orders, 0) as qt_orders
from 
    tb_employee as a
left join 
    tb_quantity_of_orders_by_employee as b on a.employee_id = b.employee_id

)

select * from tb_order_grouped_by_employee