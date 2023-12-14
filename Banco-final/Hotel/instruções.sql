-- Tabela Hospede
CREATE TABLE tb_hospede (
    hospede_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    documento TEXT,
    telefone TEXT
);

-- Tabela Quarto
CREATE TABLE tb_quarto (
    quarto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    preco_diaria REAL NOT NULL,
    status TEXT NOT NULL
);

-- Tabela Reserva
CREATE TABLE tb_reserva (
    reserva_id INTEGER PRIMARY KEY AUTOINCREMENT,
    hospede_id INTEGER,
    quarto_id INTEGER,
    data_entrada TEXT NOT NULL,
    data_saida TEXT NOT NULL,
    FOREIGN KEY (hospede_id) REFERENCES tb_hospede(hospede_id),
    FOREIGN KEY (quarto_id) REFERENCES tb_quarto(quarto_id)
);

-- Inserir registros na tabela tb_hospede
INSERT INTO tb_hospede (nome, documento, telefone) VALUES
    ('João Silva', '123456789', '123456789'),
    ('Maria Santos', '987654321', '987654321'),
    ('Carlos Oliveira', '111222333', '111222333'),
    ('Ana Souza', '444555666', '444555666'),
    ('Pedro Almeida', '777888999', '777888999'),
    ('Fernanda Lima', '888999000', '888999000'),
    ('Rodrigo Pereira', '333444555', '333444555'),
    ('Camila Costa', '555666777', '555666777');

-- Inserir registros na tabela tb_quarto
INSERT INTO tb_quarto (tipo, preco_diaria, status) VALUES
    ('Simples', 100.0, 'disponível'),
    ('Duplo', 150.0, 'disponível'),
    ('Suíte', 200.0, 'ocupado'),
    ('Standard', 120.0, 'disponível'),
    ('Luxo', 180.0, 'ocupado'),
    ('Presidencial', 250.0, 'manutenção'),
    ('Econômico', 90.0, 'disponível'),
    ('Familiar', 170.0, 'ocupado');

-- Inserir registros na tabela tb_reserva
INSERT INTO tb_reserva (hospede_id, quarto_id, data_entrada, data_saida) VALUES
    (1, 1, '2023-01-01', '2023-01-05'),
    (2, 3, '2023-02-10', '2023-02-15'),
    (3, 5, '2023-03-20', '2023-03-25'),
    (4, 2, '2023-04-05', '2023-04-10'),
    (5, 4, '2023-05-15', '2023-05-20'),
    (6, 6, '2023-06-25', '2023-06-30'),
    (7, 8, '2023-07-10', '2023-07-15'),
    (8, 7, '2023-08-20', '2023-08-25'),
    (1, 2, '2023-09-05', '2023-09-10'),
    (2, 4, '2023-10-15', '2023-10-20');

-- Consulta por documento
SELECT * FROM tb_hospede WHERE documento = '123456789';

-- Consulta por id
SELECT nome, documento, telefone FROM tb_hospede WHERE hospede_id = 2;

-- Consulta por tipo
SELECT * FROM tb_quarto WHERE tipo = 'Duplo';

-- Consulta por preço da diária maior que X
SELECT * FROM tb_quarto WHERE preco_diaria > 150.0;

-- Contagem de quartos disponíveis
SELECT COUNT(*) FROM tb_quarto WHERE status = 'disponível';

-- Consulta com INNER JOIN
SELECT
    tb_hospede.nome,
    tb_hospede.documento,
    tb_quarto.tipo,
    tb_quarto.preco_diaria,
    tb_quarto.status,
    tb_reserva.reserva_id,
    tb_reserva.data_entrada,
    tb_reserva.data_saida
FROM tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id;

-- Consulta com INNER JOIN e cláusula WHERE para quartos ocupados
SELECT
    tb_hospede.nome,
    tb_hospede.documento,
    tb_quarto.tipo,
    tb_quarto.preco_diaria,
    tb_quarto.status,
    tb_reserva.reserva_id,
    tb_reserva.data_entrada,
    tb_reserva.data_saida
FROM tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id
WHERE tb_quarto.status = 'ocupado';

-- Alterações na tabela Hospede
UPDATE tb_hospede SET telefone = '555555555' WHERE hospede_id = 3;
UPDATE tb_hospede SET nome = 'José Silva' WHERE hospede_id = 5;
UPDATE tb_hospede SET documento = '999888777' WHERE hospede_id = 7;
UPDATE tb_hospede SET telefone = '111111111' WHERE hospede_id = 8;
UPDATE tb_hospede SET documento = '222333444' WHERE hospede_id = 6;

-- Alterações na tabela Quarto
UPDATE tb_quarto SET preco_diaria = 110.0 WHERE quarto_id = 1;
UPDATE tb_quarto SET status = 'manutenção' WHERE quarto_id = 3;
UPDATE tb_quarto SET tipo = 'Super Luxo' WHERE quarto_id = 5;
UPDATE tb_quarto SET preco_diaria = 95.0 WHERE quarto_id = 7;
UPDATE tb_quarto SET tipo = 'Casal' WHERE quarto_id = 8;

-- Exclusões na tabela Reserva
DELETE FROM tb_reserva WHERE reserva_id IN (2, 4, 6, 8, 10);
