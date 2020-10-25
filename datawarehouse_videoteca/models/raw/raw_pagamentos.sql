with source as (
  select * from {{ source('datawarehouse_videoteca', 'pagamentos') }}
),

raw_pagamentos as (
  select * from source
)

select * from raw_pagamentos
