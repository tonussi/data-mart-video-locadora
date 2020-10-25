with source as (
  select * from {{ ref('raw_pagamentos') }}
),

dim_pagamentos as (

select
  num_trans_pagamento,
  tipo_pagamento,
  data_pagamento,
  (case when status_pagamento <> '0' then quantia_pagamento else 0 end) as quantia_pagamento
  from source
)

select * from dim_pagamentos
