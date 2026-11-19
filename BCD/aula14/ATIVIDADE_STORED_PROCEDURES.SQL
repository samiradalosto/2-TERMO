-- Active: 1794486345815@@127.0.0.1@3308@smartcoffee_procedures_samira
-- AULA 13 - ATIVIDADE STORED PROCEDURES
-- Aluno:
-- Turma:

-- 1. listar_clientes_ativos()

-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))

-- 3. produtos_por_categoria(IN p_id_categoria INT)

-- 4. total_clientes(OUT p_total INT)

-- 5. consultar_estoque(IN p_id_produto INT) usando variável local

-- 6. classificar estoque: 0 SEM ESTOQUE / <=5 BAIXO / >5 NORMAL

-- 7. cadastrar_cliente(...) com três parâmetros IN

-- 8. alterar_preco(...) impedindo valor <= 0

-- 9. criar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)

-- 10. devolver ID com LAST_INSERT_ID()

-- 11. adicionar_item_pedido(...) buscando o preço atual

-- 12. Faça uma chamada inválida e explique o resultado.

-- 13. Use SHOW CREATE PROCEDURE.

-- 14. Remova uma procedure com DROP PROCEDURE IF EXISTS e recrie-a.

-- DESAFIO FINAL:
-- Crie uma procedure de negócio com:
-- - pelo menos 2 parâmetros;
-- - variável local;
-- - IF;
-- - pelo menos uma alteração no banco.

-- RESPOSTAS :

-- 1. listar_clientes_ativos()

USE smartcoffee_procedures_samira;

DELIMITER $$
CREATE PROCEDURE listar_clientes_ativos()
BEGIN
    SELECT id_cliente, nome, email, telefone
    FROM cliente
    WHERE ativo = TRUE
    ORDER BY nome;
END $$
DELIMITER ;


CALL listar_clientes_ativos();

--------//-------------------------//-------


-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))

DROP PROCEDURE IF EXISTS buscar_produto_por_nome;

DELIMITER $$
CREATE PROCEDURE buscar_produto_por_nome(IN p_busca VARCHAR(100))
BEGIN
    SELECT id_produto, nome, preco
    FROM produto
    WHERE nome LIKE CONCAT('%', p_busca, '%')
      AND ativo = TRUE
    ORDER BY nome;
END $$
DELIMITER ;

CALL buscar_produto_por_nome('Café');

--------//-------------------------//-------

-- 3. produtos_por_categoria(IN p_id_categoria INT)

DROP PROCEDURE IF EXISTS produtos_por_categoria;

DELIMITER $$
CREATE PROCEDURE produtos_por_categoria(
    IN p_id_categoria INT
)
BEGIN
    SELECT id_produto, nome, preco
    FROM produto
    WHERE id_categoria = p_id_categoria
      AND ativo = TRUE
      ORDER BY nome;


      END $$

      DELIMITER;

CALL produtos_por_categoria(1);

--------//-------------------------//-------


-- 4. total_clientes(OUT p_total INT)

DELIMITER $$
CREATE PROCEDURE total_clientes(
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_total
    FROM cliente
    WHERE ativo = TRUE;
END $$
DELIMITER ;

CALL total_clientes(@total_clientes);
SELECT @total_clientes AS total_clientes_ativos;


--------//-------------------------//-------

-- 5.
DELIMITER $$
create PROCEDURE consultar_preco (in P_id_produto INT)
BEGIN
    DECLARE V_PRECO Decimal(10,2);

    select preco 
    into V_preco
    from produto
    WHERE id_produto = P_id_produto;

    select V_preco as Preco_produto;
end $$

DELIMITER;


--------//-------------------------//-------

-- 6.
create procedure classificar_estoque (in P_ID_PRODUTO INT)
BEGIN 
    DECLARE V_QUANTIDADE INT;
    SELECT QUANTIDADE 
    FROM ESTOQUE id_produto
    WHERE ID_PRODUTO = P_ID_PRODUTO;

    IF V_QUANTIDADE = 0 THEN
        SELECT 'SEM ESTOQUE' AS SITUAÇÃO;
    ELSEIF V_QUANTIDADE <= 5 THEN
        SELECT ' ESTOQUE BAIXO' AS SITUAÇÃO;
    ELSE
        SELECT 'ESTOQUE NORMAL' AS SITUAÇÃO;
    END IF;
    END $$

    DELIMITER;

    CALL CLASSIFICAR_ESTOQUE(2);

--------//-------------------------//-------

-- 7.
DELIMITER $$

CREATE PROCEDURE CADASTRAR_CLIENTE(
    IN P_NOME VARCHAR(100),
    IN P_EMAIL VARCHAR(120),
    IN P_TELEFONE VARCHAR(20)
)  

BEGIN
    INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO)
    VALUES (P_NOME, P_EMAIL, P_TELEFONE, TRUE);
END $$

DELIMITER;

CALL CADASTRAR_CLIENTE ('Catarina', 'Catarina@email.com', '19999999');

SELECT * FROM CLIENTE;

--------//-------------------------//-------

-- 8.
DELIMITER $$

CREATE PROCEDURE ATUALIZAR_PRECO_PRODUTO(
    IN P_ID_PRODUTO INT,
    IN P_NOVO_PRECO DECIMAL(10,2)
)

BEGIN 

    IF P_NOVO_PRECO > 0 THEN
        UPDATE produto 
        SET PRECO = P_NOVO_PRECO
        WHERE id_produto = P_ID_PRODUTO;

        SELECT 'PREÇO ATULIZADO' AS MENSAGEM;
    ELSE
        SELECT 'PREO INVÁLIDO' AS MENSAGEM;
    END IF;
END $$

DELIMITER;

CALL ATULIZAR_PRECO_PRODUTO(2,14);

SELECT * FROM PRODUTO;

--------//-------------------------//-------

DELIMITER $$

CREATE PROCEDURE REGISTRAR_PEDIDO (
    IN P_ID_CLIENTE INT,
    OUT P_ID_PEDIDO INT
)
BEGIN 
     START TRANSACTION;
     INSERT INTO PEDIDO(
        ID_CLIENTE,
        DATA_PEDIDO,
        STATUS_PEDIDO
     )

    VALUES(
        P_ID_CLIENTE, NOW(), 'ABERTO'
    );

    SET P_ID_PEDIDO = LAST_INSERT_ID();
    COMMIT;
END $$

DELIMITER;

CALL REGISTRO_PEDIDO(1, @PEDIDO);
SELECT @PEDIDO;


--------//-------------------------//-------

-- 10.

DELIMITER $$

CREATE PROCEDURE criar_pedido(
    IN p_cliente_id INT,
    OUT p_novo_pedido_id INT
)
BEGIN
    INSERT INTO pedidos (cliente_id, data_pedido, status)
    VALUES (p_cliente_id, NOW(), 'Aberto');
    
    SET p_novo_pedido_id = LAST_INSERT_ID();
END $$

DELIMITER ;

CALL criar_pedido(1, @id_gerado);
SELECT @id_gerado AS id_do_pedido;

--------//-------------------------//-------

-- 11
DELIMITER $$

CREATE PROCEDURE adicionar_item_pedido(
    IN p_pedido_id INT,
    IN p_produto_id INT,
    IN p_quantidade INT
)
BEGIN
    DECLARE v_preco_atual DECIMAL(10, 2);

    SELECT preco INTO v_preco_atual
    FROM produtos
    WHERE id = p_produto_id;

    INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
    VALUES (p_pedido_id, p_produto_id, p_quantidade, v_preco_atual);
END $$

DELIMITER ;

-- Execução do item 11:
CALL adicionar_item_pedido(@id_gerado, 1, 2);

--------//-------------------------//-------

-- 12
CALL adicionar_item_pedido(99999, 1, 2);

/* 
EXPLICAÇÃO DO RESULTADO:
O mysql e interrompido pois ocorre um erro 
Cannot add or update a child row: a foreign key constraint fails.
Isso ocorre porque a integridade referencial impede cadastrar um item vinculado 
a um pedido (99999) que não existe na tabela pai (pedidos).
(Caso fosse passada uma quantidade errada de argumentos, retornaria ERROR 1318).
*/


-- 
SHOW CREATE PROCEDURE adicionar_item_pedido;

--------//-------------------------//-------

-- 14
DROP PROCEDURE IF EXISTS criar_pedido;

DELIMITER $$

CREATE PROCEDURE criar_pedido(
    IN p_cliente_id INT,
    OUT p_novo_pedido_id INT
)
BEGIN
    INSERT INTO pedidos (cliente_id, data_pedido, status)
    VALUES (p_cliente_id, NOW(), 'Pendente');
    
    SET p_novo_pedido_id = LAST_INSERT_ID();
END $$

DELIMITER ;
--------//-------------------------//-------

