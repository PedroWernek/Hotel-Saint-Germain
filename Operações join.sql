USE HotelSaintGermain;

INSERT INTO Cliente 
(IdCliente, Nome, Sexo, DtaNasc)
VALUES
    (1,'João Silva', 'M', '1990-01-15'),
    (2,'Maria Santos', 'F', '1985-05-20'),
    (3,'Carlos Oliveira', 'M', '2000-09-10'),
    (4,'Ana Pereira', 'F', '1998-03-25'),
    (5,'Pedro Alves', 'M', '1980-11-12'),
    (6,'João Amado', 'M', '1990-01-15'),
    (7,'Maria Joaquina', 'F', '1985-05-20'),
    (8,'Carlos Alberto', 'M', '2000-09-10'),
    (9,'Ana Clara', 'F', '1998-03-25'),
    (10,'Pedro Correia', 'M', '1980-11-12');

INSERT INTO ClienteBrasileiro (IdCliente, Cpf, Rg, Rua, Numero, Cidade, Estado, Cep)
VALUES
    (1, '12345678901', '12345', 'Rua A', 123, 'São Paulo', 'SP', '12345-678'),
    (2, '98765432109', '54321', 'Rua B', 456, 'Rio de Janeiro', 'RJ', '54321-876'),
    (3, '55555555555', '99999', 'Rua C', 789, 'Belo Horizonte', 'MG', '98765-432'),
    (4, '11111111111', '77777', 'Rua D', 101, 'Brasília', 'DF', '11111-111'),
    (5, '99999999999', '33333', 'Rua E', 222, 'Porto Alegre', 'RS', '22222-222');

INSERT INTO ClienteEstrangeiro (IdCliente, Passaporte)
VALUES
    (6, 'ABC12345'),
    (7, 'XYZ98765'),
    (8, 'DEF45678'),
    (9, 'GHI78901'),
    (10, 'JKL23456');

INSERT INTO Telefone (Numero, IdCliente)
VALUES
    ('(11) 1234-5678', 1),
    ('(21) 9876-5432', 2),
    ('(31) 5555-5555', 3),
    ('(61) 1111-1111', 4),
    ('(51) 9999-9999', 5);

INSERT INTO Gerente (MatriculaGerente, Nome)
VALUES
    (101, 'Lucas Oliveira'),
    (102, 'Mariana Santos'),
    (103, 'Ricardo Pereira'),
    (104, 'Isabela Silva'),
    (105, 'Gustavo Alves');
    
INSERT INTO Quarto (NroQuarto, Andar, Tipo, Descricao, VlrDiaria)
VALUES
    ( 101, 1, 'Standard', 'Quarto padrão com cama de casal', '150.00'),
    ( 102, 2, 'Luxo', 'Quarto de luxo com vista para o mar', '250.00'),
    ( 103, 1, 'Standard', 'Quarto padrão com duas camas de solteiro', '150.00'),
	( 104, 3, 'Suíte', 'Suíte de luxo com jacuzzi', '350.00'),
    ( 105, 2, 'Standard', 'Quarto padrão com cama de casal', '150.00');
    
INSERT INTO Reserva 
	(NroReserva, IdCliente, NroQuarto, DataHora)
VALUES
    (1, 1, 101, '2023-10-10 14:00:00'),
    (2, 2, 102, '2023-10-15 12:00:00'),
    (3, 3, 103, '2023-10-20 16:00:00'),
    (4, 4, 104, '2023-10-25 18:00:00'),
    (5, 5, 105, '2023-10-30 10:00:00');
    

INSERT INTO Ocupacao 
	(NroReserva, NroQuarto, Entrada, Saida)
VALUES 
	(1, 101, '2023-10-9 14:00:00', '2023-10-10 14:00:00'),
    (2, 102, '2023-10-13 12:00:00', '2023-10-15 12:00:00'),
    (3, 103, '2023-10-19 16:00:00', '2023-10-20 16:00:00'),
    (4, 104, '2023-10-22 18:00:00', '2023-10-25 18:00:00'),
    (5, 105, '2023-10-28 10:00:00', '2023-10-30 10:00:00');

INSERT INTO Aprovacao 
(NroReserva, MatriculaGerente, DataHora, AprovacaoQuarto)
	VALUES
    (1, 101, '2023-11-05 14:00:00', 'Aprovado'),
	(2, 102, '2023-11-06 12:30:00', 'Aprovado'),
	(3, 103, '2023-11-07 15:15:00', 'Aprovado'),
	(4, 104, '2023-11-08 17:45:00', 'Aprovado'),
	(5, 105, '2023-11-09 10:20:00', 'Aprovado');

INSERT INTO Restaurante (IdRestaurante, Prato, Preco)
VALUES
    (1, 'Spaghetti Carbonara', 20.00),
    (2, 'Filet Mignon', 30.00),
    (3, 'Salada Caesar', 15.00),
    (4, 'Pizza Margherita', 18.00),
    (5, 'Sorvete de Chocolate', 8.00);

INSERT INTO OcupacaoRestaurante (NroReserva, IdRestaurante, DataHora, Quantidade)
VALUES
    (1, 1, '2023-10-10 19:30:00', 2),
    (2, 2, '2023-10-15 20:00:00', 3),
    (3, 3, '2023-10-20 19:00:00', 1),
    (4, 4, '2023-10-25 21:15:00', 2),
    (5, 5, '2023-10-30 18:30:00', 4);

INSERT INTO Frigobar (IdFrigobar, Item, Preco)
VALUES
    (1, 'Refrigerante', 5.00),
    (2, 'Água Mineral', 3.00),
    (3, 'Cerveja', 7.00),
    (4, 'Batata Chips', 4.00),
    (5, 'Chocolate', 2.50);

INSERT INTO OcupacaoFrigobar (NroReserva, IdFrigobar, DataHora, Quantidade)
VALUES
    (1, 1, '2023-10-10 15:30:00', 2),
    (2, 2, '2023-10-15 14:45:00', 1),
    (3, 3, '2023-10-20 17:00:00', 3),
    (4, 4, '2023-10-25 19:30:00', 2),
    (5, 5, '2023-10-30 11:15:00', 4);

INSERT INTO Massagem (IdMassagem, Tipo, Preco)
VALUES
    (1, 'Massagem Relaxante', 60.00),
    (2, 'Massagem Terapêutica', 70.00),
    (3, 'Massagem Esportiva', 80.00),
    (4, 'Massagem Ayurvédica', 90.00),
    (5, 'Massagem com Pedras Quentes', 100.00);

INSERT INTO OcupacaoMassagem (NroReserva, IdMassagem, DataHora, Produtos)
VALUES
    (1, 1, '2023-10-11 15:00:00', 'Óleo de Lavanda'),
    (2, 2, '2023-10-16 14:30:00', 'Creme de Arnica'),
    (3, 3, '2023-10-21 16:45:00', 'Óleo de Eucalipto'),
    (4, 4, '2023-10-26 18:15:00', 'Creme de Camomila'),
    (5, 5, '2023-10-31 10:30:00', 'Óleo de Rosa Mosqueta');


INSERT INTO TipoPagamento (IdTipoPagamento, Descricao)
VALUES
    (1, 'Cartão de Crédito'),
    (2, 'Cartão de Débito'),
    (3, 'Dinheiro'),
    (4, 'Transferência Bancária'),
	(5, 'Dinheiro');
    
INSERT INTO PagamentoOcupacao (NroReserva, IdTipoPagamento, DataHora, ValorTotal)
VALUES
    (1, 1, '2023-10-12 10:00:00', 200.00),
    (2, 1, '2023-10-17 09:30:00', 300.00),
    (3, 2, '2023-10-22 11:45:00', 150.00),
    (4, 3, '2023-10-27 13:20:00', 350.00),
    (5, 4, '2023-11-01 08:00:00', 600.00);

    


/*• Listar, em ordem alfabética, o nome de todos os clientes e a data de entrada de suas reservas;*/
SELECT C.Nome, R.DataHora
FROM Cliente C, Reserva R
WHERE C.IdCliente = R.IdCliente
ORDER BY Nome ASC;

/*• Listar o nome e o cpf de todos os clientes brasileiros;*/
SELECT C.Nome, C.CPF 
FROM Cliente C
WHERE  

/*• Listar o nome e o passaporte de todos os clientes estrangeiros;*/


/*• Listar o número da reserva e o nome do gerente de todas as reservas aprovadas;*/


/*• Listar o número da reserva, a descrição e o valor dos pratos consumidos por todas as ocupações;*/


/*• Listar o nome do cliente e o tipo de pagamento de todas as ocupações pagas;*/


/*• Listar o nome do cliente e os produtos utilizados nas massagens dos clientes que ficaram hospedadosno último ano;*/


/*• Listar o nome do cliente, a data de nascimento e o andar do quarto em que ficaram hospedados osclientes nos últimos três meses;*/


/*• Listar o estado, o nome da cidade e o nome do cliente, para os clientes que se hospedaram nosúltimos cinco anos.*/


/*• Listar o nome do cliente, a data prevista para entrada (reservada), a data e saída da hospedagem(ocupação),
o andar e o número do quarto de todos os clientes que se hospedaram no hotel no anocorrente.*/