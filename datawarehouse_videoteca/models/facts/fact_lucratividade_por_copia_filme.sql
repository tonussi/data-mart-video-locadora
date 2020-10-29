with source as (
  select
    dim_soma_taxa_por_copia_filme.num_copia_filme,
    dim_investimento_por_copias.valor_pago_total_copias,
    dim_soma_taxa_por_copia_filme.receita_somada_aluguel_filme
  from {{ ref('dim_soma_taxa_por_copia_filme') }} as dim_soma_taxa_por_copia_filme
  join {{ ref('dim_investimento_por_copias') }} as dim_investimento_por_copias
  on dim_soma_taxa_por_copia_filme.num_copia_filme = dim_investimento_por_copias.num_copia_filme
),

fact_lucratividade_por_copia_filme as (
  select
    num_copia_filme,
    valor_pago_total_copias,
    trunc(receita_somada_aluguel_filme, 3),
    trunc(receita_somada_aluguel_filme / valor_pago_total_copias, 3) as lucratividade,
    trunc((receita_somada_aluguel_filme / valor_pago_total_copias ) * 100, 3) as lucratividade_porcento
  from source
)

select * from fact_lucratividade_por_copia_filme
