-- Tabela de Passageiros
CREATE TABLE Passageiros (
    cpf TEXT PRIMARY KEY,
    nome TEXT,
    data_nascimento TEXT,
    telefone1 TEXT,
    telefone2 TEXT,
    rua TEXT,
    numero TEXT,
    cep TEXT,
    complemento TEXT,
    bairro TEXT,
    cidade TEXT,
    estado TEXT
);

-- Tabela de Rotas
CREATE TABLE Rotas (
    codigo_rota INTEGER PRIMARY KEY,
    origem TEXT,
    destino TEXT
);

-- Tabela Voos
CREATE TABLE Voos (
    numero_voo INTEGER PRIMARY KEY,
    codigo_rota INTEGER,
    horario_partida INTEGER,
    horario_chegada INTEGER,
    aviao_designado TEXT NOT NULL,
    FOREIGN KEY (codigo_rota) REFERENCES Rotas(codigo_rota)
);

-- Tabela Reservas
CREATE TABLE Reservas (
    id_reserva INTEGER PRIMARY KEY,
    cpf_passageiro TEXT,
    numero_voo INTEGER,
    numero_assento INTEGER,
    FOREIGN KEY (cpf_passageiro) REFERENCES Passageiros(cpf),
    FOREIGN KEY (numero_voo) REFERENCES Voos(numero_voo)
);

-- Inserindo dados na tabela Passageiros
INSERT INTO Passageiros (cpf, nome, data_nascimento, telefone1, telefone2, rua, numero, cep, complemento, bairro, cidade, estado)
VALUES
    ('11122233344', 'João Silva', '1980-05-15', '123456789', '987654321', 'Rua A', '123', '12345-678', 'Apto 101', 'Centro', 'Cidade A', 'UF'),
    ('22233344455', 'Maria Oliveira', '1985-08-22', '987654321', '123456789', 'Av B', '456', '54321-876', 'Casa 202', 'Bairro B', 'Cidade B', 'UF'),
    ('33344455566', 'Carlos Santos', '1990-02-10', '567890123', '987654321', 'Travessa C', '789', '98765-432', 'Sala 303', 'Bairro C', 'Cidade C', 'UF'),
    ('44455566677', 'Ana Souza', '1988-11-30', '234567890', '987654321', 'Alameda D', '101', '87654-321', 'Apto 404', 'Bairro D', 'Cidade D', 'UF'),
    ('55566677788', 'Pedro Rocha', '1995-07-03', '876543210', '987654321', 'Avenida E', '202', '23456-789', 'Casa 505', 'Bairro E', 'Cidade E', 'UF'),
    ('66677788899', 'Mariana Lima', '1992-04-18', '321098765', '987654321', 'Rua F', '303', '65432-109', 'Apto 606', 'Bairro F', 'Cidade F', 'UF'),
    ('77788899900', 'Lucas Pereira', '1993-09-25', '432109876', '987654321', 'Estrada G', '404', '87654-321', 'Casa 707', 'Bairro G', 'Cidade G', 'UF'),
    ('88899900011', 'Julia Costa', '1997-06-14', '567890123', '987654321', 'Avenida H', '505', '76543-210', 'Sala 808', 'Bairro H', 'Cidade H', 'UF'),
    ('99900011122', 'Fernando Oliveira', '1991-12-07', '109876543', '987654321', 'Rua I', '606', '87654-321', 'Apto 909', 'Bairro I', 'Cidade I', 'UF'),
    ('12345678900', 'Camila Martins', '1994-03-02', '210987654', '987654321', 'Travessa J', '707', '98765-432', 'Casa 1010', 'Bairro J', 'Cidade J', 'UF');

-- Inserindo dados na tabela Reservas
INSERT INTO Reservas (cpf_passageiro, numero_voo, numero_assento)
VALUES
    ('11122233344', 101, 1),
    ('22233344455', 102, 2),
    ('33344455566', 103, 3),
    ('44455566677', 104, 4),
    ('55566677788', 105, 5),
    ('66677788899', 106, 6),
    ('77788899900', 107, 7),
    ('88899900011', 108, 8),
    ('99900011122', 109, 9),
    ('12345678900', 110, 10);

-- Inserindo dados na tabela Voos
INSERT INTO Voos (numero_voo, codigo_rota, horario_partida, horario_chegada, aviao_designado)
VALUES
    (101, 1, strftime('%s', '2023-01-15 08:00:00'), strftime('%s', '2023-01-15 10:00:00'), 'A320'),
    (102, 2, strftime('%s', '2023-02-20 10:30:00'), strftime('%s', '2023-02-20 12:30:00'), 'B737'),
    (103, 3, strftime('%s', '2023-03-25 13:45:00'), strftime('%s', '2023-03-25 15:45:00'), 'A330'),
    (104, 4, strftime('%s', '2023-04-30 16:15:00'), strftime('%s', '2023-04-30 18:15:00'), 'B787'),
    (105, 5, strftime('%s', '2023-05-05 19:30:00'), strftime('%s', '2023-05-05 21:30:00'), 'A350'),
    (106, 6, strftime('%s', '2023-06-10 22:45:00'), strftime('%s', '2023-06-11 00:45:00'), 'B747'),
    (107, 7, strftime('%s', '2023-07-15 03:00:00'), strftime('%s', '2023-07-15 05:00:00'), 'A380'),
    (108, 8, strftime('%s', '2023-08-20 06:15:00'), strftime('%s', '2023-08-20 08:15:00'), 'B777'),
    (109, 9, strftime('%s', '2023-09-25 09:30:00'), strftime('%s', '2023-09-25 11:30:00'), 'A320neo'),
    (110, 10, strftime('%s', '2023-10-30 12:45:00'), strftime('%s', '2023-10-30 14:45:00'), 'B737MAX');