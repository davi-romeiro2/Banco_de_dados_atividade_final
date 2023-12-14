-- Tabela Cliente
CREATE TABLE tb_cliente (
    cliente_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cnh TEXT,
    telefone TEXT
);

-- Tabela Veículo
CREATE TABLE tb_veiculo (
    veiculo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    modelo TEXT NOT NULL,
    ano INTEGER NOT NULL,
    placa TEXT NOT NULL,
    disponibilidade TEXT NOT NULL
);

-- Tabela Aluguel
CREATE TABLE tb_aluguel (
    aluguel_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    veiculo_id INTEGER NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES tb_cliente(cliente_id),
    FOREIGN KEY (veiculo_id) REFERENCES tb_veiculo(veiculo_id)
);

-- Inserir registros na tabela tb_cliente
INSERT INTO tb_cliente (nome, cnh, telefone) VALUES
    ('João Silva', '123456789', '111222333'),
    ('Maria Oliveira', '987654321', '444555666'),
    ('Carlos Santos', '456789012', '777888999'),
    ('Ana Souza', '234567890', '333444555'),
    ('Pedro Rocha', '876543210', '666777888'),
    ('Mariana Lima', '321098765', '999000111'),
    ('Lucas Pereira', '432109876', '222333444'),
    ('Julia Costa', '567890123', '555666777');

-- Inserir registros na tabela tb_veiculo
INSERT INTO tb_veiculo (modelo, ano, placa, disponibilidade) VALUES
    ('Civic', 2022, 'ABC1234', 'disponível'),
    ('Corolla', 2021, 'XYZ5678', 'disponível'),
    ('Onix', 2023, 'DEF5678', 'disponível'),
    ('Golf', 2022, 'GHI9012', 'disponível'),
    ('Uno', 2021, 'JKL3456', 'disponível'),
    ('Fusca', 2023, 'MNO7890', 'disponível'),
    ('Camaro', 2022, 'PQR1234', 'disponível'),
    ('Hilux', 2021, 'STU5678', 'disponível');

-- Inserir registros na tabela tb_aluguel
INSERT INTO tb_aluguel (cliente_id, veiculo_id, data_inicio, data_fim) VALUES
    (1, 1, '2023-01-10', '2023-01-15'),
    (2, 2, '2023-02-15', '2023-02-20'),
    (3, 3, '2023-03-20', '2023-03-25'),
    (4, 4, '2023-04-25', '2023-04-30'),
    (5, 5, '2023-05-30', '2023-06-04'),
    (6, 6, '2023-06-05', '2023-06-10'),
    (7, 7, '2023-07-10', '2023-07-15'),
    (8, 8, '2023-08-15', '2023-08-20'),
    (1, 3, '2023-09-20', '2023-09-25'),
    (2, 4, '2023-10-25', '2023-10-30');

-- Consulta pelo telefone
SELECT * FROM tb_cliente WHERE telefone = '111222333';

-- Consulta pela CNH
SELECT * FROM tb_cliente WHERE cnh = '123456789';

-- Consulta com campos específicos
SELECT nome, cnh FROM tb_cliente;

-- Consulta pelo ano
SELECT * FROM tb_veiculo WHERE ano = 2022;

-- Consulta pelo id
SELECT * FROM tb_veiculo WHERE veiculo_id = 3;

-- Consulta pela disponibilidade
SELECT * FROM tb_veiculo WHERE disponibilidade = 'disponível';

-- Consulta com INNER JOIN
SELECT
    tb_cliente.nome,
    tb_cliente.cnh,
    tb_veiculo.modelo,
    tb_veiculo.placa,
    tb_veiculo.disponibilidade,
    tb_aluguel.aluguel_id,
    tb_aluguel.data_inicio,
    tb_aluguel.data_fim
FROM tb_aluguel
INNER JOIN tb_cliente ON tb_aluguel.cliente_id = tb_cliente.cliente_id
INNER JOIN tb_veiculo ON tb_aluguel.veiculo_id = tb_veiculo.veiculo_id;

-- Consulta com INNER JOIN para veículos disponíveis
SELECT
    tb_cliente.nome,
    tb_cliente.cnh,
    tb_veiculo.modelo,
    tb_veiculo.placa,
    tb_veiculo.disponibilidade,
    tb_aluguel.aluguel_id,
    tb_aluguel.data_inicio,
    tb_aluguel.data_fim
FROM tb_aluguel
INNER JOIN tb_cliente ON tb_aluguel.cliente_id = tb_cliente.cliente_id
INNER JOIN tb_veiculo ON tb_aluguel.veiculo_id = tb_veiculo.veiculo_id
WHERE tb_veiculo.disponibilidade = 'disponível';

-- Consulta com INNER JOIN para veículos alugados
SELECT
    tb_cliente.nome,
    tb_cliente.cnh,
    tb_veiculo.modelo,
    tb_veiculo.placa,
    tb_veiculo.disponibilidade,
    tb_aluguel.aluguel_id,
    tb_aluguel.data_inicio,
    tb_aluguel.data_fim
FROM tb_aluguel
INNER JOIN tb_cliente ON tb_aluguel.cliente_id = tb_cliente.cliente_id
INNER JOIN tb_veiculo ON tb_aluguel.veiculo_id = tb_veiculo.veiculo_id
WHERE tb_veiculo.disponibilidade = 'alugado';

-- Alterar registros na tabela tb_cliente
UPDATE tb_cliente SET telefone = '999888777' WHERE cliente_id = 1;
UPDATE tb_cliente SET cnh = '987654321' WHERE cliente_id = 2;
UPDATE tb_cliente SET nome = 'Carlos Silva' WHERE cliente_id = 3;
UPDATE tb_cliente SET nome = 'Ana Rocha' WHERE cliente_id = 4;
UPDATE tb_cliente SET telefone = '111222333' WHERE cliente_id = 5;

-- Alterar registros na tabela tb_veiculo
UPDATE tb_veiculo SET disponibilidade = 'alugado' WHERE veiculo_id IN (1, 3, 5, 7, 8);
UPDATE tb_veiculo SET ano = 2024 WHERE veiculo_id = 2;
UPDATE tb_veiculo SET modelo = 'Civic Sport' WHERE veiculo_id = 4;
UPDATE tb_veiculo SET placa = 'ZZZ9999' WHERE veiculo_id = 6;
UPDATE tb_veiculo SET disponibilidade = 'disponível' WHERE veiculo_id = 10;

-- Excluir registros na tabela tb_aluguel
DELETE FROM tb_aluguel WHERE aluguel_id IN (2, 4, 6, 8, 10);
