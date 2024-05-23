with 

source as (

    select * from {{ source('src_tpch_sf1', 'customer') }}

),

renamed as (

    select
        c_nationkey,
        c_address,
        c_name,
        c_phone,
        c_acctbal,
        c_comment,
        c_mktsegment,
        c_custkey
    from source

)

select * from renamed
