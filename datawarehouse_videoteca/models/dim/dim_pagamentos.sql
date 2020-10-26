with source as (
  select * from {{ ref('raw_pagamentos') }}
),

dim_pagamentos as (

select
  -- (case when status_pagamento <> '0' and tipo_pagamento = 'cartao' and tipo_pagamento_cartao = 'debito' then quantia_pagamento else 0 end) as quantia_pagamento_cartao_debito,
  -- (case when status_pagamento <> '0' and tipo_pagamento = 'cartao' and tipo_pagamento_cartao = 'credito' then quantia_pagamento else 0 end) as quantia_pagamento_cartao_credito,
  -- (case when status_pagamento <> '0' and tipo_pagamento = 'dinheiro' then quantia_pagamento else 0 end) as quantia_pagamento_dinheiro
  num_trans_pagamento,
  data_pagamento,
  quantia_pagamento
  from source
)

select * from dim_pagamentos
