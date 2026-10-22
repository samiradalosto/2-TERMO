-- Active: 1788435985790@@127.0.0.1@3306@biblioteca_conecta_sami
Create DATABASE biblioteca_conecta_sami;

-- Fase1- ddl: criação e estrutura
create database if not exists biblioteca_conecta_sami;
USE biblioteca_conecta_sami;

CREATE TABLE cliente(
    id_cliente INT primary key auto_increment,
    nome varchar(100) not null,
    email varchar(120) unique,
    telefone varchar(20),
    ativo boolean not null default true
);

create Table livro(
    id_livro int PRIMARY key AUTO_INCREMENT,
    tilulo varchar(150) not null,
    autor varchar(120) not null,
    isbh varchar(13) not null UNIQUE,
    ano_publicacao int,
    quantidade_disponivel int default 0,
)

create table emprestimo(
    id_emprestimo int PRIMARY key AUTO_INCREMENT,
    data_empretimo DATETIME DEFAULT corrent_timestamp,
    data_devolucao date,
    status_emprestimo vachar(20) default 'Aberto',
    constraint fk_item_pedido Foreign Key (id_usuario) REFERENCES pedido (id_livro),
)

id_usuario int,
FOREIGN key 


