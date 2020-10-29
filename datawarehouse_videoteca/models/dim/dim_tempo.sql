with source as (
  select * from {{ ref('raw_aluguel_filmes') }}
),

dim_tempo as (

select
  -- this is just an example of a time dimension
  data_retorno_filme,
  from source
  where status_aluguel_filme = 'PG'
)

select * from dim_tempo
