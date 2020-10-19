-- postgres

drop table if exists filmes cascade;
drop table if exists locadoras cascade;
drop table if exists copia_filmes cascade;
drop table if exists distribuidores cascade;
drop table if exists locadora_distribuidores cascade;
drop table if exists clientes cascade;
drop table if exists funcionarios cascade;
drop table if exists pagamentos cascade;
drop table if exists aluguel_filmes cascade;

create table filmes
(
  num_filme serial not null,
  nome_filme character varying(25),
  diretor_filme character varying(25),
  categoria_filme character varying(20),
  estrela_filme character varying(25),
  censura_filme integer,
  taxa_aluguel_filme money,
  data_filme timestamp without time zone,
  constraint filme_pkey primary key (num_filme)
); --ok

create table locadoras
(
  id_locadora serial not null,
  rua_locadora character varying(45),
  fone_locadora integer,
  nome_locadora character varying(25),
  constraint locadoras_pkey primary key (id_locadora)
); --ok

create table copia_filmes
(
  num_copia_filme serial not null,
  num_filme bigint,
  id_locadora integer,
  valor_pago money,
  condicao_geral integer,
  dta_compra timestamp without time zone,
  constraint copia_filmes_pkey primary key (num_copia_filme),
  constraint num_filme_fk_constraint foreign key (num_filme) references filmes (num_filme),
  constraint id_locadora_fk_constraint foreign key (id_locadora) references locadoras (id_locadora)
); --ok

create table distribuidores
(
  id_distribuidor serial not null,
  nome_distribuidor character varying(25),
  endereco_distribuidor character varying(45),
  cidade_distribuidor character varying(20),
  estado_distribuidor character varying(2),
  cep_distribuidor integer,
  fone_distribuidor integer,
  constraint distribuidores_pkey primary key (id_distribuidor)
); --ok

create table locadora_distribuidores
(
  id_locadora integer not null,
  id_distribuidor bigint not null,
  constraint locadora_distribuidores_pkey primary key (id_locadora, id_distribuidor),
  constraint id_locadora_fk_constraint foreign key (id_locadora) references locadoras (id_locadora),
  constraint id_distribuidor_fk_constraint foreign key (id_distribuidor) references distribuidores (id_distribuidor)
); --ok

create table clientes
(
  num_cliente serial not null,
  nome_cliente character varying(25),
  endereco_cliente character varying(45),
  cidade_cliente character varying(20),
  estado_cliente character varying(2),
  cpf_cliente integer,
  fone_cliente integer,
  num_cliente_titular bigint,
  constraint clientes_pkey primary key (num_cliente),
  constraint num_cliente_titular_fk_constraint foreign key (num_cliente_titular) references clientes (num_cliente)
); --ok

create table funcionarios
(
  id_funcionario serial not null,
  id_locadora integer,
  id_supervisor bigint,
  nome_funcionario character varying(25),
  endereco_funcionario character varying(45),
  cidade_funcionario character varying(20),
  estado_funcionario character varying(2),
  cep_funcionario integer,
  fone_funcionario integer,
  cpf_funcionario integer,
  ingresso_funcionario timestamp without time zone,
  constraint funcionarios_pkey primary key (id_funcionario),
  constraint id_locadora_fk_constraint foreign key (id_locadora) references locadoras (id_locadora),
  constraint id_supervisor_fk_constraint foreign key (id_supervisor) references funcionarios (id_funcionario)
); --ok

create table pagamentos
(
  num_trans_pagamento serial not null,
  num_consumidor bigint,
  id_funcionario bigint,
  tipo_pagamento character varying(20),
  quantia_pagamento money,
  data_pagamento timestamp without time zone,
  status_pagamento character varying(2),
  num_banco integer,
  num_agencia_banco character varying(18),
  num_cheque integer,
  num_cartao_credito integer,
  data_exp_cartao timestamp without time zone,
  tipo_pagamento_cartao character varying(20),
  constraint pagamentos_pkey primary key (num_trans_pagamento),
  constraint num_consumidor_fk_constraint foreign key (num_consumidor) references clientes (num_cliente),
  constraint id_funcionario_fk_constraint foreign key (id_funcionario) references funcionarios (id_funcionario)
); --ok

create table aluguel_filmes
(
  num_aluguel_filme serial not null,
  id_funcionario bigint,
  num_copia_filme bigint,
  num_cliente bigint,

  num_trans_pagamento bigint,

  data_aluguel_filme timestamp without time zone,
  data_retorno_filme timestamp without time zone,
  status_aluguel_filme character varying(2),
  taxa_aluguel_filme money,
  sobretaxa_aluguel_filme money,
  feedback_cliente character varying(30),
  constraint aluguel_filme_pkey primary key (num_aluguel_filme, id_funcionario, num_copia_filme, num_cliente),
  constraint id_funcionario_fk_constraint foreign key (id_funcionario) references funcionarios (id_funcionario),
  constraint num_copia_filme_fk_constraint foreign key (num_copia_filme) references copia_filmes (num_copia_filme),
  constraint num_cliente_fk_constraint foreign key (num_cliente) references clientes (num_cliente),
  constraint num_trans_pagamento_fk_constraint foreign key (num_trans_pagamento) references pagamentos (num_trans_pagamento)
); --ok
