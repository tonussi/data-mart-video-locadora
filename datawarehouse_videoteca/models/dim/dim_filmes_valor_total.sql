with source as (
  select * from {{ ref('raw_copia_filmes') }}
),

dim_filmes_valor_total as (
  select
    num_filme,
    num_copia_filme,
    dta_compra,
    sum(valor_pago) as valor_investido_pago_total_copias
  from source
  group by (num_filme, num_copia_filme, dta_compra, valor_pago)
)

select * from dim_filmes_valor_total
