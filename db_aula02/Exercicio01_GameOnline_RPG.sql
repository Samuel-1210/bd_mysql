drop database db_generation_game_online;

CREATE DATABASE db_generation_game_online;
 
USE db_generation_game_online;

create table tb_classes(
id bigint AUTO_INCREMENT,
classe varchar(30) not null,
despertar enum('Ativo','Inativo') default 'Inativo',
arma_duas_maos varchar(25) default 'Não Usa',
arma_mao_unica_1 varchar(25) default 'Não Usa',
arma_mao_unica_2 varchar(25) default 'Não Usa',
espacoArmaSecundaria varchar(25) default 'Não Usa',
PRIMARY KEY (id)
);
 
 
CREATE TABLE tb_personagens(
id bigint AUTO_INCREMENT,
nickname varchar(255) not null,
vip enum('Ativo','Inativo') default 'Inativo',
poder_ataque int not null,
poder_defesa int not null,
guilda varchar(255) default 'iniciante',
nivel int not null,
classe_id bigint not null,
PRIMARY KEY (id),
FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (classe, despertar, arma_duas_maos, arma_mao_unica_1, arma_mao_unica_2, espacoArmaSecundaria)
VALUES 
('Paladino', 'Ativo', 'Martelo', 'Não Usa', 'Não Usa', 'Livro Sagrado'),
('Mago', 'Inativo', 'Cajado', 'Não Usa', 'Não Usa', 'Orbe Arcano'),
('Guerreiro', 'Inativo', 'Espada', 'Não Usa', 'Não Usa', 'Totem de Resistência'),
('Arqueiro', 'Inativo', 'Não Usa', 'Arco', 'Não Usa', 'Aljava de Flechas'),
('Assassino', 'Inativo', 'Não Usa', 'Adaga', 'Adaga', 'Sigilo Sombrio');

INSERT INTO tb_personagens (nickname, vip, poder_ataque, poder_defesa, guilda, nivel, classe_id)
VALUES 
('LuzSagrada', 'Ativo', 2500, 1500, 'Cavaleiros da Luz', 50, 1), -- Paladino
('ChamaEterna', 'Inativo', 2200, 800, 'Magos Elementais', 45, 2), -- Mago
('EspadaFerrea', 'Ativo', 1800, 1800, 'Guardiões de Ferro', 40, 3), -- Guerreiro
('SombraNoturna', 'Inativo', 3000, 600, 'Guilda Oculta', 55, 5), -- Assassino
('FlechaVeloz', 'Ativo', 2000, 1200, 'Arqueiros Reais', 48, 4), -- Arqueiro
('MarteloDivino', 'Inativo', 1000, 2000, 'Cavaleiros da Luz', 35, 1), -- Paladino
('EscudoImortal', 'Ativo', 1200, 1500, 'Guardiões de Ferro', 30, 3), -- Guerreiro
('SoproArcano', 'Inativo', 2500, 1000, 'Magos Elementais', 42, 2); -- Mago

select * from tb_classes;

select * from tb_personagens;

-- todes os personagens cujo poder de ataque seja maior do que 2000.

SELECT * 
FROM tb_personagens 
WHERE poder_ataque > 2000;

-- todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.

SELECT * 
FROM tb_personagens 
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- todes os personagens que possuam a letra C no atributo nome.

SELECT * 
FROM tb_personagens 
WHERE nickname LIKE '%C%';

-- unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

select * from tb_personagens inner join tb_classes
on tb_personagens.classe_id = tb_classes.id;

-- unindo os dados da tabela tb_personagens com os dados da tabela tb_classes,
-- onde traga apenas os personagens que pertençam a uma classe específica

select * from tb_personagens inner join tb_classes
on tb_personagens.classe_id = tb_classes.id
where classe ='Paladino'

SELECT 
    tb_personagens.id AS personagem_id,
    tb_personagens.nickname,
    tb_personagens.vip,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa,
    tb_personagens.guilda,
    tb_personagens.nivel,
    tb_classes.classe,
    tb_classes.despertar,
    tb_classes.arma_duas_maos,
    tb_classes.arma_mao_unica_1,
    tb_classes.arma_mao_unica_2,
    tb_classes.espacoArmaSecundaria
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.classe = 'Paladino';



