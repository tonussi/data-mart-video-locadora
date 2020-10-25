with source as (
  select * from {{ source('datawarehouse_videoteca', 'filmes') }}
),

raw_filmes as (
  select * from source
)

select * from raw_filmes
