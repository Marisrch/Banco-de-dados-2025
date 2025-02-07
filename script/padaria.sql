-- apagando banco de dados se existir

drop database dbpadaria;

-- criando banco de dados

create database dbpadaria;

-- acessar banco de dados
use dbpadaria;

-- criando as tabelas no banco de dados

create table tbusuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
primary key(codUsu) 
);
create table tbfuncionarios(
codFunc int not null auto_increment,
nome varchar(10),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2),
sexo char (1),
primary key(codFunc)
);

-- visualizando as tabelas
show tables;
--visualizando a estruturas das tabelas
desc tbusuarios;
desc tbfuncionarios;