
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Samira Dalosto', 'samira@email.com', '19988887766', 'Limeira', TRUE),
('Otavio Correia', 'Otavio@email.com', '19977776655', 'Limeira', TRUE);

INSERT INTO categoria (nome) VALUES 
('Especiais da Casa');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Frappuccino Especial', 18.50, TRUE, LAST_INSERT_ID()),
('Torta de Maçã Artesanal', 14.00, TRUE, LAST_INSERT_ID()),
('Toast de Abacate com Ovo', 16.00, TRUE, LAST_INSERT_ID());

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Mariana Lima', 'mariana@email.com', NULL, 'Limeira', TRUE);

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'aberto', 0.00, 1);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(LAST_INSERT_ID(), 1, 1, 4.50, 'Sem açúcar'),
(LAST_INSERT_ID(), 7, 2, 5.00, 'Bem quentinho');