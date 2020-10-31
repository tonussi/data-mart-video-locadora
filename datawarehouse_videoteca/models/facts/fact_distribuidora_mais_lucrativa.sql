with source as (
  select
    raw_locadoras.nome_locadora
  from {{ ref('dim_locadoras') }} as dim_locadoras
  join {{ ref('dim_soma_taxa_por_copia_filme') }} as dim_soma_taxa_por_copia_filme
  on raw_locadoras.id_locadora = raw_locadora_distribuidores.id_locadora
),

dim_locadora as (
  select
    id_locadora,
    id_distribuidor,
    nome_locadora
  from source
)

select * from dim_locadora
