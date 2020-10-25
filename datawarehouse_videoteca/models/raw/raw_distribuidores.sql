with source as (
  select * from {{ source('datawarehouse_videoteca', 'distribuidores') }}
),

raw_distribuidores as (
  select * from source
)

select * from raw_distribuidores
