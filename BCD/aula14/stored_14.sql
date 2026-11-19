-- Active: 1794486345815@@127.0.0.1@3308@smartcoffee_procedures_samira
--Aula 14 - Stored procedures
-- stored prodedure é um conjunto de instruções sql.
-- depois de criado podemos executar sempre que necessário usando call 

-- sem procedure - A aplicação envia várias instruções e repete a lógica em diferentes lugares 
-- com procedure - a lógica fica centralizada em uma rotina qu epode receber parâmetros

-- Linha do tempo da procedure 
-- Entrada - procedure - processamento - resultado

-- Quando ultilizar?
-- Operações repetidas
-- Consultas padronizadas 
-- Processos com várias instruções 
-- Regras que precisam ser executadas de maneira consistente
-- Rotinas administrativas

-- Delimites 
-- Dentro de uma procedure temos vários comandos encerrados
-- por ; para não ocorrer o risco de o mysql não interpretar o comando correto inserimos o delimitador

-- Ex 1  comando inicial 
--instruções e procedimento

delimiter $$

create PROCEDURE exemplo01()
begin
    select 'olá mundo :)';
END

delimiter;

-- Ex 2 : consulta simples

delimiter $$ 
create procedure Listar_produtos()
begin
    select id_produto as código, nome, preco
    from produto
    where ativo = TRUE
    order by nome;
END
delimiter;

call listar_produtos();

-- Obs: A procedure não recebe parâmetro, apenas executa uma consulta padronizada

-- Ex 3: parâmetros in - representa um valor enviado para a procedure 

delimiter $$

create procedure busca_produtos_categoria(in p_id_categoria int)
begin
select id_produto as código, nome, preco
from produto 
where id_categoria = p_id_categoria
and ativo = TRUE
order by nome;
END

DELIMITER;

call buscar_produtos_categoria(3);

--Ex 4 Parâmetro out - devolve um valor través de uma  variável do cliente 

DELIMITER $$
create PROCEDURE contat_produtos_ativos(out p_total int)
begin
    select count(*)
    into P_TOTAL
    from produto
    where ativo = true;
end$$

delimiter;

--Resultado de quantidade de produtos ativos 
CALL contar_produtos_ativos(@TOTAL);
select @TOTAL;

--Ex 5 inout - recebe um valor e pode devolcer esse mesmo parâmetro

delimiter $$

create PROCEDURE aplicar_bonus_fidelidade (INOUT P_ponto int, in p_bonus int)

begin
    set p_pontos + P_bonus;
END $$
DELIMITER;

set @Potos = 100;
-- @ definição da variavel 
call aplicar_conus_fidelidade(@pontos, 25);

select @pontos;

-- Ex 6: variáveis locias - dentro do begin .... end podemos declaras variáveis 

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

call consultar_preco(2);

-- Ex 7 :

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

 --EX 8: PROCEDURE COM INSERT - CADASTRAR CLIENTE
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

CALL CADASTRAR_CLIENTE ('BRUNO AUGUSTO', 'BRUNO@EMAIL.COM', '19999999');

SELECT * FROM CLIENTE;

-- EX 9 - PROCEDURE PARA UPDATE

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

-- EX 10: PRECEDURE  COM REGAR DE NEGÓCIO E REGISTRO DE PEDIDO

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


