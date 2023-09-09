-- Cria a tabela Endereco
CREATE TABLE Endereco(
	id_endereco NUMBER NOT NULL,
    logradouro VARCHAR2(50) NOT NULL,
    numero NUMBER NOT NULL,
    complemento VARCHAR2(20),
    cep VARCHAR2(9) NOT NULL,
    bairro VARCHAR2(20) NOT NULL,
    cidade VARCHAR2(50) NOT NULL,
    estado VARCHAR2(50) NOT NULL,
    pais VARCHAR2(50) NOT NULL,
    PRIMARY KEY(id_endereco)
);

-- Insere 4 entradas na tabela Endereco
INSERT INTO Endereco VALUES (1, 'Av. Dr. Nilo Peçanha', 1600, NULL, '91330-002', 'Boa Vista', 'Porto Alegre', 'RS', 'Brasil');
INSERT INTO Endereco VALUES (2, 'Av. Unisinos', 950, NULL, '93022-750', 'Cristo Rei', 'Unisinos', 'RS', 'Brasil');
INSERT INTO Endereco VALUES (3, 'Av. Paulo Gama', 110, 'Prédio 2', '90046-900', 'Centro', 'Porto Alegre', 'RS', 'Brasil');
INSERT INTO Endereco VALUES (4, 'Rua dos Andradas', 736, NULL, '90020-004', 'Centro Histórico', 'Porto Alegre', 'RS', 'Brasil');



-- Cria a tabela Cliente
CREATE TABLE Cliente(
    cpf VARCHAR2(14)  NOT NULL,
    id_endereco INT  NOT NULL,
    nome VARCHAR2(20)  NOT NULL,
    sobrenome  VARCHAR2(30)  NOT NULL,
    data_nascimento DATE NOT NULL,
    cnh VARCHAR2(10),
    PRIMARY KEY(cpf),
    CONSTRAINT fk_endereco_id_endereco FOREIGN KEY (id_endereco) REFERENCES Endereco (id_endereco)
);

-- Insere 4 entradas na tabela Cliente
INSERT INTO Cliente VALUES ('12345678900', 1, 'Tarsila', 'do Amaral', DATE '1953-10-10', 'B');
INSERT INTO Cliente VALUES ('98765432100', 2, 'Carla', 'Madeira', DATE '1960-04-22', 'A');
INSERT INTO Cliente VALUES ('11223344556', 3, 'Pedro', 'Pacífico', DATE '1992-09-02', 'AB');
INSERT INTO Cliente VALUES ('99664422112', 4, 'Mario', 'Quintana', DATE '1906-06-30', 'B');



-- Cria a tabela Veiculo
CREATE TABLE Veiculo(
    placa VARCHAR(10) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    ano INT NOT NULL,
    fabricante VARCHAR(20) NOT NULL,
    numero_passageiros INT NOT NULL,
    capacidade_porta_malas DOUBLE PRECISION NOT NULL,
    valor_dia DOUBLE PRECISION NOT NULL,
    valor_semana DOUBLE PRECISION NOT NULL,
    valor_mes DOUBLE PRECISION NOT NULL,
    PRIMARY KEY(placa)
);

--Insere 4 entradas na tabela Veiculo
INSERT INTO Veiculo VALUES ('IXW1234', 'HRV', 'Hatch', 2020, 'Hyundai', 5, 300, 80, 560, 2400);
INSERT INTO Veiculo VALUES ('ABC3972', 'HB20', 'Sedan', 2021, 'Hyundai', 5, 475, 100, 700, 3000);
INSERT INTO Veiculo VALUES ('IRW0590', 'Gol', 'Hatch', 2018, 'Chevrolet', 5, 375, 75, 525, 2250);
INSERT INTO Veiculo VALUES ('IFD9988', 'Fiesta', 'Hatch', 2017, 'Ford', 5, 300, 90, 810, 2700);



-- Cria a tabela Aluga
CREATE TABLE Aluga(
    id_aluga INT NOT NULL,
    cliente_cpf VARCHAR2(14) NOT NULL,
    veiculo_placa VARCHAR(10) NOT NULL,
	data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    valor_pago DOUBLE PRECISION NOT NULL,
    PRIMARY KEY(id_aluga),
    CONSTRAINT fk_cliente_cliente_cpf FOREIGN KEY (cliente_cpf) REFERENCES Cliente (cpf),
    CONSTRAINT fk_veiculo_veiculo_placa FOREIGN KEY (veiculo_placa) REFERENCES Veiculo (placa)
);

-- Insere 4 entradas na tabela Aluga
INSERT INTO Aluga VALUES (1, '12345678900', 'IXW1234', DATE '2023-05-04', DATE '2023-05-06', 160);
INSERT INTO Aluga VALUES (2, '98765432100', 'ABC3972', DATE '2023-07-10', DATE '2023-07-20', 1000);
INSERT INTO Aluga VALUES (3, '11223344556', 'IRW0590', DATE '2023-08-01', DATE '2023-08-15', 1050);
INSERT INTO Aluga VALUES (4, '99664422112', 'IFD9988', DATE '2023-09-02', DATE '2023-09-04', 180);


-- Cria a tabela Manutencao
CREATE TABLE Manutencao(
    id_manutencao INT NOT NULL,
    veiculo_placa VARCHAR(10) NOT NULL,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    custo DOUBLE PRECISION NOT NULL,
    PRIMARY KEY(id_manutencao),
    CONSTRAINT fk_manutencao_veiculo_placa FOREIGN KEY (veiculo_placa) REFERENCES Veiculo (placa)
);

-- Insere 4 entradas na tabela Manutencao
INSERT INTO Manutencao VALUES (1, 'IXW1234', DATE '2023-09-02', DATE '2023-09-03', 100);
INSERT INTO Manutencao VALUES (2, 'ABC3972', DATE '2023-09-03', DATE '2023-09-06', 2500);
INSERT INTO Manutencao VALUES (3, 'IRW0590', DATE '2023-05-10', DATE '2023-05-13', 1000);
INSERT INTO Manutencao VALUES (4, 'IFD9988', DATE '2023-06-05', DATE '2023-06-15', 800);