with source as (
  select * from {{ ref('raw_aluguel_filmes') }}
),

dim_aluguel_filmes as (
  select
    num_copia_filme,
    taxa_aluguel_filme,
    sobretaxa_aluguel_filme,
    num_trans_pagamento
  from source
)

select * from dim_aluguel_filmes
