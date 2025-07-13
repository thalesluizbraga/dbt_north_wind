{{ config(materialized='view') }}

with postgres_db_shippers as (

select
    cast(shipper_id as int) as shipper_id,
    cast(company_name as varchar) as company_name,
    cast(phone as varchar) as phone

from
    shippers

)
select * from postgres_db_shippers
