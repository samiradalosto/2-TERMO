-- Active: 1788435985790@@127.0.0.1@3306@sesi_cr_tb
-- Active: 1788435985790@@127.0.0.1@3306@mysql
Create database SESI_CR_TB;

USE SESI_CR_TB;
 
Create table Cliente(
    ID_Cliente Int AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTE VARCHAR(60) NOT NULL
);

CREATE TABLE Pedido(
    ID_PEDIDO INT AUTO_INCREMENT PRIMARY KEY,
    DATA_PEDIDO DATETIME NOT NULL,
    ID_CLIENTE INT NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES Cliente(ID_Cliente)
);

Create table fornecedor (
    ID_Frornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Razâo_social VARCHAR(100) NOT NULL, 
);

CREATE table produtos(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    Id_Fornecedor INT NOT NULL,
    Foreign Key (Id_Fornecedor) REFERENCES fornecedor(ID_Frornecedor)
);

--Desafios 
-- 1- Questões 
--- Categoria --- possui --- Produtos
-- UMa categoria pode possuir vários produto.
--Cada produto pertence a uma categoria.
--- Resposta:
--- 1,n 1,1

-- 2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um
-- funcionário.
-- Respostada:
--1,n 1,1

-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser
-- comprado de vários fornecedores.
-- resposta:
-- 1,n 1,n

-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar
-- vinculada a uma mesa.
-- Resposta:
-- 0,n 1,1

-- 5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.
-- Resposta da 5
-- 1,n 1,1

-- Consulta de Tabelas 
SELECT * FROM Cliente;
SELECT * FROM Pedido;

-- Inserindo dados na tabela 
INSERT INTO Cliente (NOME_CLIENTE) VALUES 
('Bruno'),
('Maria'),
('José');
