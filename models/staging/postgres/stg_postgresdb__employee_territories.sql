{{ config(materialized='view') }}

with postgres_db_employee_territories as (

select
    cast(employee_id as int) as employee_id,
    cast(territory_id as int) as territory_id
from
    employee_territories

)
select * from postgres_db_employee_territories
