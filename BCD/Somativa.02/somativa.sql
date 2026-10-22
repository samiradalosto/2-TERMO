-- Active: 1788435985790@@127.0.0.1@3306@biblioteca_conecta_sami
Create DATABASE biblioteca_conecta_sami;

-- Fase1- ddl: criação e estrutura
CREATE DATABASE IF NOT EXISTS biblioteca_som2;
USE biblioteca_som2;

-- Tabela USUARIO — 6 pts
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT DEFAULT 0,
    CONSTRAINT ck_livro_quantidade CHECK (quantidade_disponivel >= 0)
);

CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE RESTRICT,
    CONSTRAINT fk_emprestimo_livro FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE RESTRICT,
    CONSTRAINT ck_status_emprestimo CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO'))
);

ALTER TABLE livro ADD COLUMN editora VARCHAR(100);

INSERT INTO usuario (nome, email, telefone, ativo) VALUES 
('Safira Campos', 'safira@email.com', '19999999911', TRUE),
('Oliva dos Santos', 'olivia@gmail.com', '19999999912', TRUE),
('Karen Tokioy', 'karen@email.com', '19999999913', TRUE),
('Daniel Oliveira', 'daniel@email.com', NULL, TRUE);


INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
('Dom Casmurro', 'Machado de Assis', '9788594318602', 2020, 5, 'Principis'),
('Memórias Póstumas de Brás Cubas', 'Machado de Assis', '9788582850015', 2014, 3, 'Editora A'),
('Vidas Secas', 'Graciliano Ramos', '9788501114785', 2020, 4, 'Editora Record'),
('Grande Sertão: Veredas', 'João Guimarães Rosa', '9788535931983', 2019, 2, 'Companhia das Letras'),
('O Alquimista', 'Paulo Coelho', '9788575427583', 2017, 6, 'Sextante'),
('Ensaio sobre a Cegueira', 'José Saramago', '9788535902778', 2021, 1, 'Companhia das Letras');


INSERT INTO emprestimo (data_prevista, id_usuario, id_livro, status_emprestimo) VALUES
('2026-11-01', 1, 1, 'ABERTO'),
('2026-11-05', 2, 3, 'ABERTO'),
('2026-11-10', 3, 4, 'ABERTO');

-- 9. UPDATE
SELECT * FROM usuario WHERE id_usuario = 4;
UPDATE usuario SET telefone = '19988887777' WHERE id_usuario = 4;

-- 10. Atualização em lote 
UPDATE livro 
SET quantidade_disponivel = quantidade_disponivel + 2 
WHERE ano_publicacao >= 2020;

-- 11. DELETE e integridade 
-- Criação de um usuário sem empréstimos para teste
INSERT INTO usuario (nome, email, telefone, ativo) VALUES ('Teste Exclusao', 'teste@email.com', '19900000000', TRUE);

-- Exclusão bem-sucedida (Usuário sem empréstimo)
DELETE FROM usuario WHERE email = 'teste@email.com';

-- Tentativa não vai dar certo por que à restrição de chave estrangeira (FK)
-- DELETE FROM usuario WHERE id_usuario = 1; 
-- O comando falha pois o id_usuario esta associado na tabela 'emprestimo'. 
-- A Foreign Key (FK) configurada previne a exclusão de dados pais para garantir a integridade referencial do banco.

-- FASE 3 — DQL: CONSULTAS E ANÁLISE

-- 12. SELECT básico
SELECT titulo, autor, quantidade_disponivel FROM livro;

-- 13. WHERE + ORDER BY
SELECT * FROM livro 
WHERE quantidade_disponivel > 2 
ORDER BY quantidade_disponivel DESC;

-- 14. LIKE
SELECT * FROM livro 
WHERE titulo LIKE '%Memórias%';

-- 15. BETWEEN 
SELECT * FROM livro 
WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16. Funções agregadas
SELECT 
    COUNT(*) AS total_livros,
    SUM(quantidade_disponivel) AS soma_estoque,
    AVG(quantidade_disponivel) AS media_estoque,
    MIN(quantidade_disponivel) AS menor_estoque,
    MAX(quantidade_disponivel) AS maior_estoque
FROM livro;

-- 17. INNER JOIN
select  e.id_emprestimo, u.nome AS usuario,
l.titulo AS livro, e.data_emprestimo, e.status_emprestimo
FROM emprestimo e
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
INNER JOIN livro l ON e.id_livro = l.id_livro;

-- 18. JOIN + WHERE
SELECT e.id_emprestimo,
u.nome AS usuario,
l.titulo AS livro,
e.data_emprestimo,
e.status_emprestimo
FROM emprestimo e
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
INNER JOIN livro l ON e.id_livro = l.id_livro
WHERE e.status_emprestimo = 'ABERTO';

-- 19. GROUP BY — 4 pts
SELECT 
    u.nome AS usuario,
    COUNT(e.id_emprestimo) AS quantidade_emprestimos
FROM emprestimo e
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
GROUP BY u.id_usuario, u.nome
ORDER BY quantidade_emprestimos DESC

-- 20. LEFT JOIN — 4 pts
SELECT 
    u.nome AS usuario,
    COUNT(e.id_emprestimo) AS quantidade_emprestimos
FROM usuario u
LEFT JOIN emprestimo e ON u.id_usuario = e.id_usuario
GROUP BY u.id_usuario, u.nome;

-- Fase 4 tcl transações e integridade START TRANSACTION;
INSERT INTO emprestimo (data_prevista, id_usuario, id_livro, status_emprestimo) 
VALUES ('2026-11-15', 4, 2, 'ABERTO');

UPDATE livro 
SET quantidade_disponivel = quantidade_disponivel - 1 
WHERE id_livro = 2;

SELECT * FROM emprestimo;
SELECT * FROM livro WHERE id_livro = 2;
COMMIT;

START TRANSACTION;
UPDATE livro 
SET quantidade_disponivel = 99 
WHERE id_livro = 1;

SELECT id_livro, titulo, quantidade_disponivel FROM livro WHERE id_livro = 1;
ROLLBACK;

SELECT id_livro, titulo, quantidade_disponivel FROM livro WHERE id_livro = 1;

-- 23. SAVEPOINT — 4 pts
START TRANSACTION;
UPDATE livro SET quantidade_disponivel = quantidade_disponivel + 1 WHERE id_livro = 1;
SAVEPOINT sp_primeira_alteracao;

UPDATE livro SET quantidade_disponivel = quantidade_disponivel + 5 WHERE id_livro = 2;
ROLLBACK TO SAVEPOINT bs_primeira_alteracao;
COMMIT;

START TRANSACTION;
UPDATE emprestimo 
SET status_emprestimo = 'DEVOLVIDO', data_devolucao = CURDATE() 
WHERE id_emprestimo = 1 AND status_emprestimo = 'ABERTO';



