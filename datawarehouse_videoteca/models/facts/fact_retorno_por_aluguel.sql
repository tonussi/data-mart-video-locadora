select
  source_raw_pagamentos.num_trans_pagamento,
  source_raw_aluguel_filmes.num_copia_filme,
  source_raw_pagamentos.data_pagamento,
  sum(case when source_raw_aluguel_filmes.data_retorno_filme != null
      then source_raw_pagamentos.quantia_pagamento + source_raw_aluguel_filmes.taxa_aluguel_filme
      else source_raw_pagamentos.quantia_pagamento end) as quantia_pagamento_taxada
  from {{ ref('raw_pagamentos') }} as source_raw_pagamentos
  join {{ ref('raw_aluguel_filmes') }} as source_raw_aluguel_filmes
  on source_raw_pagamentos.num_trans_pagamento = source_raw_aluguel_filmes.num_trans_pagamento
  group by (
    source_raw_pagamentos.num_trans_pagamento,
    source_raw_aluguel_filmes.num_copia_filme,
    source_raw_pagamentos.data_pagamento)
