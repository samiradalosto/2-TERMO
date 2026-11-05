-- Active: 1788435985790@@127.0.0.1@3306@smartcoffee_dml_samira
-- Views ou Visões - transformar determinadas consultas em visões reutilizáveis

select * from cliente; ADD

-- Como posso desipomibilizar uma consulta como se ela fosse uma tabela resposta:Views

-- Ex 1: View - Como consultar um visão lógica
select id_produto, nome, preco
from produto 
where ativo = true;

-- Visualizar a consulta criada através da VIEW
select * from vw_produtos_ativos;

-- Obs: A View guarda a de4finição da consulta. Em uma view comum os dados continuam pertencendo as tabelas de origem.

-- tabela - armazena  registros 
-- View - representa o resultado lógica da consulta

-- Por que ultilizar?
-- Por que desejo simplificar a minha consulta 
-- Reutilizar lógica onde a consulta ganha um nome
-- Padronização de relatórios
-- Restrição de relatório
-- Restrição de eexposição da lógica

select id_produto , nome, preco
from produto
where ativo = true;

-- Transformar em uma view

create View vw_produtos_ativos as select id_produto, nome, preco
from produto
where ativo = TRUE;

-- Ex 2: Utilizar filtros nas vews 

select id_produto, nome, preco
from produto 
where preco >= 10.00
Order by preco desc;

select * from vw_produtos_ativos
where preco >= 10.00
Oreder by preco DESC;

-- obs: View não elimina a possibilidade de usar where, Order by e outras cláusulas 

-- Ex 3: View com Joins - mostrar produtos e categorias 

select p.id_produto, p.nome as produto, ca.nome as categoria, p.preco
from produto as p 
inner join categoria = p.id_categoria;

-- Criando em VIEW

create view vw_produtos_categorias as 
select p.id_produto, p.nome as produto, ca.nome as categoria, p.preco
from produto as preco
inner join categoria as ca
on ca.id_categoria = p.id_categoria;

-- Resultado visual por view

select * from vw_produtos_categorias
Order by categoria, produto;

-- ex 4: view com várias tabelas - Relatório de pedidos
-- obs: p e de pedido tudo que esta com p. esta relacionado com o pedido 


crete view vw_pedidos_clients as 
select p.id_pedido, p.data_pedido, p.status , c.id_clientes, c.nome as clientes
from pedido as p
inner join cliente as c 
on c.id_cliente = p.id_cliente;

-- Para apagar as views aplique esse comando
-- drop view vw_pedidos_clientes;

-- Resultado
select * from vw_pedidos_cliente
where status = 'aberto';

-- Ex 5: View para um relatório COMPLETION

CREATE View vw_itens_pedidos as 
select pe.id_pedido. pe.data_pedido, c.nome as Cliente, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitaro as subtotal
from pedido as pe
inner join cliente as c
on c.id_cliente = pe.id_cliente
inner join item_pedido as ip
on ip.id_pedido = pe.id_pedido
inner join produto as pr
ON pr.id_produto = ip.id_produto;

-- Resultado

Select * from vw_itens_pedidos
where id_pedido = 3;

-- Ex 6: View com funções de agregação 

create View  vw_vendas_pro_produto as
select pr.id_produto, pr.nome as produto, sum(ip.quantidade) As unidades_vendidas, sum(ip.quantidade *ip.preco_unitario) as faturamento
from produto as pr
inner join item_pedido as ip
on ip.produto = pr.ip.id_produto
inner join pedido as pe
on pe.status = 'aberto'
group by pr.id_produto, pr.nome;

-- Resultado: Consulta gerencial

select * from vw_vendas_por_produto
order ny faturamento desc;

-- Ex 7: View com  join - Queremos todos os clientes inclusive quem nunca realizou pedidos

create view vw_cliente_resumo as 
select c.id_cliente, c.nome as cliente, count(p.id_pedido) as quantidade _pedidos
from cliente as c
left join pedido as p
on p.id_cliente = c.id_cliente
group by c.id_cliente, c.nome;

-- Resultado
select * from vw_produtos_resumo as
where quantidade_pedidos = 0;

-- Ex 8: nomeando views aliases tornam as views mais claras

create view vw_precos_produtos as
select id_produto, nome as produto, preco as preco_atual
from produto;

select * from vw_precos_produtos;

-- Ex 9: visualzar as views existententes visualizar o resultado de todas as views criadas
show full table where table_type = 'view';

-- podemos consultar o catálogo
-- quer dizer todo o bd mysql ;

select table_name from information_schema.VIEWS
where table_schema = database();

-- Ex 10: Visualizando defenições

show CREATE view vw_produtos_categorias;

-- Ex 11: Create or replace view

create or replace view vw_produto_ativos as 
select id_produto, nome, preco, id_categoria
from produto
where ativo = true;
-- obs: irá substituir ou alterar uma view ja criada com suas informações

-- Ex 12: view atualizável
create view cliente_ativos as 
select id_cliente, nome, email, ativo
from cliente
where ativo = true;

-- atulizar a tabela cliente

update vw_clientes_ativos as 
select id_cliente, nome, email, ativo
from cliente
where ativo = true;

-- Atualizar a tabela cliente

update vw_cliente_ativos
set nome = 'Ana francis'
where id_cliente = 2; 

-- Ex 13: view não atuaçizável
Update vw_vendas_por_produto
set faturamento = 1000
where id_produo = 1

-- obs: O campo é calculado. Simplesmente não é possícel receber 1000.
-- Ex 14: with check option - view que mostra apenas produtos ativos
create or replace view vw_produtos_ativos as
select id_porduto, nome, preco, ativo, id_categoria
from produto 
where aivo = TRUE
with check option;

select * from vw_produto_ativos;

-- obs: O with check option ajuda a impedir alterações realizadas pela view que fariam o registro.
-- Verificar se tudo o que eu pedi pra ele está ok se estiver ele confirma 


-- Ex 15: Padão definição de nomenclatura
-- vw - views 
-- nome - complementar a tabela ou consultar que deseja realizar.
-- vw_nome_desejo
-- vw_nome_da_finalidade
-- vw_produtos_ativos


