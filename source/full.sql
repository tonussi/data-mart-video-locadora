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
  taxa_aluguel_filme decimal(10,2),
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
  valor_pago decimal(10,2),
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
  quantia_pagamento decimal(10,2),
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
  taxa_aluguel_filme decimal(10,2),
  sobretaxa_aluguel_filme decimal(10,2),
  feedback_cliente character varying(30),
  constraint aluguel_filme_pkey primary key (num_aluguel_filme, id_funcionario, num_copia_filme, num_cliente),
  constraint id_funcionario_fk_constraint foreign key (id_funcionario) references funcionarios (id_funcionario),
  constraint num_copia_filme_fk_constraint foreign key (num_copia_filme) references copia_filmes (num_copia_filme),
  constraint num_cliente_fk_constraint foreign key (num_cliente) references clientes (num_cliente),
  constraint num_trans_pagamento_fk_constraint foreign key (num_trans_pagamento) references pagamentos (num_trans_pagamento)
); --ok

insert into filmes (
  num_filme,
  nome_filme,
  diretor_filme,
  categoria_filme,
  estrela_filme,
  censura_filme,
  taxa_aluguel_filme,
  data_filme
) values
(1, 'quando em roma', 'mark steven johnson', 'comedia', 'kristen bell', 12, 6, '2010-01-29'),
(2, 'jogo de amor em las vegas', 'tom vaughan', 'comedia', 'ashton kutcher', 12, 5, '2008-04-22'),
(3, 'wall-e', 'andrew stanton', 'animação', 'ben burtt', 0, 5, '2008-06-27' ),
(4, ' água para elefantes' , 'francis lawrence' , 'drama', 'reese witherspoon', 14, 5, '2011-04-29'),
(5, 'idas e vindas do amor', 'garry marshall', 'romance', 'julia roberts', 12, 7, '2010-02-12'),
(6, 'crepúsculo' , 'catherine hardwicke', 'romance', 'kristen stewart', 12, 5, '2018-12-19'),
(7, 'a origem' , 'christopher nolan', 'ficção científica', 'leonardo dicaprio', 14, 8, '2010-08-06'),
(8, 'o poderoso chefão', 'francis ford coppola', 'drama', 'marlon brando', 14, 7, '1972-03-24'),
(9, 'pulp fiction', 'quentin tarantino', 'crime', 'john travolta', 18, 6, '1995-02-18'),
(10, 'coringa', 'todd phillips', 'drama', 'joaquin phoenix', 16, 8, '2019-10-03');

insert into locadoras (
  id_locadora,
  rua_locadora,
  fone_locadora,
  nome_locadora
) values
(1, 'lauro linhares', 11111111, 'locadora matriz'),
(2, 'pequeno principe', 22222222, 'locadora campeche'),
(3, 'felipe schmidt', 33333333, 'locadora centro'),
(4, 'abelardo otacilio gomes', 44444444, 'locadora pantano'),
(5, 'av. das rendeiras', 55555555, 'locadora lagoa'),
(6, 'joão pio duarte silva', 66666666, 'locadora córrego');

insert into distribuidores (
  id_distribuidor,
  nome_distribuidor,
  endereco_distribuidor,
  cidade_distribuidor,
  estado_distribuidor,
  cep_distribuidor,
  fone_distribuidor
) values
(1, 'miguel', 'rua bocaiúva, 32', 'florianopolis', 'sc', 88015530, 12345678),
(2, 'alice', 'av. rio branco, 154', 'florianopolis', 'sc', 88015201, 23456789),
(3, 'arthur', 'conselheiro mafra, 257', 'florianopolis', 'sc', 88010101, 34567891),
(4, 'sophia', 'prefeito osmar cunha, 180', 'florianopolis', 'sc', 88015100, 34567892),
(5, 'davi', 'luiz boiteux piazza, 3100', 'florianopolis', 'sc', 88054700, 34567893),
(6, 'laura', 'brisamar, 320', 'florianopolis', 'sc', 88058570, 34567894),
(7, 'heitor', 'manoel vidal, 302', 'florianopolis', 'sc', 88067140, 34567895),
(8, 'helena', 'baldicero filomeno, 10101', 'florianopolis', 'sc', 	88064002, 34567896),
(9, 'gabriel', 'manoel severino de oliveira, 660', 'florianopolis', 'sc', 88062120, 34567897),
(10, 'isabella', 'joão pacheco da costa, 595', 'florianopolis', 'sc', 88062100, 34567898);

insert into clientes (
  num_cliente,
  nome_cliente,
  endereco_cliente,
  cidade_cliente,
  estado_cliente,
  cpf_cliente,
  fone_cliente,
  num_cliente_titular
) values
(1, 'pedro', 'gilson da costa xavier, 2900', 'florianopolis', 'sc', 1, 1, 1),
(2, 'manuela', 'joão pio duarte silva, 80', 'florianopolis', 'sc', 2, 2, 2),
(3, 'lorenzo', 'cônego serpa, 20', 'florianopolis', 'sc', 3, 3, 3),
(4, 'lucas', 'desembargador pedro silva, 26', 'florianopolis', 'sc', 4, 4, 4),
(5, 'luiza', 'conselheiro mafra, 672', 'florianopolis', 'sc', 5, 5, 5),
(6, 'matheus', 'engenheiro max de souza, 127', 'florianopolis', 'sc', 6, 6, 6),
(7, 'lívia', 'felipe schmidt, 890', 'florianopolis', 'sc', 7, 7, 7),
(8, 'enzo', 'coronel pedro demoro, 12', 'florianopolis', 'sc', 8, 8, 8),
(9, 'benjamin', 'coronel pedro demoro, 8', 'florianopolis', 'sc', 9, 9, 9),
(10, 'theo', 'haroldo soares glavan, 1121', 'florianopolis', 'sc', 10, 10, 10);

insert into locadora_distribuidores (
  id_locadora,
  id_distribuidor
) values
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

insert into funcionarios (
  id_funcionario,
  id_locadora,
  id_supervisor,
  nome_funcionario,
  endereco_funcionario,
  cidade_funcionario,
  estado_funcionario,
  cep_funcionario,
  fone_funcionario,
  cpf_funcionario,
  ingresso_funcionario
) values
(1, 1, 1, 'rafael', 'conselheiro mafra, 333', 'florianopolis', 'sc', 88010101, 84841111, 11, '2019-10-22'),
(2, 1, 1, 'maria eduarda', 'abdon batista, 31', 'florianopolis', 'sc', 88045108, 84842222, 12, '2019-10-22'),
(3, 2, 3, 'maria clara', 'abelardo luz, 123', 'florianopolis', 'sc', 88075542, 84843333, 13, '2019-10-22'),
(4, 2, 3, 'nicolas', 'travessa abelardo mateus pinto, 11', 'florianopolis', 'sc', 88095135, 84844444, 14, '2019-10-22'),
(5, 3, 5, 'lara', 'afonso pena, 35', 'florianopolis', 'sc', 88070650, 84845555, 15, '2019-10-22'),
(6, 3, 5, 'guilherme', 'agapito veloso, 546', 'florianopolis', 'sc', 88075580, 84846666, 16, '2019-10-22'),
(7, 4, 7, 'gustavo', 'servidão apollo, 232', 'florianopolis', 'sc', 88045102, 84847777, 17, '2019-10-22'),
(8, 4, 7, 'lorena', 'aprigio josé da silva, 765', 'florianopolis', 'sc', 88090380, 84848888, 18, '2019-10-22'),
(9, 5, 9, 'beatriz', 'armando calil bulos, 278', 'florianopolis', 'sc', 88056618, 84849999, 19, '2019-10-22'),
(10, 6, 10, 'mariana', 'armindo martins correia, 425', 'florianopolis', 'sc', 88056616, 84841010, 20, '2019-10-22');

insert into copia_filmes (
  num_copia_filme,
  num_filme,
  id_locadora,
  valor_pago,
  condicao_geral,
  dta_compra
) values
(1, 1, 1, 60, 10, '2019-10-22'),
(2, 1, 1, 60, 10, '2019-10-22'),
(3, 2, 2, 20, 10, '2019-10-22'),
(4, 2, 2, 20, 10, '2019-10-22'),
(5, 3, 3, 35, 10, '2019-10-22'),
(6, 3, 3, 35, 10, '2019-10-22'),
(7, 4, 4, 40, 10, '2019-10-22'),
(8, 4, 4, 40, 10, '2019-10-22'),
(9, 5, 5, 25, 10, '2019-10-22'),
(10, 5, 5, 25, 10, '2019-10-22'),
(11, 6, 6, 45, 10, '2019-10-22'),
(12, 6, 6, 45, 10, '2019-10-22'),
(13, 7, 1, 60, 10, '2019-10-22'),
(14, 7, 1, 60, 10, '2019-10-22'),
(15, 8, 2, 25, 10, '2019-10-22'),
(16, 8, 2, 25, 10, '2019-10-22'),
(17, 9, 3, 60, 10, '2019-10-22'),
(18, 9, 3, 60, 10, '2019-10-22'),
(19, 10, 4, 60, 10, '2019-10-22'),
(20, 10, 4, 60, 10, '2019-10-22'),
(21, 1, 5, 60, 10, '2019-10-22'),
(22, 1, 5, 60, 10, '2019-10-22'),
(23, 2, 6, 20, 10, '2019-10-22'),
(24, 2, 6, 20, 10, '2019-10-22');

insert into pagamentos (
  num_trans_pagamento,
  num_consumidor,
  id_funcionario,
  tipo_pagamento,
  quantia_pagamento,
  data_pagamento,
  status_pagamento,
  num_banco,
  num_agencia_banco,
  num_cheque,
  num_cartao_credito,
  data_exp_cartao,
  tipo_pagamento_cartao
) values
(1, 1, 1, 'cartao', 3.25, '2019-10-23', 'PG', 1, '123', 18573, 1, '2025-01-01', 'debito'),
(2, 2, 1, 'cartao', 3.25, '2019-10-23', 'PG', 1, '345', 44426, 2, '2025-01-02', 'debito'),
(3, 3, 3, 'cartao', 3.25, '2019-10-30', 'PG', 1, '567', 32765, 3, '2025-01-03', 'credito'),
(4, 4, 3, 'cartao', 3.25, '2019-10-30', 'PG', 1, '789', 88849, 4, '2025-01-05', 'debito'),
(5, 5, 5, 'cartao', 3.25, '2019-10-30', 'PG', 1, '321', 24942, 5, '2025-01-06', 'credito'),
(6, 6, 5, 'cartao', 3.25, '2019-10-30', 'PG', 1, '213', 06663, 6, '2025-01-07', 'credito'),
(7, 7, 7, 'cartao', 3.25, '2019-10-30', 'PG', 1, '412', 00553, 7, '2025-01-08', 'credito'),
(8, 8, 7, 'cartao', 3.25, '2019-10-30', 'PG', 1, '526', 55578, 8, '2025-01-09', 'credito'),
(9, 9, 9, 'cartao', 3.25, '2019-10-30', 'PG', 1, '333', 51655, 9, '2025-01-10', 'credito'),
(10, 10, 10, 'cartao', 3.25, '2019-10-30', 'PG', 1, '111', 36634, 10, '2025-01-11', 'debito');

insert into aluguel_filmes (
  num_aluguel_filme,
  id_funcionario,
  num_copia_filme,
  num_cliente,
  num_trans_pagamento,
  data_aluguel_filme,
  data_retorno_filme,
  status_aluguel_filme,
  taxa_aluguel_filme,
  sobretaxa_aluguel_filme,
  feedback_cliente
) values
(1, 1, 1, 1, 1, '2019-10-23', '2019-10-27', 'AL', 3.00, 0.25, 'bom'),
(2, 1, 2, 2, 2, '2019-10-23', '2019-10-27', 'AL', 3.00, 0.25, 'otimo'),
(3, 3, 3, 3, 3, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'excelente'),
(4, 3, 4, 4, 4, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'ruim'),
(5, 5, 5, 5, 5, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'bom'),
(6, 5, 6, 6, 6, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'bom'),
(7, 7, 7, 7, 7, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'bom'),
(8, 7, 8, 8, 8, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'bom'),
(9, 9, 9, 9, 9, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'otimo'),
(10, 10, 11, 10, 10, '2019-10-30', '2019-11-03', 'AL', 3.00, 0.25, 'ruim');
