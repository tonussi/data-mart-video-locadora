with source as (
  select
    dim_retorno_por_aluguel.num_trans_pagamento,
    dim_retorno_por_aluguel.data_pagamento,
    dim_retorno_por_aluguel.taxa_aluguel_filme,
    dim_retorno_por_aluguel.quantia_pagamento,
    dim_retorno_por_aluguel.quantia_pagamento_taxada,
    dim_filmes_valor_total.num_filme,
    dim_filmes_valor_total.dta_compra,
    dim_filmes_valor_total.valor_pago_total_copias
    from {{ ref('dim_filmes_valor_total') }} as dim_filmes_valor_total
    join {{ ref('dim_retorno_por_aluguel') }} as dim_retorno_por_aluguel
    on dim_filmes_valor_total.num_copia_filme = dim_retorno_por_aluguel.num_copia_filme
),

mart_quanto_tempo_midia_se_paga as (
  select
  quantia_pagamento_taxada,
  num_filme,
  data_pagamento,
  dta_compra,
  valor_pago_total_copias,
  valor_pago_total_copias - quantia_pagamento_taxada as diferenca_valor_pago_valor_recebido,
  data_pagamento - dta_compra as dias_entre_dta_compra_data_pagamento
  from source
)

select * from mart_quanto_tempo_midia_se_paga
