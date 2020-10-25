with source as (
  select * from {{ source('datawarehouse_videoteca', 'funcionarios') }}
),

raw_funcionarios as (
  select * from source
)

select * from raw_funcionarios
