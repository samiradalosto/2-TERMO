-- COMANDO PARA CRIAR BANCO DE DADOS 
create database academia_samira;
create database academia_samira2;

-- COMANDO PARA APAGAR BANCOO DE DADOS 
DROP database acadamia_samira;

-- COMANDO PAAR ATIVAR O BANCO DE DADOS 
  USE academia_samira;
  
  -- COMANDO PARA CRIAR TABELAS
  create table Aluno(
  id_aluno int auto_increment primary key,
  nome varchar(60) not null,
  CPF varchar(14) not null unique,
  telefone varchar(60),
  data_de_nascimento date,
  data_de_cadastro timestamp default current_timestamp,
  dia_de_ir varchar(20)
  );

create table Equipametos(
 id_equipamentos int auto_increment primary key,
 nome_equipamentos varchar(60),
 Categoria varchar(20),
 registro_de_equipamento varchar(60),
 modelo varchar (60),
 status varchar(20)
 );
 
 create table Plano (
 id_plano int auto_increment primary key,
 valor varchar(20),
 data_do_pagamento varchar(50),
 tipo_de_plano varchar(50),
 turno varchar(60),
 forma_de_pagamento varchar(60)
 );
 
 create table recepcao(
 id_recepisionista int auto_increment primary key,
 CPF varchar(20),
 turno varchar(60),
 nome varchar(60) not null,
 cargo varchar(20) ,
 Data_admissao date
 );
 
 create table instrutor (
 id_instrutor int auto_increment primary key,
 nome varchar(60) not null,
 CPF varchar(14) not null unique,
 cref varchar (20),
 epecialidade varchar (60)
); 
 
 