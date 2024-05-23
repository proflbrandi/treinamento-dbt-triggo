{{ config(
    materialized = 'table',
) }}


SELECT
    customer.c_custkey,
    customer.c_name,
    customer.c_address,
    nation.n_name,
    region.r_name,
    customer.c_phone
FROM {{ ref('stg_src_tpch_sf1__customer') }} AS customer
LEFT JOIN {{ ref('stg_src_tpch_sf1__nation') }} AS nation
    ON (customer.c_nationkey = nation.n_nationkey)
LEFT JOIN {{ ref('stg_src_tpch_sf1__region') }} AS region
    ON (nation.n_regionkey = region.r_regionkey)
