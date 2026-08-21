-- COMANDOS PARA CRIA BD
CREATE DATABASE academia_samira2;

-- VERIFICAR BD E CRIAR  
Create database if not exists academia_samira2;

-- ATIVAR O BD
USE academia_samira2;

-- TABELAS 
CREATE TABLE IF NOT EXISTS RECEPCAO(
id_recepisionista int auto_increment primary key,
nome varchar(60) not null,
CPF VARCHAR (14) not null unique, 
telefne varchar(15),
turno enum ('noite', 'tarde', 'manhã') default 'noite',
data_admissão timestamp default current_timestamp 
);

Create table if not exists equipamentos(
id_equipamentos int primary key,
nome_equipamentos varchar(60) not null,
categorias enum('superiores', 'inferiores'),
modelos varchar(60) not null,
staus_equipamentos enum ('ativo', 'inativo') default 'ativo',
registros_de_equipamentos varchar(60) not null
);

-- visualizar tabelas
show tables;

 -- apagar bd 
 drop database academia_samira;
 
 -- apagar tabelas  
 drop tables cadastro;
 
 -- inserir Campos 
 alter table recepcao add email varchar(100);
 
 -- campos paraa execultar caso tenha esquecido algo nas tabelas 
 -- inserir campos 
 alter table recepcao add email varchar(100);
 
 -- alterar tipo de dados
 alter table recepcao modify telefone int;
 
 -- renomear tabelas 
 rename table alunos to recepcao;

-- apagar dadosed uma tabela
truncate table alunos;

-- inserido dados na tabela 
insert into equipamentos (id_equipamentos, nome_equipamentos, categorias, modelos, staus_equipamentos, registros_de_equipamentos) 
values (2, 'supino', 'superiores', 'novo', 'ativo', 'confere'), (3, 'elevação pelvica', 'inferiores','novo','ativo','confere');

-- consultar dados e, um tabela 
select * from equipamentos;

CREATE TABLE IF NOT EXISTS instrutor(
id_instrutor int auto_increment primary key,
nome_do_instrutor varchar(60) not null,
CPF VARCHAR (9) not null unique, 
cref enum ('sim', 'naõ') default 'sim',
especialidade varchar (15) not null
);

insert into instrutor (id_instrutor, nome_do_instrutor,CPF, cref, especialidade ) 
values(default,'samira', '203040405', 'sim', 'musculação'), (default,'otavio', '394958773', 'sim', 'fit-dance'), 
(default,'matheus', '35447585', 'sim', 'crosft'), 
(default, 'nicolas', '234566678', 'sim', 'crosft'), (default,'Duda', '257538923', 'sim', 'fit-dance'), 
(default, 'vinicius', '123526789', 'sim','musculação');

-- consultar dados e, um tabela 
select * from instrutor;

-- apagar tabelas  
 drop tables instrutor;

-- apagar dados 
truncate table instrutor;