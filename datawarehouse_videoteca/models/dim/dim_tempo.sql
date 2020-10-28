with source as (
  select * from {{ ref('raw_pagamentos') }}
),

dim_tempo as (

select
  -- this is just an example of a time dimension
  num_trans_pagamento,
  data_pagamento
  from source
)

select * from dim_tempo
