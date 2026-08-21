-- PROJETO Sistema SmartCoffee

CREATE DATABASE SmartCoffee;

Create database if not exists SmartCoffee;

-- TABELAS
CREATE TABLE IF NOT EXISTS clientes(
id_cliente int auto_increment primary key,
nome varchar (50) not null,
cpf VARCHAR (9) not null unique, 
telefone varchar(60)
);

CREATE TABLE IF NOT EXISTS produtos(
id_produtos int auto_increment primary key,
nome varchar (50) not null,
preco varchar (50) not null,
descrição enum ('cntém', 'não contém') default 'não contém',
staus_do_produto enum ('sim', 'não') default 'sim'
);

CREATE TABLE IF NOT EXISTS funcionarios(
id_funcionarios  int auto_increment primary key,
nome varchar (50) not null,
cpf varchar (9) not null unique,
cargo varchar (50) not null,
 salario varchar (50) not null
); 

create table if not exists pedidos(
id_pedidos int auto_increment primary key,
valor_do_pedido varchar (50) not null,
data_do_pedido varchar (50) not null
)



