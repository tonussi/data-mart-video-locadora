with source as (
  select * from {{ ref('raw_copia_filmes') }}
),

dim_investimento_por_copias as (
  select
    num_copia_filme,
    sum(valor_pago) as valor_pago_total_copias
  from source
  group by (num_copia_filme, valor_pago)
)

select * from dim_investimento_por_copias
