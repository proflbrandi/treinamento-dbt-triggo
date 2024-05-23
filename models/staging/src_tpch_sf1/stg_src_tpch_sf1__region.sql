with 

source as (

    select * from {{ source('src_tpch_sf1', 'region') }}

),

renamed as (

    select
        r_name,
        r_regionkey,
        r_comment

    from source

)

select * from renamed
