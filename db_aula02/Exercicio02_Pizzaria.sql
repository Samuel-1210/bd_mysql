drop database db_pizzaria_legal;

CREATE DATABASE db_pizzaria_legal;
 
USE db_pizzaria_legal;


CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
tamanho enum('Grande','Media','Broto') not null,
descricao varchar(50) not null,
PRIMARY KEY (id)
);

create table tb_pizza (
id bigint AUTO_INCREMENT,
bordaRecheada enum('Sim','Não') default 'Não', 
valor decimal (5,2) not null,
acompanha_refrigerante enum('Sim','Não') default 'Não',
categoria_id bigint not null,
tempo_preparo int not null,
sabor varchar(30) not null,
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);
 
 
INSERT INTO tb_categoria (tamanho, descricao) VALUES
('Grande', 'Pizza grande com até 8 pedaços'),
('Media', 'Pizza média com até 6 pedaços'),
('Broto', 'Pizza pequena ideal para uma pessoa'),
('Grande', 'Pizza grande de sabores especiais'),
('Media', 'Pizza média com massa fina e recheio extra');


INSERT INTO tb_pizza (bordaRecheada, valor, acompanha_refrigerante, categoria_id, tempo_preparo, sabor) VALUES
('Sim', 45.00, 'Sim', 1, 30, 'Calabresa'),
('Não', 35.00, 'Não', 2, 25, 'Mussarela'),
('Sim', 25.00, 'Sim', 3, 20, 'Portuguesa'),
('Não', 50.00, 'Não', 4, 35, 'Frango com Catupiry'),
('Sim', 40.00, 'Sim', 5, 28, 'Marguerita'),
('Não', 48.00, 'Sim', 1, 32, 'Quatro Queijos'),
('Sim', 38.00, 'Não', 2, 24, 'Napolitana'),
('Não', 30.00, 'Não', 3, 18, 'Peito de Peru');

-- pizzas cujo valor seja maior do que R$ 45,00.

SELECT * 
FROM tb_pizza 
WHERE valor > 45.00;

-- pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.

SELECT * 
FROM tb_pizza 
WHERE valor BETWEEN 50.00 AND 100.00;


-- buscando todas as pizzas que possuam a letra M no atributo nome.

SELECT * 
FROM tb_pizza 
WHERE sabor LIKE '%M%';

-- unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.

SELECT tb_pizza.id AS pizza_id, tb_pizza.sabor AS pizza_sabor, tb_pizza.bordaRecheada, tb_pizza.valor, tb_pizza.acompanha_refrigerante, tb_pizza.tempo_preparo, tb_categoria.tamanho, tb_categoria.descricao 
FROM tb_pizza 
INNER JOIN tb_categoria 
ON tb_pizza.categoria_id = tb_categoria.id;


-- onde traga apenas as pizzas que pertençam a uma categoria específica
SELECT tb_pizza.id AS pizza_id, tb_pizza.sabor AS pizza_sabor, tb_pizza.bordaRecheada, tb_pizza.valor, tb_pizza.acompanha_refrigerante, tb_pizza.tempo_preparo, tb_categoria.tamanho, tb_categoria.descricao 
FROM tb_pizza 
INNER JOIN tb_categoria
ON tb_pizza.categoria_id = tb_categoria.id
WHERE tb_categoria.tamanho = 'Grande';

