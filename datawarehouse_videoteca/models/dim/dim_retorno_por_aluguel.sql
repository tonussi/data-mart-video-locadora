with source as (
  select
    pagamentos.num_trans_pagamento,
    dim_aluguel_filmes.num_copia_filme,
    pagamentos.data_pagamento,
    dim_aluguel_filmes.taxa_aluguel_filme,
    dim_aluguel_filmes.sobretaxa_aluguel_filme,
    pagamentos.quantia_pagamento
  from {{ ref('dim_pagamentos') }} as pagamentos
  join {{ ref('dim_aluguel_filmes') }} as dim_aluguel_filmes
  on pagamentos.num_trans_pagamento = dim_aluguel_filmes.num_trans_pagamento
),

dim_retorno_por_aluguel as (
  select
    num_trans_pagamento,
    num_copia_filme,
    data_pagamento,
    taxa_aluguel_filme,
    quantia_pagamento,
    quantia_pagamento + taxa_aluguel_filme + sobretaxa_aluguel_filme as quantia_pagamento_taxada
  from source
)

select * from dim_retorno_por_aluguel
