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
    data_empretimo DATETIME DEFAULT current_timestamp,
    data_devolucao date,
    status_emprestimo vachar(20) default 'Aberto',
    constraint fk_item_pedido Foreign Key (id_usuario) REFERENCES pedido (id_livro),
)

id_usuario int, FOREIGN key (id_usario) REFERENCES Usuairio (id_usuario)

id_livro int, Foreign Key (id_livro) REFERENCES Usuario(id_livro)

insert into cliente (nome, email, telefone, cidade, ativo) VALUES 
('Safira campos','safira@email.com','19999999911','Tauba', TRUE),
('Oliva dos Santos', 'olivia@gmail.com', '19999999911', 'Campinas', TRUE),
('karen tokioy','karen@email.com','19999999912','Limeira',TRUE),
('Daniel Oliveira','daniel@email.com','19999999914','Chicago',TRUE);

INSERT INTO livro (Titulo, autor, isbn, Ano_publicado, editora, quantidade_disponivel) VALUES
('Dom Casumorro', 'Machado de Assis' '978-8594318602' '2020 / 1899' 'Principis' 'duas unidades'),
('Memórias  Póstmas de Brá Cubas', 'Machado de Assis' ''978-8582850015 '2014 / 1881' 'duas unidades'),
('Vidas Secas', 'Guimarão Rosa' '978-8501114785' '2020 / 1938' 'Editora Record' 'duas unidades'),
('Grande Sertão:', 'João Guimarães Rosas' '978-8535931983' '2019 / 1956' 'Companhia das Letras' 'duas unidades');

SELECT * FROM Cliente;

INSERT INTO pedido (data_emprestimo, status,) VALUES
(NOW(), 'aberto', 0.00, 1),
('2026-10-02 08:30:00', 'Finalizado', 0.00, 1),
(NOW(), 'aberto', 0.00, 1),
('2026-10-02 09:15:00', 'preparando', 0.00, 2),
('2026-10-02 10:00:00', 'cancelado', 0.00, 3);





