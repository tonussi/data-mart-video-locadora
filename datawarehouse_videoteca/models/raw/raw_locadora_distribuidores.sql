with source as (
  select * from {{ source('datawarehouse_videoteca', 'locadora_distribuidores') }}
),

raw_locadora_distribuidores as (
  select * from source
)

select * from raw_locadora_distribuidores
