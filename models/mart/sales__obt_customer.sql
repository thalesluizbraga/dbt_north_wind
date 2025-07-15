{{ config(materialized='table') }}

with tb_stg_postgresdb__customer as (

select 
   customer_id,
   company_name,
   contact_name,
   contact_title,
   address,
   city,
   region,
   phone 
from 
    {{ ref('stg_postgresdb__customer') }} 

),

tb_int__orders_grouped_by_month as (

select
    customer_id,
    month,
    date_first_purchase,
    date_last_purchase,
    qtd_orders,
    total_quantity,
    total_spend
from 
    {{ ref('int__orders_grouped_by_month')  }}
    

),

tb_sales__obt_customer as (

select
    b.customer_id,
    b.company_name,
    b.contact_name,
    b.contact_title,
    b.address,
    b.city,
    b.region,
    b.phone,
    a.month,
    a.date_first_purchase,
    a.date_last_purchase,
    a.qtd_orders,
    a.total_quantity,
    a.total_spend,
    'TESTE' as teste
from 
    tb_int__orders_grouped_by_month as a
left join 
    tb_stg_postgresdb__customer as b on a.customer_id = b.customer_id

)

select * 
from
     tb_sales__obt_customer
order by 
    month asc 