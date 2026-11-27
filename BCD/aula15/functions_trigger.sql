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

--------------------------------------------------------

-- 4. 
