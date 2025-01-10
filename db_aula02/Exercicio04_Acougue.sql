 drop database if exists db_cidade_das_carnes;

CREATE DATABASE db_cidade_das_carnes;
 
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_em_estoque INT NOT NULL,
    validade DATE,
     categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Carnes Bovinas', 'Cortes de carne de boi, frescas e de alta qualidade'),
('Carnes Suínas', 'Variedade de cortes suínos, ideais para diferentes receitas'),
('Aves', 'Carnes de frango e outras aves, perfeitas para refeições leves'),
('Linguiças', 'Linguiças artesanais e tradicionais, temperadas e prontas para grelhar'),
('Carnes Exóticas', 'Cortes de carnes exóticas, como cordeiro e javali');

INSERT INTO tb_produtos (nome, descricao, categoria_id, preco, quantidade_em_estoque, validade) VALUES
('Picanha', 'Corte nobre bovino, ideal para churrascos', 1, 79.90, 50, '2025-01-31'),
('Alcatra', 'Corte macio e suculento, ideal para bifes', 1, 59.90, 30, '2025-02-15'),
('Costela Suína', 'Costela suína temperada, pronta para assar', 2, 29.90, 20, '2025-01-20'),
('Linguiça Toscana', 'Linguiça toscana artesanal, ideal para churrasco', 4, 22.90, 40, '2025-03-10'),
('Filé de Frango', 'Peito de frango sem osso e sem pele', 3, 19.90, 100, '2025-02-28'),
('Coxa de Frango', 'Coxas de frango frescas e suculentas', 3, 14.90, 80, '2025-01-25'),
('Paleta de Cordeiro', 'Corte especial de cordeiro, sabor marcante', 5, 99.90, 10, '2025-06-30'),
('Javali Picado', 'Carne de javali para preparo de ensopados', 5, 89.90, 15, '2025-04-15');

-- todos os produtos cujo valor seja maior do que R$ 50,00.

SELECT * 
FROM tb_produtos 
WHERE preco > 50.00;

-- todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.

SELECT * 
FROM tb_produtos 
WHERE preco BETWEEN 50.00 AND 150.00;

-- buscando todos os produtos que possuam a letra C no atributo nome.
SELECT * 
FROM tb_produtos 
WHERE nome LIKE '%C%';

-- unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT p.id, p.nome, p.descricao, p.preco, p.quantidade_em_estoque, p.validade, c.nome AS categoria 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.categoria_id = c.id;

-- unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, 
-- onde traga apenas os produtos que pertençam a uma categoria específica
SELECT p.id, p.nome, p.descricao, p.preco, p.quantidade_em_estoque, p.validade
FROM tb_produtos p
INNER JOIN tb_categorias c 
ON p.categoria_id = c.id
WHERE c.nome = 'Aves';





