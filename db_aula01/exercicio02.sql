create database db_e_letronics;

use db_e_letronics;

create table eletronicGames(
    id bigint auto_increment primary key,
	nomeProduto varchar(255) not null unique,
    categoria varchar(255) not null,
    multiplayer tinyint(1) not null,
    valor decimal(8,2) not null,
    quantidadeEstoque int not null default 0,
    descricaoProduto varchar(255) not null
    
);

INSERT INTO eletronicGames (nomeProduto, categoria, multiplayer, valor, quantidadeEstoque, descricaoProduto)
VALUES
('The Legend of Zelda: Breath of the Wild', 'Aventura', 0, 299.99, 10, 'Explore um vasto mundo aberto cheio de segredos e desafios.'),
('FIFA 24', 'Esporte', 1, 199.99, 15, 'Jogo de futebol com modos multiplayer e gráficos incríveis.'),
('Elden Ring', 'RPG', 1, 249.99, 8, 'Aventure-se em um mundo sombrio criado por Hidetaka Miyazaki e George R. R. Martin.'),
('Call of Duty: Modern Warfare II', 'FPS', 1, 349.99, 5, 'Experiência intensa de combate com modos multiplayer e história envolvente.'),
('PlayStation 5', 'Console', 1, 4999.99, 3, 'Console de nova geração da Sony com gráficos incríveis e SSD ultra-rápido.'),
('Xbox Series X', 'Console', 1, 4499.99, 4, 'Console poderoso da Microsoft com suporte para 4K e alta taxa de quadros.'),
('Nintendo Switch', 'Console Híbrido', 1, 2999.99, 6, 'Console híbrido da Nintendo que combina portabilidade e jogabilidade doméstica.'),
('Steam Deck', 'Console Portátil', 1, 3499.99, 2, 'Console portátil da Valve com acesso à biblioteca Steam e excelente performance.');


-- Exibirá todos produtos que tiverem valor maior que 500
select * from eletronicGames where valor > 500;

-- Exibirá todos que tiverem valor menor que 500
select * from eletronicGames where valor < 500;

update eletronicGames set quantidadeEstoque = 12 where id in(1,2,3);

select * from eletronicGames