-- Active: 1794486345815@@127.0.0.1@3308@biblioteca_senai_samira
-- Active: 1794486345815@@127.0.0.1@3308@mysql
--Criar tabelas - usuario, livro, emprestimo

create database if not exists biblioteca_senai_samira;

use biblioteca_senai_samira;

--Criação de tabelas 
create table usuario(
    id_usuairo int AUTO_INCREMENT,
    nome varchar(100) not null,
    email varchar(120) not null unique,
    Telefone varchar(20) not null,
    ativo boolean default true,
    constraint pk_usuario primary key(id_usuairo),
    constraint uq_email unique (email)
);

create table livro(
    id_livro int auto_increment,
    titulo varchar(100) not null,
);

