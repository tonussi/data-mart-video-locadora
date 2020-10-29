with source as (
  select * from {{ ref('raw_aluguel_filmes') }}
),

dim_soma_taxa_por_copia_filme as (

select
  num_copia_filme,
  sum(taxa_aluguel_filme) as soma_taxa_aluguel_filme
  from source
  group by (num_copia_filme, taxa_aluguel_filme)
)

select * from dim_soma_taxa_por_copia_filme
