with source as (
  select
    raw_locadoras.id_locadora,
    raw_locadora_distribuidores.id_distribuidor,
    raw_locadoras.nome_locadora
  from {{ ref('raw_locadoras') }} as raw_locadoras
  join {{ ref('raw_locadora_distribuidores') }} as raw_locadora_distribuidores
  on raw_locadoras.id_locadora = raw_locadora_distribuidores.id_locadora
),

dim_locadoras as (
  select
    id_locadora,
    id_distribuidor,
    nome_locadora
  from source
)

select * from dim_locadoras
