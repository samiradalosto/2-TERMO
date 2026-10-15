-- Active: 1788435985790@@127.0.0.1@3306@smartcoffee_dml_samira
-- Active; 1788435081206@@127 .0.0.1@3306@smartcoffe_dml_samira Senai_Sesi
-- DQL -DATA query language (liguagem de consulta de dados)
-- Antes de iniciar 
insert into cliente (nome, email, telefone, cidade, ativo) 
VALUES('Ana Flávia', 'ana@gmail.com', '19999999999', 'campinas', True);

-- Ex 1: select simples ou consulta simples 
-- Estrutura select como exemplo  
-- Select coluna
-- From tabela;
 
select *
from cliente;
-- Consultar colunas especificas

-- Ex 2: Alias com as como apelido as colunas 
select nome As Nome_Cliente
From cliente;

select email as Email_cliente, telefone AS Contato_Cliente
from cliente;

-- Ex 3: Distinct cidade
select DISTINCT cidade
from cliente;

select cidade
from cliente; 

-- sem distinct o resultado irá se repetir mais vezes.
-- com o distinct o resultado irá aparecer uma vez

-- Ex 4: Where  - Filtri por registros
-- Iremos definir condições
-- = igual
-- <> ou ! = Diferente
-- > Maior que 
-- >= Maior ou igual a 
-- < Menor a que 
-- <= Menor igual 

select nome, preco 
from produto
Where preco > 10.00;
Where ativo = true; ADD
-- Consulta status de cliente se está ativo ou inativo

select id_pedido, data_pedido, valor_pedido
From pedido
where valor_total >+ 25.00;

-- Consulta pedidos acima de determinado valor

-- Ex 5: uso do and, or e not
-- and todas as condições verdadeiras
select nome, preco 
from produto
where preco >= 8.00 and preco <= 25.00

-- or pelo menos uma condição verdadeira
select nome, cidade 
from cliente
where cidade = 'Limeira' or cidade ='Piracicaba';

-- Not não irá buscar ou consultar o valor desejado

select nome, cidade
from cliente
where not cidade = 'Limeira';

-- Extra - Ultilizando and e or juntos separar por ()

select nome. cidade
from cliente
where ativo = true ativo
and (cidade = 'Limeira' or cidade = 'Piracicaba');

-- Ex 6: Detween - entre  dois valores 
-- Limite inicial e final 

select nome, preco 
from produto 
Where preco BETWEEN 8.00 and 15.00;
-- Consulta pro valores entre 8 e 15

select id_pedido, valor_total
from pedido
Where data_pedido BETWEEN '2026-09-01 00:00:00' and '2026-09-30 23:59:59';
-- Consulta por intervalo de datas

-- Ex 7: in várias possibilidades
select nome, cidade
from cliente
where cidade in ('Limeira', 'Campinas', 'Americana', 'Piracicaba');
-- Consulta com várias condições e diminuindo o uso de or

select nome, cidade
from cliente
where cidade not in('Limeira', 'Piracicaba');
-- consulta com excessão dos valores especificados

-- Ex 8: like - pesquisar por textos
-- Cortingas
-- % Vários caracteres
-- _Extamente um caracter

select nome
from produto
Where nome like 'Café%';
-- Consulta todos os produtos que começam com a palavra desejada

select nome 
from produto
where nome like '%chocolate%';

-- Consulta todos os produtos que possuem a palavra desejada

select nome
from cliente
where nome like '%Si_va';

-- Consulta especificamente o caracter que não se lembra

-- Ex 9: Null - Ausência de valores

select nome, telefone
from cliente
where telefone is null; 
-- consulta campos que possuem o null

select nome, telefone
from cliente
where telefone is not null;
-- consulta compos que não são mais null

-- Ex 10: order by - ordenando resultados
-- Asc crecente
-- Desc decrecente
select nome, preco
from produto
order by preco Asc;
-- Consulta dados de forma crecente

select cidade, nome 
from cliente
order by cidade asc, nome DESC;
-- Consulta por mais de uma coluna

-- Ex 11: LIMIT - LImitar quantidade de linhas
select nome, preco 
from produto
order by preco DESC
LIMIT 2;
-- Consultar apenas uma quantidade de linhas
select nome, preco 
from produto 
order by nome 
LIMIT 5 offset 5;

select *from produto

select * from categoria

-- Ex 12: Cálculo de colunas 
select nome, preco, preco * 2 as preco_ajustado
from produto;

select id_item, quantidade, preco_unitario, quantidade * preco_unitario AS sub_total
From item_pedido;

-- Ex 13: Funções para consultas 
-- texto
select upper(nome) as nome_cliente, Lower(email) as Email_Cliente
from cliente;

select concat(nome, '----', cidade) as cidade_clientes
-- concat concatenação de valores
--números 

select nome, preco, round(preco * 0.90, 2) as Preco_Desconto
from produto;

-- Datas
select id_pedido, data_pedido, date(data_pedido) as datas, MONTH (data_pedido) as Mês, year(data_pedido) as ano , day(data_pedido) as dia,
time(daat_pedido) as Horário
From pedido;

-- coalesce - substituir a informação que deixamos em null ou não deixamos
select nome, coalesce(telefone, 'Não contém o número') as telefone 
from cliente;

-- Ex 14: funções de agrupamento
-- count - contar quantos registros existem
-- sum - soma de valores
-- Avg - média de valores
-- Min - menor valor 
-- Max - AMior valor

select count(*) as Total_clientes
from cliente;
ontar quantos clientes existem

select avg(preco) as Média_preço
from produto;
-- Calcular média de preços dos produtos

select min(preco) AS menor_preço, AVG(preco) as Média_preço
from produto;
-- Resumo de preços

select sum(valor_total) AS faturamento_mensal
from pedido
where status = 'Finalizado';
-- total de vendas ou pedidos realizados com critério

-- Ex 15: GROUP by - Agrupar dados
select cidade, count(*) as Qauntidade_clientes
From clientes
group by cidade;

select id_categoria, count(*) as Quantidade_produtos
from produto
group by id_categoria;

-- Ex 16: HAVING - filtro por grupos 
-- where - filtra linhas antes do group
-- HAVING - filtra linhas depois do group by

select cidade, COUNT(*) as qtde_clientes
from cliente
group by cidade 
HAVING COUNT(*) >= 2;
-- cidades com pelos menos dois clientes

-- Ex 17: Ordem de criação de uma conxulta completa
select colunas 
from tabela 
where condicao 
GROUP BY colunas_agrupar
HAVING condicao_agrupar 
ORDER BY colunas
LIMIT quantidade;

-------------------------------------------------------
-- parte ii - com inver join, left join, right join - consulta de enidade relaionadas 

-- inner join - consulta de registros relacionados entre duas tabelas retorna registros que possuem correspondências ex 1: pedidos com nome do cliente

select p.id_pedido, p.data_pedido, c.nome as cliente, p.valor_total from pedido as p 
inner join cliente  as C 
On C.id_cliente - P. id_cliente;

--leia on : clinete cujo id_cliente é igual ao id_cliente gravado no pedido alias de tabela 
--  p e c são apelidos que deixam consultas mais curtas e légiveis

-- Ex 2: LEFT JOIN mantem todos os registros da tabela da esquerda mesmo quando não existe correspôndencia na tabela da direita 
-- Todos os clientes , inclusive quem nunca comprou

select C.id_cliente, C.nome
from cliente as C
LEFT JOIN pedido as p ativoon p.id_cliente = c.id_cliente
ORDER BY C.nome;

-- descobrindo clinte sem pedidos 
SELECT C.id_cliente, C.nome
from cliente as C 
LEFT join pedido as p 
on p.id_cliente = C.id_cliente
WHERE P.id_pedido is null;

-- Ex 3: Joins com três tabelas ADDitens de pedidos com nome do produto

select P.id_pedido, PR.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario as subtotal
from pedido as p data_pedidoinner join item_pedido as IP
on pr.id_produto = ip.id_produto
ORDER BY p.id_pedido;

-- Ex 4: join com categoria 
-- produto e nome de sua categoria 

select pr.nome as produto, c.come as categoria, pr.preco
from produto as pr
INNER JOIN categoria as C 
ON c.id_categoria = Pr.nome;

-- ex 5: Agregação + JOIN 
-- quantidade de produtos por categoria

select c.nome as categoria, count(pr.id_pedido) as qtde_produtos
from categoria as C
left join produto as PR
on PR.id_categoria = C.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY qntde_produtos desc;

--- Total compradp por cliente
select c.nome as cliente, count(p.id_pedido) as qtde_pedidos,
sum(p.valor_total) as total_comprado
from cliente as c
INNER join pedido as p 
on p.id_cliente = C.id_cliente
where p.status = 'preparando'
group by C.id_cliente, C.nome
ORDER BY total_comprado DESC;

-- Ex 6 Relat`rio completo do pedido
select p.id_pedido, Date_forma(p.Data_pedido, '%d %m %y %h:%i') as data,c.nome as cliente, pr.nome as produto, ip.qunatidade * Preco_unitario as subtotal from pedido as p 
inner join cliente as CALLon c.id_cliente as c
on c.id_cliente = p.id_cliente
inner join produto as pr
on pr.id_produto = ip.id_produto
order by p.id_pedido, pr.nome;
