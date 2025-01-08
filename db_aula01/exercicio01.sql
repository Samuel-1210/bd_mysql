create database db_rh;
use db_rh;

-- criação da tabela, usando default null, se nada for passado o campo assumirá null

create table colaboradores(
    id bigint auto_increment primary key,
	cpf varchar(14) not null unique,
    nome varchar(255) not null,
    setor varchar(255) not null,
    cargo varchar(255) not null,
    salario decimal(8,2) not null,
    addNoturno decimal(8,2) default null,
    data_admissao TIMESTAMP default current_timestamp,
    proxFerias date default null
    
);
-- populando a tabela, não é necessário inserir o id.
INSERT INTO colaboradores (cpf, nome, setor, cargo, salario, addNoturno, data_admissao, proxFerias) 
VALUES
('123.222.123-32', 'João Silva', 'TI', 'Desenvolvedor', 4500.00, 500.00, '2023-05-10 09:00:00', '2024-05-10'),
('321.444.321-12', 'Maria Oliveira', 'Financeiro', 'Analista Financeiro', 5200.00, NULL, '2022-03-15 09:00:00', '2023-03-15'),
('123.111.123-23', 'Pedro Santos', 'RH', 'Coordenador de RH', 6000.00, 300.00, '2021-07-20 09:00:00', '2023-07-20'),
('000.555.321-12', 'Ana Paula', 'TI', 'Gerente de Projetos', 7500.00, NULL, '2020-11-25 09:00:00', '2023-11-25'),
('123.000.123-32', 'Clara Mendes', 'Marketing', 'Especialista em Mídias', 4300.00, NULL, '2023-02-01 09:00:00', '2024-02-01');

-- Exibirá todos que tiverem salário maior que 2000
select * from colaboradores where salario > 2000;

-- Exibirá todos que tiverem salário menor que 2000
select * from colaboradores where salario < 2000;

-- Adicionando o valor de Adicional Noturno
update colaboradores set addNoturno = 280 where id = 20;

-- Pesquisa que realize a soma do salário + adicional noturno.
-- usado o IFNULL, pois o adicional noturno não é obrigatório, então a soma é realizada com 
-- salário + 0
SELECT id,
    nome,
    setor,
    cargo,
    salario,
    addNoturno,
    (salario + IFNULL(addNoturno,0)) AS 'Salario + Adicional' 
FROM colaboradores;

