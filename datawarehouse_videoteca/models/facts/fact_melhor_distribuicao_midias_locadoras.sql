with source as (
  select
    dim_locadoras.id_locadora,
    dim_locadoras.nome_locadora,
    dim_locadoras.id_distribuidor,
    dim_aluguel_filmes.num_copia_filme,
    dim_aluguel_filmes.taxa_aluguel_filme,
    dim_aluguel_filmes.sobretaxa_aluguel_filme,
    (select count(*) from dim_aluguel_filmes) as total_locacoes_todas_locadoras
  from {{ ref('dim_locadoras') }} as dim_locadoras
  join {{ ref('dim_copia_filmes_e_suas_locadoras') }} as dim_copia_filmes_e_suas_locadoras
  on dim_locadoras.id_locadora = dim_copia_filmes_e_suas_locadoras.id_locadora
  join {{ ref('dim_aluguel_filmes') }} as dim_aluguel_filmes
  on dim_copia_filmes_e_suas_locadoras.num_copia_filme = dim_aluguel_filmes.num_copia_filme
),

fact_melhor_distribuicao_midias_locadoras as (
  select
    id_locadora,
    nome_locadora,
    id_distribuidor,
    num_copia_filme,
    total_locacoes_todas_locadoras,
    (taxa_aluguel_filme + sobretaxa_aluguel_filme) as lucro_da_locadora
  from source
)

select
  id_locadora,
  sum(lucro_da_locadora) as soma_lucro_por_locadora,
  total_locacoes_todas_locadoras,
  trunc(sum(lucro_da_locadora) / total_locacoes_todas_locadoras, 3) as razao_soma_lucro_por_total
from fact_melhor_distribuicao_midias_locadoras
group by (id_locadora, total_locacoes_todas_locadoras)
