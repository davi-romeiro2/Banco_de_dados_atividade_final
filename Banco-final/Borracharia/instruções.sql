-- Tabela de Pneus
CREATE TABLE Pneus (
    numero_serie INTEGER PRIMARY KEY,
    marca TEXT,
    modelo TEXT,
    dimensoes TEXT,
    quantidade_estoque INTEGER
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    cpf TEXT PRIMARY KEY,
    nome TEXT,
    telefone TEXT,
    endereco TEXT
);

-- Tabela de Serviços
CREATE TABLE Servicos (
    numero_ordem INTEGER PRIMARY KEY,
    data_realizacao TEXT,
    valor REAL,
    cpf_cliente TEXT,
    FOREIGN KEY (cpf_cliente) REFERENCES Clientes(cpf)
);

-- Tabela ligando serviço e pneu
CREATE TABLE Servicos_Pneus (
    numero_ordem INTEGER,
    numero_serie INTEGER,
    FOREIGN KEY (numero_ordem) REFERENCES Servicos(numero_ordem),
    FOREIGN KEY (numero_serie) REFERENCES Pneus(numero_serie),
    PRIMARY KEY (numero_ordem, numero_serie)
);

-- Inserindo dados na tabela Pneus
INSERT INTO Pneus (numero_serie, marca, modelo, dimensoes, quantidade_estoque)
VALUES
    (1, 'Michelin', 'Pilot Sport 4', '225/45R17', 50),
    (2, 'Continental', 'ContiSportContact 5', '205/55R16', 30),
    (3, 'Pirelli', 'P Zero', '245/40R18', 40),
    (4, 'Goodyear', 'Eagle F1', '235/45R19', 25);

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (cpf, nome, telefone, endereco)
VALUES
    ('123.456.789-01', 'João Silva', '123456789', 'Rua A, 123, Bairro X, Cidade Y, Estado Z'),
    ('234.567.890-12', 'Maria Oliveira', '987654321', 'Av B, 456, Bairro Y, Cidade Z, Estado X'),
    ('345.678.901-23', 'Carlos Santos', '456789012', 'Travessa C, 789, Bairro Z, Cidade X, Estado Y');

-- Inserindo dados na tabela Servicos
INSERT INTO Servicos (numero_ordem, data_realizacao, valor, cpf_cliente)
VALUES
    (1, '2023-01-15', 150.00, '123.456.789-01'),
    (2, '2023-02-20', 200.00, '234.567.890-12'),
    (3, '2023-03-25', 120.00, '345.678.901-23');

-- Inserindo dados na tabela Servicos_Pneus
INSERT INTO Servicos_Pneus (numero_ordem, numero_serie)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4);
