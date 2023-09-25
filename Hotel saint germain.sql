HotelSaintGermain.sql
CREATE DATABASE HotelSaintGermain;
USE HotelSaintGermain;

DROP TABLE Cliente; 
CREATE TABLE Cliente(
	IdCliente INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DtaNasc DATETIME NOT NULL
);

DROP TABLE CienteBrasileiro;
CREATE TABLE CienteBrasileiro(
	IdCliente INT PRIMARY KEY,
	Cpf NUMERIC(11) UNIQUE,
	Rg VARCHAR(12) NOT NULL, 
	Rua TEXT(100) NOT NULL,
	Numero NUMERIC(10) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	Estado VARCHAR(50) NOT NULL,
	Cep VARCHAR(9) NOT NULL,
		FOREIGN KEY (IdCliente)
			REFERENCES Cliente(IdCliente) 
); 

DROP TABLE ClienteEstrangeiro;
CREATE TABLE ClienteEstrangeiro(
	IdCliente INT PRIMARY KEY,
    Passaporte TEXT(8),
		FOREIGN KEY (IdCliente)
			REFERENCES Cliente(IdCliente)
);

DROP TABLE Telefone;
CREATE TABLE Telefone(
    Numero VARCHAR(20) PRIMARY KEY,
    IdCliente INT,
		FOREIGN KEY (IdCliente)
			REFERENCES Cliente(IdCliente)
);

DROP TABLE Gerente;
CREATE TABLE Gerente(
	MatriculaGerente INT PRIMARY KEY,
	Nome TEXT(100) NOT NULL
);

DROP TABLE Aprovacao;
CREATE TABLE Aprovacao(
	NroReserva INT PRIMARY KEY,
    MatriculaGerente INT NOT NULL,
    DataHora DATETIME NOT NULL,
    Aprovacao CHAR(1) NOT NULL,
	FOREIGN KEY (MatriculaGerente)
		REFERENCES Gerente(MatriculaGerente),
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva)
);

DROP TABLE Reserva;
CREATE TABLE Reserva(
	IdReserva INT PRIMARY KEY,
	NroReserva INT PRIMARY KEY,
    IdCliente INT,
    NroQuarto SMALLINT,
    DataHora DATETIME, 			
    Periodo NUMERIC,
	FOREIGN KEY (IdCliente)
		REFERENCES Cliente(IdCliente),
	FOREIGN KEY (NroQuarto)
		REFERENCES Quarto(NroQuarto)
);

DROP TABLE Quarto;
CREATE TABLE Quarto(
	NroQuarto INT PRIMARY KEY,
	Andar NUMERIC NOT NULL,
	Tipo TEXT,
	Descricao TEXT,
	VlrDiaria VARCHAR(100) NOT NULL
);

DROP TABLE Ocupacao;
CREATE TABLE Ocupacao(
	NroReserva INT PRIMARY KEY,
	NroQuarto SMALLINT,
	Entrada DATETIME NOT NULL,
	Saida DATETIME NOT NULL,
	FOREIGN KEY (NroReserva)
		REFERENCES Quarto(NroQuarto)
);

DROP TABLE Restaurante;
CREATE TABLE Restaurante(
	IdRestaurante INT PRIMARY KEY,
    Prato TEXT,
    Preco DECIMAL
);

DROP TABLE OcupacaoRestaurante;
CREATE TABLE OcupacaoRestaurante(
	NroReserva INT PRIMARY KEY,
	IdRestaurante INT PRIMARY KEY,
	DataHora DATETIME PRIMARY KEY,
	Quantidade TINYINT,
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva),
	FOREIGN KEY (IdReserva)
		REFERENCES Restaurante(IdRestaurante)
);

DROP TABLE Frigobar;
CREATE TABLE Frigobar(
	IdFrigobar INT PRIMARY KEY,
    Item TEXT,
    Preco DECIMAL
);

DROP TABLE OcupacaoFrigobar;
CREATE TABLE OcupacaoFrigobar(
	NroReserva INT PRIMARY KEY,
    IdFrigobar INT PRIMARY KEY,
	DataHora DATETIME PRIMARY KEY,
    Quantidade TINYINT,
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva),
	FOREIGN KEY (IdFrigobar)
		REFERENCES Frigobar(IdFrigobar)
);

DROP TABLE OcupacaoMassagem;
CREATE TABLE OcupacaoMassagem(
	NroReserva INT PRIMARY KEY,
	IdMassagem INT PRIMARY KEY,
	DataHora DATETIME,
	Produtos TEXT,
	FOREIGN KEY (NroReserva)
		REFERENCES Reverva(NroReserva),
	FOREIGN KEY (IdMassagem)
		REFERENCES Massagem(IdMassagem)
);

DROP TABLE Massagem;
CREATE TABLE Massagem(
	IdMassagem INT PRIMARY KEY,
    Tipo TEXT,
    Preco DECIMAL
); 

DROP TABLE TipoPagamento;
CREATE TABLE TipoPagamento(
	IdTipoPagamento INT PRIMARY KEY,
	Descricao TEXT 
);

DROP TABLE PagamentoOcupacao;
CREATE TABLE PagamentoOcupacao(
	NroReserva INT PRIMARY KEY,
	IdTipoPagamento INT PRIMARY KEY,
	DataHora DATETIME,
	ValorTotal DECIMAL,
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva)
);


