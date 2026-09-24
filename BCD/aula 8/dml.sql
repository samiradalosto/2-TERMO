-- BANCO DE DADOS - SMARTCOFFE - DML

create database if not exists smartcoffee_dml_Samira;
create database if not exists smartecoffee_dml_Samira;
use smartecoffee_dml_Samira;

CREATE TABLE cliente(
    id_cliente INT primary key auto_increment,
    nome varchar(100) not null,
    email varchar(120) unique,
    telefone varchar(15),
    cidade varchar(60) not null,
    ativo boolean not null default true
);

CREATE TABLE categoria (
    id_categoria int primary key auto_increment,
    nome varchar(60) not null unique
);

CREATE TABLE produto(
    id_produto int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    ativo boolean not null default true,
    id_categoria int not null,
    constraint fk_produto_categoria Foreign Key (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido int primary key AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status enum('aberto', 'preparando', 'Finalizado', 'cancelado') not null,
    valor_total decimal(10,2) not null default 0.00,
    id_cliente int not null,
    constraint fk_pedido_cliente Foreign Key (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item int PRIMARY KEY AUTO_INCREMENT,
    id_pedido int not null,
    id_produto int not null,
    quantidade int not NULL,
    preco_unitario DECIMAL(10,2) not null,
    observacao varchar(150),
    constraint fk_item_pedido Foreign Key (id_pedido) REFERENCES pedido (id_pedido),
    constraint fk_item_produto Foreign Key (id_produto) REFERENCES produto (id_produto)
);

CREATE TABLE pagamento (
    id_pagamento int PRIMARY key AUTO_INCREMENT,
    id_pedido int not null,
    id_forma_pagamento int not null,
    valor decimal(10,2) not null,
    data_pagamento DATETIME,
    constraint fk_pagamento_pedido Foreign Key (id_pedido) REFERENCES pedido (id_pedido),
    constraint fk_pagamento_forma_pagamento Foreign Key (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
);

 -- Inserindo dados no bd
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Luis Felipe', 'luis@email.com', '19999999901', 'Limeira', TRUE),
('Maria Eduarda', 'maria@email.com', '19999999902', 'Limeira', TRUE),
('Mateus Silva', 'mateus@email.com', '19999999903', 'Limeira', TRUE),
('Matheus Oricolli', 'matheusc@email.com', '19999999904', 'Limeira', TRUE),
('Nicolas Filipe', 'nicolas@email.com', '19999999906', 'Limeira', TRUE),
('Otavio Correia', 'otavio@email.com', '19999999905', 'Conchal', TRUE),
('Pedro Miranda', 'pedro@email.com', '19999999907', 'Limeira', TRUE),
('Rafael Viera', 'rafael@email.com', '19999999908', 'Limeira', TRUE),
('Rebecca', 'rebecca@email.com', NULL, 'Limeira', TRUE),
('Rennan Campos', 'rennan@email.com', '19999999909', 'Limeira', TRUE),
('Rennan ', 'rafael@email.com', '19999999908', 'Limeira', TRUE),
('Samira Emily Dalosto','samira@email.com',NULL,'Ourinhos',FALSE),
('Sophia Carolina','sophia@email.com','19999999911','Tauba'),
('Stefany Santana', 'stefany@gmail.com', NULL, 'Campinas', FALSE),
('Vanessa Queiroz','vanessa@email.com','19999999912','Limeira',TRUE),
('Vinicius Henrique','vinicius@email.com','19999999913','Limeira',TRUE),
('Vinicius Oliveira','viniciuso@email.com','19999999914','Chicago',TRUE);

SELECT * FROM cliente;

INSERT INTO categoria (nome) VALUES
('Café'), ('Bebidads Quentes'), ('Bebidas geladas'), ('Doces'),('Salgados'),
('Combo');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Coado', 4.50, TRUE, 1),
('Chocolate Quente', 8.50, TRUE, 2),
('Suco de Laranja', 7.50, TRUE, 3),
('Suco de morango', 6.50, TRUE, 3)
('Brigadeiro', 4.00, TRUE, 2),
('Coxinha de frango', 8.50, TRUE, 4)
('Pão de Queijo', 5.00, TRUE, 5);

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'aberto', 0.00, 1),
('2026-10-02 08:30:00', 'Finalizado', 0.00, 1),
(NOW(), 'aberto', 0.00, 1),
('2026-10-02 09:15:00', 'preparando', 0.00, 2),
('2026-10-02 10:00:00', 'cancelado', 0.00, 3);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1, 1, 1, 4.50, 'Sem açúcar'),
(1, 7, 1, 5.00, 'Bem quentinho'),
(2, 2, 1, 8.50, NULL),
(3, 3, 2, 7.50, 'Com bastante gelo'),
(4, 4, 1, 6.50, 'Sem açúcar');

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(1, 3, 13.00, '2024-05-10 08:32:10'),
(2, 2, 8.50, '2024-05-10 09:16:05'),
(3, 1, 15.00, '2024-05-10 10:01:40'),
(4, 3, 6.50, '2024-05-10 10:31:00');

