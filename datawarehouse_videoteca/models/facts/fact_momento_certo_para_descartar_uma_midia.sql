with source as (
  select
    dim_soma_taxa_por_copia_filme.num_copia_filme,
    dim_investimento_por_copias.valor_pago_total_copias,
    dim_soma_taxa_por_copia_filme.receita_somada_aluguel_filme,
    dim_tempo_de_copia_filmes.dta_compra
  from {{ ref('dim_soma_taxa_por_copia_filme') }} as dim_soma_taxa_por_copia_filme
  join {{ ref('dim_investimento_por_copias') }} as dim_investimento_por_copias
  on dim_soma_taxa_por_copia_filme.num_copia_filme = dim_investimento_por_copias.num_copia_filme
  join {{ ref('dim_tempo_de_copia_filmes') }} as dim_tempo_de_copia_filmes
  on dim_tempo_de_copia_filmes.num_copia_filme = dim_soma_taxa_por_copia_filme.num_copia_filme
),

fact_momento_certo_para_descartar_uma_midia as (
  select
    num_copia_filme,
    valor_pago_total_copias,
    dta_compra,
    ((current_date - dta_compra) / 30) as meses_pos_compra_midia,
    trunc((receita_somada_aluguel_filme / valor_pago_total_copias ) * 100, 3) as lucratividade_porcento
  from source
)

select * from fact_momento_certo_para_descartar_uma_midia
