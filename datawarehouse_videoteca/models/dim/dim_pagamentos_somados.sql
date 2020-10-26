with source as (
  select
    pagamentos.num_trans_pagamento,
    aluguel_filmes.num_copia_filme,
    pagamentos.quantia_pagamento
    from {{ ref('dim_pagamentos') }} as pagamentos
    join {{ ref('raw_aluguel_filmes') }} as aluguel_filmes
    on pagamentos.num_trans_pagamento = aluguel_filmes.num_trans_pagamento
),

dim_pagamentos_somados as (
  select
    num_copia_filme,
    sum(quantia_pagamento)
  from source
  group by (num_copia_filme, quantia_pagamento)
)

select * from dim_pagamentos_somados
