-- CREATE DATABASE loja_online;

-- CRIANDO A TABELA CLIENTES
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(60) NOT NULL
);

-- CRIANDO A TABELA CATEGORIAS
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(40) NOT NULL UNIQUE
);

-- CRIANDO A TABELA PRODUTOS
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco > 0), 
    id_categoria INTEGER NOT NULL,
    CONSTRAINT fk_produtos_categorias 
		FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- CRIANDO A TABELA PEDIDOS
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
	data DATE NOT NULL,
    id_cliente INTEGER NOT NULL,
    CONSTRAINT fk_pedidos_clientes 
		FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- CRIANDO A TABELA ITEM_PEDIDO
CREATE TABLE item_pedido (
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0), -- Regra CHECK: quantidade comprada deve ser maior que 0
    PRIMARY KEY (id_pedido, id_produto), -- Chave Primária Composta
    CONSTRAINT fk_item_pedidos 
		FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT fk_item_produtos 
		FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);



-- POVOANDO A TABELA COM AJUDA DA IA

-- 1. POVOANDO A TABELA CLIENTES (20 registros)
INSERT INTO clientes (nome) VALUES
('Ana Clara Souza'),
('Bruno Henrique Silva'),
('Carla Mendes'),
('Diego Ramos'),
('Elena Rostova'),
('Fernando Prado'),
('Gabriela Duarte'),
('Heitor Macedo'),
('Isabela Freitas'),
('João Vinícius Castro'),
('Karen Moreira'),
('Lucas Evangelista'),
('Manuela Barbosa'),
('Nicolas Ferreira'),
('Olivia Palermo'),
('Paulo Roberto Aguiar'),
('Quésia Vasconcelos'),
('Renan Augusto'),
('Sofia Guimarães'),
('Tiago Fonseca');


-- 2. POVOANDO A TABELA CATEGORIAS (20 registros)
INSERT INTO categorias (nome) VALUES
('Eletrônicos'),
('Informática'),
('Smartphones'),
('Móveis'),
('Eletrodomésticos'),
('Vestuário Masculino'),
('Vestuário Feminino'),
('Calçados'),
('Livros'),
('Brinquedos'),
('Esporte e Lazer'),
('Beleza e Perfumaria'),
('Ferramentas'),
('Jardim e Varanda'),
('Automotivo'),
('Alimentos e Bebidas'),
('Papelaria'),
('Instrumentos Musicais'),
('Relógios e Acessórios'),
('Cama, Mesa e Banho');


-- 3. POVOANDO A TABELA PRODUTOS (20 registros)
-- Relaciona id_categoria com as 20 categorias criadas acima
INSERT INTO produtos (nome, preco, id_categoria) VALUES
('Smart TV 55" 4K', 2899.90, 1),
('Notebook Ryzen 7 16GB', 3499.00, 2),
('Smartphone 128GB', 1999.99, 3),
('Cadeira Ergonômica de Escritório', 850.50, 4),
('Geladeira Frost Free 400L', 3200.00, 5),
('Camiseta Algodão Premium', 79.90, 6),
('Vestido Floral de Verão', 129.90, 7),
('Tênis de Corrida', 299.90, 8),
('Livro: O Senhor dos Anéis', 89.90, 9),
('Jogo de Tabuleiro Catan', 249.00, 10),
('Bicicleta Aro 29 21 Marchas', 1190.00, 11),
('Perfume Importado 100ml', 450.00, 12),
('Furadeira e Parafusadeira 12V', 210.00, 13),
('Conjunto de Ferramentas de Jardinagem', 95.00, 14),
('Kit Óleo de Motor 5W30 Sintético', 180.00, 15),
('Café Gourmet Torrado 500g', 32.50, 16),
('Kit Canetas Gel 12 Cores', 24.90, 17),
('Violão Acústico de Aço', 520.00, 18),
('Relógio Cronógrafo Esportivo', 340.00, 19),
('Jogo de Cama Casal 4 Peças', 159.90, 20);


-- 4. POVOANDO A TABELA PEDIDOS (20 registros)
-- Relaciona id_cliente com os clientes de 1 a 20
INSERT INTO pedidos (data, id_cliente) VALUES
('2026-01-10', 1),
('2026-01-12', 2),
('2026-01-15', 3),
('2026-01-18', 4),
('2026-01-20', 5),
('2026-01-22', 6),
('2026-01-25', 7),
('2026-01-28', 8),
('2026-02-01', 9),
('2026-02-03', 10),
('2026-02-05', 11),
('2026-02-08', 12),
('2026-02-10', 13),
('2026-02-12', 14),
('2026-02-15', 15),
('2026-02-18', 16),
('2026-02-20', 17),
('2026-02-22', 18),
('2026-02-25', 19),
('2026-02-28', 20);


-- 5. POVOANDO A TABELA ITEM_PEDIDO (20 registros)
-- Chave composta (id_pedido, id_produto) garantindo combinação única
INSERT INTO item_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 2, 1),
(4, 5, 1),
(5, 9, 3),
(6, 6, 2),
(7, 8, 1),
(8, 12, 1),
(9, 4, 2),
(10, 10, 1),
(11, 11, 1),
(12, 7, 2),
(13, 13, 1),
(14, 16, 5),
(15, 18, 1),
(16, 17, 3),
(17, 19, 1),
(18, 15, 2),
(19, 20, 1),
(20, 14, 2);


SELECT *
FROM clientes