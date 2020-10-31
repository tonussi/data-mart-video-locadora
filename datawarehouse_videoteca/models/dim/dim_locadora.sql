with source as (
  select * from {{ ref('raw_locadoras') }}
),

dim_locadora as (
  select
    id_locadora,
    fone_locadora
  from source
)

select * from dim_locadora

