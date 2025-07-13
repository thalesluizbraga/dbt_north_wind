{{ config(materialized='view') }}

with postgres_db_customer as (

select
    cast(customer_id as varchar) as customer_id,
    cast(company_name as varchar) as company_name,
    cast(contact_name as varchar) as contact_name,
    cast(contact_title as varchar) as contact_title,
    cast(address as varchar) as address,
    cast(city as varchar) as city,
    cast(region as varchar) as region,
    cast(phone as varchar) as phone 
from
    customers

)
select * from postgres_db_customer