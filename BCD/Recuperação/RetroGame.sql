-- Active: 1794486345815@@127.0.0.1@3308@retrogame_sami_recuperacao
create database if not exists retrogame_sami_recuperacao;

- --- 1. DROP DAS TABELAS (Evita o erro de tabela já existente) ---
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS plataforma;
DROP TABLE IF EXISTS jogos;
DROP TABLE IF EXISTS locacao;


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
-------------------------------------------
-- 0.3 - Plataforma
create table plataforma(
    id_plataforma int primary key auto_increment,
    nome varchar(80) not null unique
);
--------------------------------------
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
---------------------------------------------
create table locacao(
    id_locacao int auto_increment,
    titulo varchar(20) not null,
    data_devolucao date not null,
    status_locacao varchar(20) default'aberta'
);
--------------------------------
INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('BRUNO','BRUNO@EMAIL.COM','19988123148',TRUE),
('ANA CLARA','ANACLARA@EMAIL.COM','13145789784',TRUE),
('ANA CHICO','ANACHICO@EMAIL.COM',NULL,TRUE),
('BRUNA', 'BRUNA@EMAIL.COM', NULL,TRUE);
-- catergoria
-----------------------------------------------
UPDATE jogo
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ANO_PUBLICACAO >= 2020;

INSERT INTO CATEGORIA ('NOME') VALUES ('titulo'), ('codigo'),
('ano_lancamento'),
('The Legend of Zelda', '234512315678235', '2012-08-23'),
('Breath of the Wild', '5678997640098098', '2009-09-09'),
('Grand Theft Auto', '123445312123', '2022-10-04'),
('Super Mario World', '19093402785', '2026-02-14'),
('super mario', '123371437', '2008-06-06'),
('corridas super', '2934928848', '1999-04-09')

SELCET * FROM jogos;

--------------------------------------

DELETE FROM usuario
WHERE ID_USUARIO = 1;

----------------------------------------------
SELECT TITLUO, codigo, ano de lançamento FROM LIVRO;

-- 13
--------------------------------------------------------------
SELECT * FROM jogos
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL DESC;
---------------------------------------------------------
-- 14
select TITULO FROM jogos
WHERE TITULO LIKE '%HARRY%';

-------------------------------------------------------------
-- 15
select TITULO, ANO_PUBLICACAO FROM  jogos
WHERE ano_lancamento BETWEEN 2009 AND 2012;

-------------------------------------------------
SELECT 
    COUNT(*) AS total_jogos,
    SUM(quantidade_disponivel) AS soma_estoque,
    AVG(quantidade_disponivel) AS media_estoque,
    MIN(quantidade_disponivel) AS menor_estoque,
    MAX(quantidade_disponivel) AS maior_estoque
FROM jogos;
-----------------------------------------


--24. savepoint

UPDATE emprestimo 
SET status_emprestimo = 'DEVOLVIDO', data_devolucao = CURDATE() 
WHERE id_emprestimo = 1 AND status_emprestimo = 'ABERTO';

