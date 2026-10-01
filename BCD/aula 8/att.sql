
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('samira Dalosto', 'samira2@email.com', '19988887766', 'Limeira', TRUE),
('otavio Correia', 'otavio2@email.com', '19977776655', 'Limeira', TRUE);

INSERT INTO categoria (nome) VALUES 
('Especiais da Casa');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Frappuccino Especial', 18.50, TRUE,),
('Torta de Maçã Artesanal', 14.00, TRUE,),
('Toast de Abacate com Ovo', 16.00, TRUE,);

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('matheus oricoli', 'matheus2@email.com', NULL, 'Limeira', TRUE);

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'aberto', 0.00, 38);

SET @pedido_atividade = LAST_INSERT_ID();
SELECT @pedido_atividade;

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'aberto', 18.00, 22),
('2026-10-02 08:30:00', 'Finalizado', 18.00, 22),
(NOW(), 'aberto', 22.00, 40),
('2026-10-02 09:15:00', 'preparando', 22.00, 40);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido_atividade, 43, 1, 4.50, 'Sem açúcar'),
(@pedido_atividade, 44, 2, 5.00, 'Bem quentinho');

-- corrija o telefone de um dos clientes criados
UPDATE cliente
set telefone = '199999993939'
where id_cliente =39;

UPDATE cliente
set telefone = '199999993939'
    cidade = 'campinas'
    where id_cliente = 39;

UPDATE produto
set preco = 18.50
where id_produto = 43;


select * from produto;
SELECT * from PEDIDO;

SELECT * from cliente;
-- importante
set @categoria_especial = (select id_categoria from categoria where nome = 'Especiais da Casa');

insert into produto(nome,preco,ativo,id_categoria)values
('Cupcake',8.00, true, 14),
('Mousse de chocolate', 25.00, true, 14),
('Fondue', 15.00, true, 14);
