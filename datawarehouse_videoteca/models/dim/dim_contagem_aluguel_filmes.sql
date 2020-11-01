with source as (
  select * from {{ ref('raw_aluguel_filmes') }}
),

dim_contagem_aluguel_filmes as (
  select
    num_copia_filme,
    count(num_copia_filme) as contagem_de_num_copia_filme_iguais
  from source
  group by (num_copia_filme)
)

select * from dim_contagem_aluguel_filmes
