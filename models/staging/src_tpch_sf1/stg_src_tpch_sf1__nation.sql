with 

source as (

    select * from {{ source('src_tpch_sf1', 'nation') }}

),

renamed as (

    select
        n_comment,
        n_name,
        n_nationkey,
        n_regionkey

    from source

)

select * from renamed
