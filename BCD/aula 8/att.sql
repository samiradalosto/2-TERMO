-- 1. Cadastre dois novos clientes
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Samira Dalosto', 'samira@email.com', '19988887766', 'Limeira', TRUE),
('Otavio Correia', 'Otavio@email.com', '19977776655', 'Limeira', TRUE);

-- 2. Cadastre uma nova categoria chamada Especiais da Casa
INSERT INTO categoria (nome) VALUES 
('Especiais da Casa');

-- 3. Cadastre três produtos na nova categoria (assumindo id_categoria = LAST_INSERT_ID())
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Frappuccino Especial', 18.50, TRUE, LAST_INSERT_ID()),
('Torta de Maçã Artesanal', 14.00, TRUE, LAST_INSERT_ID()),
('Toast de Abacate com Ovo', 16.00, TRUE, LAST_INSERT_ID());

-- 4. Insira um cliente sem telefone e observe o uso de NULL
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Mariana Lima', 'mariana@email.com', NULL, 'Limeira', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'aberto', 0.00, 1);

-- 6. Use LAST_INSERT_ID() para inserir pelo menos dois itens no pedido
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(LAST_INSERT_ID(), 1, 1, 4.50, 'Sem açúcar'),
(LAST_INSERT_ID(), 7, 2, 5.00, 'Bem quentinho');