with source as (
  select * from {{ source('datawarehouse_videoteca', 'copia_filmes') }}
),

raw_copia_filmes as (
  select * from source
)

select * from raw_copia_filmes
