{{ config(materialized='view') }}

with postgres_db_category as (

select
    cast(category_id as int) as category_id,
    cast(category_name as varchar) as category_name,
    cast(description as varchar) as col_description
from
    categories

)
select * from postgres_db_category
