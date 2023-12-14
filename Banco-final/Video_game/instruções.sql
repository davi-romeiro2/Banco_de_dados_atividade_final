-- Tabela Plataformas
CREATE TABLE Plataformas (
    cod_plataforma INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    fabricante TEXT
);

-- Tabela Jogos
CREATE TABLE Jogos (
    cod_jogo INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    genero TEXT,
    lancamento DATE,
    cod_plataforma INTEGER,
    FOREIGN KEY (cod_plataforma) REFERENCES Plataformas(cod_plataforma)
);

-- Inserir registros na tabela Plataformas
INSERT INTO Plataformas (nome, fabricante) VALUES
    ('PlayStation 5', 'Sony'),
    ('Xbox Series X', 'Microsoft'),
    ('Nintendo Switch', 'Nintendo'),
    ('PC', 'Vários');

-- Inserir registros na tabela Jogos
INSERT INTO Jogos (titulo, genero, lancamento, cod_plataforma) VALUES
    ('The Last of Us Part II', 'Ação/Aventura', '2020-06-19', 1),
    ('Cyberpunk 2077', 'RPG', '2020-12-10', 4),
    ('Super Mario Odyssey', 'Aventura', '2017-10-27', 3),
    ('Halo Infinite', 'Tiro em Primeira Pessoa', '2021-12-08', 2),
    ('The Witcher 3: Wild Hunt', 'RPG', '2015-05-19', 4),
    ('Breath of the Wild', 'Aventura', '2017-03-03', 3),
    ('God of War', 'Ação/Aventura', '2018-04-20', 1),
    ('FIFA 22', 'Esporte', '2021-10-01', 2),
    ('Among Us', 'Multijogador online', '2018-06-15', 4),
    ('Minecraft', 'Sandbox', '2011-11-18', 4);

-- Consulta em uma plataforma específica (por exemplo, PlayStation 5)
SELECT * FROM Jogos WHERE cod_plataforma = 1;

-- Consulta em um gênero específico (por exemplo, Aventura)
SELECT * FROM Jogos WHERE genero = 'Aventura';

-- Consulta utilizando INNER JOIN
SELECT Plataformas.nome, Plataformas.fabricante, Jogos.titulo, Jogos.lancamento, Jogos.genero
FROM Plataformas
INNER JOIN Jogos ON Plataformas.cod_plataforma = Jogos.cod_plataforma;

-- Alterar a data de lançamento de jogos específicos
UPDATE Jogos SET lancamento = '2022-01-01' WHERE cod_jogo IN (2, 5, 7, 9);

-- Excluir jogos específicos
DELETE FROM Jogos WHERE cod_jogo IN (3, 6, 8, 10);
