with source as (
  select * from {{ ref('raw_copia_filmes') }}
),

dim_copia_filmes_e_suas_locadoras as (
  select
    num_copia_filme,
    id_locadora,
    condicao_geral
  from source
)

select * from dim_copia_filmes_e_suas_locadoras
