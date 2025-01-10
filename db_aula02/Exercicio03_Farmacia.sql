drop database db_farmacia_bem_estar;

CREATE DATABASE db_farmacia_bem_estar;
 
USE db_farmacia_bem_estar;

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
    categoria_id BIGINT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_em_estoque INT NOT NULL,
    validade DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamento', 'Produtos para tratamento de doenças e condições médicas'),
('Cosmético', 'Produtos para cuidados pessoais e estéticos'),
('Higiene', 'Produtos para higiene pessoal e doméstica'),
('Suplementos', 'Produtos nutricionais e vitamínicos'),
('Dermocosméticos', 'Produtos para cuidados com a pele com ação dermatológica');

INSERT INTO tb_produtos (nome, descricao, categoria_id, preco, quantidade_em_estoque, validade) VALUES
('Paracetamol 500mg', 'Alívio de dores e febre', 1, 10.50, 100, '2025-12-31'),
('Shampoo Anti-caspa', 'Shampoo para controle de caspa', 2, 25.00, 50, '2026-06-30'),
('Sabonete Líquido', 'Sabonete para uso diário', 3, 5.00, 200, NULL),
('Ibuprofeno 400mg', 'Anti-inflamatório e analgésico', 1, 15.30, 80, '2025-11-30'),
('Creatina Monohidratada', 'Suplemento para aumento de massa muscular', 4, 70.00, 60, '2026-05-15'),
('Protetor Solar FPS 30', 'Protetor solar para todos os tipos de pele', 5, 40.00, 150, '2025-08-01'),
('Bepantol Derma', 'Pomada para hidratação e cicatrização da pele', 5, 20.00, 120, '2026-02-20'),
('Cálcio + Vitamina D', 'Suplemento para ossos e dentes', 4, 30.00, 90, '2026-10-10');

SELECT * 
FROM tb_produtos 
WHERE preco > 50.00;

SELECT * 
FROM tb_produtos 
WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * 
FROM tb_produtos 
WHERE nome LIKE '%C%';


SELECT p.id, p.nome, p.descricao, p.preco, p.quantidade_em_estoque, p.validade, c.nome AS categoria 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.categoria_id = c.id;


SELECT p.id, p.nome, p.descricao, p.preco, p.quantidade_em_estoque, p.validade
FROM tb_produtos p
INNER JOIN tb_categorias c 
ON p.categoria_id = c.id
WHERE c.nome = 'Suplementos';




