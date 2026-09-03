-- Oficina Samira Dalosto --
create database Oficina_Samira_Dalosto;
create database if not exists Oficina_Samira_Dalosto;
USE Oficina_Samira_Dalosto;

-- TABELAS --

CREATE TABLE IF NOT EXISTS Clientes(
id_clientes int auto_increment primary key,
nome varchar(60) not null,
CPF varchar (14) not null unique, 
telefone varchar(15),
data_de_nacimnento timestamp default current_timestamp,
Email varchar(12) not null unique
);

CREATE TABLE IF NOT EXISTS Modelos(
id_modelos int auto_increment primary key,
nome varchar (60) not null,
Fabricacao varchar(20) not null, 
Categoria varchar(60) not null, 
Documentcao varchar(60) not null, 
Garantia varchar(60) not null 
);

CREATE TABLE IF NOT EXISTS Pecas(
id_pecas int auto_increment primary key,
nome varchar(60) not null,
Documentacao varchar(60) not null,
Pecas_status enum ('usavel', 'nao usavel') default 'usavel',
Categoria varchar(60)  not null, 
Quantidade int not null
);

CREATE TABLE IF NOT EXISTS Fornecedores(
id_fornecedores int auto_increment primary key,
nome varchar (60) not null, 
Telefone varchar (15),
Produto varchar(60) not null,
Pedidos varchar(60) not null, 
Preco varchar(60) not null
);

CREATE TABLE IF NOT EXISTS Viculos(
id_veiculos int auto_increment primary key,
nome varchar (60) not null, 
Ano_do_veiculo year not null,
Tipo varchar(60) not null, 
Motor varchar(60) not null, 
Placa varchar(60) not null 
);

CREATE TABLE IF NOT EXISTS Funcionarios(
id_funcionarios int auto_increment primary key, 
Email varchar(12) not null unique,
CPF varchar (14) not  null unique, 
Telefne varchar(15), 
Cargo varchar (60),
Salario varchar (60)
);

CREATE TABLE IF NOT EXISTS Ordem_de_servicos(
id_Ordem_de_servicos int auto_increment primary key,
Setor varchar(60),
Preco int,
nome varchar(60), 
Descrição varchar(60) not null,
Registro varchar (60) not null 
);

CREATE TABLE IF NOT EXISTS Marcas(
id_marcas int auto_increment primary key,
Estilos varchar(60),
Telefone varchar(15),
Rede_socias varchar(25) not null,
nome varchar(60) not null,
Email varchar(60)
);

CREATE TABLE IF NOT EXISTS Servicos(
id_servicos int auto_increment primary key,
Data_de_cadastro Varchar(60) not null,
nome varchar(60) not null, 
Telefone varchar(15),
Email varchar(60),
CPF varchar(16) not null unique
);

CREATE TABLE IF NOT EXISTS Pagamentos(
id_Pagamentos int auto_increment primary key,
Valor varchar(60) not null,
Data_da_compra timestamp default current_timestamp,
Descricao varchar(90) not null, 
Forma_de_pagamento enum ('Pix', 'Cartao', 'Dinheiro') default 'Pix',
Observacao varchar(90)
)


