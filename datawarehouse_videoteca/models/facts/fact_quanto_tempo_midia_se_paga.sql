with source as (
  select
    dim_retorno_por_aluguel.num_trans_pagamento,
    dim_retorno_por_aluguel.data_pagamento,
    dim_retorno_por_aluguel.taxa_aluguel_filme,
    dim_retorno_por_aluguel.quantia_pagamento,
    dim_retorno_por_aluguel.quantia_pagamento_taxada,
    dim_filmes_valor_total.num_filme,
    dim_filmes_valor_total.dta_compra,
    dim_filmes_valor_total.valor_pago_total_copias,
    dim_pagamentos_somados.ultima_data_pos_soma,
    dim_pagamentos_somados.quantia_pagamento_somada
  from {{ ref('dim_filmes_valor_total') }} as dim_filmes_valor_total
  join {{ ref('dim_retorno_por_aluguel') }} as dim_retorno_por_aluguel
  on dim_filmes_valor_total.num_copia_filme = dim_retorno_por_aluguel.num_copia_filme
  join {{ ref('dim_pagamentos_somados') }} as dim_pagamentos_somados
  on dim_retorno_por_aluguel.num_copia_filme = dim_pagamentos_somados.num_copia_filme
),

fact_quanto_tempo_midia_se_paga as (
  select
    filmes.num_filme,
    filmes.nome_filme,
    dta_compra,
    ultima_data_pos_soma,
    valor_pago_total_copias,
    quantia_pagamento_somada,
    valor_pago_total_copias - quantia_pagamento_somada as diferenca_valor_pago_valor_recebido,
    data_pagamento - dta_compra as dias_entre_dta_compra_data_pagamento
  from source join filmes on filmes.num_filme = source.num_filme
)

select * from fact_quanto_tempo_midia_se_paga
