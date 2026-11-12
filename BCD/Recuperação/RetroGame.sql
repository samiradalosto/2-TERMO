-- Active: 1794486345815@@127.0.0.1@3308@retrogame_sami_recuperacao
create database if not exists retrogame_sami_recuperacao;


-- 0.2 usuaios
create table cliente (
    id_usuario int auto_increment,
    nome varchar(100)not null,
    email varchar(120) not null,
    telefone varchar(20) not null,
    ativo boolean default true,
    constraint pk_usuario primary key (id_usuario),
    constraint un_usuario_email unique (email)
);

-- 0.3 - Plataforma
create table plataforma(
    id_plataforma int primary key auto_increment,
    nome varchar(80) not null unique
);

-- 0.4 jogos
create table jogos (
    id_jogo int auto_increment,
    titulo varchar(150) not null,
    codigo varchar(15) not null unique,
    quantidade_disponivel int DEFAULT 0,
    check (quantidade_disponivel >=),
    ano_lancamento int not null,
    id_plataforma int not null,
    id_categoria int not null,
    constraint fk_cliente FOREIGN key (id_cliente) REFERENCES cliente(id_cliente),
    constraint fk_jogo Foreign Key (id_jogo) REFERENCES jogo(id_jogo)
);

create table locacao(
    id_locacao int auto_increment,
    titulo varchar(20) not null,
    data_devolucao date not null,
    status_locacao varchar(20) default'aberta'
);

INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('BRUNO','BRUNO@EMAIL.COM','19988123148',TRUE),
('ANA CLARA','ANACLARA@EMAIL.COM','13145789784',TRUE),
('ANA CHICO','ANACHICO@EMAIL.COM',NULL,TRUE),
('BRUNA', 'BRUNA@EMAIL.COM', NULL,TRUE);

-- catergoria

UPDATE jogo
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ANO_PUBLICACAO >= 2020;
INSERT INTO CATEGORIA ('NOME') VALUES ('titulo'), ('codigo'),
('ano_lancamento'),
('The Legend of Zelda', '234512315678235', '2012-08-23')
('Breath of the Wild', '5678997640098098', '2009-09-09')
('Grand Theft Auto', '123445312123', '2022-10-04')
('Super Mario World', '19093402785', '2026-02-14')

SELCET * FROM jogos;



