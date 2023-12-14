-- Tabela de Flores
CREATE TABLE Flores (
    codigo_identificacao INTEGER PRIMARY KEY,
    nome_cientifico TEXT,
    nome_popular TEXT,
    preco REAL,
    quantidade_estoque INTEGER,
    cores_disponiveis TEXT
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    cpf TEXT PRIMARY KEY,
    nome TEXT,
    telefone TEXT,
    endereco_entrega TEXT
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    numero_pedido INTEGER PRIMARY KEY,
    data_realizacao TEXT,
    valor_total REAL,
    cpf_cliente TEXT,
    data_entrega TEXT,
    horario_entrega TEXT,
    FOREIGN KEY (cpf_cliente) REFERENCES Clientes(cpf)
);

-- Tabela de Detalhes_Pedido (relacionamento entre Pedidos e Flores)
CREATE TABLE Detalhes_Pedido (
    numero_pedido INTEGER,
    codigo_identificacao INTEGER,
    quantidade INTEGER,
    FOREIGN KEY (numero_pedido) REFERENCES Pedidos(numero_pedido),
    FOREIGN KEY (codigo_identificacao) REFERENCES Flores(codigo_identificacao),
    PRIMARY KEY (numero_pedido, codigo_identificacao)
);


-- Inserindo dados na tabela Flores
INSERT INTO Flores (codigo_identificacao, nome_cientifico, nome_popular, preco, quantidade_estoque, cores_disponiveis)
VALUES
    (1, 'Rosa sp.', 'Rosa', 10.00, 50, 'Vermelha, Branca, Amarela'),
    (2, 'Lilium sp.', 'Lírio', 15.00, 30, 'Branca, Rosa, Amarela'),
    (3, 'Tulipa sp.', 'Tulipa', 12.00, 40, 'Vermelha, Branca, Rosa'),
    (4, 'Orchidaceae sp.', 'Orquídea', 20.00, 25, 'Branca, Rosa, Roxa');

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (cpf, nome, telefone, endereco_entrega)
VALUES
    ('123.456.789-01', 'Ana Silva', '123456789', 'Rua A, 123, Bairro X, Cidade Y, Estado Z'),
    ('234.567.890-12', 'Carlos Oliveira', '987654321', 'Av B, 456, Bairro Y, Cidade Z, Estado X'),
    ('345.678.901-23', 'Mariana Santos', '456789012', 'Travessa C, 789, Bairro Z, Cidade X, Estado Y');

-- Inserindo dados na tabela Pedidos
INSERT INTO Pedidos (numero_pedido, data_realizacao, valor_total, cpf_cliente, data_entrega, horario_entrega)
VALUES
    (1, '2023-01-15', 150.00, '123.456.789-01', '2023-01-20', '14:00'),
    (2, '2023-02-20', 200.00, '234.567.890-12', '2023-02-25', '16:30'),
    (3, '2023-03-25', 120.00, '345.678.901-23', '2023-03-30', '13:45');

-- Inserindo dados na tabela Detalhes_Pedido
INSERT INTO Detalhes_Pedido (numero_pedido, codigo_identificacao, quantidade)
VALUES
    (1, 1, 10),
    (1, 2, 5),
    (2, 3, 8),
    (3, 4, 3),
    (3, 1, 12);
