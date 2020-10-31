with source as (
  select * from {{ ref('raw_copia_filmes') }}
),

dim_tempo_de_copia_filmes as (
  select
    cast (dta_compra as date),
    num_copia_filme
  from source
)

select * from dim_tempo_de_copia_filmes
