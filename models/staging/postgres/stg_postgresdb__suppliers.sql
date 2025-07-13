{{ config(materialized='view') }}

with postgres_db_suppliers as (

select
    cast(supplier_id as int) as supplier_id,
    cast(company_name as varchar) as company_name,
    cast(contact_name as varchar) as contact_name

from
    suppliers

)
select * from postgres_db_suppliers
