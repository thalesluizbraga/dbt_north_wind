{{ config(materialized='view') }}

with tb_stg_postgresdb__orders as (

select
*
from 
    {{ ref('stg_postgresdb__orders')  }}

),

tb_stg_postgresdb__order_details as (

select
*
from 
    {{ ref('stg_postgresdb__order_details')  }}

),

tb_prices_orders_summed as (

select 
    order_id,
    sum(quantity) AS total_quantity,
    sum(unit_price * quantity) AS total_spend
from
    tb_stg_postgresdb__order_details
where
    1=1
group by 
     order_id

),

tb_stg_postgresdb__orders_and_tb_prices_orders_summed_joined as (

select
    a.*,
    b.total_quantity,
    b.total_spend
from 
    tb_stg_postgresdb__orders as a 
inner join 
    tb_prices_orders_summed as b on a.order_id = b.order_id

),

tb_orders_grouped_by_month as (

select
    customer_id,
    cast(date_trunc('month', order_date) as date) as month,
    cast(min(order_date) as date) as date_first_purchase,
    cast(max(order_date) as date) as date_last_purchase,
    count(order_id) as qtd_orders,
    sum(total_quantity) as total_quantity,
    round(cast(sum(total_spend) as numeric), 2) as total_spend
from 
  tb_stg_postgresdb__orders_and_tb_prices_orders_summed_joined
group by 
    customer_id,
    date_trunc('month', order_date)
order by 
    customer_id,
    date_trunc('month', order_date) asc

)

select * from tb_orders_grouped_by_month