--CORRECAO SOMATIVA 01 - OFICINA MECâNICA --
create DATABASE IF NOT EXISTS Oficina_Samira_Dalosto;

use Oficina_Samira_Dalosto;

create table if not exists Clientes(
    id_clientes int auto_increment primary key,
    nome varchar(60) not null,
    telefone varchar(15) not null,
    email varchar(60) not null,
    CPF varchar(14) not null unique,
    data_nacimento date not NULL,
    data_cadastro timestamp default current_timestamp
);

create table if not exists veiculos(
    id_veiculos int auto_increment primary key,
    placa char(8) not null unique,
    tipo varchar(20) Enum('Carro', 'Moto', 'Caminhão') DEfAULT ('Carro'),
    cor VARCHAR(20),
    quilometragem FLOAT,
    tipo_motor enum ('Eletrico', 'Combustão', 'Híbrido') default ('Combustão'),
    data_cadrasto timestamp default current_timestamp
);
create table if not exists marcas(
    id_marcas int auto_increment primary key,
    ano_lançamento year,
    pais_origem varchar(60),
    status_marca enum ('Ativa', 'Inativa') default ('Ativa'),
    nome_marca varchar(60) not null unique,
    SITE_MARCA varchar(100)
);
create table if not exists modelos(
    id_modelos int auto_increment primary key,
    cor varchar(20),
    ano_modelo year,
    valor_modelo decimal(10,2) not null,
    categoria enum ('sun', 'hatch', 'seda', 'moto esportiva'),
    status_modelo enum ('Ativo', 'Inativo'),
    data_cadrasto timestamp default current_timestamp,
);
create table if not exists funcionarios(
    id_funcionarios int auto_increment primary key,
    nome_funcionarios varchar(60) not null,
    telefone varchar(15) not null,
    CPF varchar(14) not null unique,
    cargo varchar(50) not null,
    salario decimal(10,2) not null,
    status_funcionario enum ('Ativo', 'Inativo') default ('Ativo'),
    );

create table if not exists serviços(
    id_servicos int auto_increment primary key,
    tipo_servico varchar(60) not null,
    valor_problema varchar(250) not null,
    preco_servico decimal(10,2) default 0.00 not null,
    data_termino datetime not null,
    status_servico enum ('Ativo', 'Inativo') default ('Ativo'),
    data_cadrasto timestamp default current_timestamp
);
create table if not exists pecas(
    id_pecas int auto_increment primary key,
    tamanho varchar(10),
    valor decimal(10,2) not null,
    nome_peca varchar(60) not null,
    validade date not null,
    qtde_pecas int,
    data_cadatro TIMESTAMP default current_timestamp
);
create table if not exists ordem_de_serviço(
    id_ordem int auto_increment primary key,
    prioridade enum ('urgente', 'simples') not null DEFAULT 'simples',
    prazo_final date no null,
    ranking_ordem varchar(40) not null,
    data_cadastro timestamp default current_timestamp,
    tipo_caso varchar(250) not null,
    status_servicosenum ('Em andamento', 'pendente', 'concluído') default ('pendente'),
);

create table if not exists pagamentos(
    id_pagamentos int auto_increment primary key,
    valor_total decimal(10,2)not null
    forma_pagamento enum ('debito', 'credito', 'pix'),
    status_pagamento varchar(30),
    data_vencimento date not null,
    comprovante int,
    data_pagamento timestamp default current_timestamp
);

create TABLE IF NOT EXISTS Fornecedores(
    id_fornecedores int auto_increment primary key,
    razao_social varchar(100) not null,
    cnpj char(18) not null unique,
    email varchar(100) not null,
    inscricao_estadual char(10),
    segmento_fornecedor varchar(60) not null,
    data_cadastro timestamp default current_timestamp
);
-- Alterações inserindo campos novos nas tabelas ---
alter table  Clientes add idade int;
alter table funcionarios add enderaco varchar(100);
alter table fornecidores add idade int;
alter table marcas add observação vachar(200);
alter table modelos add tipo_modelo varchar(200);
alter table pagamentos add observacao varchar(200);
alter table pecas add peso float not null;
alter servicos add observacao varchar(200);
alter veiculos add modelos varchar(60);
alter ordem_servico add area_servicos varchar(50) not null;


alter table 

alter table 
--- Visualizar todos  os BD
show schemas;

-- Visualizar todas as tabelas do BD
show tables;

-- descrição sobre informações das tabelas
describe Clientes;
