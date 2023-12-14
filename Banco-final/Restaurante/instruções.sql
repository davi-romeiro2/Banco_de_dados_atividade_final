-- Tabela Produtos
CREATE TABLE Produtos (
    produto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    tipo TEXT,
    preco REAL,
    descricao TEXT
);

-- Tabela Mesas
CREATE TABLE Mesas (
    mesa_id INTEGER PRIMARY KEY AUTOINCREMENT,
    numero INTEGER,
    capacidade INTEGER
);

-- Tabela Pedidos
CREATE TABLE Pedidos (
    pedido_id INTEGER PRIMARY KEY AUTOINCREMENT,
    mesa_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER,
    total REAL,
    FOREIGN KEY (mesa_id) REFERENCES Mesas(mesa_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Inserir registros na tabela Produtos
INSERT INTO Produtos (nome, tipo, preco, descricao) VALUES
    ('Lasanha', 'Prato Principal', 25.99, 'Deliciosa lasanha de carne e queijo'),
    ('Coca-Cola', 'Bebida', 5.99, 'Refrigerante Coca-Cola 350ml'),
    ('Tiramisu', 'Sobremesa', 12.99, 'Clássico tiramisu italiano'),
    ('Salmão Grelhado', 'Prato Principal', 29.99, 'Salmão grelhado com molho de limão'),
    ('Suco de Laranja', 'Bebida', 7.99, 'Suco natural de laranja'),
    ('Cheesecake', 'Sobremesa', 14.99, 'Cheesecake com calda de frutas vermelhas'),
    ('Nhoque ao Pesto', 'Prato Principal', 22.99, 'Nhoque caseiro ao molho pesto'),
    ('Água Mineral', 'Bebida', 3.99, 'Água mineral sem gás 500ml');

-- Inserir registros na tabela Mesas
INSERT INTO Mesas (numero, capacidade) VALUES
    (1, 4),
    (2, 6),
    (3, 2),
    (4, 8),
    (5, 4),
    (6, 6),
    (7, 2),
    (8, 4);

-- Inserir registros na tabela Pedidos
INSERT INTO Pedidos (mesa_id, produto_id, quantidade, total) VALUES
    (1, 1, 2, 51.98),
    (2, 3, 1, 12.99),
    (3, 5, 3, 23.97),
    (4, 4, 2, 59.98),
    (5, 2, 4, 23.96),
    (6, 6, 1, 14.99),
    (7, 7, 2, 45.98),
    (8, 8, 3, 11.97),
    (1, 2, 2, 11.98),
    (2, 4, 1, 29.99);

-- Consulta pelo tipo
SELECT * FROM Produtos WHERE tipo = 'Prato Principal';

-- Consulta pela mesa
SELECT * FROM Mesas WHERE numero = 3;

-- Consulta com campos específicos
SELECT nome, tipo, preco FROM Produtos;

-- Consulta por mesas
SELECT * FROM Mesas;

-- Consulta por capacidade acima de 6 assentos
SELECT * FROM Mesas WHERE capacidade > 6;

-- Consulta com INNER JOIN
SELECT
    Produtos.nome,
    Produtos.tipo,
    Produtos.preco,
    Mesas.numero,
    Mesas.capacidade,
    Pedidos.pedido_id,
    Pedidos.quantidade,
    Pedidos.total
FROM Pedidos
INNER JOIN Produtos ON Pedidos.produto_id = Produtos.produto_id
INNER JOIN Mesas ON Pedidos.mesa_id = Mesas.mesa_id;

-- Consulta com INNER JOIN para total específico
SELECT
    Produtos.nome,
    Produtos.tipo,
    Produtos.preco,
    Mesas.numero,
    Mesas.capacidade,
    Pedidos.pedido_id,
    Pedidos.quantidade,
    Pedidos.total
FROM Pedidos
INNER JOIN Produtos ON Pedidos.produto_id = Produtos.produto_id
INNER JOIN Mesas ON Pedidos.mesa_id = Mesas.mesa_id
WHERE Pedidos.total = 23.96;

-- Consulta com INNER JOIN para pedidos acima de 20
SELECT
    Produtos.nome,
    Produtos.tipo,
    Produtos.preco,
    Mesas.numero,
    Mesas.capacidade,
    Pedidos.pedido_id,
    Pedidos.quantidade,
    Pedidos.total
FROM Pedidos
INNER JOIN Produtos ON Pedidos.produto_id = Produtos.produto_id
INNER JOIN Mesas ON Pedidos.mesa_id = Mesas.mesa_id
WHERE Pedidos.quantidade > 20;

-- Alterar registros na tabela Produtos
UPDATE Produtos SET preco = 27.99 WHERE produto_id = 1;
UPDATE Produtos SET tipo = 'Prato' WHERE produto_id = 3;
UPDATE Produtos SET descricao = 'Bebida gaseificada' WHERE produto_id = 5;
UPDATE Produtos SET nome = 'Gnocchi al Pesto' WHERE produto_id = 7;
UPDATE Produtos SET preco = 4.99 WHERE produto_id = 8;

-- Alterar registros na tabela Mesas
UPDATE Mesas SET capacidade = 5 WHERE mesa_id = 2;
UPDATE Mesas SET numero = 10 WHERE mesa_id = 4;
UPDATE Mesas SET capacidade = 3 WHERE mesa_id = 6;
UPDATE Mesas SET numero = 20 WHERE mesa_id = 8;
UPDATE Mesas SET capacidade = 6 WHERE mesa_id = 1;

-- Excluir registros na tabela Pedidos
DELETE FROM Pedidos WHERE pedido_id IN (2, 4, 6, 8, 10);
