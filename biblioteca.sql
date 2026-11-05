
-- criando database bilbioteca

--CREATE DATABASE bilbioteca;

-- novo comentario

-- criando a tabela de editoras
CREATE TABLE editoras (
	id_editora SERIAL PRIMARY KEY,
	nome_editora VARCHAR(50) NOT NULL UNIQUE

);

-- criando a tabela de autores
CREATE TABLE autores (
	id_autor SERIAL PRIMARY KEY,
	nome_autor VARCHAR(50) NOT NULL UNIQUE,
	cpf CHAR(11) NOT NULL 

);

-- Criando a tabela livros
CREATE TABLE livros(
	id_livro SERIAL,
	titulo VARCHAR(80),
	ano INTEGER,
	id_autor INTEGER NOT NULL,
	id_editora INTEGER NOT NULL,
		CONSTRAINT pk_livros
			PRIMARY KEY(id_livro),
		CONSTRAINT check_ano_livro
			CHECK(ano BETWEEN 1900 AND 2026),
		CONSTRAINT fk_editoras_livros
			FOREIGN KEY(id_editora) REFERENCES editoras(id_editora),
		CONSTRAINT fk_autores_livros
			FOREIGN KEY(id_autor) REFERENCES autores(id_autor)
);