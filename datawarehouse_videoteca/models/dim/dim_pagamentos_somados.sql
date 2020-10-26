with source as (
  select
    pagamentos.num_trans_pagamento,
    aluguel_filmes.num_copia_filme,
    pagamentos.quantia_pagamento,
    pagamentos.data_pagamento
    from {{ ref('dim_pagamentos') }} as pagamentos
    join {{ ref('raw_aluguel_filmes') }} as aluguel_filmes
    on pagamentos.num_trans_pagamento = aluguel_filmes.num_trans_pagamento
),

dim_pagamentos_somados as (
  select
    num_copia_filme,
    max(data_pagamento) as ultima_data_pos_soma,
    sum(quantia_pagamento) as quantia_pagamento_somada
  from source
  group by (num_copia_filme, data_pagamento, quantia_pagamento)
)

select * from dim_pagamentos_somados
