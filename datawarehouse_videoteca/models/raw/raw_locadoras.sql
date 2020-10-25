with source as (
  select * from {{ source('datawarehouse_videoteca', 'locadoras') }}
),

raw_locadoras as (
  select * from source
)

select * from raw_locadoras
