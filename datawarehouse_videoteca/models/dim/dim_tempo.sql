with source as (
  select * from {{ ref('raw_aluguel_filmes') }}
),

dim_tempo as (

select
  cast(data_retorno_filme as date)
  from source
  where status_aluguel_filme = 'NA' -- means NOT RENTED
)

select * from dim_tempo
