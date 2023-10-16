DROP DATABASE HotelSaintGermain;
CREATE DATABASE HotelSaintGermain;
USE HotelSaintGermain;


CREATE TABLE Cliente(
	IdCliente INT PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DtaNasc DATETIME NOT NULL
);


CREATE TABLE ClienteBrasileiro(
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

CREATE TABLE ClienteEstrangeiro(
	IdCliente INT PRIMARY KEY,
    Passaporte TEXT(8),
		FOREIGN KEY (IdCliente)
			REFERENCES Cliente(IdCliente)
);

CREATE TABLE Telefone(
    Numero VARCHAR(20) PRIMARY KEY,
    IdCliente INT,
		FOREIGN KEY (IdCliente)
			REFERENCES Cliente(IdCliente)
);

CREATE TABLE Gerente(
	MatriculaGerente INT PRIMARY KEY,
	Nome TEXT(100) NOT NULL
);

CREATE TABLE Quarto(
	NroQuarto INT PRIMARY KEY,
	Andar NUMERIC NOT NULL,
	Tipo TEXT,
	Descricao TEXT,
	VlrDiaria VARCHAR(100) NOT NULL
);


CREATE TABLE Reserva(
	NroReserva INT,
    IdCliente INT,
    NroQuarto INT,
    DataHora DATETIME, 			
    PRIMARY KEY (NroReserva),
	FOREIGN KEY (IdCliente)
		REFERENCES Cliente(IdCliente),
	FOREIGN KEY (NroQuarto)
		REFERENCES Quarto(NroQuarto)
);


CREATE TABLE Ocupacao(
	NroReserva INT PRIMARY KEY,
	NroQuarto SMALLINT,
	Entrada DATETIME NOT NULL,
	Saida DATETIME NOT NULL,
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva)
);

CREATE TABLE Aprovacao(
	NroReserva INT,
    MatriculaGerente INT NOT NULL,
    DataHora DATETIME NOT NULL,
    AprovacaoQuarto CHAR(9) NOT NULL,
    PRIMARY KEY (NroReserva),
	FOREIGN KEY (MatriculaGerente)
		REFERENCES Gerente(MatriculaGerente),
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva)
);


CREATE TABLE Restaurante(
	IdRestaurante INT PRIMARY KEY,
    Prato TEXT,
    Preco DECIMAL
);


CREATE TABLE OcupacaoRestaurante(
	NroReserva INT,
	IdRestaurante INT,
	DataHora DATETIME,
	Quantidade TINYINT,
    PRIMARY KEY (NroReserva, IdRestaurante, DataHora),
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva),
	FOREIGN KEY (IdRestaurante)
		REFERENCES Restaurante(IdRestaurante)
);


CREATE TABLE Frigobar(
	IdFrigobar INT PRIMARY KEY,
    Item TEXT,
    Preco DECIMAL
);


CREATE TABLE OcupacaoFrigobar(
	NroReserva INT,
    IdFrigobar INT,
	DataHora DATETIME,
    Quantidade TINYINT,
    PRIMARY KEY (NroReserva, IdFrigobar, DataHora),
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva),
	FOREIGN KEY (IdFrigobar)
		REFERENCES Frigobar(IdFrigobar)
);

CREATE TABLE Massagem(
	IdMassagem INT PRIMARY KEY,
    Tipo TEXT,
    Preco DECIMAL
); 

CREATE TABLE OcupacaoMassagem(
	NroReserva INT,
	IdMassagem INT,
	DataHora DATETIME,
	Produtos TEXT,
    PRIMARY KEY (NroReserva, IdMassagem, Datahora),
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva),
	FOREIGN KEY (IdMassagem)
		REFERENCES Massagem(IdMassagem)
);


CREATE TABLE TipoPagamento(
	IdTipoPagamento INT PRIMARY KEY,
	Descricao TEXT 
);


CREATE TABLE PagamentoOcupacao(
	NroReserva INT,
	IdTipoPagamento INT,
	DataHora DATETIME,
	ValorTotal DECIMAL,
    PRIMARY KEY (NroReserva, IdTipoPagamento),
	FOREIGN KEY (NroReserva)
		REFERENCES Reserva(NroReserva)
);


DROP TABLE PagamentoOcupacao;
DROP TABLE TipoPagamento;
DROP TABLE OcupacaoMassagem;
DROP TABLE Massagem;
DROP TABLE OcupacaoRestaurante;
DROP TABLE Restaurante;
DROP TABLE OcupacaoFrigobar;
DROP TABLE Frigobar;
DROP TABLE Ocupacao;
DROP TABLE Aprovacao;
DROP TABLE Gerente;
DROP TABLE Telefone;
DROP TABLE ClienteEstrangeiro;
DROP TABLE CienteBrasileiro;
DROP TABLE Cliente; 
DROP TABLE Reserva;
DROP TABLE Quarto;