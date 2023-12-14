-- Tabela de Alunos
CREATE TABLE Alunos (
    id_aluno INTEGER PRIMARY KEY,
    nome TEXT,
    cpf TEXT,
    rg TEXT,
    data_nascimento TEXT,
    endereco TEXT
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    id_curso INTEGER PRIMARY KEY,
    nome TEXT,
    carga_horaria TEXT
);

-- Tabela de Professores
CREATE TABLE Professores (
    id_professor INTEGER PRIMARY KEY,
    nome TEXT,
    especialidade TEXT,
    contato TEXT
);

-- Tabela de Matriculas
CREATE TABLE Matriculas (
    id_matricula INTEGER PRIMARY KEY,
    id_aluno INTEGER,
    id_curso INTEGER,
    numero_matricula TEXT,
    quadro_notas TEXT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Tabela de Notas
CREATE TABLE Notas (
    id_nota INTEGER PRIMARY KEY,
    id_matricula INTEGER,
    n1 INTEGER,
    n2 INTEGER,
    n3 INTEGER,
    n4 INTEGER,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula)
);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (nome, cpf, rg, data_nascimento, endereco)
VALUES
    ('João Silva', '111.222.333-44', '1234567', '1990-05-15', 'Rua A, 123'),
    ('Maria Oliveira', '222.333.444-55', '7654321', '1988-08-22', 'Av B, 456'),
    ('Carlos Santos', '333.444.555-66', '9876543', '1995-02-10', 'Travessa C, 789'),
    ('Ana Souza', '444.555.666-77', '1357924', '1992-11-30', 'Alameda D, 101'),
    ('Pedro Rocha', '555.666.777-88', '2468135', '1987-07-03', 'Avenida E, 202'),
    ('Mariana Lima', '666.777.888-99', '8765432', '1998-04-18', 'Rua F, 303'),
    ('Lucas Pereira', '777.888.999-00', '9876541', '1993-09-25', 'Estrada G, 404'),
    ('Julia Costa', '888.999.000-11', '5432167', '1997-06-14', 'Avenida H, 505'),
    ('Fernando Oliveira', '999.000.111-22', '7654329', '1991-12-07', 'Rua I, 606'),
    ('Camila Martins', '123.456.789-00', '9876540', '1994-03-02', 'Travessa J, 707');

-- Inserindo dados na tabela Cursos
INSERT INTO Cursos (nome, carga_horaria)
VALUES
    ('Informática', '120 horas'),
    ('Inglês', '80 horas'),
    ('Administração', '150 horas'),
    ('Matemática', '100 horas'),
    ('Artes', '60 horas'),
    ('Ciências', '130 horas'),
    ('História', '90 horas'),
    ('Geografia', '110 horas'),
    ('Física', '70 horas'),
    ('Química', '140 horas');

-- Inserindo dados na tabela Professores
INSERT INTO Professores (nome, especialidade, contato)
VALUES
    ('Prof. Silva', 'Informática', 'prof.silva@example.com'),
    ('Prof. Oliveira', 'Inglês', 'prof.oliveira@example.com'),
    ('Prof. Santos', 'Administração', 'prof.santos@example.com'),
    ('Prof. Souza', 'Matemática', 'prof.souza@example.com'),
    ('Prof. Rocha', 'Artes', 'prof.rocha@example.com'),
    ('Prof. Lima', 'Ciências', 'prof.lima@example.com'),
    ('Prof. Pereira', 'História', 'prof.pereira@example.com'),
    ('Prof. Costa', 'Geografia', 'prof.costa@example.com'),
    ('Prof. Oliveira2', 'Física', 'prof.oliveira2@example.com'),
    ('Prof. Martins', 'Química', 'prof.martins@example.com');

-- Inserindo dados na tabela Matriculas
INSERT INTO Matriculas (id_aluno, id_curso, numero_matricula, quadro_notas)
VALUES
    (1, 1, '2023001', NULL),
    (2, 2, '2023002', NULL),
    (3, 3, '2023003', NULL),
    (4, 4, '2023004', NULL),
    (5, 5, '2023005', NULL),
    (6, 6, '2023006', NULL),
    (7, 7, '2023007', NULL),
    (8, 8, '2023008', NULL),
    (9, 9, '2023009', NULL),
    (10, 10, '2023010', NULL);

-- Inserindo dados na tabela Notas
INSERT INTO Notas (id_matricula, n1, n2, n3, n4)
VALUES
    (1, 85, 90, 78, 92),
    (2, 70, 88, 95, 81),
    (3, 92, 75, 89, 87),
    (4, 80, 85, 92, 88),
    (5, 78, 93, 87, 75),
    (6, 88, 82, 90, 79),
    (7, 85, 89, 91, 84),
    (8, 93, 78, 85, 88),
    (9, 80, 92, 86, 91),
    (10, 87, 85, 94, 80);
