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

-- Consulta de Tabelas 
SELECT * FROM Cliente;
SELECT * FROM Pedido;

-- Inserindo dados na tabela 
INSERT INTO Cliente (NOME_CLIENTE) VALUES 
('Bruno'),
('Maria'),
('José');