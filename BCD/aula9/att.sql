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
and todas as condições verdadeiras
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

-- Extra - Ultilizando and e orjuntos separar por ()
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
-- Consultar apenas uma quantidade de limnhas
select nome, preco 
from produtoorder by nome 
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

