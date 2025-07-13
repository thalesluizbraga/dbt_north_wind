{{ config(materialized='view') }}

with postgres_db_region as (

select
    cast(region_id as int) as region_id,
    cast(region_description as varchar) as region_description

from
    region

)
select * from postgres_db_region
