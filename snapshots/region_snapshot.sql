{% snapshot region_snapshot %}

{{
    config(
      target_database='analytics_dev',
      target_schema='dbt_lbrandi_snapshots',

      unique_key='r_regionkey',
      strategy='check',
      check_cols='all',
    )
}}

select * from {{ ref('region_csv') }}

{% endsnapshot %}