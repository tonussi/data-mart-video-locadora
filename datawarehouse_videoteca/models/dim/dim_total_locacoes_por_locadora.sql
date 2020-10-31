with source as (
  select * from {{ ref('raw_locadoras') }}
),

dim_quantidade_de_locadoras as (
  select
    count(*)
  from source
)

select * from dim_quantidade_de_locadoras
