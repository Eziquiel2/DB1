-- CREATE DATABASE escola_idiomas;

-- CRIANDO A TABELA PROFESSORES
CREATE TABLE professores (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    CONSTRAINT chk_cpf_tamanho CHECK (length(cpf) = 11) -- Regra CHECK: exatamente 11 dígitos no CPF
);

/*
ALTER TABLE professores 
ALTER COLUMN cpf SET NOT NULL;
*/

-- CRIANDO A TABELA DISCIPLINAS
CREATE TABLE disciplinas (
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE -- Regra UNIQUE: nome da disciplina não pode repetir
);

/*
ALTER TABLE disciplinas 
RENAME COLUMN nome TO nome_disciplina;

ALTER TABLE disciplinas
ALTER COLUMN id_disciplina SET NOT NULL;
*/

-- CRIANDO A TABELA TURMAS
CREATE TABLE turmas (
    id_turma SERIAL PRIMARY KEY,
    sala VARCHAR(20) NOT NULL,
    cpf_prof CHAR(11) NOT NULL,
    id_disciplina INT NOT NULL,
    CONSTRAINT fk_turmas_professores FOREIGN KEY (cpf_prof) REFERENCES professores(cpf),
    CONSTRAINT fk_turmas_disciplinas FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

/*
ALTER TABLE turmas
ALTER COLUMN id_turma SET NOT NULL;
*/

-- CRIANDO A TABELA ALUNOS
CREATE TABLE alunos (
    matricula SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    id_turma INT NOT NULL,
    CONSTRAINT fk_alunos_turmas FOREIGN KEY (id_turma) REFERENCES turmas(id_turma)
);

/*
ALTER TABLE alunos
ALTER COLUMN matricula SET NOT NULL;
*/


-- povoando as tabelas com auxilio de IA.

-- 1. POVOANDO A TABELA PROFESSORES (20 registros)
INSERT INTO professores (cpf, nome) VALUES
('11111111101', 'Carlos Eduardo Silva'),
('11111111102', 'Maria Fernanda Oliveira'),
('11111111103', 'João Pedro Santos'),
('11111111104', 'Ana Luíza Costa'),
('11111111105', 'Lucas Rodrigues'),
('11111111106', 'Beatriz Almeida'),
('11111111107', 'Gabriel Martins'),
('11111111108', 'Mariana Pereira'),
('11111111109', 'Rafael Barbieri'),
('11111111110', 'Camila Rocha'),
('11111111111', 'Thiago Lima'),
('11111111112', 'Juliana Fernandes'),
('11111111113', 'Rodrigo Carvalho'),
('11111111114', 'Larissa Ribeiro'),
('11111111115', 'Felipe Gomes'),
('11111111116', 'Amanda Martins'),
('11111111117', 'Gustavo Henrique'),
('11111111118', 'Vanessa Mendes'),
('11111111119', 'Leonardo Castro'),
('11111111120', 'Patricia Souza');


-- 2. POVOANDO A TABELA DISCIPLINAS (20 registros)
INSERT INTO disciplinas (nome_disciplina) VALUES
('Inglês Básico'),
('Inglês Intermediário'),
('Inglês Avançado'),
('Inglês Instrumental'),
('Espanhol Básico'),
('Espanhol Intermediário'),
('Espanhol Avançado'),
('Francês Básico'),
('Francês Intermediário'),
('Francês Avançado'),
('Alemão Básico'),
('Alemão Intermediário'),
('Alemão Avançado'),
('Italiano Básico'),
('Italiano Intermediário'),
('Italiano Avançado'),
('Japonês Básico'),
('Japonês Intermediário'),
('Mandarim Básico'),
('Mandarim Intermediário');


-- 3. POVOANDO A TABELA TURMAS (20 registros)
-- Observação: Relaciona com professores (cpf_prof) e disciplinas (id_disciplina de 1 a 20)
INSERT INTO turmas (sala, cpf_prof, id_disciplina) VALUES
('Sala 101', '11111111101', 1),
('Sala 102', '11111111102', 2),
('Sala 103', '11111111103', 3),
('Sala 104', '11111111104', 4),
('Sala 105', '11111111105', 5),
('Sala 106', '11111111106', 6),
('Sala 107', '11111111107', 7),
('Sala 108', '11111111108', 8),
('Sala 109', '11111111109', 9),
('Sala 110', '11111111110', 10),
('Sala 201', '11111111111', 11),
('Sala 202', '11111111112', 12),
('Sala 203', '11111111113', 13),
('Sala 204', '11111111114', 14),
('Sala 205', '11111111115', 15),
('Sala 206', '11111111116', 16),
('Sala 207', '11111111117', 17),
('Sala 208', '11111111118', 18),
('Sala 209', '11111111119', 19),
('Sala 210', '11111111120', 20);


-- 4. POVOANDO A TABELA ALUNOS (20 registros)
-- Observação: Relaciona com turmas (id_turma de 1 a 20)
INSERT INTO alunos (nome, id_turma) VALUES
('Alexandre Pires', 1),
('Bruna Marquezine', 2),
('Caio Castro', 3),
('Daniela Mercury', 4),
('Eduardo Moscovis', 5),
('Flávia Alessandra', 6),
('Guilherme Arantes', 7),
('Heloísa Périssé', 8),
('Igor Rickli', 9),
('Isabela Garcia', 10),
('Jorge Ben', 11),
('Kelly Key', 12),
('Luan Santana', 13),
('Ludmilla Oliveira', 14),
('Mateus Solano', 15),
('Nathalia Dill', 16),
('Otávio Müller', 17),
('Paolla Oliveira', 18),
('Renato Russo', 19),
('Sabrina Sato', 20);


SELECT * 
FROM turmas