with source as (
  select * from {{ source('datawarehouse_videoteca', 'aluguel_filmes') }}
),

raw_aluguel_filmes as (
  select * from source
)

select * from raw_aluguel_filmes
