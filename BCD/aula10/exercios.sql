-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): Samira
-- Regra: valide sempre antes de COMMIT.

-- 01. Consulte produto 2 e seu preço.
select * from produto 

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
update produto
set preco = 3.00
where id_produto = 2;
select * from produto where id_produto = 2;

-- 03. Consulte dentro da transação.
SELECT * FROM produtos;
-- 04. ROLLBACK.
ROLLBACK;
-- 05. Consulte e comprove retorno.
SELECT * FROM produtos;
-- 06. Repita a alteração e finalize com COMMIT.
START TRANSACTION;
UPDATE produtos SET preco = preco * 1.10 WHERE id = 3; -- exemplo de alteração
COMMIT;
-- 07. START TRANSACTION e aumente produto 3 em 10%.
START TRANSACTION;
UPDATE produtos SET preco = preco * 1.10 WHERE id = 3;
-- 08. SAVEPOINT ajuste_produto3.
SAVEPOINT ajuste_produto3;
-- 09. Aumente produto 4 em 50%.
UPDATE produtos SET preco = preco * 1.50 WHERE id = 4;
-- 10. Consulte os dois.
SELECT * FROM produtos WHERE id IN (3, 4);
-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.
ROLLBACK TO SAVEPOINT ajuste_produto3;
-- 12. COMMIT e explique em comentário qual alteração permaneceu.
COMMIT;
-- pois o aumento de apenas 10% do produto 2 permanece
-- e o aumento do produto 4 foi desfeito por que o ROLLBACK to savepoint retpunou 

-- 13. START TRANSACTION.
START TRANSACTION;
-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.
insert into pedido(id_cliente, , status, data_pedido,
valor_total, id_cliente)
VALUES (now(), 'Aberto', 0.00)

select TRANSACTION;

-- 15. Insira dois itens válidos.
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@id_pedido, 1, 2, 10.00),
(@id_pedido, 2, 1, 15.00);

-- 16. Registre pagamento válido.
INSERT INTO pagamentos (id_pedido, valor, forma_pagamento) VALUES
(@id_pedido, 35.00, 'cartao');

-- 17. Consulte pedido, itens e pagamento.
SELECT * FROM pedidos WHERE id = @id_pedido;
SELECT * FROM itens_pedido WHERE id_pedido = @id_pedido;
SELECT * FROM pagamentos WHERE id_pedido = @id_pedido;

-- 18. COMMIT.
COMMIT;

-- 19. START TRANSACTION e crie pedido para cliente 2.
START TRANSACTION;
INSERT INTO pedidos (id_cliente, data_pedido, status) VALUES (2, NOW(), 'pendente');

-- 20. Salve o id em @pedido_com_erro.
SET @pedido_com_erro = LAST_INSERT_ID();

-- 21. Tente inserir item com id_produto inexistente.
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_com_erro, 9999, 1, 10.00); -- O MySQL irá retornar erro de Foreign Key (FK)

-- 22. Após observar a FK, ROLLBACK.
ROLLBACK;

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.
SELECT * FROM pedidos WHERE id = @pedido_com_erro;

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.
DELETE FROM categorias WHERE id = 1;
-- Explicação: A exclusão foi bloqueada devido a uma restrição de Chave Estrangeira (Foreign Key / RESTRICT ou NO ACTION). 
-- O banco de dados impede que uma categoria seja removida enquanto existirem produtos associados a ela, garantindo a integridade referencial.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.
START TRANSACTION;

INSERT INTO pedidos (id_cliente, data_pedido, status) VALUES (1, NOW(), 'temporario');
SET @id_temp = LAST_INSERT_ID();

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@id_temp, 1, 1, 10.00),
(@id_temp, 2, 1, 15.00);

-- Exclui o pedido para testar o efeito do ON DELETE CASCADE nos itens associados
DELETE FROM pedidos WHERE id = @id_temp;
SELECT * FROM itens_pedido WHERE id_pedido = @id_temp; -- Deve retornar 0 linhas

ROLLBACK;


-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.

START TRANSACTION;

-- a) Criar pedido
INSERT INTO pedidos (id_cliente, data_pedido, status) VALUES (1, NOW(), 'em processamento');
SET @id_smartcoffee = LAST_INSERT_ID();

-- b) Inserir 3 itens
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@id_smartcoffee, 1, 2, 5.00),
(@id_smartcoffee, 2, 1, 12.00),
(@id_smartcoffee, 3, 3, 8.00);

-- c) Baixa de estoque dos produtos inseridos
UPDATE produtos SET estoque = estoque - 2 WHERE id = 1;
UPDATE produtos SET estoque = estoque - 1 WHERE id = 2;
UPDATE produtos SET estoque = estoque - 3 WHERE id = 3;

-- d) Definir SAVEPOINT
SAVEPOINT pos_itens;

-- e) Registar pagamento
INSERT INTO pagamentos (id_pedido, valor, forma_pagamento) VALUES (@id_smartcoffee, 36.00, 'pix');

-- f) Atualizar status para FINALIZADO
UPDATE pedidos SET status = 'FINALIZADO' WHERE id = @id_smartcoffee;

-- g) Consultas de verificação
SELECT * FROM pedidos WHERE id = @id_smartcoffee;
SELECT * FROM itens_pedido WHERE id_pedido = @id_smartcoffee;
SELECT * FROM pagamentos WHERE id_pedido = @id_smartcoffee;
SELECT * FROM produtos WHERE id IN (1, 2, 3);

-- h) Confirmar alteração definitiva
COMMIT;