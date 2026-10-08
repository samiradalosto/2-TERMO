-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
Nome_cliente Vachar(50) not null,
id_cliente int auto_increment PRIMARY KEY
)

CREATE TABLE Pedido (
id_pedido int auto_increment primary key PRIMARY KEY,
id_cliente int auto_increment,
Data_pedido datetime not null,
FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
)

CREATE TABLE ESTOQUE(
Id _Estoque Int Auto_Increment Primary Key,
id_Produto Int Not Null Unique,
Qauntidade Int Not Null
Fpreign Key (Id_Produto) References Produto (Id_Produto) 
);
