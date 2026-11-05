
-- CRIANDO O DATABSE STREAMING
CREATE DATABASE streaming;

-- CRIANDO A TABELA PLANOS
CREATE TABLE planos (
    id_plano SERIAL PRIMARY KEY NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0) -- Regra CHECK: valor do plano não pode ser negativo
);

-- CRIANDO A TABELA GENEROS
CREATE TABLE generos (
    id_genero SERIAL PRIMARY KEY NOT NULL,
    nome_genero VARCHAR(40) NOT NULL UNIQUE -- Regra UNIQUE: nomes de gêneros não se repetem
);


-- CRIANDO A DIRETORES
CREATE TABLE diretores (
    id_diretor SERIAL PRIMARY KEY NOT NULL,
    nome_diretor VARCHAR(60) NOT NULL
);

-- CRIANDO A TABELA USUARIOS
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY NOT NULL,
    email_user VARCHAR(100) NOT NULL UNIQUE, -- Regra UNIQUE: não permite e-mails duplicados
    id_plano INTEGER NOT NULL,
    CONSTRAINT fk_usuarios_planos 
		FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
);


-- CRIANDO A TABELA FILMES
CREATE TABLE filmes (
    id_filme SERIAL PRIMARY KEY NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    ano INTEGER NOT NULL CHECK (ano >= 1888), -- Regra CHECK: ano válido para filmes
    id_genero INTEGER NOT NULL,
    id_diretor INTEGER NOT NULL,
    CONSTRAINT fk_filmes_generos 
		FOREIGN KEY (id_genero) REFERENCES generos(id_genero),
    CONSTRAINT fk_filmes_diretores 
		FOREIGN KEY (id_diretor) REFERENCES diretores(id_diretor)
);

-- CRIANDO A TABELA ASSISTIDOS
CREATE TABLE assistidos (
    id_usuario INTEGER NOT NULL,
    id_filme INTEGER NOT NULL,
    CONSTRAINT pk_assistidos
		PRIMARY KEY (id_usuario, id_filme), -- Chave Primária Composta
    CONSTRAINT fk_assistidos_usuarios 
		FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_assistidos_filmes 
		FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
);
