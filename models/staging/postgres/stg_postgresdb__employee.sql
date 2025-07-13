{{ config(materialized='view') }}

with postgres_db_employee as (

select
    cast(employee_id as int) as employee_id,
    cast(last_name as varchar) as last_name,
    cast(first_name as varchar) as first_name
from
    employees

)
select * from postgres_db_employee
