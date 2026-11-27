-- Active: 1794486345815@@127.0.0.1@3308@smartcoffee_procedures_samira
-- function: Armazena uma rotina criada dentro do MySql que recebe parâmetro, executa uma lógica e devolve um valor com RETURN.

--Exemplos de ultilização:
-- -Calculo de frete (valor do frete)
-- -Escola (Classificar média com aprovado e reprovado)
-- -Finaceiro (calcular juros - valor crrigido)
-- -Estoque (situação estoque - opções de checagem)

-- Ex 0: Estrutura básica (modelo)
create function nome_funcao(parametro tipo)

returns tipo_de_retorno 
determinitic
begin

--processamento
return valor;

end $$
DELIMITER;

-- obs: returns: informa qual tipo será devolvido. retur informa o resultado devolvido 

-- Ex 1: Total de Item 

DELIMITER $$

create function calcular_total_item
(p_preco decimal(10,2), p_quantidade int)
returns decimal(10,2)
DETERMINISTIC
begin
    RETURN p_preco * p_quantidade;
end $$

delimiter;
--obs: agora a fução pode ser usada como se fosse uma função nativa 
-- Apresentar o resultado da function

select nome, preco, calcular_total_item(preco, 3) as total_3_unidades
from produto; 

--Ex 2: com decisão - base em fidelidade

DELIMITER $$

create function classificar_fidelidade
(p_pontos int)
returns varchar(20)
deterministic 
begin
    if p_pontos >= 500 THEN
        return 'ouro';
    elseif p_pontos >= 200 THEN
        return 'prata';
    ELSE
        return 'bronze';
    END if;
end $$

DELIMITER;

select nome, pontos_fidelidade, classificar_fidelidade(pontos_fidelidade) as nível
from cliente;

-- Ex 3: Exempla com variável local 

delimiter $$

create function calcular_desconto
(
    p_valor decimal(10,2),
    p_pontos int
)
retutns decimal(10,2)
DETERMINISTIC
begin
    declare v_percentual decimal (5,2);
    if p_pontos >= 500 THEN
        set v_percentual = 0.10;
    elseif p_pontos >= 200 THEN
        set v_percentual = 0.05;
    ELSE
        set v_percentual = 0;
    end if;
    return p_valor * v_percentual;
end $$

delimiter ;

-- obs: deterministic?
-- Uma função marcada como deterministic declara que, para os mensmos valores de entrada, o resultado será o mesmo.

-- Comparações entre funciton x procedure x VieW
-- view: select ... from view - consulta reutilizável - vw_pedidos_abertos
-- procedure: call ... - processo com várias etapas - registrar_pedido
-- Function: dentro da expressão / select - cáculo ou classifição -- calcular_desconto

-- Atividade ampliada - aulas 14 e 15 
--  1. function calcular_total_item

-- 2. function classificar_fidelidade

-- 3. function calcular_desconto

-- 4. Function situação_estoque

-- 5. teste todas em select 

--------------//------------//------------
--1
select nome, preco, calcular_total_item(preco, 2) as total_2_unidades
from produto; 

---------------//------------//----------

--------------//-------------//----------
-- 2

create function classificar_fidelidade_frutas
(s_pontos int)
returns varchar(20)
deterministic 
begin
    if s_pontos >= 500 THEN
        return 'banana';
    elseif s_pontos >= 200 THEN
        return 'morango';
    ELSE
        return 'abacaxi';
    END if;
end $$

select nome, pontos_fidelidade, classificar_fidelidade_frutas(pontos_fidelidade) as nível
from cliente;

--------------//----------------//---------

-- 3. 

delimiter $$
create funciton calcular_desconto_produtos(
    p_valor decimal(10,2),
    p_pontos int
)
returns decimal(10,2)
DETERMINISTIC
begin
    declare v_percentual decimal(5,2);
    if p_pontos >= 500 THEN
        set v_percentual = 0.15;
    elseif p_pontos >= 250 THEN
        set v_percentual = 0.13;
    else 
        set v_percentual = 0;
    end if;
    return p_valor * v_percentual;
end $$
delimiter;

select calcular_desconto_produtos(200.00, 1200) as valor_desconto;

----------//-----------------//-------------

-- 4. 
DELIMITER $$

CREATE FUNCTION SITUACAO_ESTOQUE(P_QUANTIDADE INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF P_QUANTIDADE = 0 THEN
        RETURN 'SEM ESTOQUE';
    ELSEIF P_QUANTIDADE <= 10 THEN
        RETURN 'ESTOQUE BAIXO';
    ELSE
        RETURN 'ESTOQUE NORMAL';
    END IF;
END $$

DELIMITER ;

SELECT ID_PRODUTO, SITUACAO_ESTOQUE(QUANTIDADE) AS SITUÇÃO_ESTOQUE FROM ESTOQUE;

-- Exemplo keynan
select id_produto, situacao_estoque(quantidade) as situação_estoque from estoque;

-- Exemplo gabriel 

select e.id_produto, p.nome as produto, E.quantidade, situacao_estoque(E.quantidade) as status_estoque from estoque as e 
inner join produto as p
on E.id_produto = p.id_produto
order by id_produto;

-- Triggers
-- trigger é uma rotina associda a uma tabela que é execultada automaticamente quando 
-- ocorre um insert, update, delete
-- Aplicaçôes no dia-dia
-- auditoria: regitrar preco antigo e novo  sempre que um produto muda 
-- segurança: registrar exclusões importantes
-- estoque: impedir quantidade negativa
-- hospital: registrar alterações em dados criticos 
-- finaceira: criar histórico de mudança de status de pagamento

create table auditoria_preco(
    id_auditoria int auto_increment,
    id_produto int not null,
    preco_anterior decimal(10,2),
    preco_novo decimal(10,2),
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    constraint pk_id_auditoria PRIMARY key (id_auditoria),
    constraint fk_produto FOREIGN key (id_roduto) references produto
    (id_produto)
);

DELIMITER $$

create trigger trg_produto_preco_update
after update on produtofor each ROW
BEGIN
    INSERT INTO AUDITORIA_PRECO (ID_PRODUTO, PRECO_ANTERIOR, PRECO_NOVO)
        VALUES (NEW.ID_PRODUTO, OLD.PRECO, NEW.PRECO);
    END IF;
END $$
DELIMITER;

select id_produto, nome, preco from produto
where id_produto -1;

update produto
set preco = 10.50
where id_produto = 1;

select * from auditoria_preco
order by id_auditoria desc;

-- OBS: boa prática - sempre mostre o estado antes (before), execute a mudança e depois consulte o estado depois (after)
-- Before antes de gravar validar estoque negativo 
-- after depois de gravar registrar histórico/auditoria
-- insert (old não) (new sim)
-- update (old sim) (new sim)
-- delete (old sim) (new não)

--  Ex 2- validação automática com signal

DELIMITER $$

create trigger trg_estoque_before_update
before update on estoque 
for each row 
begin
    if new.quantidade < 0 THEN
        signal sqlstate '45000'
        set message_text = 'estpque não pode ficar negativo';
    end if;
end $$

DELIMITER;
-- Ex 3: before insert - antes de inserir dados

DELIMITER $$
create trigger trg_produto_before_insert
before insert on id_produto
for each ROW
begin
    if new.preco <= 0 THEN
        signal sqlstate '45000'
        set message_text = 'preço deve ser maior que zero';
        end if;
end $$
DELIMITER ;

select * from  produto;

-- insert into produto (id_categoria, nome, preco, ativo) valuess (1, 'café americano', -2.00, true);

-- Ex 4: exclusão de registro - afer delete

create table log_exclusao_produto (
    id_log int AUTO_INCREMENT,
    id_produto int,
    nome_produto VARCHAR(120),
    excluido_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_LOG PRIMARY KEY (id_log),
    CONSTRAINT FK_PRODUTO_ID FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

delimiter $$

create trigger trg_produto_after_delete
after delete on produto
for each ROW
begin
    insert into log_exlusao_produto(id_produto, nome_produto)
    values (old.id_produto, old.nome);
end$$
DELIMITER;

-- testando

insert into log_exclusão_produto(id_prduto, nome_produto) values (1, 'teste');

selct * from log_exclusao_produto;

DELETE from log_exclusao_produto
WHERE 

