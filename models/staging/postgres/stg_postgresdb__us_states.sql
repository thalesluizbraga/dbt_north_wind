{{ config(materialized='view') }}

with postgres_db_us_states as (

select
    cast(state_id as int) as state_id,
    cast(state_name as varchar) as state_name,
    cast(state_abbr as varchar) as state_abbr,
    cast(state_region as varchar) as state_region
from
    us_states

)
select * from postgres_db_us_states
