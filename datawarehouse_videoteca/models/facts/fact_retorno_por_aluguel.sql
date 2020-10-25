select
  pagamentos.num_trans_pagamento,
  aluguel_filmes.num_copia_filme,
  pagamentos.data_pagamento,
  (
    case when aluguel_filmes.data_retorno_filme <> null
    then pagamentos.quantia_pagamento + aluguel_filmes.taxa_aluguel_filme
    else pagamentos.quantia_pagamento end
  ) as quantia_pagamento_taxada
  from {{ ref('dim_pagamentos') }} as pagamentos
  join {{ ref('raw_aluguel_filmes') }} as aluguel_filmes
  on pagamentos.num_trans_pagamento = aluguel_filmes.num_trans_pagamento
  group by (
    pagamentos.num_trans_pagamento,
    aluguel_filmes.num_copia_filme,
    aluguel_filmes.data_retorno_filme,
    pagamentos.quantia_pagamento,
    aluguel_filmes.taxa_aluguel_filme,
    pagamentos.data_pagamento
  )
