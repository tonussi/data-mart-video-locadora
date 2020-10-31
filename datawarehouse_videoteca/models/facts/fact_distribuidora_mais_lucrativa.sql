with source as (
  select
    dim_locadoras.id_locadora,
    dim_locadoras.nome_locadora,
    dim_locadoras.id_distribuidor,
    dim_aluguel_filmes.num_copia_filme,
    dim_aluguel_filmes.taxa_aluguel_filme,
    dim_aluguel_filmes.sobretaxa_aluguel_filme
  from {{ ref('dim_locadoras') }} as dim_locadoras
  join {{ ref('dim_copia_filmes_e_suas_locadoras') }} as dim_copia_filmes_e_suas_locadoras
  on dim_locadoras.id_locadora = dim_copia_filmes_e_suas_locadoras.id_locadora
  join {{ ref('dim_aluguel_filmes') }} as dim_aluguel_filmes
  on dim_copia_filmes_e_suas_locadoras.num_copia_filme = dim_aluguel_filmes.num_copia_filme
),

fact_distribuidora_mais_lucrativa as (
  select
    id_locadora,
    nome_locadora,
    id_distribuidor,
    num_copia_filme,
    (taxa_aluguel_filme + sobretaxa_aluguel_filme) as lucro_da_locadora
  from source
)

select
  id_locadora,
  sum(lucro_da_locadora)
from fact_distribuidora_mais_lucrativa
group by 1
