{{ config(materialized='view') }}

with postgres_db_products as (

select
    cast(product_id as int) as product_id,
    cast(product_name as varchar) as product_name,
    cast(supplier_id as int) as supplier_id,
    cast(category_id as int) as category_id,
    cast(quantity_per_unit as varchar) as quantity_per_unit,
    cast(unit_price as real) as unit_price,
    cast(units_in_stock as int) as units_in_stock,
    cast(units_on_order as int) as units_on_order,
    cast(reorder_level as int) as reorder_level,
    cast(discontinued as int) as discontinued
from
    products

)
select * from postgres_db_products
