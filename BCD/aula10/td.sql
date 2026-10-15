-- TCl - transsações e integridade
-- sem Transação: Podemos confirmar ou desfazer o processo inteiro 

--Estrutura de transação 

commit; -- confirmar a transação 
--ou
ROLLBACK; -- Desfazer a transação 

-- Processo inicial 

insert into cliente (nome, email, telefone, cidade, ativo)Values ('Ariana Grnade', 'ariana.g@gmail.com', '199992837', 'Boca Raton', TRUE)

select nome from cliente;

-- Ex 1: commit
-- confirma as alterações dentro da transação
start TRANSACTION;

update produto
set preco = 8.50
where id_produto = 1;
COMMIT

-- Ex 2 : ROLLBACK
-- Desfaz as alterações ainda não confirmadas

start TRANSACTION;

update produto
set preco = 5000.00
where id_produto = 1;
select * from produto where id_produto = 1;

ROLLBACK;

-- Ex3: savepoint
-- criar um ponto dentro de uma transação
start TRANSACTION;

UPDATE produto
set preco = preco * 2.00
where id_categoria = 1

savepoint reajuste_cafes;

UPDATE produto
set preco = preco * 2.00
where id_categoria = 4

ROLLBACK to SAVEPOINT reajuste_cafes;

commit;

select * FROM

-- Ex 4: Release savepoint 
-- Remove o savepoint da transição

release SAVEPOINT reajuste_cafes;

COMMIT;

-- Ex 5: AutoCommit
select @@autocommit;
--ativo por padrão no mysql
START TRANSACTION;
COMMIT;

--Ex 6: Transações não substitui constraint
CONSTRAINT fk_categoria foreign key (id_categoria) REFERENCES
categoria(id_categoria) on delete cascade on UPDATE cascade;

CONSTRAINT fk_pedido_cliente Foreign Key (id_cliente) REFERENCES cliente (id_cliente); on delete cascade on update cascade;

-- Não executar!!!!
create table cliente (
    id_cliente INT PRIMARY Key,
    nome varchar(60),
    telefone VARCHAR(15),
    cidade varchar(60),
    ativo boolean default true,
    constraint fk_pedido_cliente FOREIGN key (id_cliente) REFERENCES cliente (id_cliente); on DELETE cascade on update cascade
);

-- sempre checar a quantidade e se a abaixo de 0 ou igual que 0 sinalizar
CONSTRAINT ck_estoque_qunatidade CHECK (quantidade >= 0);

-- exemplo com ultilização
create table estoque(
    id_estoque int auto_increment,
    id_produto int not null,
    quantidade int not null DEFAULT 0,
-- Retrições de segurança:
    -- Chave primaria
    constraint pk_estoque PRIMARY key (id_estoque),
    -- Chave unica
    constraint up_estoque_produto unique (id_produto),
    -- Checar ou validar uma opração de quantidade
    constraint ck_estoque_quantidade check (quantidade >= 0),
    --Chave estrangeira
    constraint fk_estoque_produto FOREIGN key (id_produto)
    REFERENCES produto (id_produto) on update cascade on delete RESTRICT
)

insert into estoque (id_produto, quantidade) values (1,50),(2,40),(3,30);

select * from estoque; 

-- Ex 7: fluxo seguro pra UPDATE/DELETE
-- Exclusão física

delete from produto
where id_produto = 11;

-- exclusão lógica
UPDATE produto
ste ativo = FALSE
where id_produto = 10;

select * from produto where id_produto = 3;

start TRANSACTION;
UPDATE produto
set preco = 15.50
where id_produto where id_produto = 3;

start transaction;

update produto
set preco = 15.50
where id_produto =3;

select * From produto where is_produto = 3;
COMMIT;
-- Rollback;
-- Ex 8: Pedido completo com transação
start TRANSACTION;
insert into pedido(id_cliente, , status, data_pedido,
valor_total, id_cliente)
VALUES (now(), 'Aberto', 0.00)

select TRANSACTION;
insert into item_pedido (data_pedido, status, valor_total, id_cliente) VALUES (now(), 'Aberto', 0.00, 130);

set @pedido = LAST_INSERT_ID();

insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (@pedido, 1,2, 7.50), (@pedido, 1,2, 8.50);

INSERT into pagamento (id_pedido, valor, id_forma_pagamento)VALUES
(@id_pedido, 23.00, 2);

COMMIT;

-- Ex 9: pedido completo com transação e ROLLBACK
start transaction;
insert into pedido (data_pedido, status, valor_total, id_cliente)
values (now(), 'Aberto', 0.00, 23);

set @pedido = LAST_INSERT_ID();

-- produto inexistente
insert into item_pedido (id_pedido, id_pedido, quantidade, preco_unitario) values (@pedido, 1, 999, 9.00), (@pedido, 1.999, 11.00);

ROLLBACK;