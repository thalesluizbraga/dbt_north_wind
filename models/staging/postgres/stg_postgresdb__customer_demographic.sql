{{ config(materialized='view') }}

with postgres_db_customer_demographic as (

select
    cast(customer_type_id as int) as customer_type_id,
    cast(customer_desc as varchar) as customer_desc
from
    customer_demographics
)
select * from postgres_db_customer_demographic