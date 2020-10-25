with source as (
  select * from {{ source('datawarehouse_videoteca', 'clientes') }}
),

raw_clientes as (
  select * from source
)

select * from raw_clientes
