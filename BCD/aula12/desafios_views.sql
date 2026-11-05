-- Atividade Prática — Catálogo de
-- VIEWs SmartCoffee

-- Missão: a equipe de desenvolvimento quer padronizar consultas que
-- serão utilizadas por relatórios e futuras telas do sistema.

-- Parte A — Básico Fundamentos

-- 1. Crie vw_produtos_ativos .
create views vw_produtos_ativos as select id_produto, nome, preco
from produto
where ativo = TRUE;

-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.
select * from vw_produtos_ativos
where preco >= 10.00
Oreder by preco DESC;


-- CREATE VIEW vw_pedidos_clientes AS
-- SELECT
-- p.id_pedido,
-- p.data_pedido,
-- c.id_cliente,
-- c.nome AS cliente,
-- p.status_pedido
-- FROM pedido AS p
-- INNER JOIN cliente AS c
-- ON c.id_cliente = p.id_cliente;

select p.id_produto, p.nome as produto, ca.nome as categoria, p.preco
from produto as p 
inner join categoria = p.id_categoria;

-- SELECT *
-- FROM vw_pedidos_clientes
-- WHERE id_cliente = 1
-- ORDER BY data_pedido DESC;
select * from vw_produtos_categorias
Order by categoria, produto;

-- 3. Liste todas as views do banco.
create view vw_produtos_categorias as 
select p.id_produto, p.nome as produto, ca.nome as categoria, p.preco
from produto as preco
inner join categoria as ca
on ca.id_categoria = p.id_categoria;

-- 4. Exiba a definição de vw_produtos_ativos .
select * from vw_pedidos_cliente
where status = 'aberto';
-- Parte B — Relacionamentos Intermediário

-- 5. Crie vw_produtos_categorias usando INNER JOIN.
CREATE View vw_itens_pedidos as 
select pe.id_pedido. pe.data_pedido, c.nome as Cliente, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitaro as subtotal
from pedido as pe
inner join cliente as c
on c.id_cliente = pe.id_cliente
inner join item_pedido as ip
on ip.id_pedido = pe.id_pedido
inner join produto as pr
ON pr.id_produto = ip.id_produto;

-- 6. Crie vw_pedidos_clientes .
CREATE View vw_itens_pedidos as 
select pe.id_pedido. pe.data_pedido, c.nome as Cliente, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitaro as subtotal
from pedido as pe
inner join cliente as c
on c.id_cliente = pe.id_cliente
inner join item_pedido as ip
on ip.id_pedido = pe.id_pedido
inner join produto as pr
ON pr.id_produto = ip.id_produto;

-- 7. Consulte somente pedidos FINALIZADOS pela view.
create View  vw_vendas_pro_produto as
select pr.id_produto, pr.nome as produto, sum(ip.quantidade) As unidades_vendidas, sum(ip.quantidade *ip.preco_unitario) as faturamento
from produto as pr
inner join item_pedido as ip
on ip.produto = pr.ip.id_produto
inner join pedido as pe
on pe.status = 'aberto'
group by pr.id_produto, pr.nome;
-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.
create view vw_cliente_resumo as 
select c.id_cliente, c.nome as cliente, count(p.id_pedido) as quantidade _pedidos
from cliente as c
left join pedido as p
on p.id_cliente = c.id_cliente
group by c.id_cliente, c.nome;

-- Parte C — Relatórios Intermediário/
-- Avançado

-- 9. Crie vw_vendas_por_produto com SUM e GROUP BY.

-- 10. Liste os produtos pelo maior faturamento.

-- 11. Crie uma view que apresente todos os clientes e a quantidade de
-- pedidos, inclusive zero.

-- 12. Descubra, pela view anterior, clientes que nunca compraram.

-- Parte D — Manutenção

-- 13. Use CREATE OR REPLACE para acrescentar id_categoria em uma
-- view.

-- 14. Crie uma view simples e teste uma atualização permitida pelo SGBD.

-- 15. Crie uma view de produtos ativos com WITH CHECK OPTION e
-- analise seu efeito.

-- 16. Remova uma view de teste com DROP VIEW IF EXISTS.