with source as (
  select * from {{ ref('raw_aluguel_filmes') }}
),

intermediate_source as (

select
  num_copia_filme,
  sum(taxa_aluguel_filme) as soma_taxa_aluguel_filme,
  sum(sobretaxa_aluguel_filme) as soma_sobretaxa_aluguel_filme
  from source
  group by (num_copia_filme, taxa_aluguel_filme, sobretaxa_aluguel_filme)

),

dim_soma_taxa_por_copia_filme as (
  select
    num_copia_filme,
    soma_taxa_aluguel_filme + soma_sobretaxa_aluguel_filme as receita_somada_aluguel_filme
  from intermediate_source

)

select * from dim_soma_taxa_por_copia_filme
