create database db_escola;

use db_escola;

create table estudantes(
    id bigint auto_increment primary key,
    cpf varchar(14) not null unique,
	nomeAluno varchar(255) not null,
    anoSerie varchar(255) not null,
    dataNasc date not null,
    nota decimal(3,1) not null,
    turno varchar(10)not null
);

INSERT INTO estudantes (cpf, nomeAluno, anoSerie, dataNasc, nota, turno)
VALUES
('123.456.789-00', 'João Silva', '3º Ano do Ensino Médio', '2005-02-15', 8.5, 'Tarde'),
('987.654.321-00', 'Maria Oliveira', '1º Ano do Ensino Médio', '2006-05-20', 9.2, 'Manhã'),
('456.789.123-00', 'Carlos Souza', '2º Ano do Ensino Médio', '2005-10-30', 7.8, 'Noite'),
('789.123.456-00', 'Ana Costa', '3º Ano do Ensino Médio', '2005-07-14', 9.0, 'Tarde'),
('321.654.987-00', 'Lucas Almeida', '2º Ano do Ensino Médio', '2006-03-22', 6.2, 'Manhã'),
('654.987.321-00', 'Juliana Santos', '1º Ano do Ensino Médio', '2007-08-10', 5.8, 'Noite'),
('213.546.879-00', 'Rafael Pereira', '3º Ano do Ensino Médio', '2005-11-05', 4.9, 'Manhã'),
('876.543.210-00', 'Fernanda Lima', '2º Ano do Ensino Médio', '2006-01-13', 6.5, 'Tarde');

select * from estudantes where nota > 7.0;

select * from estudantes where nota < 7.0;

update estudantes set turno = 'Manhã' where id in(1,3);

select * from estudantes
