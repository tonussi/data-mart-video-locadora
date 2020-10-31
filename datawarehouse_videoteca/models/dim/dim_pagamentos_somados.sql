with source as (
  select
    raw_pagamentos.num_trans_pagamento,
    raw_aluguel_filmes.num_copia_filme,
    raw_pagamentos.quantia_pagamento,
    raw_pagamentos.data_pagamento
  from {{ ref('raw_pagamentos') }} as raw_pagamentos
  join {{ ref('raw_aluguel_filmes') }} as raw_aluguel_filmes
  on raw_pagamentos.num_trans_pagamento = raw_aluguel_filmes.num_trans_pagamento
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
