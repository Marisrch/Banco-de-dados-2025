-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados 

create database dbpadaria;
-- acessar o banco de dados

use dbpadaria;
--criando as tabelas no banco de dados

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
cpf char(14) not null unique,
email varchar(100) unique,
primary key(codCli));

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100) unique,
telCel char(10),
primary key(codForn));

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100) unique,
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
primary key(codFunc));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10),
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));

create table tbVendas(
codVend int not null auto_increment,
dataVend date,
horaVend time,
quantidade decimal(9,2) default 0 check(quantidade >=0),
valor decimal(9,2) default 0 check(valor >=0),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key(codVend),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codcli)references tbClientes(codcli));

-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas
desc tbUsuarios;
desc tbFornecedores;
desc tbFuncionarios;
desc tbProdutos;
desc tbClientes;
desc tbVendas;

-- inserindo registros nas tabelas

insert into tbClientes(nome,cpf,email)
	values('Manuel Ribeiro','253.352.879-88',
		'manuel.ribeiro@gmail.com');
insert into tbClientes(nome,cpf,email)
	values('Lene de Oliveira','243.252.978-78',
		'lene.oliveira@hotmail.com');

insert into tbFornecedores(nome,email,telCel)
	values('Verduras SA','sac@verduras.com.br',
		'97125-5382');
insert into tbFornecedores(nome,email,telCel)
	values('Armarinhos Fernandes',
		'sac@armarinhos.fernandes.com.br',
		'98823-8574');
insert into tbFuncionarios(nome,email,telCel,dataNasc,
salario,sexo)
	values('Jeferson da Cunha Macedo',
		'jeferson.cmacedo@gmail.com',
		'98523-9685','1985-02-24',1500.35,'M');
insert into tbFuncionarios(nome,email,telCel,dataNasc,
salario,sexo)
	values('Melina Dias',
		'melina.dias@gmail.com',
		'98741-8524','1992-05-12',3530.00,'F');

insert into tbUsuarios(nome,senha,codFunc)
	values('melina.dias','123456',2);

insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values('Banana nanica', 2, 3.50, '2025-03-06', 'A32336478B',1);
insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values('Banana prata', 6, 4.50, '2025-05-07', 'A88836478B',2);
insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values('Mamao', 7, 6.50, '2025-02-02', 'A34256478B',1);
insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values('Roma', 10, 9.50, '2025-09-06', 'A32336565B',2);
insert into tbProdutos(descricao,quantidade,preco,dataVal,lote,codForn)
	values('Uva', 5, 2.50, '2025-01-12', 'A32365478B',1);

insert into tbVendas(dataVend,horaVend,quantidade,valor,codProd,codUsu,codCli)
	values('2025-03-05','20:20:10',10,50.00,2,1,2);
insert into tbVendas(dataVend,horaVend,quantidade,valor,codProd,codUsu,codCli)
	values('2025-08-10','05:30:00',20,15.00,3,1,1);
insert into tbVendas(dataVend,horaVend,quantidade,valor,codProd,codUsu,codCli)
	values('2025-12-05','12:20:50',30,80.00,1,1,2);

	



-- visualizando os registros nas tabelas

select * from tbClientes;
select * from tbFornecedores;
select * from tbFuncionarios;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;