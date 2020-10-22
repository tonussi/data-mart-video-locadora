INSERT INTO filmes (num_filme, nome_filme, diretor_filme, categoria_filme, estrela_filme, censura_filme, taxa_aluguel_filme, data_filme)
VALUES (1, 'Quando em Roma', 'Mark Steven Johnson', 'comedia', 'Kristen Bell', 12, 6, '2010-01-29'),
(2, 'Jogo de Amor em Las Vegas', 'Tom Vaughan', 'comedia', 'Ashton Kutcher', 12, 5, '2008-04-22'),
(3, 'WALL-E', 'Andrew Stanton', 'animação', 'Ben Burtt', 0, 5, '2008-06-27' ),
(4, ' Água para Elefantes' , 'Francis Lawrence' , 'Drama', 'Reese Witherspoon', 14, 5, '2011-04-29'),
(5, 'Idas e Vindas do Amor', 'Garry Marshall', 'Romance', 'Julia Roberts', 12, 7, '2010-02-12'),
(6, 'Crepúsculo' , 'Catherine Hardwicke', 'Romance', 'Kristen Stewart', 12, 5, '2018-12-19'),
(7, 'A Origem' , 'Christopher Nolan', 'Ficção científica', 'Leonardo DiCaprio', 14, 8, '2010-08-06'),
(8, 'O Poderoso Chefão', 'Francis Ford Coppola', 'Drama', 'Marlon Brando', 14, 7, '1972-03-24'),
(9, 'Pulp Fiction', 'Quentin Tarantino', 'Crime', 'John Travolta', 18, 6, '1995-02-18'),
(10, 'Coringa', 'Todd Phillips', 'Drama', 'Joaquin Phoenix', 16, 8, '2019-10-03');

INSERT INTO locadoras (id_locadora, rua_locadora, fone_locadora, nome_locadora)
VALUES (1, 'Lauro Linhares', 11111111, 'locadora matriz'),
(2, 'Pequeno Principe', 22222222, 'locadora campeche'),
(3, 'Felipe Schmidt', 33333333, 'locadora centro'),
(4, 'Abelardo Otacilio Gomes', 44444444, 'locadora pantano'),
(5, 'Av. das Rendeiras', 55555555, 'locadora lagoa'),
(6, 'João Pio Duarte Silva', 66666666, 'locadora córrego');

INSERT INTO distribuidores (id_distribuidor, nome_distribuidor, endereco_distribuidor, cidade_distribuidor, estado_distribuidor, cep_distribuidor, fone_distribuidor)
VALUES (1, 'Miguel', 'Rua Bocaiúva, 32', 'florianopolis', 'SC', 88015530, 12345678),
(2, 'Alice', 'Av. Rio Branco, 154', 'florianopolis', 'SC', 88015201, 23456789),
(3, 'Arthur', 'Conselheiro Mafra, 257', 'florianopolis', 'SC', 88010101, 34567891),
(4, 'Sophia', 'Prefeito Osmar Cunha, 180', 'florianopolis', 'SC', 88015100, 34567892),
(5, 'Davi', 'Luiz Boiteux Piazza, 3100', 'florianopolis', 'SC', 88054700, 34567893),
(6, 'Laura', 'Brisamar, 320', 'florianopolis', 'SC', 88058570, 34567894),
(7, 'Heitor', 'Manoel Vidal, 302', 'florianopolis', 'SC', 88067140, 34567895),
(8, 'Helena', 'Baldicero Filomeno, 10101', 'florianopolis', 'SC', 	88064002, 34567896),
(9, 'Gabriel', 'Manoel Severino de Oliveira, 660', 'florianopolis', 'SC', 88062120, 34567897),
(10, 'Isabella', 'João Pacheco da Costa, 595', 'florianopolis', 'SC', 88062100, 34567898);

INSERT INTO clientes (num_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente, cpf_cliente, fone_cliente, num_cliente_titular)
VALUES (1, 'Pedro', 'Gilson da Costa Xavier, 2900', 'florianopolis', 'SC', 1, 1, 1),
(2, 'Manuela', 'João Pio Duarte Silva, 80', 'florianopolis', 'SC', 2, 2, 2),
(3, 'Lorenzo', 'Cônego Serpa, 20', 'florianopolis', 'SC', 3, 3, 3),
(4, 'Lucas', 'Desembargador Pedro Silva, 26', 'florianopolis', 'SC', 4, 4, 4),
(5, 'Luiza', 'Conselheiro Mafra, 672', 'florianopolis', 'SC', 5, 5, 5),
(6, 'Matheus', 'Engenheiro Max de Souza, 127', 'florianopolis', 'SC', 6, 6, 6),
(7, 'Lívia', 'Felipe Schmidt, 890', 'florianopolis', 'SC', 7, 7, 7),
(8, 'Enzo', 'Coronel Pedro Demoro, 12', 'florianopolis', 'SC', 8, 8, 8),
(9, 'Benjamin', 'Coronel Pedro Demoro, 8', 'florianopolis', 'SC', 9, 9, 9),
(10, 'Theo', 'Haroldo Soares Glavan, 1121', 'florianopolis', 'SC', 10, 10, 10);

INSERT INTO locadora_distribuidores (id_locadora, id_distribuidor)
VALUES (1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

INSERT INTO funcionarios (id_funcionario, id_locadora, id_supervisor, nome_funcionario, endereco_funcionario, cidade_funcionario, estado_funcionario, cep_funcionario, fone_funcionario, cpf_funcionario, ingresso_funcionario)
VALUES (1, 1, 1, 'Rafael', 'Conselheiro Mafra, 333', 'florianopolis', 'SC', 88010101, 84841111, 11, '2019-10-22'),
(2, 1, 1, 'Maria Eduarda', 'Abdon Batista, 31', 'florianopolis', 'SC', 88045108, 84842222, 12, '2019-10-22'),
(3, 2, 3, 'Maria Clara', 'Abelardo Luz, 123', 'florianopolis', 'SC', 88075542, 84843333, 13, '2019-10-22'),
(4, 2, 3, 'Nicolas', 'Travessa Abelardo Mateus Pinto, 11', 'florianopolis', 'SC', 88095135, 84844444, 14, '2019-10-22'),
(5, 3, 5, 'Lara', 'Afonso Pena, 35', 'florianopolis', 'SC', 88070650, 84845555, 15, '2019-10-22'),
(6, 3, 5, 'Guilherme', 'Agapito Veloso, 546', 'florianopolis', 'SC', 88075580, 84846666, 16, '2019-10-22'),
(7, 4, 7, 'Gustavo', 'Servidão Apollo, 232', 'florianopolis', 'SC', 88045102, 84847777, 17, '2019-10-22'),
(8, 4, 7, 'Lorena', 'Aprigio José da Silva, 765', 'florianopolis', 'SC', 88090380, 84848888, 18, '2019-10-22'),
(9, 5, 9, 'Beatriz', 'Armando Calil Bulos, 278', 'florianopolis', 'SC', 88056618, 84849999, 19, '2019-10-22'),
(10, 6, 10, 'Mariana', 'Armindo Martins Correia, 425', 'florianopolis', 'SC', 88056616, 84841010, 20, '2019-10-22');

INSERT INTO copia_filmes (num_copia_filme, num_filme, id_locadora, valor_pago, condicao_geral, dta_compra)
VALUES (1, 1, 1, 60, 10, '2020-10-22'),
(2, 1, 1, 60, 10, '2020-10-22'),
(3, 2, 2, 20, 10, '2020-10-22'),
(4, 2, 2, 20, 10, '2020-10-22'),
(5, 3, 3, 35, 10, '2020-10-22'),
(6, 3, 3, 35, 10, '2020-10-22'),
(7, 4, 4, 40, 10, '2020-10-22'),
(8, 4, 4, 40, 10, '2020-10-22'),
(9, 5, 5, 25, 10, '2020-10-22'),
(10, 5, 5, 25, 10, '2020-10-22'),
(11, 6, 6, 45, 10, '2020-10-22'),
(12, 6, 6, 45, 10, '2020-10-22'),
(13, 7, 1, 60, 10, '2020-10-22'),
(14, 7, 1, 60, 10, '2020-10-22'),
(15, 8, 2, 25, 10, '2020-10-22'),
(16, 8, 2, 25, 10, '2020-10-22'),
(17, 9, 3, 60, 10, '2020-10-22'),
(18, 9, 3, 60, 10, '2020-10-22'),
(19, 10, 4, 60, 10, '2020-10-22'),
(20, 10, 4, 60, 10, '2020-10-22'),
(21, 1, 5, 60, 10, '2020-10-22'),
(22, 1, 5, 60, 10, '2020-10-22'),
(23, 2, 6, 20, 10, '2020-10-22'),
(24, 2, 6, 20, 10, '2020-10-22');



